#!/bin/bash
#
# This script assumes that the css4j, css4j-dom4j and other module git repositories
# are in subdirectories of this directory's parent.
#
# You'll probably want to edit manually the result of executing the script.
#
if [[ $# -eq 0 ]] ; then
	echo "No version supplied (e.g. '1.0.3')"
	exit 1
fi
OLDTAG=`git tag -l --merged 1-stable --sort=-taggerdate|head -1`
echo "Writing changes from tag $OLDTAG"
TITLE="CSS4J CHANGES"
VERHDR="Version ${1}"
OUTFILE="../css4j-dist/CHANGES.txt"
echo -e "${TITLE}\\r\\n${TITLE//?/=}\\r\\n\\r\\n${VERHDR}\\r\\n${VERHDR//?/-}\\r">CHANGES.txt
cd ../css4j
echo -e " * Core:\\r">>${OUTFILE}
git log --reverse --pretty=format:%s ${OLDTAG}..|sed -e 's/^/- /'|fold -s|sed -r 's/^([^-])/  \1/'|sed -e 's/$/\r/'>>${OUTFILE}
cd ../css4j-dom4j
echo -e "\\r\\n * Dom4j module:\\r">>${OUTFILE}
git log --reverse --pretty=format:%s ${OLDTAG}..|sed -e 's/^/- /'|fold -s|sed -r 's/^([^-])/  \1/'|sed -e 's/$/\r/'>>${OUTFILE}
cd ../css4j-agent
echo -e "\\r\\n * Agent module:\\r">>${OUTFILE}
git log --reverse --pretty=format:%s ${OLDTAG}..|sed -e 's/^/- /'|fold -s|sed -r 's/^([^-])/  \1/'|sed -e 's/$/\r/'>>${OUTFILE}
cd ../css4j-awt
echo -e "\\r\\n * AWT module:\\r">>${OUTFILE}
git log --reverse --pretty=format:%s ${OLDTAG}..|sed -e 's/^/- /'|fold -s|sed -r 's/^([^-])/  \1/'|sed -e 's/$/\r/'>>${OUTFILE}
cd ../css4j-dist
