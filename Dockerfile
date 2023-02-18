FROM node:19.6.1-alpine3.17 as build
# Enable corepack so pnpm is available
RUN corepack enable
# Download and setup redbean
ARG DOWNLOAD_FILENAME=redbean-original-2.2.com
RUN apk add --update zip bash
RUN wget https://redbean.dev/${DOWNLOAD_FILENAME} -O redbean.com
RUN chmod +x redbean.com
# Normalize redbean binary to ELF
RUN sh /redbean.com --assimilate
# Set working directory and start building app
WORKDIR /app
# Copy only package.json and pnpm-lock.yml 
COPY package.json pnpm-lock.yaml ./
# Install dependencies required to build the app
RUN pnpm i
# Copy app source
COPY . .
# Build the app
RUN pnpm run build
# Prepare redbean binary
WORKDIR /app/dist
RUN zip -r /redbean.com *


FROM scratch as serve

COPY --from=build /redbean.com /
CMD ["/redbean.com", "-vv", "-p", "80"]