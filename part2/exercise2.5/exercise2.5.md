# exercise 2.5

Add redis to example backend. <br>

Redis is used to speed up some operations. Backend uses a slow api to get information. You can test the slow api by requesting /slow with curl. The frontend program has a button to test this. Before configuring redis it should take 10 to 20 seconds to get a response. <br>

Configure a redis container to cache information for the backend. Use the documentation if needed when configuring: https://hub.docker.com/_/redis/ <br>

The backend README should have all the information needed to connect. <br>

When you’ve correctly configured it should take less than a second to get a response and the button will turn green. <br>

Submit the docker-compose.yml <br>

**Note**: setup of docker-compose.yml expects that you have tagged the frontend and backend images as exercise1.10 and exercise1.11 respectively.