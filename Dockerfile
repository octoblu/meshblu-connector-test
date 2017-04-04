FROM octoblu/node:7-worker-onbuild
MAINTAINER Octoblu, Inc. <docker@octoblu.com>

RUN mkdir -p /usr/src/app/log
RUN chmod 777 -R /usr/src/app/log

CMD ["./start"]
