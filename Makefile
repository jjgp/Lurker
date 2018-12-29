build-cpu-jupyter:
	docker build -f dockerfiles/cpu-jupyter.Dockerfile -t lurker-cpu-jupyter .

build-game:
	docker build -f dockerfiles/game.Dockerfile -t lurker-game .

clean-exited:
	docker rm `docker ps -qaf status=exited`

remove-all:
	docker stop `docker ps -aq` && \
	docker rm `docker ps -aq` && \
	docker rmi `docker images -q`:w

run-cpu-jupyter:
	docker run -it -p 8888:8888 lurker-cpu-jupyter