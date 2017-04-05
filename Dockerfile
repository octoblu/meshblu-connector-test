FROM mhart/alpine-node:5.5
MAINTAINER Octoblu <docker@octoblu.com>

ENV NPM_CONFIG_LOGLEVEL error

RUN apk add --no-cache alpine-sdk python-dev bash
#
# # Fix bug https://github.com/npm/npm/issues/9863
# RUN cd $(npm root -g)/npm \
#   && npm install fs-extra \
#   && sed -i -e s/graceful-fs/fs-extra/ -e s/fs\.rename/fs.move/ ./lib/utils/rename.js

RUN npm --silent install node-gyp -g \
  && node-gyp install \
  && npm cache clean

RUN npm --silent --global install yarn

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN mkdir -p /usr/src/app/log
RUN chmod 777 -R /usr/src/app/log

ONBUILD COPY package.json yarn.lock /usr/src/app/
ONBUILD RUN yarn --no-progress --no-emoji --production && yarn cache clean
ONBUILD COPY . /usr/src/app

CMD ["./start"]
