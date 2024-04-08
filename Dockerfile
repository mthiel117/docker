FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=America/Detriot

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    openssh-server \
    python3 \
    python3-pip \
    snapd \
    sudo \
    wget \
    zsh \
    git

COPY requirements.txt requirements.txt

COPY requirements.yml requirements.yml

RUN pip3 install -r requirements.txt

RUN ansible-galaxy collection install -r requirements.yml --force

# Install Oh My Zsh
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Optionally, if you want to set the Robby Russell theme explicitly
# RUN sed -i 's/ZSH_THEME=".*"/ZSH_THEME="robbyrussell"/g' ~/.zshrc

# Set the default shell to zsh
SHELL ["/bin/zsh", "-c"]

# Set the entrypoint to zsh
ENTRYPOINT ["/bin/zsh"]
