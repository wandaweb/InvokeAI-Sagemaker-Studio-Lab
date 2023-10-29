#!/bin/bash
dir=$(pwd)
conda create -y -n  invoke python=3.10
eval "$(conda shell.bash hook)"
conda activate invoke
mkdir -p /tmp/invoke/models
mkdir -p ~/invokeai
if ! test -e ~/invokeai/models
then
  ln -s /tmp/invoke/models ~/invokeai/
fi
#mkdir -p /tmp/huggingface/hub
#mkdir -p ~/.cache/huggingface
#if ! test -e ~/.cache/huggingface/hub
#then
#  ln -s /tmp/huggingface/hub ~/.cache/huggingface/hub
#fi
python --version
cd ~
git clone --depth 1 --branch v3.1.0 https://github.com/invoke-ai/InvokeAI
cd InvokeAI
pip install -e .[xformers] --use-pep517 --extra-index-url https://download.pytorch.org/whl/cu118
cd $dir
pip install pyngrok
pip install opencv-python-headless
python patch-16bit-model-download.py
conda install glib -y
conda deactivate
