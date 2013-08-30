#!/bin/bash -x
#
# Creates a distributable bundle
#
cd `dirname $(readlink -f $0)`
P=`/usr/bin/xpath -e '/project/artifactId/text()' pom.xml`
V=`/usr/bin/xpath -e '/project/version/text()' pom.xml`
V=`echo "${V}" | sed -e "s/\\(.*\\)-SNAPSHOT/\\1/" -`

PV="${P}-${V}"
#
# Remove previous build
[[ -d "${PV}" ]] && rm -rf "${PV}"
[[ -f "${PV}.zip" ]] && rm -rf "${PV}.zip"
[[ -f "${PV}.tar.gz" ]] && rm -rf "${PV}.tar.gz"
# 
$(which mvn) clean install
#
mkdir "${PV}"
for f in bin config ddl_scripts lib LICENSE.txt log NOTICE.txt processes README.md repository templates; do
	cp -a "${f}" "${PV}/"
done
#
zip -r "${PV}.zip" "${PV}"
tar cfz "${PV}.tar.gz" "${PV}"
# rm -rf "${PV}"
