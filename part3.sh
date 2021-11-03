#!/bin/bash
# Part 2.

set -eou pipefail

rm -rf data-bin
./prepare.py
fairseq-preprocess \
    --source-lang pol.nomsg \
    --target-lang pol.gensg \
    --trainpref train \
    --validpref dev \
    --testpref test \
    --tokenizer space \
    --thresholdsrc 2 \
    --thresholdtgt 2
