#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --partition=gpuA40x4
#SBATCH --account=bcyi-delta-gpu
#SBATCH --gpus=1
#SBATCH --time=0:15:00
#SBATCH --job-name=test_installation
#SBATCH --output=log/test_installation_%j.out

# Load modules and activate environment
conda deactivate || true
module purge
module reset
module load anaconda3_gpu
source activate mega10
python -c "import torch; \
print('Torch:', torch.__version__); \
print('Built with CUDA:', torch.version.cuda); \
print('cuDNN version:', torch.backends.cudnn.version()); \
print('GPU name:', torch.cuda.get_device_name(0)); \
print('Compute capability:', torch.cuda.get_device_capability(0))"
nvcc --version
nvidia-smi
