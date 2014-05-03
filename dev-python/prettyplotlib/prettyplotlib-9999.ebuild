# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} python{3_2,3_3} )
inherit distutils-r1 git-r3

DESCRIPTION="python package for creating beautiful default matplotlib plots"
HOMEPAGE="http://olgabot.github.io/prettyplotlib/"
EGIT_REPO_URI="https://github.com/olgabot/${PN}.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/matplotlib-1.3.1[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	sci-libs/scipy[${PYTHON_USEDEP}]
	dev-python/brewer2mpl[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"
