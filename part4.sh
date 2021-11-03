#!/bin/bash
# Part 4.

set -eou pipefail

# Training.
fairseq-train \
    data-bin \
    --save-dir part4 \
    --source-lang pol.nomsg \
    --target-lang pol.gensg \
    --seed 11215 \
    --arch lstm \
    --encoder-bidirectional \
    --dropout .2 \
    --encoder-embed-dim 128 \
    --decoder-embed-dim 128 \
    --decoder-out-embed-dim 128 \
    --encoder-hidden-size 512 \
    --decoder-hidden-size 512 \
    --share-decoder-input-output-embed \
    --criterion label_smoothed_cross_entropy \
    --label-smoothing .1 \
    --optimizer adam \
    --lr .001 \
    --clip-norm 1 \
    --batch-size 128 \
    --max-update 4000 \
    --no-epoch-checkpoints

# Development set WER.
readonly DEV_RESULT=part4.dev.txt
fairseq-generate \
    data-bin \
    --source-lang pol.nomsg \
    --target-lang pol.gensg \
    --path part4/checkpoint_best.pt \
    --gen-subset valid \
    --beam 8 \
    > "${DEV_RESULT}" 2>/dev/null
echo "${DEV_RESULT}: $(./wer.py "${DEV_RESULT}")"
rm -rf "${DEV_RESULT}"

# Test set WER.
readonly TEST_RESULT=part4.test.txt
fairseq-generate \
    data-bin \
    --source-lang pol.nomsg \
    --target-lang pol.gensg \
    --path part4/checkpoint_best.pt \
    --gen-subset test \
    --beam 8 \
    > "${TEST_RESULT}" 2>/dev/null
echo "${TEST_RESULT}: $(./wer.py "${TEST_RESULT}")"
rm -rf "${TEST_RESULT}"
