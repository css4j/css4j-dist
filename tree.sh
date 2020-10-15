#!/bin/sh -
#
# This script assumes that is being run on a new directory where the contents of
# the css4j-dist repository have been copied. It will fetch the current css4j
# and other modules from git, and create a 'release-scripts' directory.
#
# Uses 'git clone --depth 1' due to Github not supporting 'git archive'.
#
GIT="git clone --depth 1 -c core.autocrlf=input -c core.eol=lf"
DIR=tokenproducer
if [ -d ${DIR} ]; then
	rm -fr ${DIR}
fi
${GIT} https://github.com/css4j/${DIR}.git
rm -fr ${DIR}/.git
rm ${DIR}/.gitignore
rm ${DIR}/.gitattributes
DIR=carte-util
if [ -d ${DIR} ]; then
	rm -fr ${DIR}
fi
${GIT} https://github.com/css4j/${DIR}.git
rm -fr ${DIR}/.git
rm ${DIR}/.gitignore
rm ${DIR}/.gitattributes
DIR=xml-dtd
if [ -d ${DIR} ]; then
	rm -fr ${DIR}
fi
${GIT} https://github.com/css4j/${DIR}.git
rm -fr ${DIR}/.git
rm ${DIR}/.gitignore
rm ${DIR}/.gitattributes
DIR=css4j
if [ -d ${DIR} ]; then
	rm -fr ${DIR}
fi
${GIT} https://github.com/css4j/${DIR}.git
rm -fr ${DIR}/.git
rm ${DIR}/.gitignore
rm ${DIR}/.gitattributes
cp -fp ${DIR}/LICENSES.txt .
DIR=css4j-dom4j
if [ -d ${DIR} ]; then
	rm -fr ${DIR}
fi
${GIT} https://github.com/css4j/${DIR}.git
rm -fr ${DIR}/.git
rm ${DIR}/.gitignore
rm ${DIR}/.gitattributes
DIR=css4j-agent
if [ -d ${DIR} ]; then
	rm -fr ${DIR}
fi
${GIT} https://github.com/css4j/${DIR}.git
rm -fr ${DIR}/.git
rm ${DIR}/.gitignore
rm ${DIR}/.gitattributes
cat ${DIR}/LICENSES.txt >> LICENSES.txt
DIR=css4j-awt
if [ -d ${DIR} ]; then
	rm -fr ${DIR}
fi
${GIT} https://github.com/css4j/${DIR}.git
rm -fr ${DIR}/.git
rm ${DIR}/.gitignore
rm ${DIR}/.gitattributes
/usr/bin/unix2dos *.txt
if [ ! -d release-scripts ]; then
	mkdir release-scripts
fi
if [ ! -d jar ]; then
	mkdir jar
fi
BOLD=$(tput bold)
RESET=$(tput sgr0)
echo ${BOLD}Now execute:
echo -n 'export JAVA_HOME="/usr/lib/jvm/java-15-openjdk-amd64/"'
echo ${RESET} '(or your path to JDK 15 or higher)'${BOLD}
echo mvn
echo mv */build/*.jar jar
echo mv *.sh release-scripts
echo -n ${RESET}
