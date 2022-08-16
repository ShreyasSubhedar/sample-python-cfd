FROM ubuntu:latest
COPY target/demo.jar .
ENTRYPOINT [ "curl" ]
