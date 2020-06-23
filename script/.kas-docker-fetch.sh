#!/bin/sh

KAS_RELEASE=2.1.1

wget_kas_docker(){
	# kas docker image version
	export KAS_IMAGE_VERSION=${KAS_RELEASE}

	rm -f kas-docker
	wget https://raw.githubusercontent.com/siemens/kas/${KAS_RELEASE}/kas-docker
	if [ ${?} != 0 ]; then
		echo "Failed to download kas-docker script"
		exit 1
	fi
	chmod a+x kas-docker
}

D_SCRIPT="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
cd "${D_SCRIPT}"

# Posix Strict Mode
set -eu
wget_kas_docker "$@"
