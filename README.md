# Cloud-C2-Docker
Basic dockerized version of the Hak5 Cloud C2 server application. This is a basic Dockerfile that creates a minimalistic Cloud C2 docker container running on a specified arch. I plan to eventually create a multi-arch image but I'm no docker expert, so for now this was the easiest solution.

## How to build/run:

Build docker image locally from Dockerfile on github (replace ????? with your arch, available arches listed below):
```bash
sudo docker build --build-arg ARCH=????? -t nilsstreedain/cloud-c2-docker:latest https://github.com/nilsstreedain/Cloud-C2-Docker.git#main
```

Run local docker image:
```bash
sudo docker run nilsstreedain/cloud-c2-docker
```

### Working Arches:
- armv5
- armv6
- armv7
- armv8
- i386

### Not Working Arches:
- amd64
