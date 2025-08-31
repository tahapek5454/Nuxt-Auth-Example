# Build Stage 1

FROM node:22-alpine AS build
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm i

# Copy the entire project
COPY . ./

# Build the project
RUN npm run build

# Build Stage 2

FROM node:22-alpine
WORKDIR /app

# Only `.output` folder is needed from the build stage
COPY --from=build /app/.output/ ./

# Change the port and host
ENV PORT=80
ENV HOST=0.0.0.0

ENV NUXT_OAUTH_GITHUB_CLIENT_ID=YOUR_GITHUB_CLIENT_ID
ENV NUXT_OAUTH_GITHUB_CLIENT_SECRET=YOUR_GITHUB_CLIENT_SECRET
ENV NUXT_SESSION_PASSWORD=YOUR_SESSION_PASSWORD

ENV NUXT_OAUTH_MICROSOFT_CLIENT_ID=YOUR_MICROSOFT_CLIENT_ID
ENV NUXT_OAUTH_MICROSOFT_CLIENT_SECRET=YOUR_MICROSOFT_CLIENT_SECRET
ENV NUXT_OAUTH_MICROSOFT_TENANT=YOUR_MICROSOFT_TENANT

# SSL set with docker compose file because of format
# ENV NITRO_SSL_CERT=YOUR_SSL_CERT
# ENV NITRO_SSL_KEY=YOUR_SSL_KEY

EXPOSE 80

CMD ["node", "/app/server/index.mjs"]