# Exercise 1.4

Now that we’ve warmed up it’s time to get inside a container while it’s running! <br>
Start image `devopsdockeruh/exec_bash_exercise`, it will start a container with clock-like features and create a log. Go inside the container and use `tail -f ./logs.txt` to follow the logs. Every 15 seconds the clock will send you a “secret message”. <br>
Submit the secret message and command(s) given as your answer.

# Solution

`$ docker run -d --name exercise1.4 devopsdockeruh/exec_bash_exercise` <br>
`$ docker exec -it exercise1.4 bash` <br>
`tail -f ./logs.txt` <br>

Secret message is: <br>
"Docker is easy" <br>
