# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/ImageInfo/ImageInfo-1.320.0.ebuild,v 1.4 2012/08/03 10:48:53 ago Exp $

EAPI=4

MY_PN=Image-Info
MODULE_AUTHOR=SREZIC
MODULE_VERSION=1.32
inherit perl-module

DESCRIPTION="The Perl Image-Info Module"

SLOT="0"
KEYWORDS="~alpha amd64 ~ppc ~ppc64 x86"
IUSE=""

DEPEND=">=dev-perl/IO-String-1.01
	dev-perl/XML-LibXML
	dev-perl/XML-Simple"
RDEPEND="${DEPEND}"

SRC_TEST="do"
