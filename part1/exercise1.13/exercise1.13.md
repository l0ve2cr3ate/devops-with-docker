# Exercise 1.13

Lets create a Dockerfile for a [Java Spring project](https://github.com/docker-hy/spring-example-project) <br>

The setup should be straightforward with the README instructions. Tips to get you started: <br>

Use openjdk image `FROM openjdk:_tag_` to get java instead of installing it manually. Pick the tag by using the README and dockerhub page. <br>

You’ve completed the exercise when you see a ‘Success’ message in your browser. <br>

# Solution (Commands)

`$ docker build -t exercise1.13 .` <br>
`$ docker run -p 8080:8080 exercise1.13` <br>