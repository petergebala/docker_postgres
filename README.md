## petergebala/docker_postgres

Basic structure of Dockerfile for postgres server.
[Docker repository page] (https://registry.hub.docker.com/u/petergebala/docker_postgres).

#### It does:

- install postgres with specific version
- create deployer role
- enable external connections
- add volumes
- run postgres as deamon

#### Instalation

1. Download Dockerfile or run: `docker pull petergebala/docker_postgres`
2. Modify what you need ex: postgres version
3. Build container: `docker build -t petergebala/docker_postgres .`
4. Build other containers if you need ex: web server
5. Link container to others.
