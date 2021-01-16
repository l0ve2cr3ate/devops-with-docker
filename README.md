# devops-with-docker

Introductory Docker and docker-compose course of the University of Helsinki in collaboration with Eficode. The course will also look into what different parts web services consist of, such as reverse proxies, databases, etc.
For more information about the course: https://devopswithdocker.com/

# Course Review DevOps with Docker

## Prerequisits
- a computer with admin/superuser priveledges
- general understanding of software development
- experience with a CLI of your choice

## Course Material
- 4 parts, where part 0 contains the prerequisits.
- the course material is meant to be read sequentially
- the course material is written for Ubuntu

## Time Commitment
5-25 hours per part

## Certificate
You can earn a certificate by completing and submitting the exercises for each part. You may skip one exercise per part, but you can't skip exercises marked as mandatory. 

## Credits
Students with a Finnish Social Security Number and exchange students can earn credits for this course after completing the exercises and passing an exam. Completing part one is worth 1 credit. Completing parts 1-2 is worth 2 credits. Completing all parts (1-3) is worth 3 credits. The 2020 course ends 24-01-2021. The 2021 edition of the course will start 17-03-2020.

## Learning Objectives
- *Part One*: 
    - explain what images and containers are and how they are related - - - build images with Docker for existing project and run them.
- *Part Two*: 
    - manage complex multi-container apps with docker-compose.
- *Part Three*: 
    - optimize image size and security for production
    - know why docker-compose is not an optimal production solution and what is.

## Windows 10 Home and Debugging
While the course material is written for Ubuntu, I started this course on Windows 10 Home. After encountering some Windows related errors, I did switch to [Docker Desktop for Windows Home using WSL 2](https://docs.docker.com/docker-for-windows/install-windows-home/). It's a full version of Docker Desktop for Linux container development. If you want to use it, don't forget to check the [System Requirements](https://docs.docker.com/docker-for-windows/install-windows-home/#system-requirements). <br>

I used Docker Desktop for Windows Home together with [Remote - WSL in VSCode](https://code.visualstudio.com/docs/remote/wsl-tutorial). <br>

I had to do a lot of debugging during the course. Almost every command that I did run did give an error. As mentioned some of the errors were related to using Windows, some of the errors came from Docker backend or remote WSL having stopped. <br>
In the beginning of the course I felt a bit lost, because I did not know if there was something wrong with my commands, or that the error was caused by the environment I was using. Working through the errors, I got a better sense of what they meant. I learned a lot about Docker, WSL2 and Remote WSL in VSCode. <br>

## Quality Content
The course content itself is great. Compared to the [Fullstack Open](https://fullstackopen.com/en/), you have to look up more things yourself. But this could also be the result of me having less experience with the content, and using Windows instead of Ubuntu.

## Exercises
DevOps with Docker gives you a lot of hands on experience, where you can practice what you have learned by completing exercises.

## No Videos
This course provides you with written information, which you will apply during the exercises. This is not a course where someone takes your hand and tells you what to do. The course does however provide enough information for you to be able to complete the exercises and learn a lot. The course only has written content, no videos, and it is self-paced. 

## Summary
Great introductory course to Docker and docker-compose, with lots of exercises to practice what you have learned.

## What's Next?
If you want to learn more about DevOps, you could take a look at the course [DevOps with Kubernets](https://devopswithkubernetes.com/). It is an introductory course to Kubernetes with K3s and GKE. In this course, you will develop software with a microservice architecture that utilizes Kubernetes to serve software that scales and deploys automatically. <br>
**Note**: In part 3 of the course [DevOps with Kubernets](https://devopswithkubernetes.com/)  you will need to use Google Kubernetes Engine. It's not free, but everyone starting with Google Cloud has $300 worth of free credits. For more info: https://devopswithkubernetes.com/part-0#google-cloud-credits.




