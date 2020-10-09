#!/usr/bin/bash
#
# Deploy artifacts to temporary css4j.github.io repository.
#
if [[ $# -ne 2 ]] ; then
	echo "No versions supplied (e.g. '2.1.0 1.0.0')"
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
# Tokenproducer
if [ ! -f ${GROUPDIR}/tokenproducer/${2}/tokenproducer-${2}.jar ]; then
	if [ -f ${GROUPDIR}/tokenproducer/maven-metadata.xml ]; then
		mv -f ${GROUPDIR}/tokenproducer/maven-metadata.xml ${GROUPDIR}/tokenproducer/maven-metadata-local.xml
	fi
	mvn install:install-file -Dfile=jar/tokenproducer-${2}.jar -DpomFile=tokenproducer/pom.xml -DgroupId=io.sf.carte -DartifactId=tokenproducer -Dversion=${2} -Dpackaging=jar -DlocalRepositoryPath=${REPODIR}
	mvn install:install-file -Dfile=jar/tokenproducer-${2}-sources.jar -DgroupId=io.sf.carte -DartifactId=tokenproducer -Dversion=${2} -Dpackaging=jar -Dclassifier=sources -DlocalRepositoryPath=${REPODIR}
	mvn install:install-file -Dfile=jar/tokenproducer-${2}-javadoc.jar -DgroupId=io.sf.carte -DartifactId=tokenproducer -Dversion=${2} -Dpackaging=jar -Dclassifier=javadoc -DlocalRepositoryPath=${REPODIR}
	# Digests
	sha1sum -b tokenproducer/pom.xml|awk '{print $1}' > ${GROUPDIR}/tokenproducer/${2}/tokenproducer-${2}.pom.sha1
	md5sum -b tokenproducer/pom.xml|awk '{print $1}' > ${GROUPDIR}/tokenproducer/${2}/tokenproducer-${2}.pom.md5
	sha1sum -b jar/tokenproducer-${2}.jar|awk '{print $1}' > ${GROUPDIR}/tokenproducer/${2}/tokenproducer-${2}.jar.sha1
	md5sum -b jar/tokenproducer-${2}.jar|awk '{print $1}' > ${GROUPDIR}/tokenproducer/${2}/tokenproducer-${2}.jar.md5
	sha1sum -b jar/tokenproducer-${2}-sources.jar|awk '{print $1}' > ${GROUPDIR}/tokenproducer/${2}/tokenproducer-${2}-sources.jar.sha1
	md5sum -b jar/tokenproducer-${2}-sources.jar|awk '{print $1}' > ${GROUPDIR}/tokenproducer/${2}/tokenproducer-${2}-sources.jar.md5
	sha1sum -b jar/tokenproducer-${2}-javadoc.jar|awk '{print $1}' > ${GROUPDIR}/tokenproducer/${2}/tokenproducer-${2}-javadoc.jar.sha1
	md5sum -b jar/tokenproducer-${2}-javadoc.jar|awk '{print $1}' > ${GROUPDIR}/tokenproducer/${2}/tokenproducer-${2}-javadoc.jar.md5
	mv -f ${GROUPDIR}/tokenproducer/maven-metadata-local.xml ${GROUPDIR}/tokenproducer/maven-metadata.xml
fi
# Carte Util
if [ -f ${GROUPDIR}/carte-util/maven-metadata.xml ]; then
	mv -f ${GROUPDIR}/carte-util/maven-metadata.xml ${GROUPDIR}/carte-util/maven-metadata-local.xml
fi
mvn install:install-file -Dfile=jar/carte-util-${1}.jar -DpomFile=carte-util/pom.xml -DgroupId=io.sf.carte -DartifactId=carte-util -Dversion=${1} -Dpackaging=jar -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/carte-util-${1}-sources.jar -DgroupId=io.sf.carte -DartifactId=carte-util -Dversion=${1} -Dpackaging=jar -Dclassifier=sources -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/carte-util-${1}-javadoc.jar -DgroupId=io.sf.carte -DartifactId=carte-util -Dversion=${1} -Dpackaging=jar -Dclassifier=javadoc -DlocalRepositoryPath=${REPODIR}
# Digests
sha1sum -b carte-util/pom.xml|awk '{print $1}' > ${GROUPDIR}/carte-util/${1}/carte-util-${1}.pom.sha1
md5sum -b carte-util/pom.xml|awk '{print $1}' > ${GROUPDIR}/carte-util/${1}/carte-util-${1}.pom.md5
sha1sum -b jar/carte-util-${1}.jar|awk '{print $1}' > ${GROUPDIR}/carte-util/${1}/carte-util-${1}.jar.sha1
md5sum -b jar/carte-util-${1}.jar|awk '{print $1}' > ${GROUPDIR}/carte-util/${1}/carte-util-${1}.jar.md5
sha1sum -b jar/carte-util-${1}-sources.jar|awk '{print $1}' > ${GROUPDIR}/carte-util/${1}/carte-util-${1}-sources.jar.sha1
md5sum -b jar/carte-util-${1}-sources.jar|awk '{print $1}' > ${GROUPDIR}/carte-util/${1}/carte-util-${1}-sources.jar.md5
sha1sum -b jar/carte-util-${1}-javadoc.jar|awk '{print $1}' > ${GROUPDIR}/carte-util/${1}/carte-util-${1}-javadoc.jar.sha1
md5sum -b jar/carte-util-${1}-javadoc.jar|awk '{print $1}' > ${GROUPDIR}/carte-util/${1}/carte-util-${1}-javadoc.jar.md5
mv -f ${GROUPDIR}/carte-util/maven-metadata-local.xml ${GROUPDIR}/carte-util/maven-metadata.xml
# XML-DTD
if [ -f ${GROUPDIR}/xml-dtd/maven-metadata.xml ]; then
	mv -f ${GROUPDIR}/xml-dtd/maven-metadata.xml ${GROUPDIR}/xml-dtd/maven-metadata-local.xml
fi
mvn install:install-file -Dfile=jar/xml-dtd-${1}.jar -DpomFile=xml-dtd/pom.xml -DgroupId=io.sf.carte -DartifactId=xml-dtd -Dversion=${1} -Dpackaging=jar -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/xml-dtd-${1}-sources.jar -DgroupId=io.sf.carte -DartifactId=xml-dtd -Dversion=${1} -Dpackaging=jar -Dclassifier=sources -DlocalRepositoryPath=${REPODIR}
mvn install:install-file -Dfile=jar/xml-dtd-${1}-javadoc.jar -DgroupId=io.sf.carte -DartifactId=xml-dtd -Dversion=${1} -Dpackaging=jar -Dclassifier=javadoc -DlocalRepositoryPath=${REPODIR}
# Digests
sha1sum -b xml-dtd/pom.xml|awk '{print $1}' > ${GROUPDIR}/xml-dtd/${1}/xml-dtd-${1}.pom.sha1
md5sum -b xml-dtd/pom.xml|awk '{print $1}' > ${GROUPDIR}/xml-dtd/${1}/xml-dtd-${1}.pom.md5
sha1sum -b jar/xml-dtd-${1}.jar|awk '{print $1}' > ${GROUPDIR}/xml-dtd/${1}/xml-dtd-${1}.jar.sha1
md5sum -b jar/xml-dtd-${1}.jar|awk '{print $1}' > ${GROUPDIR}/xml-dtd/${1}/xml-dtd-${1}.jar.md5
sha1sum -b jar/xml-dtd-${1}-sources.jar|awk '{print $1}' > ${GROUPDIR}/xml-dtd/${1}/xml-dtd-${1}-sources.jar.sha1
md5sum -b jar/xml-dtd-${1}-sources.jar|awk '{print $1}' > ${GROUPDIR}/xml-dtd/${1}/xml-dtd-${1}-sources.jar.md5
sha1sum -b jar/xml-dtd-${1}-javadoc.jar|awk '{print $1}' > ${GROUPDIR}/xml-dtd/${1}/xml-dtd-${1}-javadoc.jar.sha1
md5sum -b jar/xml-dtd-${1}-javadoc.jar|awk '{print $1}' > ${GROUPDIR}/xml-dtd/${1}/xml-dtd-${1}-javadoc.jar.md5
mv -f ${GROUPDIR}/xml-dtd/maven-metadata-local.xml ${GROUPDIR}/xml-dtd/maven-metadata.xml
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
