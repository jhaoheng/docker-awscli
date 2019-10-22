FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y curl python3 groff

# install pip3 & check version
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py && \
    which pip3 && \
    pip3 list -o

# install awscli
RUN pip3 install awscli --upgrade --user && \
    ln -s /root/.local/bin/aws /usr/bin/awscli && \
    ln -s /root/.local/bin/aws /usr/bin/aws && \
    awscli --version

# Set Aws cli completer
RUN ln -s /root/.local/bin/aws_completer /usr/bin/aws_completer && \
    complete -C aws_completer aws