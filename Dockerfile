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

FROM node:12.18.3-stretch as build-deps
WORKDIR /usr/src/app
COPY package.json ./
COPY . .
RUN npm ci
RUN npm run build

# Stage 2 - the production environment
FROM nginxinc/nginx-unprivileged 
COPY --from=build-deps /usr/src/app/build /usr/share/nginx/html
RUN chgrp -R root /var/cache/nginx /var/run /var/log/nginx && \
    chmod -R 770 /var/cache/nginx /var/run /var/log/nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]