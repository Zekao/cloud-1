#environement variables
# HOME=/home/emaugale

all:
	export DOCKER_HOST=tcp://18.169.11.21:2375
	mkdir -p ${HOME}/data/wp-db
	mkdir -p ${HOME}/data/wp-files
	docker compose build
	docker compose up -d
dns:
	@sudo sed -i "s/localhost/cloud.emaugale.com/g" /etc/hosts

clean:
	docker volume ls -qf dangling=true | xargs -r docker volume rm
	docker system prune -a
fclean: clean
	rm -rf ${HOME}/data/wp-db
	rm -rf ${HOME}/data/wp-files
re: fclean all

.PHONY: all, clean, fclean, re