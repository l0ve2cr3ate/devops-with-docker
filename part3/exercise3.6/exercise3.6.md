# Exercise 3.6

Multi-stage builds. Lets do a multi-stage build for the [frontend](https://github.com/docker-hy/frontend-example-docker) project since we’ve come so far with the application. <br>

Even though multi-stage builds are designed mostly for binaries in mind, we can leverage the benefits with our frontend project as having original source code with the final assets makes little sense. Build it with the instructions in README and the built assets should be in dist folder. <br>

You can still use the serve to serve the static files or try out something else. <br>