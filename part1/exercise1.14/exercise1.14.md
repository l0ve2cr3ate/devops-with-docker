# Exercise 1.14

Lets create a Dockerfile for a [rails project](https://github.com/docker-hy/rails-example-project). <br>

Again we can take a look at the README for the project to see the installation instructions. Tips to get you started: <br>

Use Ruby image `FROM ruby:_tag_` to easily get most of what you’ll need at the beginning. Pick the tag by using the README and dockerhub page. <br>

If you want you can make small edits to the program if you get stuck and google doesn’t help you configure the setup. If you did, explain the edits with your submission of the Dockerfile. <br>

You’ve completed the exercise when the application works in your browser. <br>

# Solution (Commands)
`$ docker build -t exercise1.14 .`
`$ docker run -p 3000:3000 exercise1.14`

