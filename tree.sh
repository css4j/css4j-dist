#!/bin/sh -
#
# This script assumes that is being run on a new directory where the contents of
# the css4j-dist repository have been copied. It will fetch the current css4j
# and other modules from git, and create a 'release-scripts' directory.
#
# Uses 'git clone --depth 1' due to Github not supporting 'git archive'.
#
GIT="git clone --depth 1 -c core.autocrlf=input -c core.eol=lf"
DIR=carte-util
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
BOLD=$(tput bold)
RESET=$(tput sgr0)
echo
echo ${BOLD}Now execute:
echo
echo -n gradle build
echo ${RESET} "(or ${BOLD}gradle build publishToMavenLocal${RESET} to install in local Maven repository)"
echo
echo "To copy jar files to a 'jar' directory: ${BOLD}gradle copyJars${RESET}"
echo "To convert line endings of top-level text files to CRLF: ${BOLD}gradle lineEndingConversion"
echo -n ${RESET}
