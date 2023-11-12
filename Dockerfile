FROM alpine:latest

WORKDIR /usr/src/app

RUN apk --no-cache add bash

SHELL ["/bin/bash", "-c"]

RUN apk --no-cache add curl

RUN apk --no-cache add git

RUN curl -L https://foundry.paradigm.xyz | bash
# RUN source ~/.bashrc
ENV PATH="~/.foundry/bin:${PATH}"
RUN foundryup

COPY . .

CMD ["tail", "-f", "/dev/null"]