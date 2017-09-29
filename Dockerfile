FROM plone:4.3.10

ENV EDW_LOGGER_PUBLISHER=false \
    GRAYLOG=logcentral.eea.europa.eu:12201 \
    GRAYLOG_FACILITY=eea.docker.kgs \
    GOSU_VERSION=1.10 \
    KGS_VERSION=12.5

LABEL eea-kgs-version=$KGS_VERSION \
      maintainer="EEA: IDM2 A-Team <eea-edw-a-team-alerts@googlegroups.com>"

USER root
RUN mv /docker-entrypoint.sh /plone-entrypoint.sh
COPY docker-setup.sh docker-initialize.py kgs-entrypoint.sh docker-entrypoint.sh debug.sh /
COPY src/* /tmp/
RUN /docker-setup.sh
