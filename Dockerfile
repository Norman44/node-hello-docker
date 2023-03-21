FROM node:16

# https://unix.stackexchange.com/questions/11544/what-is-the-difference-between-opt-and-usr-local
# /usr is the location where Distribution-based items are placed and /usr/local is the location where you'd place your own localized changes

# /usr/local, for self, inhouse, compiled and maintained software. /opt is for non-self, external, prepackaged binary/application bundle installation area. 
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# TODO: Read
# https://bitjudo.com/blog/2014/03/13/building-efficient-dockerfiles-node-dot-js/


# RUN npm install
# If you are building your code for production
# https://blog.npmjs.org/post/171556855892/introducing-npm-ci-for-faster-more-reliable
RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 3000

CMD [ "node", "index.js" ]