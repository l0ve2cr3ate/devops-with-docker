# Exercise 3.1
Return back to our frontend & backend Dockerfiles and you should see the some mistakes we now know to fix. <br>

Document both image sizes at this point, as was done in the material. Optimize the Dockerfiles of both programs, frontend and backend, by joining the RUN commands and removing useless parts. <br>

After your improvements document the image sizes again. The size difference may not be very much yet. The frontend should be around 432MB when using FROM ubuntu:16.04. The backend should be around 351MB. The sizes may vary. <br>


# Solution

## History frontend image

| IMAGE         | CREATED        | CREATED BY                                    |  SIZE  |  COMMENT 	            |  
|---------------|----------------|-----------------------------------------------|--------|-------------------------|
| 17539c99fcef  | 2 minutes ago  | CMD ["npm" "start"]                           | 0B     | buildkit.dockerfile.v0  |
| <missing>  	| 2 minutes ago  | ENV API_URL=http://localhost:8000             | 0B     | buildkit.dockerfile.v0  |   	
| <missing>	    | 2 minutes ago  | EXPOSE map[5000/tcp:{}]                       | 0B     | buildkit.dockerfile.v0  |  
| <missing>	    | 2 minutes ago  | COPY . . # buildkit                           | 192MB  | buildkit.dockerfile.v0  | 
| <missing>	    | 3 minutes ago  | RUN /bin/sh -c npm install # buildkit         | 212MB  | buildkit.dockerfile.v0  | 
| <missing>	    | 4 minutes ago  | COPY package*.json ./ # buildkit              | 541kB  | buildkit.dockerfile.v0  | 
| <missing>	    | 11 minutes ago | RUN /bin/sh -c apt-get update && apt-get ins… | 150MB  | buildkit.dockerfile.v0  | 
| 16555c3e600d  | 5 days ago     | CMD ["npm" "start"]                           | 0B     | buildkit.dockerfile.v0  |
| <missing>  	| 5 days ago     | ENV API_URL=http://localhost:8000             | 0B     | buildkit.dockerfile.v0  |   	
| <missing>	    | 5 days ago     | EXPOSE map[5000/tcp:{}]                       | 0B     | buildkit.dockerfile.v0  |  
| <missing>	    | 5 days ago     | COPY . . # buildkit                           | 192MB  | buildkit.dockerfile.v0  | 
| <missing>	    | 5 days ago     | RUN /bin/sh -c npm install # buildkit         | 212MB  | buildkit.dockerfile.v0  | 
| <missing>	    | 5 days ago     | COPY package*.json ./ # buildkit              | 541kB  | buildkit.dockerfile.v0  | 
| <missing>	    | 7 days ago     | RUN /bin/sh -c apt install -y nodejs # build… | 103MB  | buildkit.dockerfile.v0M | 
| <missing>	    | 7 days ago     | RUN /bin/sh -c curl -sL https://deb.nodesour… | 33.6MB | buildkit.dockerfile.v0  | 
| <missing>	    | 7 days ago     | RUN /bin/sh -c apt-get update && apt-get ins… | 46.5MB | buildkit.dockerfile.v0  | 
| <missing>	    | 7 days ago     | WORKDIR /app                                  | 0B     | buildkit.dockerfile.v0  |

## History backend image

| IMAGE         | CREATED       | CREATED BY                                    |  SIZE  |  COMMENT 	           |  
|---------------|-------------- |-----------------------------------------------|--------|-------------------------|
| a0e741445c7b  | 4 minutes ago | CMD ["npm" "start"]                           | 0B     | buildkit.dockerfile.v0  |
| <missing>  	| 4 minutes ago | ENV FRONT_URL=http://localhost:5000           | 0B     | buildkit.dockerfile.v0  |   	
| <missing>	    | 4 minutes ago | EXPOSE map[8000/tcp:{}]                       | 0B     | buildkit.dockerfile.v0  |  
| <missing>	    | 4 minutes ago | COPY . . # buildkit                           | 14.8MB | buildkit.dockerfile.v0  | 
| <missing>	    | 4 minutes ago | RUN /bin/sh -c npm install # buildkit         | 18.1MB | buildkit.dockerfile.v0  | 
| <missing>	    | 4 minutes ago | COPY package*.json ./ # buildkit              | 66.5kB | buildkit.dockerfile.v0  | 
| <missing>	    | 4 minutes ago | RUN /bin/sh -c apt-get update && apt-get ins… | 150MB  | buildkit.dockerfile.v0  | 
| 87c332070173  | 5 days ago    | CMD ["npm" "start"]                           | 0B     | buildkit.dockerfile.v0  |
| <missing>  	| 5 days ago    | ENV FRONT_URL=http://localhost:5000           | 0B     | buildkit.dockerfile.v0  |   	
| <missing>	    | 5 days ago    | EXPOSE map[8000/tcp:{}]                       | 0B     | buildkit.dockerfile.v0  |  
| <missing>	    | 5 days ago    | COPY . . # buildkit                           | 14.8MB | buildkit.dockerfile.v0  | 
| <missing>	    | 6 days ago    | RUN /bin/sh -c npm install # buildkit         | 18.1MB | buildkit.dockerfile.v0  | 
| <missing>	    | 6 days ago    | COPY package*.json ./ # buildkit              | 66.5kB | buildkit.dockerfile.v0  | 
| <missing>	    | 6 days ago    | WORKDIR /service                              | 0B     | buildkit.dockerfile.v0  | 


<br>

**Size frontend image at start**: 718 MB <br>
**Size backend image at start**: 944MB <br>

**Size frontend image after optimization**: 685MB <br>
**Size backend image after optimization**: 313MB <br>