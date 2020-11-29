# Exercise 1.6

Create a Dockerfile that starts with FROM devopsdockeruh/overwrite_cmd_exercise. Add a CMD line to the Dockerfile. <br>
The developer has poorly documented how the application works. Nevertheless once you will execute an application (run a container from an image) you will have some clues on how it works. Your task is to run an application so that it will simulate a clock functionality. <br>
When you will build an image tag it as “docker-clock” so that docker run docker-clock starts the application. <br>
Return both Dockerfile(s) and the command you used to run the container(s)

# Solution (commands)

`$ docker build -t docker-clock .`
`$ docker run docker-clock`
