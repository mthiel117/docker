# Create Docker Image

## Build Image

``` bash
docker build --no-cache -t mydevbox .
```

## Run Container

``` bash
docker run -it --rm -v $(PWD):/projects mydevbox
```