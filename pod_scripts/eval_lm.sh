python fairseq_cli/eval_mega_lm.py data/wikitext-103 \
    --path checkpoints/1024_wt103/model.pt  --gen-subset valid --max-tokens 5000000 --test-chunk-size 2048 --chunk-nums 2  --softmax-batch 1024 \
    --sample-break-mode 'complete' --valid-block "splits:10" --model-overrides '{"decoder_chunk_size": 2048,"max_tokens_valid": 5000000}' \
    --results-path checkpoints/1024_wt103/results/ --save-layers -1 --save-probs

python fairseq_cli/eval_mega_lm.py data/wikitext-103 \
    --path checkpoints/1024_wt103/model.pt  --gen-subset test --max-tokens 5000000 --test-chunk-size 2048 --chunk-nums 2  --softmax-batch 1024 \
    --sample-break-mode 'complete' --valid-block "splits:10" --model-overrides '{"decoder_chunk_size": 2048,"max_tokens_valid": 5000000}' \
    --results-path checkpoints/1024_wt103/results/ --save-layers -1 --save-probs

