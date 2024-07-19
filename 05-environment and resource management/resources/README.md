# Gerenciamento de Resources no Kubernetes


No Kubernetes, o termo "Resources" refere-se às capacidades computacionais e de armazenamento que podem ser alocadas para os contêineres em um cluster. O gerenciamento eficiente desses recursos é crucial para a operação estável e a escalabilidade de aplicações em um ambiente Kubernetes.

## Tipos de Resources

No Kubernetes, os recursos principais que você pode especificar para cada contêiner são CPU e memória, mas também existem outros tipos, como armazenamento e recursos de rede específicos.

### CPU e Memória

- **CPU**: Especificada em unidades de CPU virtual. Uma CPU, em Kubernetes, é equivalente a um núcleo de CPU de um processador físico.
- **Memória**: Especificada em bytes. Pode ser expressa em unidades de bytes como MiB, GiB.

### Recursos de Armazenamento

- **Volumes**: Permitem que um contêiner acesse o sistema de arquivos com base em requisitos de armazenamento.

### Recursos de Rede

- **Bandwidth**: Alguns plugins de rede podem permitir a especificação de limites de largura de banda.

## Especificação de Resources

Os recursos são especificados no manifesto do pod no Kubernetes. Cada contêiner no pod pode ter suas especificações de recursos definidas.

## Requests e Limits

- **Requests:** O mínimo de recursos garantido para o contêiner. O scheduler do Kubernetes utiliza essa informação para decidir em qual nó o contêiner deve ser executado.

- **Limits:** O máximo de recursos que um contêiner pode consumir. Se um contêiner excede o limite de CPU, ele será limitado (throttled). Se exceder o limite de memória, ele poderá ser terminado (OOM kill).
