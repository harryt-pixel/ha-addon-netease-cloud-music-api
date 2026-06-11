ARG BUILD_FROM
FROM moefurina/ncm-api:latest

ARG BUILD_ARCH
ARG BUILD_VERSION

COPY --chmod=755 run.sh /

ENTRYPOINT ["/run.sh"]
