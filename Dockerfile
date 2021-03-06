ARG  BASE_TAG=7-stackbase-devtoolset-6
FROM lsstsqre/centos:${BASE_TAG}

ARG LSST_PYTHON_VERSION=3
ARG NEW_DIR=/opt/lsst/software/stack
ARG LSST_USER=lsst

USER root

RUN mkdir -p "$NEW_DIR"
RUN groupadd "$LSST_USER"
RUN useradd -g "$LSST_USER" -m "$LSST_USER"
RUN chown "${LSST_USER}:${LSST_USER}" "$NEW_DIR"

USER $LSST_USER
WORKDIR $NEW_DIR

RUN curl -sSL https://raw.githubusercontent.com/lsst/lsst/master/scripts/newinstall.sh | bash -s -- -cbtS
