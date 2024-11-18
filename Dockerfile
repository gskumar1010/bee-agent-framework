FROM node:22

WORKDIR /app

COPY package.json yarn.lock ./

USER root

RUN corepack enable

RUN yarn install



ENV NPM_CONFIG_CACHE=/app/.npm

RUN mkdir -p /.cache/node/corepack/v1

RUN chgrp -R 0 /app /app/node_modules/ /.cache \
    && chmod -R g=u /app /app/node_modules/ /.cache

COPY . .

RUN yarn build

    
EXPOSE 3000

USER 1001

CMD ["yarn", "start"]
