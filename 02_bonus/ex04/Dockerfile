FROM debian

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y cowsay fortune

ENTRYPOINT /usr/games/fortune | /usr/games/cowsay -f ghostbusters
