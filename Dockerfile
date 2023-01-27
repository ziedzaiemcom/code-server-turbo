FROM codercom/code-server:4.9.1

RUN sudo apt update \
    && echo 'Acquire::Retries "10";' | sudo tee -a /etc/apt/apt.conf.d/80-retries \
    && sudo apt-get install -y curl gnupg apt-transport-https wget  \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - \
    && echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main" | sudo tee -a /etc/apt/sources.list.d/ansible.list \
    && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
    && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list \
    && wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list \
    && sudo apt update \
    && sudo apt install -y nodejs kubectl shellcheck openssh-server vim  build-essential gcc g++ make openjdk-17-jdk maven nano netcat telnet jq httpie ncdu nmon exa bat sqlite3 terraform vault ansible \
    && sudo rm -rf /var/lib/apt/lists/*

RUN sudo npm install -g yarn npm eslint newman 

# Shortcuts
# python3 -m http.server 8080
# batcat

RUN /usr/bin/code-server \
        --install-extension ms-python.python \
        --install-extension esbenp.prettier-vscode \
        --install-extension dbaeumer.vscode-eslint \
        --install-extension redhat.java \
        --install-extension vscjava.vscode-java-debug \
        --install-extension ms-azuretools.vscode-docker \
        --install-extension eamodio.gitlens \
        --install-extension vscjava.vscode-maven \
        --install-extension vscjava.vscode-java-test \
        --install-extension vscjava.vscode-java-dependency \
        --install-extension redhat.vscode-yaml \
        --install-extension octref.vetur \
        --install-extension streetsidesoftware.code-spell-checker-french \
        --install-extension yzhang.markdown-all-in-one \
        --install-extension Angular.ng-template \
        --install-extension DotJoshJohnson.xml \
        --install-extension redhat.vscode-xml \
        --install-extension Vue.volar \
        --install-extension GitHub.github-vscode-theme \
        --install-extension EditorConfig.EditorConfig \
        --install-extension streetsidesoftware.code-spell-checker \
        --install-extension eg2.vscode-npm-script \
        --install-extension wayou.vscode-todo-highlight \
        --install-extension ms-kubernetes-tools.vscode-kubernetes-tools \
        --install-extension Gruntfuggly.todo-tree \
        --install-extension alefragnani.Bookmarks \
        --install-extension HashiCorp.terraform \
        --install-extension MS-CEINTL.vscode-language-pack-fr \
        --install-extension vscjava.vscode-spring-initializr \
        --install-extension Pivotal.vscode-spring-boot \
        --install-extension ms-vscode.hexeditor \
        --install-extension Pivotal.vscode-boot-dev-pack \
        --install-extension vscjava.vscode-spring-boot-dashboard \
        --install-extension SonarSource.sonarlint-vscode \
        --install-extension alexcvzz.vscode-sqlite \
        --install-extension vscjava.vscode-lombok \
        --install-extension timonwong.shellcheck \
        --install-extension mutantdino.resourcemonitor \
        --install-extension redhat.ansible \
        --install-extension bierner.color-info \
        --install-extension anwar.resourcemonitor \
        --install-extension gabrielbb.vscode-lombok \
        --install-extension ms-ceintl.vscode-language-pack-fr \
    && rm /home/coder/.local/share/code-server/CachedExtensionVSIXs/*