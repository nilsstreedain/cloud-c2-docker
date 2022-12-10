# cloud-c2-docker
Basic dockerized version of the Hak5 Cloud C2 server application. This is a basic Dockerfile that creates a minimalistic Cloud C2 docker container running on a specified arch. I plan to eventually create a multi-arch image but I'm no docker expert, so for now this was the easiest solution.

## How to build/run:

Build docker image locally from Dockerfile on github (replace ????? with your arch, available arches listed below):
```bash
sudo docker build --build-arg ARCH=????? -t nilsstreedain/cloud-c2-docker:latest https://github.com/nilsstreedain/cloud-c2-docker.git#main
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



## Credits

- To the creators/contributors of [Cloud C2](https://shop.hak5.org/products/c2) at [Hak5](https://github.com/hak5) who make this project possible.

## Disclaimer
- I am in no way affiliated with Hak5 and this plugin is a personal project that I maintain in my free time.
- Use this plugin entirely at your own risk - please see licence for more information.
