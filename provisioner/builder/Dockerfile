FROM ubuntu:12.04

# Allow custom PPA
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get install -y --force-yes software-properties-common python-software-properties
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update

# Install NodeJS
RUN apt-get install -y -q nodejs

# Install grunt + coffeescript globally.
RUN npm install -g coffee-script grunt-cli

# Install Ruby
RUN apt-get install -y libgemplugin-ruby ruby
# Install SASS
RUN gem install sass

# Remove unnecessary packages
RUN apt-get autoremove -y

ADD package.json /code/package.json

WORKDIR /code/

RUN npm install .

EXPOSE 35729

CMD grunt watch