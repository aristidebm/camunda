### Process deployment using camunda process application
+ [task-form-embedded](https://github.com/camunda/camunda-bpm-examples/tree/master/usertask/task-form-embedded)

#### How does it work ?

##### Setup one time postgres db

```sh
docker run -it --rm -p 5432:5432 -it -e POSTGRES_HOST_AUTH_METHOD=trust postgres:14.1-alpine
```

##### Build camunda image

```sh
DOCKER_BUILDKIT=1 docker build -f Dockerfile . --no-cache --network host -t custom-camunda-image
```

##### Run one time container

```sh
docker run -it --rm -e DB_DRIVER=org.postgresql.Driver -e DB_URL=jdbc:postgresql://172.17.0.1:5432/ -e DB_USERNAME=postgres -e DB_PASSWORD= -p 8082:8080 custom-camunda-image:latest 2>&1
````

##### Debuging


```sh
DOCKER_BUILDKIT=1 docker build --target java_builder -f Dockerfile . --no-cache --network host -t custom-camunda-image
```

```sh
docker run -it --rm <sh256> sh
```

where <sh256> is the intermediate image hash 

##### Note
+ `172.17.0.1` is the `inet` when running `ip a` of docker0 entry (docker bridge network gateway which reprent your machine) 
