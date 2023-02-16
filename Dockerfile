FROM cassandra:4

LABEL maintainer="Robert de Bock <robert@meinit.nl>"
LABEL build_date="2023-02-16"

COPY cassandra.yaml /etc/cassandra/cassandra.yaml
