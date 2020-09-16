FROM node:12.18.3-stretch
# Setting working directory. All the path will be relative to WORKDIR
EXPOSE 3000
WORKDIR /usr/src/app

# Installing dependencies
COPY package*.json ./

# Copying source files
COPY . .

RUN npm ci
# RUN npm install
# Building app
RUN npm run build
# Running the app
ENTRYPOINT ["npm", "start"]
CMD [ "node", "build/index.html" ]