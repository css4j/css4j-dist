# css4j

This repository contains the root of the css4j distribution.

Building from the git repositories requires the subversion version control software, due to Github not supporting `git archive`.

To build, you need a JDK version 12 and a copy of this repository first, then run the `tree.sh` script. For example:
```
    git clone https://github.com/css4j/css4j.git css4j-snapshot
    cd css4j-snapshot
    ./tree.sh
```
After running the script you'll have a tree with all the modules, ready to build with Maven (just run `mvn`). Note that one of the dependencies (JCLF) is at MVNRepository but not in Maven Central. Depending on your setup, you may need to install it manually first.

