FROM codercom/code-server:4.6.1

RUN sudo apt update \
    && sudo apt-get install -y curl gnupg apt-transport-https \
    && curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - \
    && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list \
    && curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - \
    && sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list' \
    && sudo apt update \
    && sudo apt install -y openjdk-11-jdk maven shellcheck openssh-server vim build-essential gcc g++ make nodejs kubectl powershell \
    && sudo rm -rf /var/lib/apt/lists/*

RUN sudo npm install -g yarn npm eslint

ADD extensions /extensions
RUN cd /extensions \
    && /usr/bin/code-server \
        --install-extension dbaeumer.vscode-eslint-2.2.6.vsix \
        --install-extension ms-azuretools.vscode-docker-1.22.1.vsix \
        --install-extension esbenp.prettier-vscode-9.8.0.vsix \
        --install-extension eamodio.gitlens-2022.8.3105.vsix \
        --install-extension redhat.java-1.11.2022090804@linux-x64.vsix \
        --install-extension vscjava.vscode-java-debug-0.44.2022090107.vsix \
        --install-extension vscjava.vscode-java-dependency-0.21.2022090100.vsix \
        --install-extension vscjava.vscode-java-test-0.37.2022090902.vsix \
        --install-extension vscjava.vscode-maven-0.38.2022090603.vsix \
        --install-extension vscjava.vscode-java-pack-0.25.2022090600.vsix \
        --install-extension vscjava.vscode-spring-boot-dashboard-0.7.2022090900.vsix \
        --install-extension Pivotal.vscode-spring-boot-1.38.0.vsix \
        --install-extension vscjava.vscode-spring-initializr-0.11.2022090703.vsix \
        --install-extension redhat.vscode-yaml-1.10.20220805@alpine-x64.vsix \
        --install-extension GitHub.github-vscode-theme-6.3.2.vsix \
        --install-extension yzhang.markdown-all-in-one-3.4.4.vsix \
        --install-extension eg2.vscode-npm-script-0.3.28.vsix \
        --install-extension ms-vscode.PowerShell-2022.8.5.vsix \
        --install-extension streetsidesoftware.code-spell-checker-2.7.3.vsix \
        --install-extension streetsidesoftware.code-spell-checker-french-0.2.3.vsix \
        --install-extension redhat.vscode-xml-0.21.2022090704@linux-x64.vsix \
        --install-extension ms-kubernetes-tools.vscode-kubernetes-tools-1.3.10.vsix \
        --install-extension formulahendry.vscode-mysql-0.4.1.vsix \
        --install-extension hediet.vscode-drawio-1.6.4.vsix \
        --install-extension octref.vetur-0.36.0.vsix \
        --install-extension timonwong.shellcheck-0.22.0.vsix \
    && cd -

RUN sudo rm -rf /extensions