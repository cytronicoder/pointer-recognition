import torch

# Importing the pytorch model
pytorch_model = torch.load('./models/pytorch_model.pt')

# Converting back to ONNX model
device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')
print('Running on device: ' + str(device))

pytorch_model.to(device)
pytorch_model.eval()

print(pytorch_model)
