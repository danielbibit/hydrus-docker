FROM	ubuntu:20.04

ENV	TZ=America/Sao_Paulo

RUN	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD	https://github.com/hydrusnetwork/hydrus/releases/download/v407/Hydrus.Network.407.-.Linux.-.Executable.tar.gz /tmp/

WORKDIR	/tmp

RUN	tar -xzvf Hydrus.Network.407.-.Linux.-.Executable.tar.gz

RUN	rm Hydrus.Network.407.-.Linux.-.Executable.tar.gz

WORKDIR	hydrus/ network 

# Install vnc, xvfb in order to create a 'fake' display and firefox
RUN	apt-get update
RUN     apt-get install -y x11vnc xvfb 
RUN     mkdir ~/.vnc

# Setup a password
RUN     x11vnc -storepasswd 1234 ~/.vnc/passwd

RUN	./client

