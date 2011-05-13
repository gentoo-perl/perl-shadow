# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Exception-Warning/Exception-Warning-0.0401.ebuild,v 1.1 2009/12/10 16:04:58 tove Exp $

EAPI=2

MODULE_AUTHOR="DEXTER"
inherit perl-module

DESCRIPTION="Convert simple warn into real exception object"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=">=dev-perl/Exception-Base-0.22.01"
DEPEND="${RDEPEND}
	virtual/perl-Module-Build
	test? ( dev-perl/Test-Assert
		>=dev-perl/Test-Unit-Lite-0.12
		virtual/perl-parent )"

SRC_TEST=do
