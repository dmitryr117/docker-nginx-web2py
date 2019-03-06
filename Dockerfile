# Updated version based on madharjan/docker-nginx-web2py
FROM dmitryr117/docker-nginx:1.4.6
MAINTAINER Dmitry Rodetsky <colirs.developer@gmail.com>

ARG VCS_REF
ARG WEB2PY_VERSION
ARG WEB2PY_MIN=false
ARG DEBUG=false

LABEL description="Docker container for Nginx with Web2py" os_version="Ubuntu ${UBUNTU_VERSION}" \
      org.label-schema.vcs-ref=${VCS_REF} org.label-schema.vcs-url="https://github.com/dmitryr117/docker-nginx-web2py"

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV WEB2PY_VERSION ${WEB2PY_VERSION}
ENV WEB2PY_MIN ${WEB2PY_MIN}

RUN mkdir -p /build
COPY . /build

RUN /build/scripts/install.sh
RUN /build/scripts/cleanup.sh

VOLUME ["/opt/web2py/applications", "/var/log/nginx"]

CMD ["/sbin/my_init"]

EXPOSE 80
