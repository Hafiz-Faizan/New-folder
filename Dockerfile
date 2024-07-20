FROM node:16-alpine

# Install essential Puppeteer dependencies
RUN apk add --no-cache \
    chromium \
    fontconfig \
    cairo \
    pango \
    libpng \
    jpeg \
    libxrender \
    libxext \
    libx11 \
    libxcomposite \
    libxdamage \
    libxi \
    libxml2 \
    libxslt \
    libjpeg-turbo \
    alsa-lib \
    dbus \
    gtk+3.0 \
    nspr \
    nss \
    capstone \
    zip \
    unzip \
    curl \
    && rm -rf /var/cache/apk/*

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

CMD [ "node", "index.js" ]
