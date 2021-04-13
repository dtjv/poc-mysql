FROM node:alpine as base
WORKDIR /app
COPY package.json yarn.lock .

FROM base as test
RUN yarn install --frozen-lockfile
COPY src/app .
RUN yarn test

FROM base as prod
RUN yarn install --frozen-lockfile
COPY . .
CMD ["yarn", "start"]
