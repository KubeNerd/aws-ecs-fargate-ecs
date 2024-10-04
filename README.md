# AWS ELASTIC CONTAINER SERVICE - ECS

## Orquestão de Containers
Um serviço de orquestração de containers é uma plataforma ou ferramenta que automatiza a implantação, o gerenciamento, o dimensionamento e a rede de aplicativos em containers.


Os containers são uma maneira leve e portátil de executar aplicativos e suas dependências em ambientes isolados.


No Entanto, o gerenciamento desses containeres em um ambiente de produção especialmente em escala, pode ser complexo.


É nesse ponto que os serviços de orquyestração de container entram em ação.


**Principais funções**: <br/>

    - Implantação(Deployment):
      Automatizar a implantação de container em um cluster de máquinas.
      Garante que o aplicativo esteja em execução e disponível.


    - Gerenciamento(Management):
        Lida com o clico de vida dos containers, incluindo iniciar, parar e reiniciar containers.

        Gerencia a configuração dos containers para garantir que estejam sendo executados com as configuraões corretas.

    - Dimensionamento(Scaling):
        Aumento ou diminui automaticamente o número de instâncias de containers com base na carga ou regras predefinidas.

        Garante o uso eficiente dos recursos e mantém o desempenho do aplicativo durante períodos de alto tráfego.

    - Rede(Networking):
      Gerencia a rede de containers para garantir que ele spossam se comunicar entre si, e com serviços externos.
    
    - Monitoramento(Helaht Monitoring)
        Monitora continuamente a integridade dos containers e substitui todos os containers com falha ou não saudaveis.

        Fornece recursos de registro e monitoramento para acomdpanhar o desempenho do aplicativo e diagnosticar problemas.


### **Entendendo o Amazon ECS**

1. **O que é o Amazon ECS?**
    - Um serviço de gerenciamento de contêineres que facilita a execução, parada e gerenciamento de contêineres em um cluster.

2. **Principais Componentes do ECS**
    - **Cluster**: Um agrupamento lógico de recursos de computação onde os contêineres são executados.
    - **Tarefas e Definições de Tarefas (Task Definitions)**: A definição de tarefa é como um blueprint para seus contêineres, especificando imagens, CPU, memória, roles, volumes e outras configurações.
    - **Serviços**: Permitem executar e manter um número especificado de instâncias de uma definição de tarefa simultaneamente.

3. **Instâncias e Agentes ECS**
    - As instâncias EC2 no cluster ECS executam um agente ECS, que reporta informações sobre os recursos e gerencia a execução das tarefas.

---

### **Configurando um Cluster ECS**

1. **Escolha do Tipo de Lançamento**
    - **EC2 vs Fargate**: EC2 oferece controle sobre as instâncias e a alocação de recursos, enquanto o Fargate é uma opção sem servidor que gerencia a infraestrutura para você.

2. **Criando um Cluster**
    - Através do AWS Management Console, CLI ou SDKs AWS, você pode criar um cluster especificando o tipo de lançamento e outras configurações.

---

### **Criando e Executando Tarefas**

1. **Definição de Tarefa**
    - Crie uma definição de tarefa especificando imagens de contêiner, alocações de CPU/memória, variáveis de ambiente, roles do IAM e configurações de rede.

2. **Executando Tarefas**
    - Você pode executar tarefas diretamente ou gerenciá-las como parte de um serviço para garantir que o número desejado de instâncias da tarefa esteja sempre em execução.

---

### **Implementando Serviços com ECS**

1. **Configuração do Serviço**
    - Defina o número desejado de tarefas, estratégias de implantação (como rolling update), e configure o balanceamento de carga, se necessário.

---

### **Monitoramento e Escalabilidade**

- Use o Amazon CloudWatch para monitorar métricas e logs. Configure o Auto Scaling para ajustar o número de tarefas com base na demanda.

---

### **Melhores Práticas e Segurança**

1. **Segurança**
    - Use roles do IAM para controlar o acesso aos recursos da AWS e aplique práticas de segurança de rede.

2. **Monitoramento e Logging**
    - Monitore a saúde e o desempenho do seu serviço com o CloudWatch.

3. **Automação e CI/CD**
    - Integre com ferramentas de CI/CD para automatizar a implantação e atualização dos serviços.
