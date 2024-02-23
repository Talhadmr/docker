# -f: --file
# -q: --quiet
# -a: --all
# $$: escape $ for shell
all:
	@mkdir -p $(HOME)/data/tdemir/twordpress
	@mkdir -p $(HOME)/data/tdemir/mariadb
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
	rm -rf $(HOME)/data/tdemir/wordpress
	rm -rf $(HOME)/data/tdemir/mariadb

.PHONY: all re down clean
