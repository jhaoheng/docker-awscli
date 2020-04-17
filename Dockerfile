FROM ubuntu:18.04

RUN apt-get update && apt-get install -y curl git vim wget procps unzip groff

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip && \
    aws --version

# Set Aws cli completer
RUN complete -C '/usr/local/bin/aws_completer' aws