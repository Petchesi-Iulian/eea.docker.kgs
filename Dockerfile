FROM plone/plone:4.3.7
MAINTAINER "Alin Voinea" <alin.voinea@eaudeweb.ro>

ENV ZC_BUILDOUT=2.5.1 \
    SETUPTOOLS=20.2.2 \
    KGS_VERSION=6.5

COPY docker-initialize.py docker-setup.sh /
COPY src/* /tmp/

USER root
RUN /docker-setup.sh
USER plone

VOLUME /data/downloads
