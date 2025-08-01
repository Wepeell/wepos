# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /
# Copy system_files as well
COPY system_files /system_files
# Copy repo_files too
COPY repo_files /repo_files

# Base Image
FROM ghcr.io/ublue-os/bazzite:stable@sha256:56c9f52aec21cd80bb176fd2763f6cf76d01d483ec36ca86097468bb0bdb3715

## Other possible base images include:
# FROM ghcr.io/ublue-os/bazzite:latest
# FROM ghcr.io/ublue-os/bluefin-nvidia:stable
# 
# ... and so on, here are more base images
# Universal Blue Images: https://github.com/orgs/ublue-os/packages
# Fedora base image: quay.io/fedora/fedora-bootc:41
# CentOS base images: quay.io/centos-bootc/centos-bootc:stream10

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh && \
    ostree container commit
    
### LINTING
## Verify final image and contents are correct.
RUN bootc container lint