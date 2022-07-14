import tensorflow as tf
import tf2onnx
import onnx

dir = './models/'

model = tf.keras.models.load_model(dir + "model.h5")
print("Loaded " + dir + "model.h5")

input_signature = [tf.TensorSpec(list(model.input_shape), tf.float32, name='image_inputs')]
onnx_model, _ = tf2onnx.convert.from_keras(model, input_signature, opset=13)
onnx.save(onnx_model, dir + "model.onnx")

print("ONNX model saved to " + dir + "model.onnx")