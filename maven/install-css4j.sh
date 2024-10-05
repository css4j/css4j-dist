#!/usr/bin/bash
#
# Install the CSS4J artifacts to the local Maven repository.
#
LOCALREPO=${HOME}/.m2/repository
#
PLUGIN=org.apache.maven.plugins:maven-dependency-plugin:2.9:get
REMOTEREPO=https://css4j.github.io/maven/
#
function errorCheck() {
  if [ "${1}" -ne "0" ]; then
    echo "Exit code ${1} at ${2}"
    exit ${1}
  fi
}
#
function install() {
  mvn $PLUGIN -DremoteRepositories=${REMOTEREPO} -Dartifact=${1}:${2}:${3}
  errorCheck $? "Retrieval of ${1}:${2}:${3} main artifact"
  mvn $PLUGIN -DremoteRepositories=${REMOTEREPO} -Dartifact=${1}:${2}:${3} -Dpackaging=pom
  errorCheck $? "Retrieval of ${1}:${2}:${3} POM artifact"
  mvn $PLUGIN -DremoteRepositories=${REMOTEREPO} -Dartifact=${1}:${2}:${3} -Dclassifier=sources
  errorCheck $? "Retrieval of ${1}:${2}:${3} source artifact"
}
#
GROUP=io.sf.carte
ARTIFACT=tokenproducer
VERSION=3.0
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
ARTIFACT=carte-util
VERSION=3.6.0
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
ARTIFACT=xml-dtd
VERSION=4.3
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
ARTIFACT=css4j
VERSION=5.0
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
ARTIFACT=css4j-agent
VERSION=5.0
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
ARTIFACT=css4j-awt
VERSION=5.0
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
ARTIFACT=css4j-dom4j
VERSION=5.0
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
rm -f ${LOCALREPO}/io/sf/carte/*/*/_remote.repositories
