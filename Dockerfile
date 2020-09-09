FROM node:14.8.0-stretch
# Setting working directory. All the path will be relative to WORKDIR
WORKDIR /usr/src/app

# Copying source files
COPY . .
# Installing dependencies
# COPY /workspace/package*.json ./
RUN npm install --production

# Building app
RUN npm run build
# Running the app
CMD [ "npm", "start" ]