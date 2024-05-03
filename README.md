# Exercises from "Prolog programing for Artifical Intelligence" by Ivan Bratko adapted to Mercury language

branch `prolog` is for SWI-Prolg

branch `mercury` is current

branch `master` is clean

# License
repository is licensed under a simple 2-clause BSD style license. See the file COPYING for details.

# Installation
Check the values in the file Make.options to see if they agree with your system, then do:
    - Compiler is `mercury.bat` on Windows and `mmc` on Linux (fix in Make.options)
    - PROGRAM_EXT = .exe have to be fix (empty) for Linux
    - It's better to compile in `GitBash` on Windows, otherwise you must fix the goals `install` and `clean` in src/Makefile

```bash
    $ make install
```
You can also override values in Make.options on the command line, for example

```bash
    $ make INSTALL_PREFIX=/foo/bar install
```
causes the library to be installed in the directory /foo/bar.

# Mercury Compatibility
The code on the mercury branch was compiled with  Mercury ROTD 2024-04-26

# Author
Andrii Puhachenko andrqxa@gmail.com

# Contents

## Part I. Prolog language.

### Chapter 1.

1. Family relationship.
2. Geometry.
3. "Monkey world".
4. List operations.