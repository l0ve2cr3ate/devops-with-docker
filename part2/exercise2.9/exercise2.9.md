# Exercise 2.9

Postgres image uses a volume by default. Manually define volumes for the database in convenient location such as in `./database`. Use the image documentations (postgres) to help you with the task. You may do the same for redis as well. <br>

After you have configured the volume: <br>

- Save a few messages through the frontend
- Run `docker-compose down`
- Run `docker-compose up` and see that the messages are available after refreshing browser
- Run `docker-compose down` and delete the volume folder manually
- Run `docker-compose up` and the data should be gone
Maybe it would be simpler to back them up now that you know where they are. <br>

> TIP: To save you the trouble of testing all of those steps, just look into the folder before trying the steps. If it’s empty after docker-compose up then something is wrong.

> TIP: Since you may have broken the buttons in nginx exercise you should test with docker-compose.yml from before it

Submit the docker-compose.yml