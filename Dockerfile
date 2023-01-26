FROM codercom/code-server:4.9.1

RUN sudo apt update \
    && sudo apt-get install -y curl gnupg apt-transport-https \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - \
    && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list \
    && sudo apt update

RUN sudo apt install -y nodejs kubectl shellcheck openssh-server vim  build-essential gcc g++ make openjdk-17-jdk maven nano netcat telnet jq httpie wget ncdu nmon exa bat sqlite3

RUN sudo rm -rf /var/lib/apt/lists/*

RUN sudo npm install -g yarn npm eslint newman 

# Shortcuts
# python3 -m http.server 8080
# batcat

ADD extensions /extensions

RUN cd /extensions \
    && /usr/bin/code-server \
        --install-extension Angular.ng-template-15.1.0.vsix \
        --install-extension DotJoshJohnson.xml-2.5.1.vsix \
        --install-extension EditorConfig.EditorConfig-0.16.4.vsix \
        --install-extension GitHub.github-vscode-theme-6.3.3.vsix \
        --install-extension Gruntfuggly.todo-tree-0.0.222.vsix \
        --install-extension HashiCorp.terraform-2.25.2@linux-x64.vsix \
        --install-extension Pivotal.vscode-boot-dev-pack-0.2.0.vsix \
        --install-extension Pivotal.vscode-spring-boot-1.43.0.vsix \
        --install-extension SonarSource.sonarlint-vscode-3.13.0@linux-x64.vsix \
        --install-extension Vue.volar-1.0.24@linux-x64.vsix \
        --install-extension alefragnani.Bookmarks-13.3.1.vsix \
        --install-extension alexcvzz.vscode-sqlite-0.14.1.vsix \
        --install-extension bierner.color-info-0.7.2.vsix \
        --install-extension dbaeumer.vscode-eslint-2.3.3.vsix \
        --install-extension eamodio.gitlens-2023.1.2404.vsix \
        --install-extension eg2.vscode-npm-script-0.3.29.vsix \
        --install-extension esbenp.prettier-vscode-9.10.4.vsix \
        --install-extension ms-azuretools.vscode-docker-1.23.3.vsix \
        --install-extension ms-kubernetes-tools.vscode-kubernetes-tools-1.3.11.vsix \
        --install-extension ms-vscode-remote.remote-ssh-0.95.2023012415.vsix \
        --install-extension ms-vscode-remote.remote-ssh-edit-0.84.0.vsix \
        --install-extension ms-vscode-remote.vscode-remote-extensionpack-0.23.0.vsix \
        --install-extension ms-vscode.PowerShell-2023.1.0.vsix \
        --install-extension ms-vscode.cpptools-1.14.0@linux-x64.vsix \
        --install-extension ms-vscode.remote-explorer-0.1.2023012309.vsix \
        --install-extension mutantdino.resourcemonitor-1.0.7.vsix \
        --install-extension octref.vetur-0.36.1.vsix \
        --install-extension redhat.ansible-1.1.34.vsix \
        --install-extension redhat.java-1.15.2023012103@linux-x64.vsix \
        --install-extension redhat.vscode-xml-0.24.2023012403@linux-x64.vsix \
        --install-extension redhat.vscode-yaml-1.11.10112022.vsix \
        --install-extension streetsidesoftware.code-spell-checker-2.15.0.vsix \
        --install-extension streetsidesoftware.code-spell-checker-french-0.2.4.vsix \
        --install-extension timonwong.shellcheck-0.29.3@linux-x64.vsix \
        --install-extension vscjava.vscode-java-debug-0.47.2023011221.vsix \
        --install-extension vscjava.vscode-java-dependency-0.21.2023011900.vsix \
        --install-extension vscjava.vscode-java-test-0.37.2022121501.vsix \
        --install-extension vscjava.vscode-lombok-1.1.0.vsix \
        --install-extension vscjava.vscode-maven-0.40.2023011903.vsix \
        --install-extension vscjava.vscode-spring-boot-dashboard-0.10.2023012000.vsix \
        --install-extension vscjava.vscode-spring-initializr-0.11.2023011003.vsix \
        --install-extension wayou.vscode-todo-highlight-1.0.5.vsix \
        --install-extension yzhang.markdown-all-in-one-3.5.0.vsix \
    && cd -

RUN sudo rm -rf /extensions