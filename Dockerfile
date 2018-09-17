FROM node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Build app
RUN npm run build

# Bundle app source
COPY . .

EXPOSE 3000
CMD [ "npm", "start" ]
