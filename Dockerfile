FROM node:14.15.4

# Install linux dependencies
RUN apt-get update && \
    apt-get install -y gcc \
        build-essential pkg-config libusb-1.0 curl git \
        sudo && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash bot
USER bot:bot
WORKDIR /home/bot

COPY --chown=bot:bot ./ .

VOLUME /config

USER bot:bot
WORKDIR /home/bot

RUN npm install
CMD npm start
