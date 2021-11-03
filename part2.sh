#!/bin/bash
# Part 2.

set -eou pipefail

./split.py \
    --seed 11215 \
    --input_path pol.tsv \
    --train_path train.pol.tsv \
    --dev_path dev.pol.tsv \
    --test_path test.pol.tsv
