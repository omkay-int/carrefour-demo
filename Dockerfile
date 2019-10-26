FROM alpine:3.5

RUN apk add --update \
     bash \
     curl \
     python \
     coreutils \
     build-base \
     jq \
     py-pip \
     python-dev \
     libffi-dev \
     openssl-dev \
     openssh \
     lftp \
     && rm -rf /var/cache/apk/*

#Install gcloud tool
RUN curl -o \
      google-cloud-sdk.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-143.0.1-linux-x86_64.tar.gz && \
      tar -xzf google-cloud-sdk.tar.gz && \
      rm google-cloud-sdk.tar.gz
RUN google-cloud-sdk/install.sh --path-update=true --bash-completion=true --rc-path=/.bashrc

ENV GOOGLE_APPLICATION_CREDENTIALS /credentials/credentials.json
RUN touch /root/.bigqueryrc

COPY . /src

RUN chmod +x /src/launch.sh

WORKDIR /src

ENTRYPOINT ["/src/launch.sh"]
