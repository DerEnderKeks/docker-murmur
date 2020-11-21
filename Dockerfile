FROM alpine as builder

WORKDIR /build

RUN apk add --no-cache curl tar
RUN curl -sSL https://www.mumble.info/downloads/linux-static-server | tar xj --strip 1

FROM alpine
LABEL maintainer='DerEnderKeks'

COPY --from=builder /build/murmur.ini /templates/murmur.ini
COPY --from=builder /build/murmur.x86 /usr/local/bin/murmur
COPY ./start.sh /usr/local/bin/murmur-wrapper
RUN chmod +x /usr/local/bin/murmur-wrapper

RUN mkdir -m770 /data
RUN chown 65521 /data

VOLUME /data

EXPOSE 64738/tcp
EXPOSE 64738/udp

USER 65521

ENTRYPOINT ["/usr/local/bin/murmur-wrapper"]
