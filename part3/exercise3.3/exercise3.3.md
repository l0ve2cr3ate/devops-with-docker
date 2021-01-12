# Exercise 3.3 Building images inside of a container
Watchtower uses volume to docker.sock socket to access Docker daemon of the host from the container. By leveraging this ourselves we can create our own simple build service. <br>

Create a project that downloads a repository from github, builds a Dockerfile located in the root and then publishes it into Docker Hub. <br>

You can use any programming language / technology for the project implementation. A simple bash script is viable. <br>

Then create a Dockerfile for it so that it can be run inside a container. <br>

Make sure that it can build at least some of the example projects. <br>

# Solution (Commands)
Run the following commands, and follow instructions in the commandline. <br>
`$ docker build -t buildservice .` <br>
`$ docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock buildservice` <br>