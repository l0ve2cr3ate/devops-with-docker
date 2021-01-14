# Exercise 3.5

Document the image size before the changes. <br>

Rather than going to FROM alpine or scratch, lets go look into [docker-node](https://github.com/nodejs/docker-node) and we should find a way how to run a container that has everything pre-installed for us. There’s even a [best practices guide](https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md). <br>

Return back to our frontend & backend Dockerfiles and change the FROM to something more suitable. Make sure the application still works after the changes. <br>

Document the size after this change. If you used the alpine version the size for frontend can be less than 250MB. The backend can be below 150MB. <br>

# Solution

**Before optimization**: <br>
Size frontend: 686MB <br>
Size backend: 314MB <br>

**After optimization**: <br>
Size frontend: 519MB
Size backend: 143MB <nr>