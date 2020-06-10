FROM centos:7

MAINTAINER Arpit Gupta (gupta.arpit03@gmail.com)

# Run yum update and clean the cache
RUN (curl -sL https://rpm.nodesource.com/setup_10.x | bash -) \
  && yum clean all -y \
  && yum update -y \
  && yum install -y nodejs \
  && yum autoremove -y \
  && yum clean all -y \
  && npm install npm --global

# create directory for app files
RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

# Node uses a package manager so it needs to copy in package.json file
COPY package.json package.json
COPY client/package.json client/package.json

# then it needs to install dependencies from that file
RUN npm install
# to keep it clean and install we have run 'npm cache clean' above
COPY . .

EXPOSE 3000

CMD ["npm", "heroku-postbuild"]


