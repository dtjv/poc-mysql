# README

In this folder, I manually run SQL files against a msql container.

## docker run

This is how I'd run a mysql container from the command line.

```sh
# pull mysql image down to my laptop - just do this once.
$ docker pull mysql

# start a mysql container
$ docker run \
  -it \                           # interactive terminal
  --rm \                          # remove container if it exists
  -d \                            # detach mode (in background)
  --network school_backend \      # custom named network
  --network-alias mysql_service \ # how other containers reach mysql
  -v mysql-data:/var/lib/mysql \  # use a named volume
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=school_db \
  mysql                           # image name from which to base this container

  # verify container is running
$ docker ps
```

### volumes & mounts

Database data is persisted using a 'named volume' or 'bind mounts'. With 'named
volumes', docker decides where to store data on the host machine (my laptop).To
use a 'named volume', create it: `docker volume create mysql-data`.

> docker will auto create a named volume if specified in a docker run command.

A 'bind mount' lets the developer control where data is stored on the host
machine. A useful scenario is binding the source code folder on a host machine
to a mount point in a container. This allows the running container to see code
changes and trigger an app restart (via a tool like `nodemon`).

### networks & aliases

Containers can communicate amongst each other if they reside on the same
network. To use a network, create it: `docker network create school_backend`

While the containers sit on the same network, the network alias is how each
container is identified on the network.

## docker compose

The `docker run` command is too long and complex. Let's use a
`docker-compose.yml` file to simplify things.

```yaml
# docker-compose.yml
version: '3.9' # supposedly not used

services:
  mysql_service: # same as --network-alias flag
    image: mysql # w/o tag, grabs latest
    restart: always
    volumes:
      #- ./data:/var/lib/mysql # bind mount version
      - mysql-data:/var/lib/mysql # named volume
    environment:
      MYSQL_ROOT_PASSWORD: root # should be a secret
      MYSQL_DATABASE: school_db # automatically create this database
    ports:
      - '3307:3306' # exposes 3307
    networks:
      - school_backend # custom named network
    container_name: mysql_school # same as --name flag

volumes: # not needed if using bind mounts
  mysql-data:
networks:
  school_backend:
```

## sql queries

In this section, I detail how to **manually** start a mysql container, create
the database schema, populate the database and issue queries.

> The docker-compose.yml is using the 'bind mount' that is commented out above.

**terminal 1**

1. start mysql container
1. log into container

**terminal 2**

1. write sql
1. copy sql file to bind mount host folder (i.e. `data/`)

**terminal 1**

1. run sql file in mounted folder against the database

[^1]:
    now, the sql source file is available to the running container in
    `/var/lib/mysql/` - via the bind mount specified in the `docker-compose.yml`
    file.

### step-by-step

```sh
# start all services listed in docker-compose.yml in the background
$ docker-compose up -d

# verify container is running (copy container id listed)
$ docker ps

# log into the running container and run a bash terminal
$ docker exec -it <mysql-container-id> bash

# define the `school_db` database
root@<id>: mysql -tv -uroot -p school_db < var/lib/mysql/school-schema.sql
password: xxxxx # password is value of MYSQL_ROOT_PASSWORD

# log into mysql shell
root@<id>: mysql -u root -p
password: xxxxx
mysql> use school_db
mysql> status
mysql> show tables;
mysql> quit

# load the `school_db` database
root@<id>: mysql -tv -uroot -p school_db < var/lib/mysql/school-data.sql
password: xxxxx

# display query(-v flag) and results in a table(-t flag)
# to work, ensure no spaces exist between -u and -p flags and their values
root@<id>: mysql -tv -uroot -proot school_db < var/lib/mysql/school-queries.sql

# login into mysql shell
root@<id>: mysql -u root -p
password: xxxxx

# shut down all services listed
$ docker-compose down
```
