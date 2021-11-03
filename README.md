# Part 1

Masculine and feminine nouns usually end in a stem consonant (and thus a null
nom.sg. suffix) or in *-a*. Neuter nouns usually end in a nom.sg. *-o*.

The major gen.sg. suffixes are: *-a* vs. *-u* in masculines (famously
unpredictable allomorphs), *-i*/*-y* in feminines (phonologically conditioned
allomorphs), and *-a* in neuters.

Some common stem changes include *o*/*u* alternations and the deletion of *ie*;
these deleting vowels are traditionally known as *yers*.

# Part 2

See [`part2.sh`](part2.sh).

# Part 3

See [`part3.sh`](part3.sh).

# Part 4

See [`part4.sh`](part4.sh).

    Development set WER: 15.34
    Test set WER: 15.32

# Part 5

See [`part5.sh`](part5.sh).

I doubled the size of the encoder embedding to 256, and also doubled teh hidden
layer size of the encoder to 1024. (According to some obscure rule of thumb, the
embedding dimension should be roughly 1/4th the size of the hidden layer.)

    Development set WER: 14.14
    Test set WER: 16.22

# Part 6

The part 5 variant obtained a lower development set WER than part 4. The part 5
test set WER is 16.22. (Unfortunately this is worse than the part 4 test set
WER, but we're not really allowed to compare that way).
