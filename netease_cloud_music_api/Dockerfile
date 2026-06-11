ARG BUILD_FROM
FROM moefurina/ncm-api:latest

ARG BUILD_ARCH
ARG BUILD_VERSION

COPY run.sh /
RUN chmod a+x /run.sh

CMD ["/run.sh"]
