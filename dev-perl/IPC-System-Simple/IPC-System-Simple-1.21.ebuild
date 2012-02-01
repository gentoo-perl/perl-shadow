# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/IPC-System-Simple/IPC-System-Simple-1.21.ebuild,v 1.1 2012/01/21 23:58:24 ssuominen Exp $

EAPI=4

MODULE_AUTHOR=PJF
inherit perl-module

DESCRIPTION="Run commands simply, with detailed diagnostics"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/perl-File-Spec
	virtual/perl-Scalar-List-Utils
	virtual/perl-Test-Simple"
DEPEND="${RDEPEND}"

SRC_TEST="do"