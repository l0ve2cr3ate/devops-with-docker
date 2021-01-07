# Notes part 2 - DevOps with Docker 

## Learning goals
- manually scale apps
- run a group of containerized apps that interact with each other via HTTP
- run a group of containerized apps that interact with each other via volumes.
- use 3rd party services, such as db's, inside containers as part of your project.

## Docker-compose
-> designed to simplify running multi-container apps using a single command.

## First docker-compose.yml 
```yaml
version: '3'

services: 
    youtube-dl-ubuntu:
        image: <username>/<repo>
        build: .
```

<ins>commands:</ins> <br>
`$ docker-compose build` <br>
`$ docker-compose push` <br>

## Volumes in docker-compose
Volumes in docker-compose are defined like so: <br>
`location-in-host: location-in-container` -> <br>

```yaml
volumes:
    - .:/mydir
```

You can also give the container a name: <br>
`container_name: your_name` <br>

## Scaling
Compose can scale the service to run multiple instances: <br>
`docker-compose up --scale whoami=3` <br>
The above command will fail, due to port clash: Each instance will attempt to bind to the same host port. If you only specify the container port, docker will automatically choose a free port, and the command will work. <br>

Use `docker-compose port` to find out which ports the instances are bound to. <br>

In a server environment you often have a load-balancer in front of the service. For local development (or a single server) you can use nginx-proxy that configures nginx from docker deamon as containers are started/stopped: <br>

```yaml
proxy:
    image: jwilder/nginx-proxy
    ports: 
        - 80
```

nginx-proxy works with 2 environment variables:
- VIRTUAL_HOST
- VIRTUAL_PORT

VIRTUAL_PORT is not needed if service has EXPOSE in it's docker image. <br>

colasloth.com is configured so that all subdomains point to 127.0.0.1. <br>

```yaml
environment:
    - VIRTUAL_HOST=whoami.colasloth.com
```

## Docker networking
Connecting two services such as a server abd its db in docker can be achieved with docker-compose networks. It automatically creates and joines both containers into a network where the service name is the hostname. <br>

Example: services defined as `backend-server` that users access can connect to port 2345 of container `database` by connecting to `database:2345` if they are both defined as service in the same `docker-compose.yml`. <br>

You can also manually define the network and its name in version 3.5 or higher of docker-compose. This makes it easy to setup a configuration where other containers connect to an existing network as an external network. <br>

Defining a network in `docker-compose.yml`: <br>
```yaml
networks:
    database-network:
        name: server-db-network
```

To connect containers in another `docker-compose.yml`: <br>

```yaml
networks:
    default:
        external:
            name: server-db-network
```

## Larger apps with volumes
<ins>Setup postgress:</ins> <br>

```yaml
version: '3.5'
services:
    db:
        image: postgres
        restart: unless-stopped
        environment:
            POSTGRES_PASSWORD: example
        container_name: db_redmine
```

`$ docker volume prune` -> remove volumes from your machine. <br>
`$ docker-compose down` -> put app down <br>

You can create a volume to store your data with a descriptive name. <br>

<ins>Add redmine:</ins> <br>

```yaml
redmine:    
    image: redmine
    environment:
        - REDMINE_DB_POSTGRES=db
        - REDMINE_DB_PASSWORD=exampple
    ports:
        - 9000:3000
    depends_on: 
        - db
```

`depends_on` in de code above makes sure db service is started first, but it does not guarantee that the db is up. <br>

<ins>Add adminer to app:</ins> <br>

```yaml
adminer:
    image: adminer
    restart: always
    environment:
        - ADMINER_DESIGN=galkaev
    ports:
        - 8083:8080
```






