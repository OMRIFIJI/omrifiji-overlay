# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 go-module

DESCRIPTION="A cli to search and watch anime in russian"
HOMEPAGE="https://github.com/OMRIFIJI/anicli-ru"
EGIT_REPO_URI="https://github.com/OMRIFIJI/anicli-ru.git"

LICENSE="GPL-3
	MIT
	BSD-3-Clause
"
SLOT="0"
IUSE=""

BDEPEND=">=dev-lang/go-1.23.2"
RDEPEND="media-video/mpv
	media-video/ffmpeg[libxml2]"

src_unpack() {
    git-r3_src_unpack
    go-module_live_vendor
}

src_compile() {
    ego build -o "${PN}" ./cmd/unix/main.go
}

src_install() {
    dobin "${PN}"
}
