# code-server

codercom/code-server:4.6.1 + (openjdk-11-jdk maven shellcheck openssh-server vim build-essential gcc g++ make nodejs kubectl) + 24 extensions.

To be used in offline environments with only access to Docker Hub, and yes, such environments exist...

- Github : https://github.com/ziedzaiemcom/code-server-turbo
- Docker Hub : https://hub.docker.com/r/ziedzaiemcom/code-server-turbo

You can use [Dive](https://github.com/wagoodman/dive) to inspect Docker image contents.

## Bundled Extensions list

```
- dbaeumer.vscode-eslint-2.2.6.vsix
- eamodio.gitlens-2022.8.3105.vsix
- eg2.vscode-npm-script-0.3.28.vsix
- esbenp.prettier-vscode-9.8.0.vsix
- formulahendry.vscode-mysql-0.4.1.vsix
- GitHub.github-vscode-theme-6.3.2.vsix
- ms-azuretools.vscode-docker-1.22.1.vsix
- ms-kubernetes-tools.vscode-kubernetes-tools-1.3.10.vsix
- octref.vetur-0.36.0.vsix
- Pivotal.vscode-spring-boot-1.38.0.vsix
- redhat.java-1.11.2022090804@linux-x64.vsix
- redhat.vscode-xml-0.21.2022090704@linux-x64.vsix
- redhat.vscode-yaml-1.10.20220805@alpine-x64.vsix
- streetsidesoftware.code-spell-checker-2.7.3.vsix
- streetsidesoftware.code-spell-checker-french-0.2.3.vsix
- timonwong.shellcheck-0.22.0.vsix
- vscjava.vscode-java-debug-0.44.2022090107.vsix
- vscjava.vscode-java-dependency-0.21.2022090100.vsix
- vscjava.vscode-java-pack-0.25.2022090600.vsix
- vscjava.vscode-java-test-0.37.2022090902.vsix
- vscjava.vscode-maven-0.38.2022090603.vsix
- vscjava.vscode-spring-boot-dashboard-0.7.2022090900.vsix
- vscjava.vscode-spring-initializr-0.11.2022090703.vsix
- zhang.markdown-all-in-one-3.4.4.vsix
```

## Install Extensions  

```Dockerfile

FROM ziedzaiemcom/code-server-turbo:0.0.1

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
        --install-extension streetsidesoftware.code-spell-checker-2.7.3.vsix \
        --install-extension streetsidesoftware.code-spell-checker-french-0.2.3.vsix \
        --install-extension redhat.vscode-xml-0.21.2022090704@linux-x64.vsix \
        --install-extension ms-kubernetes-tools.vscode-kubernetes-tools-1.3.10.vsix \
        --install-extension hediet.vscode-drawio-1.6.4.vsix \
        --install-extension octref.vetur-0.36.0.vsix \
        --install-extension timonwong.shellcheck-0.22.0.vsix \
    && cd -

RUN sudo rm -rf /extensions
```

## Run

```
docker compose build
docker compose up -d
```

## Push to Docker Hub

```
docker tag code-server-turbo-code-server:latest ziedzaiemcom/code-server-turbo:0.0.1
docker login -u ziedzaiemcom
docker push ziedzaiemcom/code-server-turbo:0.0.1
```

## Note

You will notice that the Docker image is not optimized, I could bundle all the apt install operations together and launch the install-extension at the end : This is due to my slow internet connection, I couldn't push the entire image (~4go) to Docker hub without having issues. By executing multiple RUN operations, smaller layers are created and more easily pushed.

this can help too:
```
sudo nano /etc/docker/daemon.json
{
    "max-concurrent-uploads": 1
}

```

## License

MIT.