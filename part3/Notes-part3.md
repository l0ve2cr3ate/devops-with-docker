# Notes part 3 - DevOps with Docker 
https://devopswithdocker.com/part3/

## Learning goals
- examine the images you pull
- trim container size and image build time via multiple methods, such as multi-stage builds
- automatically deploy containers

## Look Into Ubuntu Image
In Docker Hub you can click on the Dockerfile link to look at the Dockerfile of the image.

## Optimizing the Dockerfile
You can glue RUN commands together to reduce the number of layers in your image (using `&& \`): <br>

```Dockerfile
RUN apt-get update && apt-get install -y \ 
    curl python && \ 
    curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && \ 
    chmod a+x /usr/local/bin/youtube-dl 
```

With `$ docker image history <image_name>` you can see if/how the size of your image has changed. <br>

The next step is to remove everything that is not needed in the final image: <br>

```Dockerfile
apt-get purge -y --auto-remove curl && \ 
rm -rf /var/lib/apt/lists/* 
```

Because --auto-remove also removes dependencies like ca-certificates, these need to be installed separately: <br>

```Dockerfile
curl python ca-certificates && \ 
```


## Deployment pipeline with docker-compose
Use CircleCI for building the image, save the image to Docker Hub and then automatically pull the image from there: <br>

`config.yml` in `.circleci` folder: <br>
```yaml
version: 2.1
orbs:
  docker: circleci/docker@1.0.0
workflows:
  deploy:
    jobs:
      - docker/publish:
          image: $DOCKER_LOGIN/$CIRCLE_PROJECT_REPONAME 
          tag: 'latest'
```

In CircleCI add Go to CircleCI Project Settings and Environment Variables to add `DOCKER_PASSWORD` and `DOCKER_LOGIN`, they are needed by the `orb` in the code above.

`docker-compose.yml`: <br>
```yaml
version: "3"
services:
  coursematerial:
    image: jakousa/docker-hy
    ports:
      - 4000:80
    container_name: coursematerial
  watchtower:
    image: containrrr/watchtower
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    container_name: watchtower
```

`watchtower` is used to automate updates. `watchtower` will try to update every image running. 

## Using a non-root user
Add a non-root user: <br>

```Dockerfile
...
RUN
    useradd -m app 

USER app 
...
```

app user can not write to /app - this can be fixed with `chown`. <br>

## Alpine Linux variant
Ubuntu base image is approximately 113MB. Alpine linux has a base image of just ~ 4 MB. <br>
Things to note when using Alpine Linux:
- works with apk package manager. --no-cache: no downloading sources (caches) first.
- useradd is missing, but adduser exists.
- most of the package names are the same as for ubuntu.

## Multi-stage builds
- useful when you need some tools just for the build, but not the execution of the image CDM. 
- reduces image size.

```Dockerfile
FROM ruby as build-stage
...
FROM nginx
COPY --from=build-stage /usr/app/-site/ /usr/share/nginx/html
```

Last line in above file will copy content from first image (from /usr/app/-site/) to /usr/share/nginx/html of the nginx image. <br>

## A peek into multi-host environment options
In situations with more than one host machine, you can not rely on docker-compose solely. There are other tools that can help with this:
 - Docker swarm mode: built into docker. Turns a pool of Docker hosts into a single virtual host. Command: `docker swarm`. It's the lightest way of utilizing multiple hosts.
 - Docker swarm: separate product for container orchestration on multiple hosts.
 - Kubernetes: de facto way of orchestrating containers in lage multi-host environments. The most common way to use Kubernetes is by using a managed service by a cloud provider, such as Google Kubernets Engine (GKE) or Amazon Kubernetes Service (Amazon EKS).

 You can learn more about Kubernets in this course: https://devopswithkubernetes.com/




