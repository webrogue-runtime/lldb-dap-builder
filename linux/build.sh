set -ex
cd $(dirname $0)

REPO_DIR=$(dirname $(pwd))

image_name=webrogue_lldb_dap_builder
docker build -t $image_name .
run_in_docker() {
    docker run \
        --rm \
        -v $REPO_DIR:/host_dir \
        -u $(id -u ${USER}):$(id -g ${USER}) \
        -t $image_name \
        bash -c "$1"
}

run_in_docker "sh /host_dir/linux/_build.sh"