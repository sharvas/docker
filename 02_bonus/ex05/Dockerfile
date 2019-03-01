FROM debian

RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y python3 python3-pip build-essential libssl-dev libffi-dev python3-dev

WORKDIR /home/projects

COPY hello.py hello.py
RUN python3 hello.py

#python dev environment
