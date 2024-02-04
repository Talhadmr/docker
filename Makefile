all: data db wp up

up:
	docker-compose -f ./srcs/docker-compose.yml up -d
data:
	mkdir -p /home/talha/data
db:
	mkdir -p /home/talha/data/db
wp:
	mkdir -p /home/talha/data/wp

down:
	docker-compose -f ./srcs/docker-compose.yml down

.PHONY: up data db wp down
