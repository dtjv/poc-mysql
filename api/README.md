# api

An Express app using TypeScript, MySQL and Docker.

## Usage

The following command will launch two containers - a MySQL container and an Node Express container (which the latter container is built via the Dockerfile).

```bash
$ docker compose up -d
```

This project is a proof-of-concept to get an Express app in one container to communicate with a MySQL database in another container. At this point,the Express app will in fact connect to and create a table in the database.

## Todo

- [ ] write unit test
- [ ] write CRUD handlers
- [ ] write CRUD data layer functions

## Author

- [David Valles](https://dtjv.io)

## Acknowledgements

- This project is heavily influenced by Docker's [Getting Started](https://github.com/docker/getting-started) repo.

## License

[MIT License](LICENSE)
