# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/note/note-1.3.3.ebuild,v 1.7 2008/01/24 18:14:16 nixnut Exp $
EAPI=4
MODULE_AUTHOR=TLINDEN
MODULE_VERSION=1.3.6

inherit perl-app

DESCRIPTION="A note taking perl program"
HOMEPAGE="http://www.daemon.de/NOTE"
#SRC_URI="http://www.daemon.de/files/mirror/ftp.daemon.de/scip/Apps/note/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="crypt dbm general +readline mysql"

# inherit perl-app cause depend on dev-lang/perl
comment() { echo ''; }

OPTIONAL="
	crypt? (
		dev-perl/crypt-cbc		$(comment Crypt::CBC)
		dev-perl/Crypt-Rijndael $(comment Crypt::Rijndael)
	)
	$(comment virtual/perl-Data-Dumper Data::Dumper)
	virtual/perl-MIME-Base64	$(comment MIME::Base64)
	virtual/perl-Storable		$(comment Storable.pm)
	general? (
		dev-perl/config-general	$(comment Config::General)
	)
	dbm? (
		virtual/perl-DB_File	$(comment DB_File.pm)
	)
	mysql? (
		virtual/mysql
		dev-perl/DBI			$(comment DBI.pm)
		dev-perl/DBD-mysql		$(comment DBD::mysql)
	)
	readline? (
		dev-perl/Term-ReadLine-Gnu
	)
"
RDEPEND="
	virtual/perl-IO				$(comment prereq IO::File)
								$(comment prereq FileHandle.pm)
	virtual/perl-File-Spec		$(comment prereq File::Spec)
								$(comment prereq File::Glob)
	virtual/perl-Getopt-Long	$(comment prereq Getopt::Long)
								$(comment prereq Fcntl)
	virtual/perl-IO				$(comment prereq IO::Seekable)
	${OPTIONAL}
"
DEPEND="${RDEPEND}"

RESTRICT="test"
SRC_TEST="do"

src_install() {
	perl-module_src_install || die "perl-module_src_install failed"

	# Adding some basic utitily for testing note
	dodir /usr/share/${PN}
	cp "${S}/bin/stresstest.sh" "${D}/usr/share/${PN}"

	# Adding some help for mysql backend driver
	if use mysql; then
		dodir /usr/share/${PN}/mysql
		cp -r "${S}/mysql" "${D}/usr/share/${PN}"
	fi

	# Adding a sample configuration file
	dodir /etc
	cp "${S}/config/noterc" "${D}/etc"

	# Supressing file not needed
	for v in mysql text dbm general; do
		if ! use ${v}; then
			for u in `find "${D}" -type f -name *${v}.*pm`; do
				rm "${u}"
			done
		fi
	done

	dodoc README Changelog UPGRADE VERSION
}
