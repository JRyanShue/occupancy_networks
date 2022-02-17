# !bin/bash

# Set up conda env
conda env create -f environment.yaml
source activate mesh_funcspace
conda install -c anaconda mkl
python setup.py build_ext --inplace
