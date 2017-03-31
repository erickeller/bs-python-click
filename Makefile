VERSION:=$(shell dpkg-parsechangelog -S Version | sed -rne 's,([^-\+]+)+(\+dfsg)*.*,\1,p'i)
UPSTREAM_PACKAGE:=click_${VERSION}.orig.tar.gz
PROJECT_NAME=$(shell basename `pwd`)
dpkg:
	tar cafv ../${UPSTREAM_PACKAGE} . --exclude debian --exclude .git
	debuild -uc -us
clean:
	rm -f ../${UPSTREAM_PACKAGE}
	debuild clean
