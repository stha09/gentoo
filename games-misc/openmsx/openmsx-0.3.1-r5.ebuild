# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit python-any-r1

DESCRIPTION="Open source music base set for OpenTTD"
HOMEPAGE="https://wiki.openttd.org/OpenMSX https://github.com/OpenTTD/OpenMSX"
SRC_URI="https://cdn.openttd.org/openmsx-releases/${PV}/${P}-source.tar.gz"
S="${WORKDIR}/${P}-source"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc64 ~x86"

BDEPEND="${PYTHON_DEPS}"

PATCHES=( "${FILESDIR}"/${P}-python3.patch )

pkg_setup() {
	python-any-r1_pkg_setup
}

src_compile() {
	emake _V= bundle
}

src_install() {
	insinto "/usr/share/games/openttd/gm/${P}"
	doins ${P}/{*.mid,openmsx.obm}
	dodoc ${P}/{changelog.txt,readme.txt}
}
