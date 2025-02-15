Title: Clump Finding Problem
Date: 2025-02-05
Category: Teaching
Tags: learning
Slug: teaching/bioinf2025/findclumps

# Introduction

In class we worked on `patterncount.py` a module containing some functions for finding patterns in sequences, and `prueba-bioinf.ipynb`, a jupyter notebook testing some of the functions. In the notebook, we have two cells that have very similar code for reading files:

```{python}
with open(\"vibrio-ori.txt\") as f:
    Text = ""
    for line in f.readlines():
        line = line.strip()\n
        Text += line
```

# Assignment

1. Convert the above fragment into a function that takes a filename as a parameter, and returns the contents as a single string.

2. Implement the `FindClumps` function described in Lesson 1.4 of the text. (The problem is also described in [rosalind](https://rosalind.info/problems/ba1e/)).

Upload your solutions in the course moodle.
