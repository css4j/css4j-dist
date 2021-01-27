#!/usr/bin/bash
#
# Bump the version of the parent POM.
#
if [[ $# -eq 0 ]] ; then
	echo "No new version supplied (e.g. '1.3.0')"
	exit 1
fi

NEWVER=${1}

function bump() {
  sed -zri "s#<version>[[:space:]]*[0-9]\.[0-9]\.[0-9]+[[:space:]]*</version>([[:space:]]*)</parent>#<version>$NEWVER</version>\1</parent>#" ${1}
}

bump "../css4j/pom.xml"
bump "../css4j-agent/pom.xml"
bump "../css4j-awt/pom.xml"
bump "../css4j-dom4j/pom.xml"

# Now the parent itself

sed -zri "s#css4j-dist</artifactId>([[:space:]]+)<version>[0-9]\.[0-9]\.[0-9]+</version>#css4j-dist</artifactId>\1<version>$NEWVER</version>#" pom.xml
git add "pom.xml"
git commit -m "POM: bump POM version to $NEWVER."

# Commit the modules

cd "../css4j"
git add "pom.xml"
git commit -m "POM: bump parent POM version to $NEWVER."

cd "../css4j-agent"
git add "pom.xml"
git commit -m "POM: bump parent POM version to $NEWVER."

cd "../css4j-awt"
git add "pom.xml"
git commit -m "POM: bump parent POM version to $NEWVER."

cd "../css4j-dom4j"
git add "pom.xml"
git commit -m "POM: bump parent POM version to $NEWVER."

cd "../css4j-dist"
