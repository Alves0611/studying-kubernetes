# Kubernetes LimitRange

## O que é LimitRange?

`LimitRange` é um recurso do Kubernetes que permite impor limites mínimos e máximos para recursos como CPU e memória em um namespace. Isso ajuda a garantir que nenhum contêiner consuma todos os recursos disponíveis ou que haja uma distribuição mais equilibrada dos recursos entre os contêineres em um namespace.

## Por que usar LimitRange?

- **Prevenir consumo excessivo de recursos**: Garante que um único contêiner não consuma todos os recursos disponíveis.
- **Promover uma alocação justa**: Assegura uma distribuição equilibrada dos recursos entre vários contêineres.
- **Facilitar a gestão de recursos**: Define padrões que simplificam a configuração de recursos para pods e contêineres.

## Exemplo de Configuração de LimitRange

Aqui está um exemplo de como criar um `LimitRange` para um namespace específico:

```yaml
apiVersion: v1
kind: LimitRange
metadata:
  name: example-limit-range
  namespace: default
spec:
  limits:
  - max:
      cpu: "2"
      memory: "1Gi"
    min:
      cpu: "200m"
      memory: "6Mi"
    default:
      cpu: "500m"
      memory: "256Mi"
    defaultRequest:
      cpu: "300m"
      memory: "200Mi"
    type: Container
```


**Neste exemplo:**

- **max** define o limite máximo de recursos que um contêiner pode solicitar.
- **min** define o limite mínimo de recursos que um contêiner deve solicitar.
- **default** define os valores padrão de recursos que serão aplicados se não forem especificados.
- **defaultRequest** define o valor padrão para a solicitação de recursos se não for especificado.
- **type** indica que essas configurações se aplicam a contêineres dentro do pod.



se um Resource Limit estiver configurado para 512Mi, mas o LimitRange no namespace tiver um valor máximo (max) de 300Mi, a configuração do LimitRange prevalecerá. 


![alt text](<Captura de tela de 2024-07-23 11-45-23.png>)


# Fluxo de Processamento de Solicitações no Kubernetes

Esta imagem ilustra o fluxo de processamento de uma solicitação no Kubernetes, especificamente mostrando onde o recurso `LimitRange` se encaixa no processo. Vamos detalhar cada etapa:

## Autenticação (Authentication)

- A primeira etapa no processamento de uma solicitação é a autenticação.
- O Kubernetes verifica a identidade do usuário que está fazendo a solicitação.
- Isso é feito através de tokens, certificados ou outros métodos de autenticação.
- Se a autenticação falhar, a solicitação é rejeitada imediatamente.

## Autorização (Authorization)

- Uma vez autenticado, o próximo passo é verificar se o usuário tem permissão para realizar a ação solicitada.
- O Kubernetes usa políticas de autorização, como Role-Based Access Control (RBAC), para decidir se a solicitação é permitida.
- Se a autorização falhar, a solicitação é negada.

## Admissão (Admission)

- Se a solicitação passar pela autenticação e autorização, ela chega à fase de admissão.
- Admission controllers são plugins que podem modificar ou rejeitar solicitações.
- Eles são usados para aplicar políticas adicionais e realizar verificações finais antes de uma solicitação ser persistida no etcd (o banco de dados do Kubernetes).

## LimitRange

- O `LimitRange` é um tipo de admission controller.
- Ele verifica se os pods e contêineres que estão sendo criados ou atualizados respeitam os limites de recursos configurados (como CPU e memória).
- Se a solicitação não atender aos requisitos do `LimitRange`, ela será rejeitada na fase de admissão.

## Resumo

A imagem mostra que o `LimitRange` faz parte do processo de admissão, que é a última etapa antes de uma solicitação ser aceita e persistida no sistema. O fluxo geral é:

1. **Autenticação**: Verifica a identidade do usuário.
2. **Autorização**: Verifica se o usuário tem permissão para a ação.
3. **Admissão**: Aplica políticas adicionais, incluindo `LimitRange`.

Se a solicitação passar por todas essas etapas, ela é aceita e processada pelo Kubernetes.
