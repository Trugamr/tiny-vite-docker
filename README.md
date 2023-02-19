### Tiny Vite Docker Image
Using [redbean](https://redbean.dev/) binary and [scratch](https://hub.docker.com/_/scratch) docker image to create tiny docker image that serves static files.

### These were the final results
React app final built size was **147.5kB**

```shell
dist/index.html                  0.33 kB
dist/assets/index-d24ab1de.js  143.11 kB
```

Final docker image size was **691kB**
```shell
REPOSITORY          TAG       IMAGE ID       CREATED         SIZE
tiny-vite-docker    latest    d7d5070a873b   2 minutes ago   691kB
```

### Building and running docker image
```shell
docker build -t tiny-vite-docker .
docker run --rm -p 80:80 tiny-vite-docker
```

