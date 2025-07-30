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
source activate mega11

# Run the test script
python -c "import torch; print('PyTorch version:', torch.__version__);torch.cuda.is_available() or print('CUDA is not available');import fairseq; print('Fairseq version:', fairseq.__version__)"
