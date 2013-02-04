# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/MooseX-Types-Path-Tiny/MooseX-Types-Path-Tiny-0.1.0.ebuild,v 1.1 2013/02/03 17:42:53 tove Exp $

EAPI=5

MODULE_AUTHOR=DAGOLDEN
MODULE_VERSION=0.001
inherit perl-module

DESCRIPTION="Path::Tiny types and coercions for Moose"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-perl/Path-Tiny
	dev-perl/Moose
	dev-perl/MooseX-Types
	dev-perl/MooseX-Types-Stringlike
"
DEPEND="${RDEPEND}
	>=virtual/perl-ExtUtils-MakeMaker-6.300.0
	test? (
		dev-perl/File-pushd
		dev-perl/Test-Fatal
		>=virtual/perl-File-Temp-0.180.0
		>=virtual/perl-Test-Simple-0.960.0
	)
"

SRC_TEST=do
