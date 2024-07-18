# Kubernetes Probes

Kubernetes utiliza probes para verificar o estado dos containers em execução. Eles ajudam a garantir que os containers estejam funcionando corretamente e que os serviços sejam oferecidos de maneira confiável.

## Tipos de Probes

### 1. **Liveness Probes**

**Liveness Probes** são usadas para verificar se um container está vivo (ou seja, em funcionamento) ou se está em um estado que requer uma reinicialização. Se a verificação de liveness falhar, o container será reiniciado pelo kubelet.

- **Objetivo:** Detectar e corrigir falhas no container.
- **Uso Comum:** Containers que podem entrar em um estado de deadlock onde não podem mais funcionar, mas não falharam automaticamente.

### 2. **Readiness Probes**

**Readiness Probes** são usadas para determinar se um container está pronto para aceitar tráfego. Um Pod é considerado pronto somente quando todos os seus containers estão prontos. Se a verificação de readiness falhar, o endpoint será removido dos balanceadores de carga de serviço.

- **Objetivo:** Garantir que o serviço só direcione tráfego para containers que estejam prontos para processá-lo.
- **Uso Comum:** Containers que demoram para inicializar ou que têm dependências externas que precisam ser satisfeitas antes que possam atender às solicitações.

### 3. **Startup Probes**

**Startup Probes** são usadas para verificar se um container está em processo de inicialização. Esses probes são especialmente úteis para containers que demoram muito tempo para iniciar. Durante a inicialização, apenas as Startup Probes são executadas, e as Liveness e Readiness Probes são desativadas até que a inicialização seja concluída com sucesso.

- **Objetivo:** Evitar que o Kubernetes mate containers que estão demorando muito para inicializar.
- **Uso Comum:** Containers que têm scripts de inicialização longos ou que precisam carregar grandes volumes de dados antes de estarem prontos.

## Comparação dos Probes

- **Liveness Probes:** Monitoram a saúde contínua do container e reiniciam se necessário.
- **Readiness Probes:** Verificam se o container está pronto para receber tráfego e somente então o adicionam ao balanceador de carga.
- **Startup Probes:** Garantem que containers com inicialização lenta sejam tratados corretamente antes que outras verificações de saúde sejam aplicadas.



## Explicação dos Parâmetros
- **initialDelaySeconds**: Número de segundos após o início do container para iniciar a verificação de liveness.
- **periodSeconds**: Intervalo de tempo entre as verificações de liveness.
- **failureThreshold**: Número de falhas consecutivas necessárias para considerar a aplicação como não saudável.
- **successThreshold**: Número de sucessos consecutivos necessários para resetar o failureThreshold (Para liveness probes, geralmente é 1).
- **timeoutSeconds**: Tempo máximo em segundos para aguardar uma resposta antes de considerar a verificação como falha.
