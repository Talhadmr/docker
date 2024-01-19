all: data db wp up

up:
	docker-compose -f ./srcs/docker-compose.yml up -d
data:
	mkdir /home/talha/data
db:
	mkdir /home/talha/data/db
wp:
	mkdir /home/talha/data/wp

down:
	docker-compose -f ./srcs/docker-compose.yml down

.PHONY: up data db wp down
