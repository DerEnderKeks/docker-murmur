# docker-murmur [![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/derenderkeks/murmur?style=flat-square)](https://hub.docker.com/repository/docker/derenderkeks/murmur)

Since I couldn't find any sane docker image for murmur I made this one.

## Image details

This image always downloads the latest murmur version when building.  
The final image is based on alpine and additionally only contains the murmur binary, the default config file and a tiny start script.

Any data is stored in the `/data` volume. When no config file is present the default one will be copied there.

The image exposes UDP and TCP port `64738`.

> You should probably run this in host network mode if you want IPv6 to work properly
