#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:14.04
MAINTAINER Nyk Ma <moe@nayuki.info>

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y wget && \
  rm -rf /var/lib/apt/lists/*

# Add files.
COPY addUser.js /root/addUser.js
COPY start.sh /root/start.sh

# Set environment variables.
ENV HOME /root
ENV GOPATH /root/leanote/bin

# Define working directory.
WORKDIR /root

# Download leanote and mongodb.
RUN wget https://github.com/leanote/leanote/releases/download/1.0-beta.3/leanote-linux-x86_64.v1.0-beta.3.bin.tar.gz -O leanote.tar.gz && \
    wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.6.6.tgz -O mongodb.tgz

# Extract them.
RUN tar -xvf leanote.tar.gz && \
    tar -xvf mongodb.tgz
RUN ["/bin/bash", "-c", "mv /root/mongodb-linux-x86_64-2.6.6/bin/* /usr/local/bin/"]

# Clean
RUN rm leanote.tar.gz && \
    rm mongodb.tgz && \
    rm -rf mongodb*

# Run leanote.
CMD ["/bin/bash","/root/start.sh"]
# CMD ["bash"]
EXPOSE 9000
VOLUME ["/root/notedata","/var/log","/root/leanote/conf"]
