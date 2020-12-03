# docker-recoll-webui
recoll with webui in a docker container

- creates a python standalone recoll server inside a docker container listening on port 8080
- settings for recoll are stored in `/root/.recoll/recoll.conf`
- the path of what will be indexed is `/data` to be specified as ...

`--mount type=bind,source="<<local data dir>>",target=/data`

- the db is referenced at `/root/.recoll/xapiandb` and can be linked to a Docker volume by...

`--mount source=recoll_xapiandb,target=/root/.recoll/xapiandb`

- example usage...

`docker run -d -p 8080:8080 -it --restart always --mount source=recoll_xapiandb,target=/root/.recoll/xapiandb --mount type=bind,source="/srv/data",target=/data,readonly recoll`

- DockerHub [link](https://hub.docker.com/repository/docker/newbee75/recoll)
- Git [link](https://github.com/abiggin/docker-recoll-webui)
