# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/Pod-Simple/Pod-Simple-3.160.0.ebuild,v 1.4 2011/12/04 21:11:55 maekke Exp $

EAPI=3

MODULE_AUTHOR=DWHEELER
MODULE_VERSION=3.16
inherit perl-module

DESCRIPTION="Framework for parsing Pod"

SLOT="0"
KEYWORDS="~alpha ~amd64 arm hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux ~ppc-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND=">=virtual/perl-Pod-Escapes-1.04"
RDEPEND="${DEPEND}"

SRC_TEST="do"
