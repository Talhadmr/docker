all: data db wp up

up:
	docker-compose -f ./srcs/docker-compose.yml up -d
data:
	mkdir /home/tdemir/data
db:
	mkdir /home/tdemir/data/db
wp:
	mkdir /home/tdemir/data/wp

down:
	docker-compose -f ./srcs/docker-compose.yml down

.PHONY: up data db wp down
