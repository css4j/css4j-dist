#!/usr/bin/bash
#
# Install the CSS4J artifacts to the local Maven repository.
#
# Assumes that the $TMP environment variable points to a temporary directory.
#
LOCALREPO=${HOME}/.m2/repository
#
function install() {
PLUGIN=org.apache.maven.plugins:maven-dependency-plugin:2.9:get
REMOTEREPO=https://css4j.github.io/maven/
mvn $PLUGIN -DremoteRepositories=${REMOTEREPO} -Dartifact=${1}:${2}:${3} -Ddest=${TMP}/${2}-${3}.jar
mvn $PLUGIN -DremoteRepositories=${REMOTEREPO} -Dartifact=${1}:${2}:${3} -Dpackaging=pom -Ddest=${TMP}/pom.xml
mvn $PLUGIN -DremoteRepositories=${REMOTEREPO} -Dartifact=${1}:${2}:${3} -Dclassifier=sources -Ddest=${TMP}/${2}-${3}-sources.jar
mvn install:install-file -Dfile=${TMP}/${2}-${3}.jar -DpomFile=${TMP}/pom.xml -DgroupId=${1} -DartifactId=${2} -Dversion=${3} -Dpackaging=jar
mvn install:install-file -Dfile=${TMP}/${2}-${3}-sources.jar -DgroupId=${1} -DartifactId=${2} -Dversion=${3} -Dclassifier=sources -Dpackaging=jar
rm ${TMP}/${2}-${3}.jar ${TMP}/${2}-${3}-sources.jar ${TMP}/pom.xml
}
#
GROUP=io.sf.carte
ARTIFACT=tokenproducer
VERSION=1.0.0
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
ARTIFACT=carte-util
VERSION=3.1.0
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
ARTIFACT=xml-dtd
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
ARTIFACT=css4j
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
ARTIFACT=css4j-agent
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
ARTIFACT=css4j-awt
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
ARTIFACT=css4j-dom4j
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
rm ${LOCALREPO}/io/sf/carte/*/*/_remote.repositories
