FROM alpine:3.8

RUN apk add --update python py-pip bash curl make jq \
  && pip install --upgrade awscli \
  && apk del --purge py-pip \
  && rm /var/cache/apk/*

COPY Makefile /

CMD ["make","k8s-delete-leftover-enis"]
