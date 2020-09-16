FROM node:12.18.3-stretch
# Setting working directory. All the path will be relative to WORKDIR
WORKDIR /usr/src/app
ENV PORT 3000
EXPOSE 3000

# Installing dependencies
COPY package*.json ./
RUN npm install --production

# Copying source files
COPY . .

# Building app
RUN npm run build
# Running the app
CMD [ "npm", "start" ]