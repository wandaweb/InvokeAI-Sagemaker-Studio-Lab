#!/bin/bash
eval "$(conda shell.bash hook)"
conda activate invoke
mkdir -p /tmp/invoke/models
if ! test -e /home/studio-lab-user/sagemaker-studiolab-notebooks/invokeai/models
then
  ln -s /tmp/invoke/models /home/studio-lab-user/sagemaker-studiolab-notebooks/invokeai/
fi
mkdir -p /tmp/huggingface/hub
if ! test -e /home/studio-lab-user/.cache/huggingface/hub
then
  ln -s /tmp/huggingface/hub /home/studio-lab-user/.cache/huggingface/
fi
python --version

invokeai-web --root /home/studio-lab-user/sagemaker-studiolab-notebooks/invokeai &
if [ $# -eq 0 ]
then
  python start-ngrok.py  
elif [ $1 = "reset" ]
then
  python start-ngrok.py --reset 
fi
