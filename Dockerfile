FROM alpine:3.6
RUN apk -v --update add \
        python \
        py-pip \
        groff \
	gzip \
	mysql-client \
	zip \
        less \
        mailcap \
        && \
    pip install --upgrade awscli s3cmd python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
RUN mkdir /data
VOLUME ["/data"]
WORKDIR /data
ENTRYPOINT ["/bin/sh", "-c"]
