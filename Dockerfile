FROM node:22

WORKDIR /app

COPY package.json yarn.lock ./
RUN corepack enable

RUN yarn install 4.1.1

COPY . .



RUN yarn build
RUN yarn install

EXPOSE 3000

CMD ["yarn", "start"]
