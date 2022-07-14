import onnx

dir = './models/'

model = onnx.load(dir + "onnx_model.onnx")
output =[node.name for node in model.graph.output]

input_all = [node.name for node in model.graph.input]
input_initializer =  [node.name for node in model.graph.initializer]
net_feed_input = list(set(input_all)  - set(input_initializer))

# Specs for the model
print('Inputs: ', net_feed_input)
print('Outputs: ', output)