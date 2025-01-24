FROM alpine:3
LABEL authors="strahe"

WORKDIR /app
RUN apk add --no-cache curl


ARG SQL_EXPORTER_VERSION=0.15.0
ENV SQL_EXPORTER_VERSION=${SQL_EXPORTER_VERSION}
ENV SQL_EXPORTER_URL="https://github.com/burningalchemist/sql_exporter/releases/download/${SQL_EXPORTER_VERSION}/sql_exporter-${SQL_EXPORTER_VERSION}.linux-amd64.tar.gz"
ENV TARGET_DIR="/usr/local/bin"

RUN curl -L $SQL_EXPORTER_URL  | tar -xz -C $TARGET_DIR --strip-components=1

ENTRYPOINT ["sql_exporter"]
CMD ["-web.enable-reload"]
