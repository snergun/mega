module purge 
module reset
module load anaconda3_gpu
conda create -n mega11 python=3.8 -y
source activate mega11
export TORCH_CUDA_ARCH_LIST="8.0;8.6"
conda install pytorch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0 cudatoolkit=11.3 -c pytorch -c conda-forge -y
pip install --force-reinstall "numpy<1.20" cython
pip install scikit-learn --no-deps
pip install scipy joblib threadpoolctl
# Install fairseq
python setup.py build_ext --inplace
pip install --no-build-isolation -e .

#Run tests
python -c "import torch; print('PyTorch version:', torch.__version__); import fairseq; print('Fairseq version:', fairseq.__version__)"
python -c "fairseq_cli/eval_mega_lm.py"


