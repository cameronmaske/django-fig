FROM ubuntu:12.04

# Allow custom PPA
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get install -y --force-yes software-properties-common python-software-properties
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update

# Install NodeJS
RUN apt-get install -y -q nodejs

# Install gulp + coffeescript globally.
RUN npm install -g coffee-script gulp

# Install Ruby
RUN apt-get install -y libgemplugin-ruby ruby
# Install SASS
RUN gem install sass

# Remove unnecessary packages
RUN apt-get autoremove -y

ADD run /code/client/run
RUN chmod +x /code/client/run
WORKDIR /code/client
EXPOSE 35729

CMD ["/code/client/run"]
