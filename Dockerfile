FROM eclipse-temurin:8-jre-alpine

RUN apk add --no-cache unzip && \
    rm -rf /var/cache/apk/*

ADD https://downloads.sourceforge.net/project/davmail/davmail/6.2.2/davmail-6.2.2-3546.zip /tmp/davmail.zip

RUN adduser -D davmail && \
    mkdir /usr/local/davmail && \
    unzip -q /tmp/davmail.zip -d /usr/local/davmail && \
    rm /tmp/davmail.zip

VOLUME        /etc/davmail
EXPOSE        1080 1143 1389 1110 1025
WORKDIR       /usr/local/davmail
USER davmail

CMD ["/usr/local/davmail/davmail", "/etc/davmail/davmail.properties"]
