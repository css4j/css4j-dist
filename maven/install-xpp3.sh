#!/usr/bin/bash
#
# Install the xmlpull-xpp3 artifacts to the local Maven repository.
#
# Assumes that the $TMP environment variable points to a temporary directory.
#
PLUGIN=org.apache.maven.plugins:maven-dependency-plugin:2.9:get
REMOTEREPO=https://css4j.github.io/maven/
LOCALREPO=${HOME}/.m2/repository
#
function errorCheck() {
  if [ "$?" -ne "0" ]; then
    echo "Exit code ${1} at ${2}"
    exit ${1}
  fi
}
#
function install() {
  mvn $PLUGIN -DremoteRepositories=${REMOTEREPO} -Dartifact=${1}:${2}:${3}
  errorCheck "Retrieval of ${1}:${2}:${3} main artifact"
  mvn $PLUGIN -DremoteRepositories=${REMOTEREPO} -Dartifact=${1}:${2}:${3} -Dpackaging=pom
  errorCheck "Retrieval of ${1}:${2}:${3} POM artifact"
  mvn $PLUGIN -DremoteRepositories=${REMOTEREPO} -Dartifact=${1}:${2}:${3} -Dclassifier=sources
  errorCheck "Retrieval of ${1}:${2}:${3} source artifact"
}
#
GROUP=xmlpull
ARTIFACT=xmlpull
VERSION=1.2.0
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
rm -f ${LOCALREPO}/xmlpull/${ARTIFACT}/${VERSION}/_remote.repositories
#
GROUP=xpp3
ARTIFACT=xpp3_min
install "${GROUP}" "${ARTIFACT}" "${VERSION}"
rm -f ${LOCALREPO}/xpp3/${ARTIFACT}/${VERSION}/_remote.repositories
