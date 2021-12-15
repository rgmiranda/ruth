usage_cmd() {
    cat <<EOF
Usage: ${script_name} ${cmd} [-h]

Generates a new .ext file for CSR signing

Available options:

-h, --help      Print this help and exit
EOF
    exit
}

parse_params_cmd() {

    while :; do
        case "${1-}" in
        -h | --help) usage_cmd ;;
        -?*) die "Unknown option: $1" ;;
        *) break ;;
        esac
        shift
    done

    args=("$@")

    # check required params and arguments
    [[ ${#args[@]} -eq 0 ]] && die "No command recieved"

    return 0
}

parse_params_cmd $cmd_args