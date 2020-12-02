# Exercise 1.11

Clone, fork or download a project from https://github.com/docker-hy/backend-example-docker.

Create a Dockerfile for the project and give a command so that the project runs in a docker container with port 8000 exposed and published so when you start the container and navigate to http://localhost:8000 you will generate a message in logs.txt in the working directory. <br>

Create a volume for the logs.txt so that when the application is shut down the logs are not destroyed. And when restarted it continues to write into the same `logs.txt`. <br>

Submit the Dockerfile and the command used. <br>

Do not alter the code of the project <br>

# Solution (Commands)

`$ docker build -t exercise1.11 .` <br>
`$ docker run -p 8000:8000 -v $(pwd)/logs.txt:/service/logs.txt exercise1.11`
