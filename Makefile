build-game:
	docker build -f dockerfiles/game.Dockerfile -t s2client-game .

run-game:
	docker run -P -d s2client-game

clean-exited:
	docker rm `docker ps -qaf status=exited`

remove-all:
	docker stop `docker ps -aq` && \
	docker rm `docker ps -aq` && \
	docker rmi `docker images -q`
 
