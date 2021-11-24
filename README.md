![CI workflow](https://github.com/css4j/css4j-dist/actions/workflows/ci.yml/badge.svg)

# css4j distribution

This repository is used for distribution of all the modules in the css4j project.

In the past, a copy of this repository was required to build the main modules, but that is no longer the case.

## Install the artifacts into your local Maven repository
If you build your project (that depends on css4j) with Maven, please note that some of the css4j dependencies are not in
Maven Central:
- [JCLF](https://sourceforge.net/projects/jclf/).
- [XMLPull-XPP3](https://github.com/xmlpull-xpp3/xmlpull-xpp3) (v1.2, dependency of the DOM4J module only).

You may want to install them manually into your local Maven repository, which can be done easily with the:

- [`install-jclf.sh`](https://raw.githubusercontent.com/css4j/css4j-dist/master/maven/install-jclf.sh)
- [`install-xpp3.sh`](https://raw.githubusercontent.com/css4j/css4j-dist/master/maven/install-xpp3.sh)

scripts.

You can also directly install the CSS4J artifacts into your local Maven repository, with the similar
[`install-css4j.sh`](https://raw.githubusercontent.com/css4j/css4j-dist/master/maven/install-css4j.sh).

And then, add the following to the `<dependencies>` section of your `pom.xml`:
```xml
<dependency>
    <groupId>io.sf.carte</groupId>
    <artifactId>css4j</artifactId>
    <version>${css4j.version}</version>
</dependency>
```

<br/>

## Merged javadoc of all modules

To produce a merged javadoc of all the css4j modules, execute:
```
./gradlew mergedJavadoc
```
and the javadoc shall be at the `build/docs/javadoc` directory.

<br/>

## Website
For more information please see https://css4j.github.io/
