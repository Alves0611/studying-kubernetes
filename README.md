# Componentes Principais do Kubernetes

### 1. **Worker Node**

O Master Node é responsável pela gestão do cluster. Ele coordena todas as atividades dentro do Kubernetes, como agendamento, escalonamento, manutenção e atualização de aplicativos. Os principais componentes do Master Node são:

- **API Server:** O servidor de API é o ponto de entrada para todos os comandos administrativos no cluster. Ele expõe a API do Kubernetes.
- **etcd:** Um armazenamento de chave-valor que Kubernetes usa para armazenar todos os dados de configuração do cluster. É a fonte de verdade para o estado do cluster.
- **Controller Manager:** Executa os controladores que regulam o estado do sistema, como o controller de replicação que assegura que o número correto de réplicas de um pod esteja em execução em um determinado momento.
- **Scheduler:** O Scheduler é responsável por atribuir nós às cargas de trabalho. Ele seleciona um nó disponível onde o pod pode ser implantado com base em vários fatores, como uso de recursos e restrições.

### 2. **Control Plane**

O Control Plane do Kubernetes é responsável por gerenciar o estado desejado do cluster, incluindo quais aplicativos estão sendo executados e quais recursos estão disponíveis para esses aplicativos. Ele toma decisões de agendamento e responde a eventos no cluster.

## Componentes Principais do Control Plane

### 1. **API Server**

O **API Server** é o ponto de entrada para todas as interações administrativas com o cluster Kubernetes. Ele expõe a API do Kubernetes e é responsável por autenticar, validar e configurar os dados da API para os objetos do Kubernetes, como Pods, Services, e ConfigMaps.

- **Funções:**
  - Expor a API do Kubernetes.
  - Servir como ponto de comunicação entre os componentes do Control Plane e os nós do cluster.
  - Autenticar e autorizar solicitações.
  - Validar e admitir configurações e objetos do Kubernetes.

### 2. **etcd**

O **etcd** é um armazenamento de chave-valor distribuído altamente disponível, usado como a fonte de verdade de todos os dados de configuração do Kubernetes. Ele armazena informações sobre o estado do cluster.

- **Funções:**
  - Armazenar dados de configuração e estado do cluster.
  - Garantir a consistência e a disponibilidade dos dados.
  - Permitir backups e restaurações do estado do cluster.

### 3. **Controller Manager**

O **Controller Manager** é um daemon que incorpora vários controladores que regulam o estado do sistema Kubernetes. Cada controlador é responsável por uma função específica no cluster.

- **Controladores Comuns:**
  - **Node Controller:** Monitora a saúde dos nós.
  - **Replication Controller:** Garante que o número correto de réplicas de um Pod esteja rodando.
  - **Endpoints Controller:** Popula objetos Endpoints.
  - **Service Account & Token Controllers:** Criam contas de serviço e tokens de acesso padrão para novos namespaces.

### 4. **Scheduler**

O **Scheduler** é responsável por designar os nós para os Pods recém-criados. Ele considera vários fatores, como recursos disponíveis, restrições de afinidade e afinidade de Pod, e políticas de prioridade e preempção.

- **Funções:**
  - Identificar Pods que precisam ser agendados e os recursos necessários.
  - Encontrar o nó adequado para cada Pod com base em critérios predefinidos.
  - Enviar decisões de agendamento para o API Server.

### 5. **Cloud Controller Manager (opcional)**

O **Cloud Controller Manager** permite a integração do cluster Kubernetes com a infraestrutura de um provedor de nuvem. Ele separa a lógica de controle do Kubernetes das interações com a API específica da nuvem.

- **Componentes:**
  - **Node Controller:** Gere nós no cluster que foram adicionados ou removidos na nuvem.
  - **Route Controller:** Gerencia rotas na tabela de roteamento da nuvem.
  - **Service Controller:** Cria, atualiza e deleta balanceadores de carga na nuvem.

### 3. **Node**

Os Nodes são os trabalhadores no cluster Kubernetes. Cada Node pode ser uma máquina física ou virtual. Os componentes principais de um Node são:

- **kubelet:** Um agente que roda em cada Node do cluster e garante que os contêineres estejam rodando em um Pod. Ele recebe instruções do API Server e gerencia a execução dos contêineres via runtime de contêiner (como Docker).
- **Kube Proxy:** Mantém as regras de rede em cada Node. Ele é responsável pelo encaminhamento de solicitações de rede para os contêineres apropriados, além de gerenciar o balanceamento de carga.
- **Container Runtime:** O software que é responsável por executar contêineres. Kubernetes suporta diferentes runtimes como Docker, containerd, e CRI-O.

### 4. **Pods**

- **Pod:** A menor unidade de implantação em Kubernetes. Um Pod representa uma instância em execução de um processo no cluster. Cada Pod pode conter um ou mais contêineres.

### 5. **Services**

- **Service:** Um objeto que define uma política lógica sobre como expor um grupo de Pods. Os serviços permitem a descoberta e balanceamento de carga entre os Pods.

### 6. **Volumes**

- **Volume:** Abstração que permite a persistência de dados. Diferente dos contêineres, os volumes existem enquanto o Pod existir e podem sobreviver a reinicializações de contêineres.

### 7. **Namespaces**

- **Namespace:** Proporciona um mecanismo para dividir um único cluster Kubernetes em vários ambientes virtuais. Eles são úteis para criar limites de segurança e gestão de recursos dentro de um cluster.

### 8. **ConfigMaps e Secrets**

- **ConfigMap:** Objeto que permite o armazenamento de pares chave-valor para configuração de aplicativos.
- **Secret:** Similar ao ConfigMap, mas usado para armazenar informações sensíveis, como senhas e tokens de acesso.

## Labels

Para aproveitar ao máximo o uso dessas etiquetas (labels), elas devem ser aplicadas a todos os objetos de recurso.

| Chave                          | Descrição                                                       | Exemplo          | Tipo  |
|------------------------------- |---------------------------------------------------------------- |----------------- |------ |
| app.kubernetes.io/name         | O nome da aplicação                                             | mysql            | Corda |
| app.kubernetes.io/instance     | Um nome exclusivo que identifica a instância de um aplicativo   | mysql-abcxyz     | Corda |
| app.kubernetes.io/version      | A versão atual do aplicativo (por exemplo, um SemVer 1.0, hash de revisão, etc.) | 5.7.21           | Corda |
| app.kubernetes.io/component    | O componente dentro da arquitetura                              | database         | Corda |
| app.kubernetes.io/part-of      | O nome de um aplicativo de nível superior do qual este faz parte| wordpress        | Corda |
| app.kubernetes.io/managed-by   | A ferramenta usada para gerenciar o aplicativo                  | Helm             | Corda |


https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/