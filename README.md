
![image](https://github.com/user-attachments/assets/67896637-325d-4689-9667-1a81edb2dd45)






# 📊📈 Análise de Risco Relativo no Banco Super Caja 

💡 Projeto: Risco Relativo  - Análise dos empréstimos do banco Super Caja 

Bem-vindo(a) à ficha técnica da análise de dados focada no cálculo do risco relativo da empresa financeira fictícia Super Caja. Este documento oferece uma visão abrangente do projeto, destacando como a equipe de análise de crédito pode utilizar os dados para identificar e mitigar os riscos associados ao crédito. A compreensão detalhada do contexto em que a equipe opera é fundamental para tomar decisões estratégicas e informadas que promovam a estabilidade e o crescimento do negócio.



# Título do Projeto
Risco Relativo - Banco Super Caja 


# Objetivo
  
O objetivo desta análise é identificar o perfil de clientes com risco de inadimplência, desenvolver uma pontuação de crédito por meio da análise de dados e avaliar o risco relativo. Dessa forma, será possível classificar os clientes atuais e potenciais em diferentes categorias de risco com base em sua probabilidade de inadimplência. Esta classificação permitirá ao banco tomar decisões informadas sobre a concessão de crédito, reduzindo o risco de empréstimos não reembolsáveis. Além disso, a integração dessas métricas fortalecerá a capacidade do modelo de identificar riscos, contribuindo para a solidez financeira e a eficiência operacional do banco.

Este projeto reveste-se de uma importância crucial para o banco Super Caja pois a equipe de análise de crédito
</details>

# Equipe

Trabalhei de forma independente neste projeto, assumindo todas as responsabilidades, desde o planejamento até a execução e análise dos resultados. Apesar de ser um projeto individual, busquei feedback de colegas e auxílio quando necessário, priorizando a entrega de qualidade. Mesmo atuando sozinha, reconheço a importância da aprendizagem colaborativa e valorizo as contribuições de outras colegas ao buscar insights e perspectivas externas e diferentes. A capacidade de gerenciar todas as etapas do projeto de forma independente me proporcionou um valioso aprendizado e desenvolvimento de habilidades em diversas áreas, desde análise de dados até comunicação eficaz, ao mesmo tempo em que pude perceber a importância da colaboração para enriquecer o resultado final.

</details>

# 💻📉Ferramentas e Tecnologias


**BigQuery(Linguagem SQL):** Utilizei BigQuery para importar, limpar e tratar os dados iniciais, realizar cálculos de métricas e manipulações, alterações dos tipos de dados, além de criar variáveis adicionais conforme necessário.

**Google Colab(Linguagem Python):** Utilizei o Google Colab para realizar análises estatísticas avançadas, como a construção de matrizes de confusão e a implementação de modelos de regressão logística. Esta plataforma oferece um ambiente colaborativo baseado na nuvem, que suporta uma variedade de bibliotecas e ferramentas essenciais para ciência de dados. A integração com o Google Drive facilita o acesso a conjuntos de dados armazenados na nuvem, enquanto a execução em GPUs proporciona um processamento rápido e eficiente. Essa combinação de ferramentas e tecnologias permite explorar dados complexos, desenvolver modelos preditivos robustos e realizar avaliações detalhadas do desempenho dos modelos, fundamentais para projetos de análise de dados e machine learning.

**Looker Studio:** Utilizei o Looker Studio para criar visualizações gráficas e apresentar insights obtidos durante a análise dos dados. Esta plataforma oferece uma interface intuitiva e poderosa para explorar, visualizar e compartilhar informações de forma eficaz. Com o Looker Studio, pude gerar dashboards interativos, gráficos dinâmicos e relatórios personalizados que facilitaram a comunicação de descobertas importantes.


</details>


# Dados utilizados na análise
* user_info: dados gerais dos clientes

* loans_outstanding: dados referente ao tipo de empréstimos e quantidade

* loans_detail: dados sobre o número de atrasos de pagamento de empréstimos, uso de linhas de crédito e relação ao seu limit e taxa de endividamento 

* default: dados dos clientes inadimplentes e adimplentes

# Processamento dos dados
  
* Manipulação e limpeza dos dados: Utilizando o processo de ETL (Extract, Transform, Load) no BigQuery, realizei a limpeza e manipulação dos dados. Removi valores nulos, duplicados e inconsistências, além de calcular os quartis. Criei tabelas auxiliares, transformei os dados, e segmentei os clientes com base no risco relativo. As variáveis foram convertidas em dummies para a construção da matriz de confusão e para a realização de regressão logística.

* Visualização Interativa da Análise: Utilizamos o Looker Studio para criar gráficos e tabelas interativas que facilitam a visualização e compreensão da análise realizada.

* Modelo de Score de Crédito: foi realizada uma avaliação do modelo  utilizando a matriz de confusão para análise de desempenho.
  
* Regressão Logística: Foi realizada uma análise preditiva do risco de inadimplência utilizando regressão logística, uma técnica robusta amplamente reconhecida por sua capacidade de modelar e prever comportamentos de risco com base em variáveis significativas.

* Se quiser ver mais detalhes sobre essa etapa, [clique aqui](https://tricolor-puck-1da.notion.site/Projeto-3-Ficha-T-cnica-An-lise-de-Dados-c2348ee8db3d42be881ab0b83bbfa254).


## Hipótese 1: Os mais jovens correm um risco maior de Inadimplência:

- Clientes mais jovens (21 a 29 anos) e também aqueles entre 30 e 39 anos apresentam maior risco de inadimplência.
- Possíveis causas incluem o início de carreira, instabilidade financeira e falta de experiência em gestão financeira.

A hipótese foi **confirmada** e as recomendações são:

💡 Recomendações para esses clientes:

- **Mitigação de Riscos:** Implementar políticas para reduzir riscos entre clientes mais jovens, como limites de crédito mais baixos e processos de avaliação mais rigorosos.
- **Produtos Personalizados:** Desenvolver produtos financeiros específicos com condições mais adequadas para essa faixa etária.
- **Reestruturação de Dívidas:** Oferecer planos de renegociação de dívidas para clientes jovens inadimplentes.
- **Incentivos para Pagamento em Dia:** Oferecer benefícios para clientes jovens que mantêm pagamentos em dia.

## Hipótese 2: Clientes com mais empréstimos ativos têm um maior risco:

- Clientes com mais de 9 empréstimos apresentam um risco menor de inadimplência, o que contraria a hipótese inicial de maior risco com mais empréstimos.
- Possíveis causas incluem uma boa gestão financeira que permite o pagamento dos empréstimos.

A hipótese foi **refutada** e as recomendações são:

💡 Recomendações para esses clientes:

- **Análise de Crédito Mais Flexível:** Reavaliar critérios de crédito para clientes com múltiplos empréstimos.
- **Monitoramento e Suporte:** Fornecer suporte financeiro proativo para clientes com menos empréstimos.

## Hipótese 3: Clientes com mais de 90 dias de atraso têm maior risco:

- Atrasos superiores a 90 dias são fortes indicadores de inadimplência futura.
- Possíveis causas incluem dificuldades financeiras e problemas de gestão financeira que indicam maior probabilidade de inadimplência.

A hipótese foi **confirmada** e as recomendações são:

💡 Recomendações para esses clientes:

- **Programas de Recuperação de Crédito:** Criar programas para renegociação e recuperação para clientes com atrasos superiores a 90 dias.
- **Segmentação e Ofertas Personalizadas:** Desenvolver produtos financeiros específicos e oferecer suporte adicional para clientes nessa situação.
- **Monitoramento e Controle:** Implementar um sistema de alerta para monitorar atrasos de pagamento e oferecer intervenções preventivas.


## Links de Interesse:

- [Google Colab Notebook](https://colab.research.google.com/drive/11FDmn8cMnbbneUHnjJFMojYBUW0z0dTn?authuser=0#scrollTo=AFKiBQHOMArW)

## Limitações:

- **Falta de Informações Cruciais:** Ausência de informações como moeda utilizada, valores de empréstimos anteriores, escolaridade, patrimônio e valores das parcelas dos empréstimos que poderiam enriquecer a análise.

## Dashboard:

![image](https://github.com/user-attachments/assets/d39d3468-2d39-4279-a262-127efe364ba6)


![image](https://github.com/user-attachments/assets/ebd061c0-72e6-4b6c-9ffa-2f57566b8198)

![image](https://github.com/user-attachments/assets/3676549a-c8c0-4d69-a32d-f67f269dc530)
![image](https://github.com/user-attachments/assets/ee280c08-b8a7-47d0-a8cc-929a3ac94ea3)







