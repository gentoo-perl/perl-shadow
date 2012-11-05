# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Module-Signature/Module-Signature-0.690.0.ebuild,v 1.1 2012/11/04 14:31:27 tove Exp $

EAPI=4

MODULE_AUTHOR=AUDREYT
MODULE_VERSION=0.69
inherit perl-module

DESCRIPTION="Module signature file manipulation "

LICENSE="CC0-1.0-Universal"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-solaris"
IUSE="test"

RDEPEND="
	virtual/perl-MIME-Base64
	dev-perl/PAR-Dist
	virtual/perl-IO-Compress
	dev-perl/crypt-cbc
	dev-perl/Crypt-DES
	dev-perl/Crypt-Blowfish
	dev-perl/Crypt-RIPEMD160
	dev-perl/class-loader
	dev-perl/tie-encryptedhash
	dev-perl/convert-ascii-armour
	dev-perl/data-buffer
	dev-perl/digest-md2
	>=dev-perl/math-pari-2.010603
	dev-perl/crypt-random
	dev-perl/crypt-primes
	dev-perl/crypt-des-ede3
	dev-perl/crypt-dsa
	dev-perl/crypt-rsa
	dev-perl/Convert-ASN1
	dev-perl/convert-pem
	dev-perl/Crypt-OpenPGP
	app-crypt/gnupg
"
DEPEND="${RDEPEND}
	test? (
		dev-perl/IPC-Run
	)
"

SRC_TEST="do"

src_test() {
	export TEST_SIGNATURE="1"
	perl-module_src_test
}
