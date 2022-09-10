FROM codercom/code-server:4.6.1

RUN sudo apt update \
    && sudo apt-get install -y curl gnupg apt-transport-https \
    && curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - \
    && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list \
    && sudo apt update

RUN sudo apt install -y shellcheck openssh-server vim 
RUN sudo apt install -y build-essential gcc g++ make 
RUN sudo apt install -y nodejs kubectl && sudo rm -rf /var/lib/apt/lists/*
RUN sudo apt update && sudo apt install -y openjdk-11-jdk maven && sudo rm -rf /var/lib/apt/lists/*

RUN sudo npm install -g yarn npm eslint

ADD extensions /extensions