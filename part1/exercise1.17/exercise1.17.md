# Exercise 1.17

Create an image that contains your favorite programming environment in it’s entirety. <br>

This means that a computer that only has docker can use the image to start a container which contains all the tools and libraries. Excluding IDE / Editor. The environment can be partially used by running commands manually inside the container. <br>

Explain what you created and publish it to Docker Hub. <br>

# Solution
https://hub.docker.com/r/l0v2cr3ate/react-environment

`Create React App` can be used to quickly setup a React environment. Node is needed to execute `npx` script. After installing `create-react-app`, copy `package.json` and run `npm install` to install dependencies. Copy the files, expose port 3000 and start the app with `npm start`. 