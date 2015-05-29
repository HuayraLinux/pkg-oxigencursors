#!/bin/sh
ICONDIR=usr/share/icons
WRAPPERDIR=etc/X11/cursors
CURDIR=`pwd`
        cd debian/oxygencursors/${ICONDIR}
	for theme in oxy*
	do 
		grep -v Inherits ${CURDIR}/debian/oxygencursors/${ICONDIR}/${theme}/index.theme > tmp || exit 1
		echo "Inherits = ${theme}" >> tmp  || exit 1
		install -m 644 tmp ${CURDIR}/debian/oxygencursors/${WRAPPERDIR}/${theme}.theme || exit 1
		rm tmp || exit 1
	done 
exit 0
