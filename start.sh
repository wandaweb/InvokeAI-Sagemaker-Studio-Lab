#!/bin/bash
eval "$(conda shell.bash hook)"
conda activate invoke
mkdir -p /tmp/invoke/models
if [ ! -L ~/invokeai/models ] 
then
  ln -s /tmp/invoke/models ~/invokeai/
fi

if [ $# -eq 0 ]
then
  python start-ngrok.py  
elif [ $1 = "reset" ]
then
  python start-ngrok.py --reset 
fi
