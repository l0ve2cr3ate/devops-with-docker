# Exercise 1.2 Cleanup

We’ve left containers and a image that won’t be used anymore and are taking space, as `docker ps -as` and `docker images` will reveal. <br>
Clean the docker daemon from all images and containers. <br>
Submit the output for `docker ps -a` and `docker images` <br>

# Solution

`$ docker ps -a` <br>
| CONTAINER ID | IMAGE | COMMAND | CREATED | STATUS | PORTS | NAMES |

`$ docker images` <br>
| REPOSITORY | TAG | IMAGE ID | CREATED | SIZE |