FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install -y python3-dev python3-pip git

RUN git clone https://github.com/hydrusnetwork/hydrus.git

WORKDIR hydrus

RUN git checkout tags/v407

RUN pip3 install scikit-build

RUN pip3 install -r requirements.txt

RUN python3 client.py

