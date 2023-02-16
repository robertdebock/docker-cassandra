FROM cassandra:4

LABEL maintainer="Robert de Bock <robert@meinit.nl>"
LABEL build_date="2023-02-16"

COPY cassandra.yaml /etc/cassandra/cassandra.yaml

HEALTHCHECK --interval=10s --timeout=5s --retries=17 --start-period=30s CMD cqlsh --username cassandra --password cassandra --execute "SHOW HOST"

