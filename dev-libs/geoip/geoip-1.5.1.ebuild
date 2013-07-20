# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/geoip/geoip-1.5.1.ebuild,v 1.2 2013/07/20 05:15:51 jer Exp $

EAPI=5
inherit autotools eutils

GEOLITE_URI="http://geolite.maxmind.com/download/geoip/database/"

DESCRIPTION="easily lookup countries by IP addresses, even when Reverse DNS entries don't exist"
HOMEPAGE="http://dev.maxmind.com/geoip/legacy/downloadable"
SRC_URI="
	https://github.com/maxmind/${PN}-api-c/archive/v${PV}.tar.gz -> ${P}.tar.gz
	http://geolite.maxmind.com/download/${PN}/database/GeoLiteCountry/GeoIP.dat.gz
	${GEOLITE_URI}asnum/GeoIPASNum.dat.gz
	city? ( ${GEOLITE_URI}GeoLiteCity.dat.gz )
	ipv6? (
		${GEOLITE_URI}GeoIPv6.dat.gz
		city? ( ${GEOLITE_URI}GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz )
	)
"

# GPL-2 for md5.c - part of libGeoIPUpdate, MaxMind for GeoLite Country db
LICENSE="LGPL-2.1 GPL-2 MaxMind2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux ~x86-macos"
IUSE="city ipv6 perl-geoipupdate static-libs"

DEPEND="sys-libs/zlib"
RDEPEND="
	${DEPEND}
	perl-geoipupdate? (
		dev-perl/PerlIO-gzip
		dev-perl/libwww-perl
	)
"

S="${WORKDIR}/${PN}-api-c-${PV}"

src_prepare() {
	mv "${WORKDIR}"/GeoIP.dat data || die

	epatch "${FILESDIR}"/${PN}-1.5.0-pkgconfig.patch

	sed -e "s:usr local share GeoIP:usr share GeoIP:" \
		-e "s:usr local etc:etc:" \
		-i apps/geoipupdate-pureperl.pl || die

	sed -e 's|yahoo.com|98.139.183.24|g' \
		-i test/country_test_name.txt test/region_test.txt || die

	eautoreconf
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	default

	use perl-geoipupdate && dobin apps/geoipupdate-pureperl.pl

	dodoc AUTHORS ChangeLog README TODO conf/GeoIP.conf.default

	rm "${ED}/etc/GeoIP.conf.default"

	prune_libtool_files

	insinto /usr/share/GeoIP
	doins "${WORKDIR}/GeoIPASNum.dat"
	use city && newins "${WORKDIR}"/GeoLiteCity.dat GeoIPCity.dat

	if use ipv6; then
		doins "${WORKDIR}/GeoIPv6.dat"
		use city && newins "${WORKDIR}"/GeoLiteCityv6.dat GeoIPCityv6.dat
	fi

	newsbin "${FILESDIR}/geoipupdate-r2.sh" geoipupdate.sh
}
