# Create Docker Image

## Build Image

``` bash
docker build --no-cache -t mydevbox .
```

## Run Container

``` bash
# start and mount local volume to /projects
docker run -it --rm -v $(PWD):/projects mydevbox
```