#!/bin/bash
conda create -y -n  invoke python=3.10
eval "$(conda shell.bash hook)"
conda activate invoke
mkdir -p /tmp/invoke/models
mkdir -p ~/invokeai
if ! test -e ~/invokeai/models
then
  ln -s /tmp/invoke/models ~/invokeai/
fi

python --version
pip install 'InvokeAI[xformers]==3.6.0' --use-pep517 --extra-index-url https://download.pytorch.org/whl/cu117
python patch-16bit-model-download.py
pip install pyngrok
pip install opencv-python-headless
conda install glib=2.51.0 -y
conda deactivate
