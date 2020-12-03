# Exercise 1.12
Start both frontend-example and backend-example with correct ports exposed and add ENV to Dockerfile with necessary information from both READMEs. <br>
Ignore the backend configurations until frontend sends requests to `_backend_url_/ping` when you press the button. <br>

You know that the configuration is ready when the button for 1.12 of frontend-example responds and turns green.<br>

Do not alter the code of either project <br>

Submit the edited Dockerfiles and commands used to run. <br>

# Solution (Commands)

Frontend: <br>
`$ docker build -t exercise1.10 .` <br>
`$ docker run -p 5000:5000 exercise1.10`

Backend: <br>
`$ docker build -t exercise1.11 .` <br>
`$ docker run -p 8000:8000 -v $(pwd)/logs.txt:/service/logs.txt exercise1.11`