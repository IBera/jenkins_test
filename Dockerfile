# pulled from https://stackoverflow.com/questions/48104954/adding-net-core-to-docker-container-with-jenkins
# Thanks to rockstar (Dockstar?) Dennis Fazekas

FROM jenkins/jenkins:alpine-jdk11
USER root
ENV TERRAFORM_VERSION 1.2.5

RUN apk -U upgrade && apk add curl \
    unzip \
    jq

# RUN addgroup -S jenkins && adduser -S jenkins -G jenkins
RUN apk add py3-pip
RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo make
RUN pip install --upgrade pip
RUN pip install azure-cli

RUN cd /usr/local/bin && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

CMD sh
USER jenkins
