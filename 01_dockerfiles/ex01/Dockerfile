FROM debian

WORKDIR ~/teamspeak

ARG TEAMSPEAK_URL=http://dl.4players.de/ts/releases/3.6.1/teamspeak3-server_linux_amd64-3.6.1.tar.bz2
ENV TS3SERVER_LICENSE=accept

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update && apt-get upgrade -y && \
	apt-get install -y wget bzip2 && \
	wget "${TEAMSPEAK_URL}" && \
	tar -xjf teamspeak3-server_linux_amd64-3.6.1.tar.bz2 && \
	rm teamspeak3-server_linux_amd64-3.6.1.tar.bz2

WORKDIR teamspeak3-server_linux_amd64

# 9987 default voice
# 10011 server query
# 30033 file transport
EXPOSE 9987/udp 10011 30033

ENTRYPOINT sh ts3server_minimal_runscript.sh

# docker build -t ex01 .
# docker run -it -p 9987:9987/udp -p 10011:10011 -p 30033 --rm ex01
