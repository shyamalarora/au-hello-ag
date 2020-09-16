FROM node:12.18.3-stretch
# Setting working directory. All the path will be relative to WORKDIR
WORKDIR /usr/src/app
EXPOSE 3000
# Installing dependencies
COPY package*.json ./

# Copying source files
COPY . .

# RUN npm install
# Building app
RUN npm install --unsafe-perm --quite && npm run build
# Running the app
CMD [ "npm", "start" ]