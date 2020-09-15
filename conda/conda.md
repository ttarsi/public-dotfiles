# Anaconda Notes

### Installation:
Download Conda distribution from <https://www.anaconda.com/distribution/>

Or from command line:
```
wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
bash Anaconda3-2019.07-Linux-x86_64.sh
```
Add path manually and clean:
```
export PATH=~/anaconda3/bin:$PATH
conda clean --all
```

### Basics

To create a blank Conda environment called 'myenv' for python 3.6.4:
```
conda create -n myenv python=3.6.4 pip
```
To view all environments:
```
conda env list
```
View packages in current environment:
```
conda list
```
Export active environment:
```
conda env export > environment.yml
```
Create conda environment from conda yaml config:
```
conda env create -f environment.yml
```
Clean up active conda environment to reduce disk space usage:
```
conda clean --all
```
Remove existing environment:
```
conda env remove --name myenv
```

### Main env setup

```
conda deactivate
conda create -n research python=3.6 pip
conda activate research 
conda install setuptools
conda install -c pytorch cuda100 cudatoolkit cudnn numba pytorch torchvision ignite
conda install cython matplotlib seaborn pillow scikit-learn pandas jupyter jupyterlab \
    tqdm pywavelets pylint pyyaml statsmodels joblib pytest pydot ipykernel dill \
    fastparquet sqlalchemy 
conda install -c conda-forge imbalanced-learn scikit-garden mlxtend xgboost tensorboard \
    tensorboardx visdom lightgbm frozendict boto3 jupyter_contrib_nbextensions s3fs
pip install gym
pip install tensorflow-gpu
```

Check if GPU is available:
```
python3
import torch
print(torch.cuda.is_available())
```

