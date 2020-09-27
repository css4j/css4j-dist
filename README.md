# css4j

This repository contains the root of the css4j distribution.

To build, you need a current JDK (the build is tested with version 15) and a copy of this repository first, then run the `tree.sh` script. For example:
```
    git clone https://github.com/css4j/css4j-dist.git css4j-snapshot
    cd css4j-snapshot
    ./tree.sh
```
Or download a zip and extract:
```
    /usr/bin/curl -o css4j-dist-master.zip https://codeload.github.com/css4j/css4j-dist/zip/master
    /usr/bin/unzip css4j-dist-master.zip
    cd css4j-dist-master
    ./tree.sh
```
After running the script you'll have a tree with all the modules, ready to build with Maven. You can just run `mvn` (which defaults to `clean package`) but remember to set `JAVA_HOME` to JDK 15 or higher first, if that is not your default.

Note that one of the dependencies ([JCLF](https://sourceforge.net/projects/jclf/)) is not in Maven Central. Depending on your setup, you may need to install it manually first.
