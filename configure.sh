#!/bin/bash
eval "$(conda shell.bash hook)"
conda activate invoke
mkdir -p /tmp/invoke/models
mkdir -p /tmp/huggingface/hub
mkdir -p /home/studio-lab-user/sagemaker-studiolab-notebooks/invokeai
mkdir -p /home/studio-lab-user/.cache/huggingface
if ! test -e /home/studio-lab-user/sagemaker-studiolab-notebooks/invokeai/models
then
  ln -s /tmp/invoke/models /home/studio-lab-user/sagemaker-studiolab-notebooks/invokeai/
fi
if ! test -e /home/studio-lab-user/.cache/huggingface/hub
then
  ln -s /tmp/huggingface/hub /home/studio-lab-user/.cache/huggingface/
fi
invokeai-configure --root_dir /home/studio-lab-user/sagemaker-studiolab-notebooks/invokeai --yes  --default_only --skip-sd-weights --no-full-precision
conda deactivate
