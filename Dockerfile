FROM alpine:3.7
MAINTAINER Toshiaki Maki <makingx@gmail.com>

RUN apk --no-cache add -t deps wget ca-certificates \
  && wget -q -O - https://github.com/papertrail/remote_syslog2/releases/download/v0.20/remote_syslog_linux_amd64.tar.gz \
  | tar -zxf - \
  && apk del deps

ENTRYPOINT ["/remote_syslog/remote_syslog", "-D", "-c", "/etc/rs2/log_files.yml"]
