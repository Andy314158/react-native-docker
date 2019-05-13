FROM ubuntu:latest

RUN apt-get update

RUN apt-get -y install curl gnupg

RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -

RUN apt-get -y install nodejs

RUN npm install

RUN mkdir /usr/src/app

WORKDIR /usr/src/app

RUN npm install -g react-native-cli

RUN apt-get install python

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN git clone https://github.com/facebook/watchman.git

WORKDIR watchman/

RUN git checkout v4.9.0

RUN apt-get install -y autoconf automake build-essential python-dev

RUN ./autogen.sh 

RUN ./configure 

RUN make

RUN sudo make install


COPY . /usr/src/app

EXPOSE 8080

#CMD ng serve --host 0.0.0.0 --port 8080
