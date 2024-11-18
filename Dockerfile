FROM node:22

WORKDIR /app

COPY package.json yarn.lock ./

USER root

RUN corepack enable


COPY . .

RUN yarn install


RUN yarn build

ENV NPM_CONFIG_CACHE=/app/.npm

RUN chgrp -R 0 /app \
    && chmod -R g=u /app
    
EXPOSE 3000

USER 1001

CMD ["yarn", "start"]
