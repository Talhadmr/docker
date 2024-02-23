all:
	@mkdir -p $(HOME)/tdemir/data/wordpress
	@mkdir -p $(HOME)/tdemir/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f srcs/docker-compose.yml up --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	rm -rf $(HOME)/tdemir/data/wordpress
	rm -rf $(HOME)/tdemir/data/mariadb

.PHONY: all re down clean
