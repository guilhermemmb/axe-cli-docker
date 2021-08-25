FROM debian:buster

RUN apt-get update && apt-get install -y curl build-essential unzip

# Install Chrome for Selenium
RUN apt-get install -y chromium chromium-driver

# add nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# add @axe-core/cli globally
# RUN npm install -g @axe-core/cli

# add patched @axe-core
RUN apt-get install -y git
WORKDIR /app
RUN git clone https://github.com/patsplat/axe-core-npm.git
WORKDIR /app/axe-core-npm/packages/cli
RUN npm ci
RUN npm install -g .

WORKDIR /app