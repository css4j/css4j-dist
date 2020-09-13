#!/bin/bash
#
# This script assumes that the css4j, css4j-dom4j and other module git repositories
# are in subdirectories of this directory's parent.
#
# You'll probably want to edit manually the result of executing the script.
#
if [[ $# -eq 0 ]] ; then
	echo "No version supplied (e.g. '0.40')"
	exit 1
fi
OLDTAG=`git tag -l --sort=-taggerdate|head -1`
echo "Writing changes from tag $OLDTAG"
TITLE="CSS4J CHANGES"
VERHDR="Version ${1}"
OUTFILE="../css4j-dist/CHANGES.txt"
echo -en "${TITLE}\\r\\n${TITLE//?/=}\\r\\n\\r\\n${VERHDR}\\r\\n${VERHDR//?/-}\\r\\n\\r\\n">CHANGES.txt
cd ../css4j
echo -en " * Core:\\r\\n">>${OUTFILE}
git log --reverse --pretty=format:%s ${OLDTAG}..|sed -e 's/^/- /'|fold -s|sed -r 's/^([^-])/  \1/'|sed -e 's/$/\r/'>>${OUTFILE}
cd ../css4j-dom4j
echo -en "\\n\\r\\n * Dom4j module:\\r\\n">>${OUTFILE}
git log --reverse --pretty=format:%s ${OLDTAG}..|sed -e 's/^/- /'|fold -s|sed -r 's/^([^-])/  \1/'|sed -e 's/$/\r/'>>${OUTFILE}
cd ../css4j-agent
echo -en "\\n\\r\\n * Agent module:\\r\\n">>${OUTFILE}
git log --reverse --pretty=format:%s ${OLDTAG}..|sed -e 's/^/- /'|fold -s|sed -r 's/^([^-])/  \1/'|sed -e 's/$/\r/'>>${OUTFILE}
cd ../css4j-awt
echo -en "\\n\\r\\n * AWT module:\\r\\n">>${OUTFILE}
git log --reverse --pretty=format:%s ${OLDTAG}..|sed -e 's/^/- /'|fold -s|sed -r 's/^([^-])/  \1/'|sed -e 's/$/\r/'>>${OUTFILE}
cd ../tokenproducer
echo -en "\\n\\r\\n * Tokenproducer module:\\r\\n">>${OUTFILE}
git log --reverse --pretty=format:%s ${OLDTAG}..|sed -e 's/^/- /'|fold -s|sed -r 's/^([^-])/  \1/'|sed -e 's/$/\r/'>>${OUTFILE}
echo -en "\\n">>${OUTFILE}
cd ../css4j-dist
