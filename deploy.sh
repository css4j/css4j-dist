#!/usr/bin/bash
#
# Deploy artifacts to temporary css4j.github.io repository.
#
if [[ $# -eq 0 ]] ; then
	echo "No version supplied (e.g. '1.1.0')"
	exit 1
fi
REPODIR="${HOME}/www/css4j.github.io/maven"
GROUPDIR=${REPODIR}/io/sf/carte
GROUPID=io.sf.carte
function deploy() {
REPODIR=${3}
GROUPDIR=${4}
GROUPID=io.sf.carte
if [ -f ${GROUPDIR}/$1/maven-metadata.xml ]; then
	mv -f ${GROUPDIR}/$1/maven-metadata.xml ${GROUPDIR}/$1/maven-metadata-local.xml
fi
mvn install:install-file -Dfile=jar/${1}-${2}.jar -DpomFile=${1}/pom.xml -DgroupId=${GROUPID} -DartifactId=${1} -Dversion=${2} -Dpackaging=jar -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/${1}-${2}-sources.jar -DgroupId=${GROUPID} -DartifactId=${1} -Dversion=${2} -Dpackaging=jar -Dclassifier=sources -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/${1}-${2}-javadoc.jar -DgroupId=${GROUPID} -DartifactId=${1} -Dversion=${2} -Dpackaging=jar -Dclassifier=javadoc -DlocalRepositoryPath=${REPODIR}
if [ -f jar/${1}-${2}-tests.jar ]; then
	mvn install:install-file -Dfile=jar/${1}-${2}-tests.jar -DgroupId=${GROUPID} -DartifactId=${1} -Dversion=${2} -Dpackaging=jar -Dclassifier=tests -DlocalRepositoryPath=${REPODIR}
	# Digests
	sha1sum -b jar/${1}-${2}-tests.jar|awk '{print $1}' > ${GROUPDIR}/${1}/${2}/${1}-${2}-tests.jar.sha1
	md5sum -b jar/${1}-${2}-tests.jar|awk '{print $1}' > ${GROUPDIR}/${1}/${2}/${1}-${2}-tests.jar.md5
fi
# Digests
POM=${GROUPDIR}/${1}/${2}/${1}-${2}.pom
dos2unix -q ${POM}
sha1sum -b ${POM}|awk '{print $1}' > ${POM}.sha1
md5sum -b ${POM}|awk '{print $1}' > ${POM}.md5
BASEDEST=${GROUPDIR}/${1}/${2}/${1}-${2}
sha1sum -b jar/${1}-${2}.jar|awk '{print $1}' > ${BASEDEST}.jar.sha1
md5sum -b jar/${1}-${2}.jar|awk '{print $1}' > ${BASEDEST}.jar.md5
sha1sum -b jar/${1}-${2}-sources.jar|awk '{print $1}' > ${BASEDEST}-sources.jar.sha1
md5sum -b jar/${1}-${2}-sources.jar|awk '{print $1}' > ${BASEDEST}-sources.jar.md5
sha1sum -b jar/${1}-${2}-javadoc.jar|awk '{print $1}' > ${BASEDEST}-javadoc.jar.sha1
md5sum -b jar/${1}-${2}-javadoc.jar|awk '{print $1}' > ${BASEDEST}-javadoc.jar.md5
mv -f ${GROUPDIR}/${1}/maven-metadata-local.xml ${GROUPDIR}/${1}/maven-metadata.xml
}
# Deploy main POM
if [ -f ${GROUPDIR}/css4j-dist/maven-metadata.xml ]; then
	mv -f ${GROUPDIR}/css4j-dist/maven-metadata.xml ${GROUPDIR}/css4j-dist/maven-metadata-local.xml
fi
mvn install:install-file -Dfile=pom.xml -DpomFile=pom.xml -DgroupId=${GROUPID} -DartifactId=css4j-dist -Dversion=${1} -Dpackaging=pom -DlocalRepositoryPath=${REPODIR}
# Digests: '-DcreateChecksum=true' did not work
POM=${GROUPDIR}/css4j-dist/${1}/css4j-dist-${1}.pom
dos2unix -q ${POM}
sha1sum -b ${POM}|awk '{print $1}' > ${POM}.sha1
md5sum -b ${POM}|awk '{print $1}' > ${POM}.md5
mv -f ${GROUPDIR}/css4j-dist/maven-metadata-local.xml ${GROUPDIR}/css4j-dist/maven-metadata.xml
# Core module
ARTIFACT=css4j
deploy "${ARTIFACT}" "${1}" "${REPODIR}" "${GROUPDIR}"
# Agent module
ARTIFACT=css4j-agent
deploy "${ARTIFACT}" "${1}" "${REPODIR}" "${GROUPDIR}"
# Dom4j module
ARTIFACT=css4j-dom4j
deploy "${ARTIFACT}" "${1}" "${REPODIR}" "${GROUPDIR}"
# AWT module
ARTIFACT=css4j-awt
deploy "${ARTIFACT}" "${1}" "${REPODIR}" "${GROUPDIR}"
# Generate indexes
generate_directory_index_caddystyle.py -r ${REPODIR}/io
