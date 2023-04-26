ARG POSTGRESQL_VERSION=14
FROM alpine:3.17.3

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

ENV POSTGRES_SUPER_USER="postgres" \
  POSTGRES_RESET="false" \
  POSTGRES_USER_RESET="false" \
  POSTGRES_RESET_CONFIRM="NO"

#hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates postgresql${POSTGRESQL_VERSION}-client

USER root

RUN \
  apk add --no-cache \
  # 656 kB           # 1.28 MB     # 632 kB
  ca-certificates    bash          bind-tools \
  # 256 kB           # 156 kB      # 40 kB
  curl               iputils       jo \
  # 564 kB           # 200 kB      # 316 kB
  jq                 moreutils     nano \
  # 76 kB
  pv \
  # 36 kB            # 3.3 MB      # 320 kB
  tini               tzdata        unzip \
  # 16 kB            # 480 kB
  util-linux         wget \
  && \
  # 264 kB
  apk add --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/v3.14/main unrar

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/postgres/postgres"
