#!/usr/bin/bash
#
# Install the xmlpull-xpp3 artifacts to the local Maven repository.
#
# Assumes that the $TMP environment variable points to a temporary directory.
#
PLUGIN=org.apache.maven.plugins:maven-dependency-plugin:2.9:get
REMOTEREPO=https://css4j.github.io/maven/
function install() {
mvn $PLUGIN -DremoteRepositories=${REMOTEREPO} -Dartifact=${1}:${2}:${3} -Ddest=${TMP}/${2}-${3}.jar
mvn $PLUGIN -DremoteRepositories=${REMOTEREPO} -Dartifact=${1}:${2}:${3} -Dpackaging=pom -Ddest=${TMP}/pom.xml
mvn $PLUGIN -DremoteRepositories=${REMOTEREPO} -Dartifact=${1}:${2}:${3} -Dclassifier=sources -Ddest=${TMP}/${2}-${3}-sources.jar
mvn install:install-file -Dfile=${TMP}/${2}-${3}.jar -DpomFile=${TMP}/pom.xml -DgroupId=${1} -DartifactId=${2} -Dversion=${3} -Dpackaging=jar -DcreateChecksum=true
mvn install:install-file -Dfile=${TMP}/${2}-${3}-sources.jar -DgroupId=${1} -DartifactId=${2} -Dversion=${3} -Dclassifier=sources -Dpackaging=jar -DcreateChecksum=true
rm ${TMP}/${2}-${3}.jar ${TMP}/${2}-${3}-sources.jar ${TMP}/pom.xml
}
#
GROUP=xmlpull
ARTIFACT=xmlpull
VERSION=1.2.0
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
GROUP=xpp3
ARTIFACT=xpp3_min
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
