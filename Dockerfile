FROM ubuntu:20.04

ENV RUNSCOPE_RADAR_VERSION="0.30"

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ADD ./resources /resources

RUN /resources/build && rm -rf resources

USER 1000

ENTRYPOINT ["/usr/local/bin/runscope-radar"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="runscope-radar" \
      "org.label-schema.base-image.name"="alpine" \
      "org.label-schema.base-image.version"="3.12.0" \
      "org.label-schema.description"="runscope-radar in a container" \
      "org.label-schema.url"="https://www.blazemeter.com/" \
      "org.label-schema.vcs-url"="https://github.com/FXinnovation/fx-docker-runscope-radar" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.runscope-radar.version"=$RUNSCOPE_RADAR_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="Check README.md"
