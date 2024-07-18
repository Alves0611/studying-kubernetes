kubectl create secret docker-registry docker-auth --docker-server=https://index.docker.io/v1/ --docker-username=username --docker-email=email.com --docker-password=123


# Usando Repositórios Privados no Kubernetes

Quando você utiliza repositórios de contêineres privados, como o Docker Hub privado ou outros registros de contêineres privados, é necessário configurar o Kubernetes para acessar esses registros. Isso é feito criando um Secret que contém as credenciais de autenticação.

## Criando um Secret para Repositório Privado

Para acessar um repositório privado, você precisa criar um Secret do tipo `docker-registry` no Kubernetes. Este Secret armazenará suas credenciais de autenticação.

### Comando para Criar o Secret

Use o comando abaixo para criar um Secret chamado `docker-auth` com suas credenciais de acesso ao Docker Hub:

```sh
kubectl create secret docker-registry docker-auth \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=username \
  --docker-email=email.com \
  --docker-password=123
```

## Parâmetros do Comando
- --docker-server: URL do servidor do registro de contêineres (para o Docker Hub, é https://index.docker.io/v1/).
- --docker-username: Seu nome de usuário no registro de contêineres.
- --docker-email: Seu e-mail associado à conta no registro de contêineres.
- --docker-password: Sua senha para o registro de contêineres.
