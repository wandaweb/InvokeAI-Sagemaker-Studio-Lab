#!/bin/bash
eval "$(conda shell.bash hook)"
conda activate invoke
mkdir -p /tmp/invoke/models
mkdir -p ~/invokeai
if ! test -e ~/invokeai/models
then
  ln -s /tmp/invoke/models ~/invokeai/
fi
#mkdir -p /tmp/huggingface/hub
#mkdir -p /home/studio-lab-user/.cache/huggingface
#if ! test -e /home/studio-lab-user/.cache/huggingface/hub
#then
#  ln -s /tmp/huggingface/hub /home/studio-lab-user/.cache/huggingface/
#fi
invokeai-configure --root_dir ~/invokeai --yes  --default_only --skip-sd-weights --no-full-precision

# Uncomment one of the commands below to install a model before starting the app

# Model: SDXL - https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0
#invokeai-model-install --root_dir /home/studio-lab-user/sagemaker-studiolab-notebooks/invokeai --add "stabilityai/stable-diffusion-xl-base-1.0" 

# Model: Dreamshaper XL - https://huggingface.co/Lykon/dreamshaper-xl-1-0
#invokeai-model-install --root_dir /home/studio-lab-user/sagemaker-studiolab-notebooks/invokeai --add "Lykon/dreamshaper-xl-1-0" 

# Model: Copax TimeLessXL - https://civitai.com/models/118111/copax-timelessxl-sdxl10?modelVersionId=198246
#invokeai-model-install --root_dir /home/studio-lab-user/sagemaker-studiolab-notebooks/invokeai --add "https://civitai.com/api/download/models/198246" 

# Model: T-Shirt Design Lora for SDXL - https://civitai.com/models/133031?modelVersionId=178022
#invokeai-model-install --root_dir /home/studio-lab-user/sagemaker-studiolab-notebooks/invokeai --add "https://civitai.com/api/download/models/178022" 
