FROM node:alpine as base
WORKDIR /api
COPY package.json yarn.lock .
RUN yarn install --frozen-lockfile
COPY src .
COPY tsconfig.json .

FROM base as test
RUN yarn test

FROM base as production
RUN yarn build
CMD ["yarn", "start"]
