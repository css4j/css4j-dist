#!/usr/bin/bash
#
# Install the jclf-text and jclf-linear3 artifacts.
#
GROUP=io.sf.jclf
REMOTEREPO=https://css4j.github.io/maven/
PLUGIN=org.apache.maven.plugins:maven-dependency-plugin:2.9:get
LOCALREPO=${HOME}/.m2/repository
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
  rm -f ${LOCALREPO}/io/sf/jclf/${2}/${3}/_remote.repositories
}
#
ARTIFACT=jclf-text
VERSION=5.0.2
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
#
ARTIFACT=jclf-linear3
VERSION=1.0.0
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
