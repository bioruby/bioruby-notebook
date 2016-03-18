FROM ubuntu:15.10
RUN apt update; apt install -y git ruby gcc ruby-dev rake make wget python python-dev
RUN cd; git clone git://github.com/bioruby/bioruby; cd bioruby; gem build bioruby.gemspec; gem install bioruby-*.gem pry; cd

# jupyter, sklearn
RUN wget https://bootstrap.pypa.io/get-pip.py; python get-pip.py; pip install jupyter
# iruby
RUN apt install -y libzmq3-dev libtool-bin autoconf g++; gem install rbczmq iruby

EXPOSE 8888
CMD iruby notebook --no-browser --ip='*' --port 8888
