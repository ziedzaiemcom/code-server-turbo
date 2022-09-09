# code-server

codercom/code-server:4.6.1 + (openjdk-11-jdk maven shellcheck openssh-server vim build-essential gcc g++ make nodejs kubectl) + 24 extensions

## Extensions list

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

## Push to Docker Hub

```
docker tag code-server-turbo-code-server:latest ziedzaiemcom/code-server-turbo:0.0.1
docker login -u ziedzaiemcom
docker push ziedzaiemcom/code-server-turbo:0.0.1
```