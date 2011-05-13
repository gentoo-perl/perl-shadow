# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/MooseX-AttributeHelpers/MooseX-AttributeHelpers-0.23.ebuild,v 1.1 2010/01/03 16:06:10 tove Exp $

EAPI=2

#inherit versionator
#MODULE_AUTHOR=SARTAK
#MODULE_AUTHOR=FLORA
MODULE_AUTHOR=DROLSKY
#MY_P="${PN}-$(replace_version_separator 2 '_' )"
#S="${WORKDIR}/${MY_P}"
inherit perl-module

DESCRIPTION="Extend your attribute interfaces"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=">=dev-perl/Moose-0.56"
DEPEND="${RDEPEND}
	test? (
		>=dev-perl/Test-Exception-0.21
		>=virtual/perl-Test-Simple-0.62
	)"

SRC_TEST="do"
