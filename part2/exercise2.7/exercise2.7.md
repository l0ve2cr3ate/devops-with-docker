# Exercise 2.7

Configure a [machine learning](https://en.wikipedia.org/wiki/Machine_learning) project. <br>

Look into machine learning project created with Python and React and split into three parts: [frontend](https://github.com/docker-hy/ml-kurkkumopo-frontend), [backend](https://github.com/docker-hy/ml-kurkkumopo-backend) and [training](https://github.com/docker-hy/ml-kurkkumopo-training) <br>

Note that the training requires 2 volumes and backend should share volume `/src/model` with training. <br>

The frontend will display on http://localhost:3000 and the application will tell if the subject of an image looks more like a cucumber or a moped. <br>

Submit the `docker-compose.yml` <br>

> This exercise is known to have broken for some attendees based on CPU. The error looks something like “Illegal instruction (core dumped)”. Try downgrading / upgrading the tensorflow found in requirements.txt or join the telegram channel and message with @jakousa. <br>

> Note that the generated model is a toy and will not produce good results. <br>

> It will take SEVERAL minutes to build the docker images, download training pictures and train the classifying model. <br>

This exercise was created by [Sasu Mäkinen](https://github.com/sasumaki)

