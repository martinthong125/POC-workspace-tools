# to fix workspace-tools vulnerable version
# docker build -t poc:v6 .
# using user tester and node16.14.2, workspac-tools@0.18.3

FROM ubuntu:18.04

# replace shell with bash so we can source files
# RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update the repository sources list
# and install dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install git -y && \
    apt-get install nano -y && \
    mkdir /usr/local/nvm && \
    apt-get -y autoclean

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 16.14.2

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# install node and npm
RUN . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
# RUN npm install -g npm@8.11.0 && \
#     node -v && \
#     npm -v

# add user tester
RUN useradd -rm -d /home/tester -s /bin/bash -g root -G sudo -u 1001 tester
USER tester
# WORKDIR /home/tester

# copy essential files to container, poc.js
WORKDIR /home/tester/javascript/poc
COPY /poc .

# Prepare files to copy to /root/javascript/node_modules/workspace-tools/lib, git.js and fix.sh
WORKDIR /home/tester/javascript/fix
COPY /fix .

# install vulnerable version
WORKDIR /home/tester/javascript
RUN npm install workspace-tools@0.18.3

######################################################################
## Use <bash fix.sh> to run the below

# run poc.js
# WORKDIR ~/javascript/poc
# RUN node poc.js

# apply fix
# WORKDIR ~/javascript/node_modules/workspace-tools/lib
# COPY /fix/git.js .
####################################################################

CMD ["bash"]