FROM node:22

WORKDIR /app

COPY package.json yarn.lock ./
RUN corepack enable

RUN yarn install 

COPY . .



RUN yarn build

EXPOSE 3000

CMD ["yarn", "start"]