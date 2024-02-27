# docker-recoll-webui
recoll with webui in a docker container

- used python3 and new updated recoll-web-ui https://framagit.org/medoc92/recollwebui/ version
- creates a python standalone recoll server inside a docker container listening on port 8080
- to start indexing run this command on your system:
    `docker exec CONTAINER_ID recollindex`
- change `CONTAINER_ID` and paths to your needs
- settings for recoll are stored in `/root/.recoll/recoll.conf`
- the path of what will be indexed is `/docs`
# links

- source project: https://github.com/rgeilings/recoll-webui
- docker hub: https://hub.docker.com/r/ageos/recoll-webui
# installation steps

- use the `docker-compose up -d` command to create the docker container. Make sure you do this in the directory where the `docker-compose.yml` file is located.
- for simplicity there is no user level configuration. you can maintain your container and change configs in `/root/.recoll/recoll.conf` and use `docker exec CONTAINER_ID recollindex` to rebuild index
