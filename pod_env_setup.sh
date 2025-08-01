conda create -n mega python=3.8 -y
source activate mega
pip install torch==1.10.1+cu111 torchvision==0.11.2+cu111 torchaudio==0.10.1 -f https://download.pytorch.org/whl/cu111/torch_stable.html
pip install --force-reinstall "numpy<1.20" cython
pip install scikit-learn --no-deps
pip install scipy joblib threadpoolctl
# Install fairseq
pip install setuptools==69.5.1
python setup.py build_ext --inplace
pip install --no-build-isolation -e .

#Run tests
python -c "import torch; print('PyTorch version:', torch.__version__); import fairseq; print('Fairseq version:', fairseq.__version__)"
python -c "print('Testing calling script from fairseq_cli')"
python fairseq_cli/eval_mega_lm.py --help

#Download model checkpoint and wikitext-103 dataset
bash download_model_and_data.sh