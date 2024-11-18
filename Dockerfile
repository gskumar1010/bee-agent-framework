FROM node:22

WORKDIR /app

COPY package.json yarn.lock ./

USER root

RUN corepack enable


COPY . .

RUN yarn install


RUN yarn build

RUN chgrp -R 0 /app/node-modules \
    && chmod -R g=u /app/node-modules

EXPOSE 3000

USER 1001

CMD ["yarn", "start"]
