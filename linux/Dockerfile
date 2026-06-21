FROM quay.io/pypa/manylinux_2_28_x86_64

RUN dnf -y install gcc git make cmake gpg wget python3 libxml2-devel
RUN dnf -y install almalinux-release-devel
RUN dnf config-manager --set-enabled devel
RUN dnf -y install libxml2-static
