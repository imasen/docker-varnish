FROM alpine
LABEL maintainer="Przemyslaw Ozgo linux@ozgo.info, Marcin Ryzycki marcin@m12.io, Igor Masen igor.masen@gmail.com"

RUN apk update && \
  apk add --no-cache bash && \
  apk add --no-cache varnish

ADD start.sh /start.sh

ENV VCL_CONFIG      /etc/varnish/default.vcl
ENV CACHE_SIZE      64m
ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600

CMD /start.sh
EXPOSE 80
