#!/usr/bin/env python
"""Prepares the Polish data for preprocessing."""

import contextlib
import csv

from typing import TextIO


# I have chosen to hard-code the paths here since what else would I do?

TRAIN = "train.pol.tsv"
TRAIN_NOMSG = "train.pol.nomsg"
TRAIN_GENSG = "train.pol.gensg"

DEV = "dev.pol.tsv"
DEV_NOMSG = "dev.pol.nomsg"
DEV_GENSG = "dev.pol.gensg"

TEST = "test.pol.tsv"
TEST_NOMSG = "test.pol.nomsg"
TEST_GENSG = "test.pol.gensg"


def _split(source: TextIO, nomsg: TextIO, gensg: TextIO) -> None:
    reader = csv.reader(source, delimiter="\t")
    for c1, c2, _ in reader:
        print(" ".join(c1), file=nomsg)
        print(" ".join(c2), file=gensg)


def main() -> None:
    with contextlib.ExitStack() as stack:
        source = stack.enter_context(open(TRAIN, "r"))
        nomsg = stack.enter_context(open(TRAIN_NOMSG, "w"))
        gensg = stack.enter_context(open(TRAIN_GENSG, "w"))
        _split(source, nomsg, gensg)
    # Processes development data.
    with contextlib.ExitStack() as stack:
        source = stack.enter_context(open(DEV, "r"))
        nomsg = stack.enter_context(open(DEV_NOMSG, "w"))
        gensg = stack.enter_context(open(DEV_GENSG, "w"))
        _split(source, nomsg, gensg)
    # Processes test data.
    with contextlib.ExitStack() as stack:
        source = stack.enter_context(open(TEST, "r"))
        nomsg = stack.enter_context(open(TEST_NOMSG, "w"))
        gensg = stack.enter_context(open(TEST_GENSG, "w"))
        _split(source, nomsg, gensg)


if __name__ == "__main__":
    main()
