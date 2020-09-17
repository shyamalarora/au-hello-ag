# FROM node:12.18.3-stretch
# # Setting working directory. All the path will be relative to WORKDIR
# EXPOSE 3000
# WORKDIR /usr/src/app

# # Installing dependencies
# COPY package*.json ./

# # Copying source files
# COPY . .

# RUN npm ci
# # RUN npm install
# # Building app
# RUN npm run build
# # Running the app
# CMD ["npm", "start"]
# # CMD [ "node", "build/index.html" ]

FROM node:12.18.0-alpine as build
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json ./
COPY package-lock.json ./
RUN npm ci --silent
RUN npm install react-scripts@3.4.3 -g --silent
COPY . ./
RUN npm run build

# production environment
FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]