FROM alpine

ENV DEFAULT_VERSION 39
ARG VERSION=${DEFAULT_VERSION}
ENV URL_APP https://github.com/pymumu/smartdns/releases/download/Release${VERSION}/smartdns-x86_64
ENV CONF_FILE "/app/smartdns.conf.d/smartdns.conf"
RUN apk update && apk --no-cache add curl
WORKDIR /app
RUN curl -sSfL ${URL_APP} -o smartdns \
   && chmod +x smartdns \
   && echo "user root" >> smartdns.conf \
   && echo "conf-file ${CONF_FILE}" >> smartdns.conf \
   && echo "log-file /app/smartdns.log" >> smartdns.conf \
   && mkdir `dirname $CONF_FILE`

COPY run.sh .

ENTRYPOINT ["/app/run.sh"]
