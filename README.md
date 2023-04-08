# Instalação

## Pré-requisito:
**Docker Desktop: https://www.docker.com/products/docker-desktop/**

## Download da imagem:
Faça o download da imagem utilizando o terminal:  
```
docker pull jvrajunior/autor3k0n:1.0.0
```

# Uso:

## Iniciar um container rodando o recon:  
```
docker run -it --name [NOME-CONTAINER] jvrajunior/autor3k0n:1.0.0 recon.sh [DOMÍNIO] [WEBHOOK]
```

## Gerenciar containers em execução:
```
docker ps
```

## Acessar o terminal de um container:
```
docker exec -it [NOME-CONTAINER] bash
```

## Copiar arquivos do container para a máquina local:
```
docker cp [NOME-CONTAINER]:/container/file.txt ./localhost/file.txt
```