# https://docs.docker.com/engine/reference/builder/
# this dockerfile assumes a pre-built binary
FROM golang:alpine

VOLUME ["/opt"]

WORKDIR /opt

# COPY the source code to compile in the container; useful when mac cross-compilation doesn't work
# COPY ./www /srv/www
# build
# RUN ["go", "build", "main.go"]

# Pre-built binaries can just be copied
COPY ./www/binary-file /opt

EXPOSE "80"
# EXPOSE "443"

# ENTRYPOINT treats the docker image like an executable; it will always do ENTRYPOINT
ENTRYPOINT ["./main"]
# CMD is a default that is used when nothing is provided via parameters
# CMD ["./binaryfile"]
