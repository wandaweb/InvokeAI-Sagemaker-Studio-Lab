#!/bin/bash
eval "$(conda shell.bash hook)"
conda activate invoke
mkdir -p /tmp/invoke/models
if ! test -e ~/invokeai/models
then
  ln -s /tmp/invoke/models ~/invokeai/
fi
#mkdir -p /tmp/huggingface/hub
#if ! test -e ~/.cache/huggingface/hub
#then
#  ln -s /tmp/huggingface/hub ~/.cache/huggingface/
#fi

invokeai-web --root ~/invokeai &
if [ $# -eq 0 ]
then
  python start-ngrok.py  
elif [ $1 = "reset" ]
then
  python start-ngrok.py --reset 
fi
