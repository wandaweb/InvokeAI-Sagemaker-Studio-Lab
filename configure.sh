#!/bin/bash
eval "$(conda shell.bash hook)"
conda activate invoke
invokeai-configure --root_dir /home/studio-lab-user/sagemaker-studiolab-notebooks/invokeai --yes  --default_only --skip-sd-weights --no-full-precision
conda deactivate