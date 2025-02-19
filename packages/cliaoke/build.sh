TERMUX_PKG_HOMEPAGE=https://github.com/jessfraz/cliaoke
TERMUX_PKG_DESCRIPTION="Command line karaoke"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.2.4
TERMUX_PKG_SRCURL=https://github.com/jessfraz/cliaoke/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=df601b7d118acb8c0b7251c42b5b2623335bfc51f5dc94135fa6722850955f50
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	termux_setup_golang
	go mod init || :
	go mod tidy
	go mod vendor
	go build
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin cliaoke
}
