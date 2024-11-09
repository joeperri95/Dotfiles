# This dockerfile can be used to test that everything
# is deployed correctly without messing up your
# host machine

FROM ubuntu:latest

# Install deps
RUN apt update && apt install -y python3 python3-venv curl git wget

# Install programs to test
RUN apt install -y alacritty neovim zsh tmux 

# Neovim dependencies
RUN apt install -y unzip build-essential golang-go unzip ripgrep 

# Install starship
RUN wget https://starship.rs/install.sh
RUN sh install.sh --yes

WORKDIR /root/

# Copy the dotfiles
RUN mkdir -p /root/dotfiles
COPY . /root/dotfiles/

# Remove this so we can deploy bashrc
RUN rm .bashrc

# Install dotbot and deploy the dotfiles
RUN python3 -m venv venv
RUN . venv/bin/activate && python3 -m pip install dotbot && dotbot -c /root/dotfiles/install.conf.yaml
