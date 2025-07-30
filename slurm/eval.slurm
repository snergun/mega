#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --partition=gpuA40x4
#SBATCH --account=bcyi-delta-gpu
#SBATCH --gpus=1
#SBATCH --time=2:00:00
#SBATCH --job-name=eval_cp
#SBATCH --output=log/eval_%j.out

# Load modules and activate environment
conda deactivate || true
module purge
module reset
module load anaconda3_gpu
source activate mega11

DATA=wt_103_data_bin

# wikitext-103
python fairseq_cli/eval_mega_lm.py ${DATA} \
    --path {SAVE}/model.pt  --gen-subset test --max-tokens 5000000 --test-chunk-size 2048 --chunk-nums 2  --softmax-batch 1024 \
    --sample-break-mode 'complete' --valid-block "splits:10" --model-overrides '{"decoder_chunk_size": 2048,"max_tokens_valid": 5000000}'