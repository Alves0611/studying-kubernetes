# Gerenciamento de Resources no Kubernetes

https://kubernetes.io/pt-br/docs/concepts/configuration/manage-resources-containers/

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

### Requests
**Requests** são os recursos mínimos garantidos para o contêiner. Isso significa que o Kubernetes garante que esses recursos estarão disponíveis para o contêiner. Se não houver recursos suficientes disponíveis no nó para satisfazer os requests, o pod não será agendado no nó.

- CPU: 0.2 vCPU (ou 200m). Isso significa que o contêiner requer pelo menos 20% de um núcleo de CPU para ser agendado.
- Memory: 64Mi (Mebibytes). Isso significa que o contêiner requer pelo menos 64Mi de memória para ser agendado.


### Limits

**Limits** são os recursos máximos que o contêiner pode usar. Se o contêiner tentar usar mais recursos do que o limite especificado, o Kubernetes irá restringi-lo de diferentes maneiras:

- CPU: Se o contêiner tentar usar mais CPU do que o limite especificado, o Kubernetes irá limitar a utilização da CPU, mas o pod continuará sendo executado.
- Memory: Se o contêiner tentar usar mais memória do que o limite especificado, o Kubernetes irá matar e reiniciar o contêiner (OOMKill - Out Of Memory Kill).


## Resumo
- **Requests** garantem os recursos mínimos necessários para o contêiner ser agendado e executado.
- **Limits** definem os recursos máximos que o contêiner pode usar. Se ultrapassar esses limites, o Kubernetes tomará ações para restringir o uso de CPU e reiniciar o contêiner em caso de excesso de memória.


## Boas Práticas


- **Definir Requests e Limits:** Isso ajuda a evitar a sobrecarga de recursos em um nó, garantindo que os aplicativos executem dentro das expectativas de recursos.
- **Monitoramento:** Monitorar o uso de recursos regularmente para ajustar as especificações de requests e limits com base no uso real.
- **Uso de Namespaces e Quotas:** Para controlar o uso de recursos em um ambiente com múltiplos usuários ou equipes, use namespaces e defina quotas de recursos para eles.
