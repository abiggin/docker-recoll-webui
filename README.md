# docker-recoll-webui
recoll with webui in a docker container

- creates a python standalone recoll server inside a docker container listening on port 8080
- settings for recoll are stored in `/root/.recoll/recoll.conf`
- the path of what will be indexed is `/data` to be specified as ...

`--mount type=bind,source="<<local data dir>>",target=/data`

- the db will be stored in the user "recoll" home dir.  Pass in the home dir root as...

`--mount type=bind,source="<<{$HOME} for user you are running as>>",target=/home`

# installation steps

