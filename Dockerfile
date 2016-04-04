FROM ubuntu:14.04

MAINTAINER Bobby Montalvo <bobby.montalvo@gmail.com>

# Update then Install nodejs, nodejs-legacy, npm, git
RUN     apt-get update && \
        apt-get install -y nodejs nodejs-legacy npm git

# Clone SourceJS repo and run the installation
RUN     git clone https://github.com/sourcejs/init.git -b npm /host && \
        cd /host && \
        npm install sourcejs --save

# Expose the port
EXPOSE 8080

# Set the working directory to SourceJS root
WORKDIR /host

# Start node server
CMD     ["npm", "start"]
