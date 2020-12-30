# Exercise 2.6 

Add database to example backend. <br>

Lets use a postgres database to save messages. We won’t need to configure a volume since the official postgres image sets a default volume for us. Lets use the postgres image documentation to our advantage when configuring: https://hub.docker.com/_/postgres/. Especially part Environment Variables is of interest. <br>

The backend [README](https://github.com/docker-hy/backend-example-docker) should have all the information needed to connect. <br>

The button won’t turn green but you can send messages to yourself. <br>

Submit the docker-compose.yml <br>

> TIP: When configuring the database, you might need to destroy the automatically created volumes. Use command `docker volume prune`, `docker volume ls` and `docker volume rm` to remove unused volumes when testing. Make sure to remove containers that depend on them beforehand.

> `restart: unless-stopped` can help if the postgres takes a while to get ready

**Note**: setup of docker-compose.yml expects that you have tagged the frontend and backend images as exercise1.10 and exercise1.11 respectively.