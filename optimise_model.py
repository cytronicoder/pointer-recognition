import tensorrt as trt

dir = './engines/'

logger = trt.Logger(trt.Logger.VERBOSE)
builder = trt.Builder(logger)
network = builder.create_network(1 << int(trt.NetworkDefinitionCreationFlag.EXPLICIT_BATCH))
parser = trt.OnnxParser(network, logger)
config = builder.create_builder_config()

profile = builder.create_optimization_profile();
profile.set_shape("image_inputs", (1, 3, 224, 224), (1, 3, 224, 224), (1, 3, 224, 224))
config.add_optimization_profile(profile)

config.set_memory_pool_limit(trt.MemoryPoolType.WORKSPACE, 1 << 20) # 1 MiB
serialized_engine = builder.build_serialized_network(network, config)

def build_engine_onnx(model_file):
    # parse the onnx model
    with open(model_file, 'rb') as model:
        if not parser.parse(model.read()):
            print("ERROR: Failed to parse the ONNX file.")
            for error in range(parser.num_errors):
                print(parser.get_error(error))
    
    # build the engine
    engine = builder.build_engine(network, config)
    
    # save the engine
    with open(dir + "onnx_engine.trt", "wb") as f:
        f.write(engine.serialize())

build_engine_onnx(dir + "onnx_model.onnx")