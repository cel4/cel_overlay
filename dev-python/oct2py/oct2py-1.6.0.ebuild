# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Python to GNU Octave bridge"
HOMEPAGE="http://pypi.python.org/pypi/oct2py"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc examples test"

RDEPEND="
	sci-libs/scipy[${PYTHON_USEDEP}]
	sci-mathematics/octave"
DEPEND="${RDEPEND}
	doc? (
		dev-python/sphinx-bootstrap-theme
		dev-python/numpydoc
	)
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/ipython[${PYTHON_USEDEP}]
	)"

DISTUTILS_NO_PARALLEL_BUILD=1

python_compile_all() {
	if use doc; then
		sphinx-build docs html || die
	fi
}

python_test() {
	if [[ ${EPYTHON} == python2* ]]; then
		local OPTIONS="--with-doctest"
	fi
	nosetests -v oct2py ${OPTIONS} || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( html/. )
	distutils-r1_python_install_all

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r example
	fi
}
