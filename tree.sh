#!/bin/sh -
#
# This script assumes that is being run on a new directory where the contents of
# the css4j-dist repository have been copied. It will fetch the current css4j
# and other modules from git, and create a 'release-scripts' directory.
#
# Uses 'git clone --depth 1' due to Github not supporting 'git archive'.
#
DIR=css4j
GIT="git clone --depth 1 -c core.autocrlf=input -c core.eol=lf"
${GIT} https://github.com/css4j/${DIR}.git
rm -fr ${DIR}/.git
rm ${DIR}/.gitignore
rm ${DIR}/.gitattributes
cp -fp ${DIR}/LICENSES.txt .
DIR=css4j-dom4j
${GIT} https://github.com/css4j/${DIR}.git
rm -fr ${DIR}/.git
rm ${DIR}/.gitignore
rm ${DIR}/.gitattributes
DIR=css4j-agent
${GIT} https://github.com/css4j/${DIR}.git
rm -fr ${DIR}/.git
rm ${DIR}/.gitignore
rm ${DIR}/.gitattributes
cat ${DIR}/LICENSES.txt >> LICENSES.txt
DIR=css4j-awt
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
echo -n 'export JAVA_HOME="/usr/lib/jvm/java-14-openjdk-amd64/"'
echo ${RESET} '(or your path to JDK12 or higher)'${BOLD}
echo mvn
echo mv */build/*.jar jar
echo mv *.sh release-scripts
echo -n ${RESET}
