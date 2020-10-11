#!/usr/bin/bash
#
# Deploy artifacts to temporary css4j.github.io repository.
#
if [[ $# -eq 0 ]] ; then
	echo "No version supplied (e.g. '2.1.0')"
	exit 1
fi
REPODIR="${HOME}/www/css4j.github.io/maven"
GROUPDIR=${REPODIR}/io/sf/carte
# Deploy main POM
if [ -f ${GROUPDIR}/css4j-dist/maven-metadata.xml ]; then
	mv -f ${GROUPDIR}/css4j-dist/maven-metadata.xml ${GROUPDIR}/css4j-dist/maven-metadata-local.xml
fi
mvn install:install-file -Dfile=pom.xml -DpomFile=pom.xml -DgroupId=io.sf.carte -DartifactId=css4j-dist -Dversion=${1} -Dpackaging=pom -DlocalRepositoryPath=${REPODIR}
# Digests: '-DcreateChecksum=true' did not work
sha1sum -b pom.xml|awk '{print $1}' > ${GROUPDIR}/css4j-dist/${1}/css4j-dist-${1}.pom.sha1
md5sum -b pom.xml|awk '{print $1}' > ${GROUPDIR}/css4j-dist/${1}/css4j-dist-${1}.pom.md5
mv -f ${GROUPDIR}/css4j-dist/maven-metadata-local.xml ${GROUPDIR}/css4j-dist/maven-metadata.xml
# Core module
if [ -f ${GROUPDIR}/css4j/maven-metadata.xml ]; then
	mv -f ${GROUPDIR}/css4j/maven-metadata.xml ${GROUPDIR}/css4j/maven-metadata-local.xml
fi
mvn install:install-file -Dfile=jar/css4j-${1}.jar -DpomFile=css4j/pom.xml -DgroupId=io.sf.carte -DartifactId=css4j -Dversion=${1} -Dpackaging=jar -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-${1}-sources.jar -DgroupId=io.sf.carte -DartifactId=css4j -Dversion=${1} -Dpackaging=jar -Dclassifier=sources -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-${1}-javadoc.jar -DgroupId=io.sf.carte -DartifactId=css4j -Dversion=${1} -Dpackaging=jar -Dclassifier=javadoc -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-${1}-tests.jar -DgroupId=io.sf.carte -DartifactId=css4j -Dversion=${1} -Dpackaging=jar -Dclassifier=tests -DlocalRepositoryPath=${REPODIR}
# Digests
sha1sum -b css4j/pom.xml|awk '{print $1}' > ${GROUPDIR}/css4j/${1}/css4j-${1}.pom.sha1
md5sum -b css4j/pom.xml|awk '{print $1}' > ${GROUPDIR}/css4j/${1}/css4j-${1}.pom.md5
sha1sum -b jar/css4j-${1}.jar|awk '{print $1}' > ${GROUPDIR}/css4j/${1}/css4j-${1}.jar.sha1
md5sum -b jar/css4j-${1}.jar|awk '{print $1}' > ${GROUPDIR}/css4j/${1}/css4j-${1}.jar.md5
sha1sum -b jar/css4j-${1}-sources.jar|awk '{print $1}' > ${GROUPDIR}/css4j/${1}/css4j-${1}-sources.jar.sha1
md5sum -b jar/css4j-${1}-sources.jar|awk '{print $1}' > ${GROUPDIR}/css4j/${1}/css4j-${1}-sources.jar.md5
sha1sum -b jar/css4j-${1}-javadoc.jar|awk '{print $1}' > ${GROUPDIR}/css4j/${1}/css4j-${1}-javadoc.jar.sha1
md5sum -b jar/css4j-${1}-javadoc.jar|awk '{print $1}' > ${GROUPDIR}/css4j/${1}/css4j-${1}-javadoc.jar.md5
sha1sum -b jar/css4j-${1}-tests.jar|awk '{print $1}' > ${GROUPDIR}/css4j/${1}/css4j-${1}-tests.jar.sha1
md5sum -b jar/css4j-${1}-tests.jar|awk '{print $1}' > ${GROUPDIR}/css4j/${1}/css4j-${1}-tests.jar.md5
mv -f ${GROUPDIR}/css4j/maven-metadata-local.xml ${GROUPDIR}/css4j/maven-metadata.xml
# Agent module
if [ -f ${GROUPDIR}/css4j-agent/maven-metadata.xml ]; then
	mv -f ${GROUPDIR}/css4j-agent/maven-metadata.xml ${GROUPDIR}/css4j-agent/maven-metadata-local.xml
fi
mvn install:install-file -Dfile=jar/css4j-agent-${1}.jar -DpomFile=css4j-agent/pom.xml -DgroupId=io.sf.carte -DartifactId=css4j-agent -Dversion=${1} -Dpackaging=jar -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-agent-${1}-sources.jar -DgroupId=io.sf.carte -DartifactId=css4j-agent -Dversion=${1} -Dpackaging=jar -Dclassifier=sources -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-agent-${1}-javadoc.jar -DgroupId=io.sf.carte -DartifactId=css4j-agent -Dversion=${1} -Dpackaging=jar -Dclassifier=javadoc -DlocalRepositoryPath=${REPODIR}
# Digests
sha1sum -b css4j-agent/pom.xml|awk '{print $1}' > ${GROUPDIR}/css4j-agent/${1}/css4j-agent-${1}.pom.sha1
md5sum -b css4j-agent/pom.xml|awk '{print $1}' > ${GROUPDIR}/css4j-agent/${1}/css4j-agent-${1}.pom.md5
sha1sum -b jar/css4j-agent-${1}.jar|awk '{print $1}' > ${GROUPDIR}/css4j-agent/${1}/css4j-agent-${1}.jar.sha1
md5sum -b jar/css4j-agent-${1}.jar|awk '{print $1}' > ${GROUPDIR}/css4j-agent/${1}/css4j-agent-${1}.jar.md5
sha1sum -b jar/css4j-agent-${1}-sources.jar|awk '{print $1}' > ${GROUPDIR}/css4j-agent/${1}/css4j-agent-${1}-sources.jar.sha1
md5sum -b jar/css4j-agent-${1}-sources.jar|awk '{print $1}' > ${GROUPDIR}/css4j-agent/${1}/css4j-agent-${1}-sources.jar.md5
sha1sum -b jar/css4j-agent-${1}-javadoc.jar|awk '{print $1}' > ${GROUPDIR}/css4j-agent/${1}/css4j-agent-${1}-javadoc.jar.sha1
md5sum -b jar/css4j-agent-${1}-javadoc.jar|awk '{print $1}' > ${GROUPDIR}/css4j-agent/${1}/css4j-agent-${1}-javadoc.jar.md5
mv -f ${GROUPDIR}/css4j-agent/maven-metadata-local.xml ${GROUPDIR}/css4j-agent/maven-metadata.xml
# Dom4j module
if [ -f ${GROUPDIR}/css4j-dom4j/maven-metadata.xml ]; then
	mv -f ${GROUPDIR}/css4j-dom4j/maven-metadata.xml ${GROUPDIR}/css4j-dom4j/maven-metadata-local.xml
fi
mvn install:install-file -Dfile=jar/css4j-dom4j-${1}.jar -DpomFile=css4j-dom4j/pom.xml -DgroupId=io.sf.carte -DartifactId=css4j-dom4j -Dversion=${1} -Dpackaging=jar -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-dom4j-${1}-sources.jar -DgroupId=io.sf.carte -DartifactId=css4j-dom4j -Dversion=${1} -Dpackaging=jar -Dclassifier=sources -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-dom4j-${1}-javadoc.jar -DgroupId=io.sf.carte -DartifactId=css4j-dom4j -Dversion=${1} -Dpackaging=jar -Dclassifier=javadoc -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-dom4j-${1}-tests.jar -DgroupId=io.sf.carte -DartifactId=css4j-dom4j -Dversion=${1} -Dpackaging=jar -Dclassifier=tests -DlocalRepositoryPath=${REPODIR}
# Digests
sha1sum -b css4j-dom4j/pom.xml|awk '{print $1}' > ${GROUPDIR}/css4j-dom4j/${1}/css4j-dom4j-${1}.pom.sha1
md5sum -b css4j-dom4j/pom.xml|awk '{print $1}' > ${GROUPDIR}/css4j-dom4j/${1}/css4j-dom4j-${1}.pom.md5
sha1sum -b jar/css4j-dom4j-${1}.jar|awk '{print $1}' > ${GROUPDIR}/css4j-dom4j/${1}/css4j-dom4j-${1}.jar.sha1
md5sum -b jar/css4j-dom4j-${1}.jar|awk '{print $1}' > ${GROUPDIR}/css4j-dom4j/${1}/css4j-dom4j-${1}.jar.md5
sha1sum -b jar/css4j-dom4j-${1}-sources.jar|awk '{print $1}' > ${GROUPDIR}/css4j-dom4j/${1}/css4j-dom4j-${1}-sources.jar.sha1
md5sum -b jar/css4j-dom4j-${1}-sources.jar|awk '{print $1}' > ${GROUPDIR}/css4j-dom4j/${1}/css4j-dom4j-${1}-sources.jar.md5
sha1sum -b jar/css4j-dom4j-${1}-tests.jar|awk '{print $1}' > ${GROUPDIR}/css4j-dom4j/${1}/css4j-dom4j-${1}-tests.jar.sha1
md5sum -b jar/css4j-dom4j-${1}-tests.jar|awk '{print $1}' > ${GROUPDIR}/css4j-dom4j/${1}/css4j-dom4j-${1}-tests.jar.md5
mv -f ${GROUPDIR}/css4j-dom4j/maven-metadata-local.xml ${GROUPDIR}/css4j-dom4j/maven-metadata.xml
# AWT module
if [ -f ${GROUPDIR}/css4j-awt/maven-metadata.xml ]; then
	mv -f ${GROUPDIR}/css4j-awt/maven-metadata.xml ${GROUPDIR}/css4j-awt/maven-metadata-local.xml
fi
mvn install:install-file -Dfile=jar/css4j-awt-${1}.jar -DpomFile=css4j-awt/pom.xml -DgroupId=io.sf.carte -DartifactId=css4j-awt -Dversion=${1} -Dpackaging=jar -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-awt-${1}-sources.jar -DgroupId=io.sf.carte -DartifactId=css4j-awt -Dversion=${1} -Dpackaging=jar -Dclassifier=sources -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/css4j-awt-${1}-javadoc.jar -DgroupId=io.sf.carte -DartifactId=css4j-awt -Dversion=${1} -Dpackaging=jar -Dclassifier=javadoc -DlocalRepositoryPath=${REPODIR}
# Digests
sha1sum -b css4j-awt/pom.xml|awk '{print $1}' > ${GROUPDIR}/css4j-awt/${1}/css4j-awt-${1}.pom.sha1
md5sum -b css4j-awt/pom.xml|awk '{print $1}' > ${GROUPDIR}/css4j-awt/${1}/css4j-awt-${1}.pom.md5
sha1sum -b jar/css4j-awt-${1}.jar|awk '{print $1}' > ${GROUPDIR}/css4j-awt/${1}/css4j-awt-${1}.jar.sha1
md5sum -b jar/css4j-awt-${1}.jar|awk '{print $1}' > ${GROUPDIR}/css4j-awt/${1}/css4j-awt-${1}.jar.md5
sha1sum -b jar/css4j-awt-${1}-sources.jar|awk '{print $1}' > ${GROUPDIR}/css4j-awt/${1}/css4j-awt-${1}-sources.jar.sha1
md5sum -b jar/css4j-awt-${1}-sources.jar|awk '{print $1}' > ${GROUPDIR}/css4j-awt/${1}/css4j-awt-${1}-sources.jar.md5
sha1sum -b jar/css4j-awt-${1}-javadoc.jar|awk '{print $1}' > ${GROUPDIR}/css4j-awt/${1}/css4j-awt-${1}-javadoc.jar.sha1
md5sum -b jar/css4j-awt-${1}-javadoc.jar|awk '{print $1}' > ${GROUPDIR}/css4j-awt/${1}/css4j-awt-${1}-javadoc.jar.md5
mv -f ${GROUPDIR}/css4j-awt/maven-metadata-local.xml ${GROUPDIR}/css4j-awt/maven-metadata.xml
# Generate indexes
generate_directory_index_caddystyle.py -r ${REPODIR}/io
