#!/bin/bash
# ==============================================
#  Simple Docker controller for Ubuntu 20.04 + KVM
#  Container name: d1_ubuntu20.04
#  Usage:
#     ./d1_container.sh create   # create new container
#     ./d1_container.sh start    # start existing container (interactive)
#     ./d1_container.sh root     # exec into container as root
#     ./d1_container.sh user     # exec into container as normal user
#  All users' password is "choulinux7".
# ==============================================

CONTAINER_NAME="d1_ubuntu20.04"
IMAGE_NAME="ubuntu:20.04"
WORKDIR_HOST="/home/chouan/docker_workspace/docker_1_workspace"
WORKDIR_CONT="/docker_workspace"

# check if container exists
container_exists() {
    docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"
}

case "$1" in
  create)
    if container_exists; then
        echo "Container '${CONTAINER_NAME}' already exists."
        echo "Use './d1_container.sh start' or './d1_container.sh root/user' instead."
        exit 1
    fi

    echo "Creating container '${CONTAINER_NAME}'..."
    docker run -it \
      --name ${CONTAINER_NAME} \
      --device /dev/kvm \
      -v ${WORKDIR_HOST}:${WORKDIR_CONT} \
      ${IMAGE_NAME}
    ;;

  start)
    if ! container_exists; then
        echo "Container '${CONTAINER_NAME}' not found. Run './d1_container.sh create' first."
        exit 1
    fi
    echo "Starting container '${CONTAINER_NAME}'... by root"
    docker start -ai ${CONTAINER_NAME}
    ;;

  root)
    if ! container_exists; then
        echo "Container not found. Please create it first."
        exit 1
    fi
    echo "Entering container as root..."
    docker exec -it -u 0 ${CONTAINER_NAME} bash
    ;;

  user)
    if ! container_exists; then
        echo "Container not found. Please create it first."
        exit 1
    fi
    echo "Entering container as normal user..."
    docker exec -it -u docker1 ${CONTAINER_NAME} bash
    ;;

  *)
    echo "Usage: $0 {create|start|root|user}"
    exit 1
    ;;
esac

