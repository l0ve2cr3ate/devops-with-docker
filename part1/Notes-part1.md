# Notes part 1 - DevOps with Docker

## Learning goals
- run containerized apps
- containezie apps
- utilize volumes to store data persistently outside of containers
- use port mapping to enable access via TCP to containerized apps
- share own containers publicly

## What is DevOps?
*Dev* refers to development of software, *Ops* to operations. In practice DevOps means that the release, configuring, and monitoring of software is in the hands of the people who develop it. <br>
Jabbari et all definition: 
> DevOps is a development methodology aimed at bridging the gap between Development and Operations, emphasizing communication and collaboration, continuous integration, quality assurance and delivery with automated deployment utilizing a set of development practices. <br>

## What is Docker?
Docker combines app and its dependencies into an *image* that can be run on any machine. Docker Engine in not the same as virtual machines.

## What is a Docker Image?
A file which is built by instructional `Dockerfile`. An image never changes. You can't edit an existing file, but you can create a new *layer* to it.

## What is a Docker Container?
Containers only contain that which is required to execute an app. You can start, stop and interact with them. They are *isolated* environments on the host machine, with the ability to interact with each other and the host machine itself via defined methods (TCP/UDP).

## Image vs Container
Containers are *instances* of Images. To get an image, you need to build it with `Dockerfile`. You run the image creating a container.

## Docker CLI Basics
Docker CLI - also referred to as `docker engine`

To list images you currently have downloaded: <br>
`docker images` <br>
Before removing an image, you should remove the referencing container first. <br>
To list containers thar are running: <br>
`docker container ls` <br>
To list all containers: <br>
`docker container ls -a` <br>
Containers have a `Container ID` and a name. <br> 
To filter the list of containers: <br>
`ls -a grep name-container` <br>
`grep` is a Linux command. The windows grep alternative for cmd is `findstr`, and in Powershell: `Select-String` <br>

You can remove a container using the `rm` command. Give the container name or ID as args. The command works with the 1st characters of the ID. If the ID is 3d6bac37aa63, the command `docker rm 3d` will delete it. This shorthand ID will print a warning if there are multiple IDs starting with the same characters. None of these will be removed. You can remove multiple containers with the command: <br>
`docker rm id1 id2` <br>
To remove all stopped containers: <br>
`docker container prune` <br>
`docker system prune` will clear everything. <br>

To remove an image: <br>
`docker rmi <image_name>` <br>
With `pull` command you can download images without running them: <br>
`docker pull <image_name>` <br>

`-d` flag starts a container in *detached* mode; it runs in the background: <br>
`docker run -d nginx` <br>

To remove a container, first stop it: <br>
`docker stop <container id/name>` <br>

## Where do images come from?
When you try to run an image docker will automatically search *Docker Hub* for the image if it is not found locally. <br>
You can search for images in Docker Hub with `docker search`. <br>
Official images are curated and reviewed by Docker Inc. *Automated* images are automatically built from the source repo. There are also other Docker registries, like *quay*.

## Detailed look into an image
Images can be tagged to save different versions of the image: `:<tag>` after the image name. Images are composed of different layers that are downloaded in parallel. You can also tag images locally: <br>
`docker tag ubuntu:16.04 ubuntu:xenial` creates the tag `ubuntu:xenial` which refers to `ubuntu:16.04` <br>

## Running and stopping containers
With `attach` you can attach a running container to a terminal. When you press `control + C` in the attached window, the container will stop running. If you want to attach a container that should not be closed from another terminial, you should disable signal proxying: <br>
`docker attach --signal-proxy= false <container_name>` <br>

To enter a container, you can start a new process in it: <br>
`docker exec -it <container_name> bash` <br>

`-it` stands for `-i` and `-t`. `-i`: interactive connects STDIN; `-t`: allocate pseudo-TTY --> allows you to interact with the container using the command line. Now that you are inside the (ubuntu) container, it behaves like you would expect from ubuntu. You can terminate the container with `kill`: <br>
`docker kill <container_name>` <br>
`docker rm <container_name>` <br>

If you start a process with (`-it` and) `--rm`, it will automatically be removed after its exited --> no garbage containers left behind, but you also can't start the container after it has exited with `docker start`. <br>

`control + p, control + q` --> detach terminal from STOUT <br>

## Creating own dockerized project
**Dockerfile**: <br>
- *WORKDIR*: create and set current working directory
- *RUN*: execute command with `/bin/sh -c` prefix
- *COPY*: copies existing local file to second argument. *COPY* is preferred over *ADD* for adding files.
- *CMD*: command that will be executed using `docker run`

Build the container with the command: <br>
`docker build -t <name> .` <br>
`docker diff <dockerID>` will list changes between 1st image and container. A: added, D: deleted, C: changed.

## Bigger and more complex image
*ENTRYPOINT* can be used to define main executable. By default *ENTRYPOINT* is set as `/bin/sh`. <br>
`docker cp <filename>` will copy the file. <br>

## Volumes: bind mount
By *bind mounting* a host (your machine) folder to the container you can get the file directly to your machine: <br>
`docker run -v "$(pwd):/mydir" <container_name>` <br>
A *volume* is a folder (or file) that is shared between container and host machine.

## Allowing external connections into containers
http = protocol, `127.0.0.1` = ip-address, 3000 = port, localhost = hostname (can be used instead of ip-address).<br>
`127.0.0.1`/localhost refers to the machina/container itself: <br>
If you are in a container and send a message to localhost, the target is the container itself. If you are running software on your laptop outside of containers and send message to localhost, the target is the laptop. <br>
**Exception**: you can map your laptop's (host machine) port to a container port. <br>
Opening a connection from outside world to a docker container happens in 2 steps: 
1. Exposing port: add `EXPOSE <port>` in Dockerfile
2. Publishing port: run container with `-p <host-port>:<container-port>` <br>

Exposing a container port: tell docker that container listens to a certain port. <br>
Publishing a port: docker will map container ports to host (your machine) ports. <br>

*Example*: app uses port 4567 to accept udp connections. <br> 
`EXPOSE 4567` in Dockerfile will allow container created from image to accept connections. <br>
`docker run -p 1234:4567 <container-name>` -> now you can make connection to host port 1234 and it will be mapped to the app port. If you leave out the host port and only specify the container port, docker will choose a free port. <br>

`docker port <container-name>` -> list port mappings for a container. <br>
You can limit connections to a certain protocol: <br>
`EXPOSE 4567/udp` <br>
`docker run -p 1224:4567/udp` <br>

## Publishing projects in Docker Hub
You can publish images on Docker Hub. Rename your image: <br>
`docker tag youtube-dl <username>/<docker-hub-repo-name>` <br>
`docker login` <br>
`docker push <username>/<docker-hub-repo-name>` <br>
