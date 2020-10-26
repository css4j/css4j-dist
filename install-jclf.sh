#!/usr/bin/bash
#
# Install the JCLF artifact if it is not present.
#
# Assumes that the $TMP environment variable points to a temporary directory.
#
GROUP=io.sf.jclf
ARTIFACT=jclf
VERSION=4.1.0
REMOTEREPO=https://css4j.github.io/maven/
PLUGIN=org.apache.maven.plugins:maven-dependency-plugin:2.9:get
#
mvn $PLUGIN -DremoteRepositories=${REMOTEREPO} -Dartifact=${GROUP}:${ARTIFACT}:${VERSION} -Ddest=${TMP}/${ARTIFACT}-${VERSION}.jar
mvn $PLUGIN -DremoteRepositories=${REMOTEREPO} -Dartifact=${GROUP}:${ARTIFACT}:${VERSION} -Dpackaging=pom -Ddest=${TMP}/pom.xml
mvn $PLUGIN -DremoteRepositories=${REMOTEREPO} -Dartifact=${GROUP}:${ARTIFACT}:${VERSION} -Dclassifier=sources -Ddest=${TMP}/${ARTIFACT}-${VERSION}-sources.jar
mvn install:install-file -Dfile=${TMP}/${ARTIFACT}-${VERSION}.jar -DpomFile=${TMP}/pom.xml -DgroupId=${GROUP} -DartifactId=${ARTIFACT} -Dversion=${VERSION} -Dpackaging=jar
mvn install:install-file -Dfile=${TMP}/${ARTIFACT}-${VERSION}-sources.jar -DgroupId=${GROUP} -DartifactId=${ARTIFACT} -Dversion=${VERSION} -Dpackaging=jar -Dclassifier=sources
rm ${TMP}/${ARTIFACT}-${VERSION}.jar ${TMP}/${ARTIFACT}-${VERSION}-sources.jar ${TMP}/pom.xml
