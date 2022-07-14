import tensorflow as tf

dir = './models/'

model = tf.keras.models.load_model(dir + "keras_model.h5")

# Specs for the model
model.summary()
print(model.input_shape)
print(model.output_shape)