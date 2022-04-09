#!/bin/bash

apt -y update
apt -y install libgl1
if [ $1 = 'env' ]
then
#conda config --set channel_priority flexible
export CONDA_ALWAYS_YES="true"
conda update -y -n base conda
conda env create --prefix /notebooks/.anomalib_env --file environment.yml
unset CONDA_ALWAYS_YES
pip install git+https://github.com/VLL-HD/FrEIA.git
fi
eval "$(conda shell.bash hook)"
source activate /notebooks/.anomalib_env
conda list

python -m ipykernel install --user --name=anomalib_env

