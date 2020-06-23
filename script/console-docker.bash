#!/bin/bash

main(){
    docker build --rm -t local/bitbake-core ./
    docker run --rm -it -v "$(pwd):/work/" local/bitbake-core
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    D_SCRIPT="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
    cd "${D_SCRIPT}/../"

    # Bash Strict Mode
    set -eu -o pipefail
    main "$@"
fi

