# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} python{3_2,3_3} )
inherit distutils-r1 git-r3

DESCRIPTION="python package for accessing colorbrewer2.org color maps"
HOMEPAGE="https://github.com/jiffyclub/brewer2mpl"
EGIT_REPO_URI="https://github.com/jiffyclub/${PN}.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="+matplotlib"

DEPEND=""
RDEPEND="${DEPEND}
	matplotlib? ( dev-python/matplotlib[${PYTHON_USEDEP}] )"
