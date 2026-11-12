# Plain 3x-ui, no nginx. Panel listens directly on 2053.
# Railway: set the domain's Target Port to 2053.
# To pin a version, set Railway variable XUI_VERSION (e.g. v3.10.0).
ARG XUI_VERSION=latest
FROM ghcr.io/mhsanaei/3x-ui:${XUI_VERSION}

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 2053

ENTRYPOINT ["/entrypoint.sh"]
