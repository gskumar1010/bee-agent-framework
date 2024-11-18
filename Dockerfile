FROM node:22

WORKDIR /app

COPY package.json yarn.lock ./

USER root

RUN corepack enable


COPY . .

RUN yarn install


RUN yarn build


EXPOSE 3000

USER 1001

CMD ["yarn", "start"]
