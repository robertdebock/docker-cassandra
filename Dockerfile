FROM cassandra:4

LABEL maintainer="Robert de Bock <robert@meinit.nl>"
LABEL build_date="2023-02-16"

# TLS requests.
EXPOSE 9142

# Copy the configuration.
COPY cassandra.yaml /etc/cassandra/cassandra.yaml

# Place a script to initialize keytool.
COPY keytool.sh /keytool.sh

# Run the keytool script.
RUN sh keytool.sh

# Check the health of this container.
HEALTHCHECK --interval=10s --timeout=5s --retries=17 --start-period=30s CMD cqlsh --username cassandra --password cassandra --execute "SHOW HOST"
