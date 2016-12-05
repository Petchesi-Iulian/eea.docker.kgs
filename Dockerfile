FROM plone:4.3.10
MAINTAINER "Alin Voinea" <alin.voinea@eaudeweb.ro>

ENV ZC_BUILDOUT=2.5.1 \
    SETUPTOOLS=20.9.0 \
    KGS_VERSION=8.5

COPY docker-setup.sh /
COPY src/* /tmp/

USER root
RUN /docker-setup.sh
COPY docker-initialize.py /
USER plone
