# This dockerfile can be used to test that everything
# is deployed correctly without messing up your
# host machine

FROM ubuntu:latest

# Install deps
RUN apt update && apt install -y python3 python3-pip curl git 
RUN pip3 install dotbot

# Install programs to test
RUN apt install -y neovim fish tmux 

RUN mkdir -p /root/dotfiles
COPY . /root/dotfiles/

WORKDIR /root/

# Remove this so we can deploy bashrc
RUN rm .bashrc
