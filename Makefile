#has to build docker-images using the docker-compose.yml
MARIADB ?= username
WORDPRESS ?= 
NGINX ?=
APPLICATION_NAME ?= hello-world
GIT_HASH ?= $(shell git log --format="%h" -n 1) #(pour le tag)

all : 
		build
build:
        docker build --tag ${DOCKER_USERNAME}/${APPLICATION_NAME} .

run :
		docker run -it [nom de l image] :version de l image(tag)

release:
        docker pull ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH}
        docker tag  ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH} 
        docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH}