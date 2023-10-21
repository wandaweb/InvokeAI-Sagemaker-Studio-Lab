import fileinput
import os

def find(name, path):
    for root, dirs, files in os.walk(path):
        if name in files:
            return os.path.join(root, name)

model_install_file = find('model_install_backend.py', '/home/studio-lab-user/.conda/envs/')
print('modifying file ' + model_install_file)
for line in fileinput.input(model_install_file, inplace=True):
  if ('precision = torch_dtype(choose_torch_device())' in line):
     line = line.replace('torch_dtype(choose_torch_device())', 'torch.float16')
  print(line, end='')