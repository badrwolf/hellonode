# use a node base image
FROM node:7-onbuild

# set maintainer
LABEL maintainer "bchtibi@deloitte.fr"

# set a health check

# tell docker what port to expose
EXPOSE 8000
