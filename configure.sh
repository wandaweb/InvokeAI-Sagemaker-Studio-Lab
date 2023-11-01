#!/bin/bash
eval "$(conda shell.bash hook)"
conda activate invoke
mkdir -p /tmp/invoke/models
mkdir -p ~/invokeai
if ! test -e ~/invokeai/models
then
  ln -s /tmp/invoke/models ~/invokeai/
fi

invokeai-configure --root_dir ~/invokeai --yes  --default_only --skip-sd-weights --no-full-precision

rm -rf ~/.cache/huggingface/hub/*
