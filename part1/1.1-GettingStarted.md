# Exercise 1.1 Getting started

Since we already did “Hello, World!” in the material let’s do something else. <br>
Start 3 containers from image that does not automatically exit, such as nginx, detached. <br>
Stop 2 of the containers leaving 1 up. <br>
Submitting the output for docker ps -a is enough to prove this exercise has been done.

# Solution

`$ docker ps -a`

| CONTAINER ID | IMAGE    | COMMAND                | CREATED            | STATUS                    | PORTS  | NAMES                |
| ------------ | -------- | ---------------------- | ------------------ | ------------------------- | ------ | -------------------- |
| 063be39daee4 | redix    | "docker-entrypoint.s…" | About a minute ago | Exited (0) 18 seconds ago |        | adoring_cerf         |
| 7c4b6b8b8c1d | nginx    | "/docker-entrypoint.…" | About a minute ago | Up About a minute         | 80/tcp | gallant_visvesvaraya |
| 82f6e457f6f0 | postgres | "docker-entrypoint.s…" | 2 minutes ago      | Exited (0) 26 seconds ago |        | clever_kepler        |
