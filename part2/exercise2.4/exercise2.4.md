# Exercise 2.4

A project over at https://github.com/docker-hy/scaling-exercise has a hardly working application. Go ahead and clone it for yourself. The project already includes docker-compose.yml so you can start it by running docker-compose up. <br>

Application should be accessible through http://localhost:3000. However it doesn’t work well enough and I’ve added a load balancer for scaling. Your task is to scale the compute containers so that the button in the application turns green. <br>

This exercise was created with [Sasu Mäkinen](https://github.com/sasumaki) <br>

Please return the used commands for this exercise. <br>

# Solution (Commands)

`$ docker-compose up --scale compute=5`