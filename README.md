# code-server

codercom/code-server:4.9.1 + (openjdk-11-jdk maven shellcheck openssh-server vim build-essential gcc g++ make nodejs kubectl) + 39 extensions.

To be used in air-gapped environments with only access to Docker Hub or its local mirror.

- Github : https://github.com/ziedzaiemcom/code-server-turbo
- Docker Hub : https://hub.docker.com/r/ziedzaiemcom/code-server-turbo

Other recommended tools:
- [Dive](https://github.com/wagoodman/dive) A tool for exploring each layer in a docker image.
- [LazyDocker](https://github.com/jesseduffield/lazydocker) The lazier way to manage everything docker.
- [k9s](https://github.com/derailed/k9s) Kubernetes CLI To Manage Your Clusters In Style!


## Bundled Extensions list

https://marketplace.visualstudio.com/VSCode : 

- https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools
- https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode
- https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint
- https://marketplace.visualstudio.com/items?itemName=redhat.java
- https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-debug
- https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker
- https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens
- https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-maven
- https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-test
- https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-dependency
- https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl
- https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
- https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh
- https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh-edit
- https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml
- https://marketplace.visualstudio.com/items?itemName=octref.vetur
- https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker-french
- https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one
- https://marketplace.visualstudio.com/items?itemName=Angular.ng-template
- https://marketplace.visualstudio.com/items?itemName=ms-vscode.remote-explorer
- https://marketplace.visualstudio.com/items?itemName=DotJoshJohnson.xml
- https://marketplace.visualstudio.com/items?itemName=redhat.vscode-xml
- https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack
- https://marketplace.visualstudio.com/items?itemName=Vue.volar
- https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell
- https://marketplace.visualstudio.com/items?itemName=GitHub.github-vscode-theme
- https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig
- https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker
- https://marketplace.visualstudio.com/items?itemName=eg2.vscode-npm-script
- https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight
- https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools
- https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree
- https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks
- https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform
- https://marketplace.visualstudio.com/items?itemName=MS-CEINTL.vscode-language-pack-fr
- https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-spring-initializr
- https://marketplace.visualstudio.com/items?itemName=Pivotal.vscode-spring-boot
- https://marketplace.visualstudio.com/items?itemName=ms-vscode.hexeditor
- https://marketplace.visualstudio.com/items?itemName=Pivotal.vscode-boot-dev-pack
- https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-spring-boot-dashboard
- https://marketplace.visualstudio.com/items?itemName=SonarSource.sonarlint-vscode
- https://marketplace.visualstudio.com/items?itemName=alexcvzz.vscode-sqlite
- https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-lombok
- https://marketplace.visualstudio.com/items?itemName=timonwong.shellcheck
- https://marketplace.visualstudio.com/items?itemName=mutantdino.resourcemonitor
- https://marketplace.visualstudio.com/items?itemName=redhat.ansible
- https://marketplace.visualstudio.com/items?itemName=bierner.color-info
- 

## Run

```
docker compose build --progress=plain
docker compose up -d
```

## Push to Docker Hub

```
docker tag code-server-turbo-code-server:latest ziedzaiemcom/code-server-turbo:0.0.2
docker login -u ziedzaiemcom
docker push ziedzaiemcom/code-server-turbo:0.0.2
```

## Note

For slow internet connections:

```
sudo nano /etc/docker/daemon.json
{
    "max-concurrent-uploads": 1
}

```

## License

MIT.