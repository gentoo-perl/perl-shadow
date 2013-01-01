# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Package-DeprecationManager/Package-DeprecationManager-0.130.0.ebuild,v 1.10 2012/12/31 16:56:03 ago Exp $

EAPI=4

MODULE_AUTHOR=DROLSKY
MODULE_VERSION=0.13
inherit perl-module

DESCRIPTION="Manage deprecation warnings for your distribution"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ~ppc64 s390 sh sparc x86 ~ppc-aix ~x86-fbsd ~x86-freebsd ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE="test"

RDEPEND="dev-perl/List-MoreUtils
	dev-perl/Params-Util
	dev-perl/Sub-Install"
DEPEND="${RDEPEND}
	>=virtual/perl-ExtUtils-MakeMaker-6.31
	test? ( dev-perl/Test-Fatal
		>=virtual/perl-Test-Simple-0.88
		dev-perl/Test-Requires
		dev-perl/Test-Output )"

SRC_TEST="do"
