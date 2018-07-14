FROM debian:9-slim as dirty

ARG GRAAL_VERSION

RUN apt update && apt install -y curl
RUN mkdir /graalvm && \
    curl -fsSL "https://github.com/oracle/graal/releases/download/vm-${GRAAL_VERSION}/graalvm-ce-${GRAAL_VERSION}-linux-amd64.tar.gz" \
    | tar -zxC /graalvm --strip-components 1
RUN rm -r /graalvm/man /graalvm/src.zip /graalvm/sample

FROM debian:9-slim

LABEL maintainer="Vitaly Lavrov <lavrovvv@gmail.com>"

COPY --from=dirty /graalvm /graalvm

ENV PATH=/graalvm/bin:$PATH
