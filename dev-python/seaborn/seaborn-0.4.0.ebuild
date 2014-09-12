# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3} )

inherit distutils-r1 virtualx

DESCRIPTION="Statistical data visualization using matplotlib"
HOMEPAGE="http://stanford.edu/~mwaskom/software/seaborn/index.html"
SRC_URI="https://github.com/mwaskom/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc examples test"

DISTUTILS_NO_PARALLEL_BUILD=1
PATCHES=( ${FILESDIR}/${P}-issue274.patch )

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	sci-libs/scipy[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/statsmodels[${PYTHON_USEDEP}]
	dev-python/patsy[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? (
		dev-python/sphinx
		dev-python/sphinx-bootstrap-theme
		dev-python/numpydoc
		dev-python/ipython
		dev-python/runipy
	)
	test? ( dev-python/nose[${PYTHON_USEDEP}] )"

python_compile_all() {
	if use doc; then
		emake -C doc/tutorial
		emake -C doc html
	fi
}

python_test() {
	cd "${BUILD_DIR}" || die
	run_tests() {
		nosetests -v || die "Testing failed with ${EPYTHON}"
	}
	VIRTUALX_COMMAND=run_tests virtualmake
}

python_install_all() {
	use doc && dohtml -r doc/_build/html/*
	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
	distutils-r1_python_install_all
}
