.DEFAULT_GOAL := all

.PHONY: help up down build logs ps clean nuke up-grafana down-grafana logs-grafana ps-grafana clean-grafana

DOCKER_COMPOSE := docker-compose

help:
	@echo "Usage:"
	@echo "  make up               - Build Docker image and start all containers"
	@echo "  make down             - Stop all containers"
	@echo "  make build            - Build Docker image"
	@echo "  make logs             - View output from containers"
	@echo "  make ps               - List containers"
	@echo "  make clean            - Remove all stopped containers, networks, images, and volumes"
	@echo "  make nuke             - Remove all volumes, networks, containers, and images"
	
all: create build up

	
create:
	@mkdir -p $(HOME)/tdemir/data/wordpress
	@mkdir -p $(HOME)/tdemir/data/mariadb
	
install:
	bash install_docker.sh

up:
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml up -d

down:
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml down -v

build:
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml build

logs:
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml logs -f

ps:
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml ps

clean:
	docker system prune -f
	docker volume prune -f

nuke:
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
	docker system prune -a -f
	docker volume prune -f
