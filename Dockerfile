FROM ubuntu:20.04

RUN apt update
RUN apt install tinyproxy supervisor -y 

COPY supervisord.conf .
RUN chmod +x ./supervisord.conf
COPY tiny.conf .
RUN chmod +x ./tiny.conf

#CMD tinyproxy -d -c ./tiny.conf
EXPOSE 80
CMD supervisord -c ./supervisord.conf

# docker build -t flytiny .
# docker run -it -p 1234:80 flytiny
