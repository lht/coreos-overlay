# Copyright (c) 2013 The CoreOS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
CROS_WORKON_PROJECT="flatcar-linux/nss-altfiles"
CROS_WORKON_LOCALNAME="nss-altfiles"
CROS_WORKON_REPO="git://github.com"

if [[ "${PV}" == 9999 ]]; then
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
else
	CROS_WORKON_COMMIT="de2b32289bf701ce3c8167a1b58436866922085e" # t-lo/remove-RES_USE_INET6
	KEYWORDS="amd64 arm arm64 x86"
fi

inherit cros-workon toolchain-funcs

DESCRIPTION="NSS module for data sources under /usr on for CoreOS"
HOMEPAGE="https://github.com/coreos/nss-altfiles"
SRC_URI=""

LICENSE="LGPL-2.1+"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""

src_configure() {
	tc-export CC
	econf \
		--datadir=/usr/share/baselayout \
		--with-module-name=usrfiles \
		--with-types=all
}

src_install() {
	dolib.so libnss_usrfiles.so.2
}
