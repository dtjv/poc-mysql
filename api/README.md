# README

A _simple_ express CRUD server, written in typescript that talks to a MySQL
running in a Docker container. The server will use the node driver for MySQL
directly.

## todo

- [x] write 'hello world' express server in typescript.
  - [x] split express app from index.ts
  - [ ] make server read env vars or env `_FILE`. [^1]
  - [ ] make server use `wait-port` to connect to mysql [^2]
- [ ] package up in a node docker image
  - [ ] dockerfile
    - [ ] use multi-stages
    - [ ] run tests [^3] [^4]
- [ ] launch mysql + server containers via docker-compose
- [ ] rename project: mysql-api

[^1]: https://docs.docker.com/get-started/08_using_compose/#run-the-application-stack
[^2]: https://docs.docker.com/get-started/08_using_compose/#run-the-application-stack
[^3]: https://docs.docker.com/ci-cd/best-practices/#inner-and-outer-loops
[^4]: https://docs.docker.com/language/nodejs/run-tests/

## app structure

      api/
        package.json
        src/
          app.ts
          server.ts
          db/
            __tests__
            mysql.ts
          models/
            todo.ts
            todos.ts
          routes/
            __tests__
            index.ts
            create-todo.ts
            get-todos.ts
            update-todo.ts
            delete-todo.ts

## api design

    POST   /api/todos
    GET    /api/todos
    PATCH  /api/todos/:id
    DELETE /api/todos/:id

## docker run

The `docker run` commands replaced by `docker-compose.yml`.

```sh
$ docker run \
  -it \
  --rm \
  -d \
  --network todo_backend \
  --network-alias mysql_service \
  -v mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=todo_db \
  mysql

$ docker run \
  -d \
  -p 3000:3000 \
  -w /app \
  -v "$(pwd):/app" \
  --network backend \
  -e MYSQL_HOST=mysql_service \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=root \
  -e MYSQL_DB=todo_db \
  node:12-alpine \
  sh -c "yarn install && yarn run dev"
```
