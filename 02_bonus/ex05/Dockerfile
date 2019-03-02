FROM debian

RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y python3 python3-pip build-essential libssl-dev libffi-dev python3-dev

WORKDIR /home/projects

COPY hello.py hello.py
RUN python3 hello.py

# a basic Python3 dev environment

# docker build -t 05 .
# docker run -it --rm 05
