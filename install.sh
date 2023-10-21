#!/bin/bash
conda create -y -n  invoke python=3.10
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
  ln -s /tmp/huggingface/hub /home/studio-lab-user/.cache/huggingface/hub
fi
python --version
pip install 'InvokeAI[xformers]' --use-pep517 --extra-index-url https://download.pytorch.org/whl/cu117
python patch-16bit-model-download.py
pip install pyngrok
pip install opencv-python-headless
conda install glib=2.51.0 -y
conda deactivate
