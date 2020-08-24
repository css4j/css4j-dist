#!/usr/bin/bash
#
# Deploy artifacts to temporary css4j.github.io repository.
#
if [[ $# -eq 0 ]] ; then
	echo "No version supplied (e.g. '2.1.0')"
	exit 1
fi
REPODIR="/C/Users/*****/www/css4j.github.io/maven"
GROUPDIR=${REPODIR}/io/sf/carte
# Deploy main POM
if [ -f ${GROUPDIR}/css4j-dist/maven-metadata.xml ]; then
	mv -f ${GROUPDIR}/css4j-dist/maven-metadata.xml ${GROUPDIR}/css4j-dist/maven-metadata-local.xml
fi
mvn install:install-file -Dfile=pom.xml -DpomFile=pom.xml -DgroupId=io.sf.carte -DartifactId=css4j-dist -Dversion=${1} -Dpackaging=pom -DlocalRepositoryPath=${REPODIR}
mv -f ${GROUPDIR}/css4j-dist/maven-metadata-local.xml ${GROUPDIR}/css4j-dist/maven-metadata.xml
# Core module
if [ -f ${GROUPDIR}/css4j/maven-metadata.xml ]; then
	mv -f ${GROUPDIR}/css4j/maven-metadata.xml ${GROUPDIR}/css4j/maven-metadata-local.xml
fi
mvn install:install-file -Dfile=jar/css4j-${1}.jar -DpomFile=css4j/pom.xml -DgroupId=io.sf.carte -DartifactId=css4j -Dversion=${1} -Dpackaging=jar -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-${1}-sources.jar -DgroupId=io.sf.carte -DartifactId=css4j -Dversion=${1} -Dpackaging=jar -Dclassifier=sources -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-${1}-javadoc.jar -DgroupId=io.sf.carte -DartifactId=css4j -Dversion=${1} -Dpackaging=jar -Dclassifier=javadoc -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-${1}-tests.jar -DgroupId=io.sf.carte -DartifactId=css4j -Dversion=${1} -Dpackaging=jar -Dclassifier=tests -DlocalRepositoryPath=${REPODIR}
mv -f ${GROUPDIR}/css4j/maven-metadata-local.xml ${GROUPDIR}/css4j/maven-metadata.xml
# Agent module
if [ -f ${GROUPDIR}/css4j-agent/maven-metadata.xml ]; then
	mv -f ${GROUPDIR}/css4j-agent/maven-metadata.xml ${GROUPDIR}/css4j-agent/maven-metadata-local.xml
fi
mvn install:install-file -Dfile=jar/css4j-agent-${1}.jar -DpomFile=css4j-agent/pom.xml -DgroupId=io.sf.carte -DartifactId=css4j-agent -Dversion=${1} -Dpackaging=jar -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-agent-${1}-sources.jar -DgroupId=io.sf.carte -DartifactId=css4j-agent -Dversion=${1} -Dpackaging=jar -Dclassifier=sources -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-agent-${1}-javadoc.jar -DgroupId=io.sf.carte -DartifactId=css4j-agent -Dversion=${1} -Dpackaging=jar -Dclassifier=javadoc -DlocalRepositoryPath=${REPODIR}
mv -f ${GROUPDIR}/css4j-agent/maven-metadata-local.xml ${GROUPDIR}/css4j-agent/maven-metadata.xml
# Dom4j module
if [ -f ${GROUPDIR}/css4j-dom4j/maven-metadata.xml ]; then
	mv -f ${GROUPDIR}/css4j-dom4j/maven-metadata.xml ${GROUPDIR}/css4j-dom4j/maven-metadata-local.xml
fi
mvn install:install-file -Dfile=jar/css4j-dom4j-${1}.jar -DpomFile=css4j-dom4j/pom.xml -DgroupId=io.sf.carte -DartifactId=css4j-dom4j -Dversion=${1} -Dpackaging=jar -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-dom4j-${1}-sources.jar -DgroupId=io.sf.carte -DartifactId=css4j-dom4j -Dversion=${1} -Dpackaging=jar -Dclassifier=sources -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-dom4j-${1}-javadoc.jar -DgroupId=io.sf.carte -DartifactId=css4j-dom4j -Dversion=${1} -Dpackaging=jar -Dclassifier=javadoc -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-dom4j-${1}-tests.jar -DgroupId=io.sf.carte -DartifactId=css4j-dom4j -Dversion=${1} -Dpackaging=jar -Dclassifier=tests -DlocalRepositoryPath=${REPODIR}
mv -f ${GROUPDIR}/css4j-dom4j/maven-metadata-local.xml ${GROUPDIR}/css4j-dom4j/maven-metadata.xml
# AWT module
if [ -f ${GROUPDIR}/css4j-awt/maven-metadata.xml ]; then
	mv -f ${GROUPDIR}/css4j-awt/maven-metadata.xml ${GROUPDIR}/css4j-awt/maven-metadata-local.xml
fi
mvn install:install-file -Dfile=jar/css4j-awt-${1}.jar -DpomFile=css4j-awt/pom.xml -DgroupId=io.sf.carte -DartifactId=css4j-awt -Dversion=${1} -Dpackaging=jar -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-awt-${1}-sources.jar -DgroupId=io.sf.carte -DartifactId=css4j-awt -Dversion=${1} -Dpackaging=jar -Dclassifier=sources -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-awt-${1}-javadoc.jar -DgroupId=io.sf.carte -DartifactId=css4j-awt -Dversion=${1} -Dpackaging=jar -Dclassifier=javadoc -DlocalRepositoryPath=${REPODIR}
mv -f ${GROUPDIR}/css4j-awt/maven-metadata-local.xml ${GROUPDIR}/css4j-awt/maven-metadata.xml
