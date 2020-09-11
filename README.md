# css4j

This repository contains the root of the css4j distribution.

To build, you need a JDK version 12 or higher and a copy of this repository first, then run the `tree.sh` script. For example:
```
    git clone --single-branch --branch 1-stable https://github.com/css4j/css4j-dist.git css4j-stable
    cd css4j-stable
    ./tree.sh
```
Or download a zip and extract:
```
    /usr/bin/curl -o css4j-dist-1-stable.zip https://codeload.github.com/css4j/css4j-dist/zip/1-stable
    /usr/bin/unzip css4j-dist-1-stable.zip
    cd css4j-dist-1-stable
    ./tree.sh
```
After running the script you'll have a tree with all the modules, ready to build with Maven (you can just run `mvn` but remember to set `JAVA_HOME` to JDK 12 or higher first, if that is not your default).

Note that one of the dependencies ([JCLF](https://sourceforge.net/projects/jclf/)) [is at MVNRepository](https://mvnrepository.com/artifact/io.sf.jclf/jclf) but not in Maven Central. Depending on your setup, you may need to install it manually first.
