# Use the distroless Node.js 24 image based on Debian 12
## As of 2025, alpine3.22 version just takes 10MB more than the Debian 12 version
FROM gcr.io/distroless/nodejs24-debian12
#FROM node:current-alpine3.22

# Set the working directory inside the container
WORKDIR /app    

COPY samplewebapp/ /app/

#ENTRYPOINT [ "node" ] # Required for alpine3.22 version base
CMD [ "server.js" ]

EXPOSE 3000