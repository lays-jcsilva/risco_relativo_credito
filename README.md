# 📊📈 Análise de Risco Relativo no Banco Super Caja 

💡 Projeto: Risco Relativo  - Análise dos empréstimos do banco Super Caja 

Bem-vindo(a) à ficha técnica da análise de dados focada no cálculo do risco relativo da empresa financeira fictícia Super Caja. Este documento oferece uma visão abrangente do projeto, destacando como a equipe de análise de crédito pode utilizar os dados para identificar e mitigar os riscos associados ao crédito. A compreensão detalhada do contexto em que a equipe opera é fundamental para tomar decisões estratégicas e informadas que promovam a estabilidade e o crescimento do negócio.



**Título do Projeto**
Risco Relativo - Banco Super Caja 


<details>
<summary><b>Objetivo</b></summary>
  
O objetivo desta análise é identificar o perfil de clientes com risco de inadimplência, desenvolver uma pontuação de crédito por meio da análise de dados e avaliar o risco relativo. Dessa forma, será possível classificar os clientes atuais e potenciais em diferentes categorias de risco com base em sua probabilidade de inadimplência. Esta classificação permitirá ao banco tomar decisões informadas sobre a concessão de crédito, reduzindo o risco de empréstimos não reembolsáveis. Além disso, a integração dessas métricas fortalecerá a capacidade do modelo de identificar riscos, contribuindo para a solidez financeira e a eficiência operacional do banco.

Este projeto reveste-se de uma importância crucial para o banco Super Caja pois a equipe de análise de crédito
</details>

<details>
<summary><b>Equipe</b></summary>

Trabalhei de forma independente neste projeto, assumindo todas as responsabilidades, desde o planejamento até a execução e análise dos resultados. Apesar de ser um projeto individual, busquei feedback de colegas e auxílio quando necessário, priorizando a entrega de qualidade. Mesmo atuando sozinha, reconheço a importância da aprendizagem colaborativa e valorizo as contribuições de outras colegas ao buscar insights e perspectivas externas e diferentes. A capacidade de gerenciar todas as etapas do projeto de forma independente me proporcionou um valioso aprendizado e desenvolvimento de habilidades em diversas áreas, desde análise de dados até comunicação eficaz, ao mesmo tempo em que pude perceber a importância da colaboração para enriquecer o resultado final.

</details>

<details>
<summary><b> 💻📉Ferramentas e Tecnologia</b></summary>

Durante o desenvolvimento deste projeto, foram utilizadasferramentas e tecnologias para coleta, análise e visualização de dados. Algumas das principais incluem:

**Planilhas Eletrônicas (Spreadsheets):**

- Utilizei planilhas eletrônicas para importar, limpar e tratar os dados iniciais, realizar cálculos de métricas e manipulações além de criar variáveis, aplicar fórmulas e criar tabelas dinâmicas para análises de criação de gráficos e dashboard interativo através do filtro de segmentação.

**Looker Studio:**

- O Looker Studio foi a principal ferramenta de visualização e análise de dados utilizada neste projeto. Através do Looker, criei dashboards interativos e personalizados que permitiram explorar os dados de forma dinâmica e extrair insights valiosos para apresentação dos resultados das análises realizadas.


</details>


<details>
<summary><b>Processamento de dados</b></summary>


<details>
<summary><b>Obtenção de dados</b></summary>
  
Os dados dos clientes foram obtidos, através do google planilhas, realizei uma cópia e depois importei todos os dados para uma planilha onde seria feita a análise visando não apagar ou danificar a base de dados origem
Importei os dados para uma nova planilha de forma automatizada através da fórmula IMPORTRANGE, trouxe as 3 planilhas sendo: clientes, transacoes, e resumo compras inseri cada uma em abas diferentes para realizar o tratamento na base de dados.

</details>

<details>
<summary><b> Limpeza dos dados</b></summary>

Antes da análise, os dados passaram por um processo de limpeza para lidar com inconsistências, erros e valores ausentes, isso incluiu:

- **Remoção de registros duplicados**:  Identifiquei 9 valores duplicados na tabela resumo_compra**s** na coluna id_cliente, através da formatação condicional,  retirei os valores duplicados com a fórmula ARRAY E UNIQUE
- **Tratamento de valores ausentes (nulos):**  Para tratar valores ausentes na tabela de clientes, identifiquei 24 compradores sem informação de salário. Optei por preencher esses campos com a mediana dos salários existentes, a fim de manter a consistência na base de dados e evitar distorções na distribuição dos dados. Essa abordagem foi escolhida para garantir que a falta de informação não prejudicasse a análise futura, especialmente ao criar gráficos, onde a presença de valores ausentes poderia distorcer a representação visual dos dados. Para realizar esse tratamento, utilizei fórmulas como "contar vazio", "mediana" e "SE", combinadas com a função "colar valores", aplicando a mediana nos campos vazios e garantindo a integridade dos dados de salário.

Ao identificar na tabela de transações a presença de 7 compradores sem IDs, utilizei a função "contar vazio" para verificá-los. Neste contexto, decidi excluir esses registros, uma vez que não contribuiriam para o propósito da análise em questão. A exclusão desses registros sem IDs foi uma medida adotada para garantir a integridade e a precisão dos dados utilizados na análise das transações.
- **Inconsistências:** Identifiquei na base de dados a presença de 10 usuários que possuíam cadastro, mas não tinham registros de compras, o que foi considerado um outlier para o propósito da análise em questão. Optei por remover esses usuários das tabelas de resumo de compras e clientes, como uma medida para eliminar essa inconsistência e manter a integridade dos dados utilizados na análise. Essa abordagem foi considerada válida para corrigir o problema, uma vez que preservou a qualidade dos dados sem comprometer a análise. No entanto, esses clientes foram mantidos em uma base separada e não tratada, caso fossem necessários para referência futura. Os IDs dos clientes excluídos foram: 5376, 8475, 5555, 3955, 10749, 6862, 11110, 4931, 9931 e 11181. Essa ação foi realizada apenas na tabela de análise em que estava trabalhando, sem afetar a fonte original de dados.

Na base de clientes, identifiquei a presença de 3 clientes com idades de 122, 123 e 129 anos, valores consideravelmente elevados. Embora essas idades possam parecer improváveis, optei por mantê-las na análise. A decisão de reter esses registros se deve ao fato de que, apesar das idades incomuns, todas as outras informações desses clientes estão disponíveis e eles possuem histórico de compras, o que os torna relevantes para a análise. Além disso, considerei a possibilidade de que essas idades incomuns pudessem ser resultado de erros de preenchimento ou entrada de dados. No entanto, a idade em si não é um fator crítico que impactaria negativamente na análise em questão. Portanto, decidi manter esses registros para preservar a integridade e completude dos dados, garantindo que todas as informações relevantes fossem consideradas durante a análise.

Para unir as tabelas, utilizei as funções QUERY e PROCV para consolidar todas as informações em uma única tabela. Através da função QUERY, selecionei os dados relevantes de todas as tabelas e os organizei conforme necessário. Em seguida, utilizei a função PROCV para buscar informações adicionais de outras tabelas com base em chaves de identificação comuns, garantindo a integridade e a precisão dos dados consolidados. Essa abordagem permitiu criar uma visão unificada e coesa de todos os dados, facilitando a análise e a obtenção de insights significativos.

- **Criei tabelas dinâmicas para resumir dados em variáveis categóricas -** criei tabelas dinâmicas para condensar informações em variáveis categóricas relevantes, abrangendo aspectos como por exemplo nível de escolaridade predominante, estado civil, renda média anual dos clientes, número médio de filhos, média salarial por nível de educação e valor gasto por categoria, entre outros aspectos significativos. Essa abordagem permite uma análise mais precisa e acessível dos dados, proporcionando insights essenciais para tomadas de decisão estratégicas.

</details>

<details>
<summary><b> Transformação dos dados</b></summary>

Após a limpeza inicial, os dados foram transformados para realizar a  análise de segmentação de clientes. Isso pode incluir:

- **Tabelas dinâmicas e gráficos:** Na aba "Tabela Resumo", incluí tabelas dinâmicas que sintetizam as respostas às perguntas feitas sobre o perfil dos clientes. Além disso, criei gráficos para visualizar de forma clara e acessível informações como o nível de escolaridade predominante, estado civil, renda média anual dos clientes, número médio de filhos e média salarial por nível de educação, entre outros. Essas tabelas e gráficos proporcionam uma compreensão abrangente do perfil demográfico dos clientes, facilitando a identificação de padrões e tendências importantes para a estratégia de negócios.
- **Quartil:** Calculei os quartis para segmentar os clientes em grupos com base nas métricas RFM (Recency, Frequency, Monetary).ara isso, criei uma tabela auxiliar com a coluna "Posição Quartil", numerada de 1 a 4, e utilizei a fórmula do quartil para calcular a posição RFM. Esse processo gerou um número limite no intervalo de valores, que pude utilizar como pontuação para definir as classificações posteriormente. Essa abordagem possibilitou uma segmentação mais precisa dos clientes, permitindo uma análise mais detalhada de seus comportamentos e necessidades.
- **Cálculo das métricas RFM (Recency, Frequency, Monetary):** No cálculo das métricas RFM (Recency, Frequency, Monetary) para cada cliente, levei em consideração suas transações  passadas e calculei individualmente cada valor conforme descrito abaixo:

**Recência (R):** Determinei a recência com base na data da última transação do cliente em relação ao último dia de compra registrado na base de dados. Como a base de dados se estendia até 31/12/2022 e alguns clientes haviam realizado compras até o último dia disponível, utilizei a data fictícia de 01/01/2023 na fórmula. Essa abordagem garantiu que os clientes não fossem penalizados com uma recência excessiva devido à falta de registros mais recentes além do último dia da base de dados.

**Frequência (F):** No cálculo da frequência, utilizei a contagem de transações por cliente, utilizando a fórmula "Contar Se", a fim de determinar quantas compras cada cliente realizou desde sua data de cadastro. Essa abordagem proporcionou uma medida da frequência de compras de cada cliente ao longo do tempo, permitindo uma avaliação clara de seu engajamento e atividade dentro do período de análise.

**Monetário (M):** utilizei o total de compras de cada cliente para determinar quanto ele já gastou na empresa. Essa abordagem proporcionou uma medida direta do valor monetário que cada cliente contribuiu para o negócio, permitindo uma análise detalhada do seu comportamento de compra e do seu impacto financeiro.

Além disso, criei uma métrica de média entre frequência e monetário, considerando que essas duas métricas estão correlacionadas. Essa média proporcionou uma perspectiva mais abrangente sobre o comportamento dos clientes, permitindo uma análise mais detalhada sobre como essas métricas se relacionam e como influenciam o desempenho geral do cliente.


</details>

</details>

<details>
<summary><b> Métodos e Técnicas </b></summary>

Nesta fase, vou descrever as técnicas e metodologias utilizadas na análise de segmentação de clientes, destacando os métodos estatísticos empregados para extrair insights significativos dos dados

- **Segmentação de Clientes**
Utilizei a técnica RFM (Recency, Frequency, Monetary) para segmentar a base de clientes em grupos distintos com base em seu comportamento de compra
Os clientes foram classificados em diferentes segmentos com base na Recência de suas compras, na Frequência com que fazem compras e no valor Monetário gasto em suas transações/compras
- **Análise de Coorte**

Realizei uma análise de coorte para entender o comportamento de compra dos clientes ao longo do tempo

Agrupei os clientes com base no momento em que realizaram seu cadastro e sua primeira compra e analisei como seu comportamento de compra evoluiu ao longo dos meses

Essa análise me proporcionou insights sobre padrões de retenção de clientes e potenciais mudanças nas preferências de compra ao longo do tempo. Pude identificar quantos clientes efetuaram sua primeira compra no mês de cadastro e observar quando retornaram para fazer novas compras ou deixaram de comprar

- **Validação e Interpretação dos Resultados**

Validei os resultados da segmentação de clientes e análise de coorte utilizando técnicas estatísticas apropriadas (média, mediana e moda), e testes através de formulas se, para confirmar se aquele resultado  é verdadeiro ou não  com base em alguns parâmetros criados 

Com base nos dados fornecidos interpretei os insights obtidos à luz dos objetivos do negócio, identificando oportunidades de melhoria e ação com base nos resultados da análise

- **Visualização de Dados**

Utilizei  visualizações de dados , como gráficos de barra, coluna, linha, histogramas e mapas de calor, pizza, entre outros, para comunicar os resultados da análise de forma clara e acessível

As visualizações foram realizadas para destacar padrões e tendências nos dados com objetivo de facilitar a compreensão e interpretação dos gráficos, as visualizações foram criadas no Goolgle sheets e Looker Studio.


</details>

<details>
<summary><b>  💡 Conclusões e Recomendações </b></summary>

Após a análise, destaquei alguns pontos relevantes que podem trazer um retorno significativo para a empresa:


**Tendência de compra:** observando a série histórica o número de transações de 22.121 online e física identifiquei um aumento no intervalo do 2 º semestre de 2021 até o 1º semestre de 2022. Isso pode indicar uma mudança no comportamento dos clientes ou uma sazonalidade.

**Preferência por compras na loja física**: Cerca de 60% dos clientes  preferem comprar na loja física, especialmente os adultos com idade entre 30 e 59 anos e idosos com mais de 60 anos, cuja maioria compõe o público-alvo, e esse público tem uma tendência a não gostar muito do online preferem a loja física.

Por ser um publico com idade relativamente alta o consumo por produtos como vinho e carne se destacam , são produtos importados mais difíceis de ser encontrados por isso os clientes optam por por apreciar e valorizar esses produtos.

**Perfil demográfico dos clientes:** A maioria dos clientes são adultos (68%) e idosos (31%), , muitos dos quais possuem ensino superior completo ou pós-graduação, refletindo em um salário médio anual considerável de 52.181U$.Após pesquisar sobre o assunto descobri que geralmente o publico que tem mais estudo são os que geralmente tem maiores salários.

**Baixa adesão a campanha de marketing:** A campanha teve uma adesão de apenas 15% dos clientes, somente esse percentual de clientes responderam, Sugiro mudar a estratégia, oferecendo incentivos como descontos ou brindes para aumentar a participação.

**Segmentação RFM (Recência), (Frequência) e (Monetário):**  identifiquei o comportamento desses clientes com base em seu histórico de compra e minhas sugestões e análise foi:

**Maiores clientes em quantidade:** Para nossos maiores clientes em termos de quantidade o leal se destacou com 38% dos clientes classificados, esses clientes tem um bom gasto em produtos e frequência 

💡Sugestão para esse cliente: 
oferecer produtos de maior valor pois tendem a responder bem, e ter um bom gasto em produtos

a nossa outra maior classificação é o potencial leal que são clientes  recentes, que gastaram um bom valor e já compraram mais de uma vez 

💡Sugestão para esse cliente: 
podemos oferecer programas de fidelidade e promoções para engajar eles

**Representatividade:** Somando as duas classificações temos mais de 50% dos clientes sendo leal e potencial legal isso explica um pouco sobre o comportamento de compras

**Cliente em risco de perda:** Precisamos direcionar nossos esforços para os clientes que estão "Hibernando", ou seja, que não realizaram compras há muito tempo, e os "Prestes a Dormir", cuja recência, frequência e valor monetário estão abaixo da média. É crucial engajá-los para evitar a perda desses clientes. Além disso, os clientes em "Risco de Perda", que já gastaram consideravelmente e compraram com frequência, mas não realizam compras há algum tempo, precisam ser reconquistados**.**

A análise de coorte revela que muitos clientes se cadastram e até fazem compras inicialmente, mas acabam deixando de comprar. Isso evidencia um problema na retenção desses clientes, e para recuperá-los, precisamos implementar campanhas personalizadas. Essas campanhas podem incluir descontos especiais, programas de renovação com vantagens exclusivas, como notificações sobre novos produtos ou brindes para clientes com maior volume de compras, incentivando-os a voltar a comprar conosco e não buscar alternativas na concorrê**ncia.**

**Monetário: Observando o aspecto** monetário  é evidente que nossos clientes em destaque, classificados como "Leal" representam 67% do total, enquanto os em "Risco de Perda" representam 14%. O risco de perda têm um ticket médio em torno de $144 , em comparação com o ticket médio total de $122, isso demonstra que tanto o cliente leal quanto o risco de perda  são valiosos e vale a pena investir em estratégias de retenção personalizadas para mantê-los engajados e satisfeitos com nossos produtos.

💡Sugestão para esses clientes em aspectos monetários:  

Para garantir a retenção desses clientes em específico, é crucial implementar campanhas personalizadas e oferecer descontos especiais, com foco nos produtos que mais apreciam. Além disso, proporcionar um atendimento exclusivo pode fortalecer ainda mais o relacionamento com eles, aumentando sua fidelidade à marca.

Essa análise ressalta a importância de investir em estratégias voltadas para os aspectos demográficos, comportamentais, interesses, preferências e padrões de compra de nossos clientes, visando garantir sua retenção e, consequentemente, o sucesso do negócio

</details>



</details>

<details>
<summary><b> Links de interesse  </b></summary>

**Banco de dados:**  https://docs.google.com/spreadsheets/d/1r9GAy-2B8o06p4JHbUGv8DrOZKAPpgPwap0rBCR6yk8/edit?gid=1287610346#gid=1287610346

**Dashboard:** https://lookerstudio.google.com/u/1/reporting/8dec447c-d156-4788-ace0-5add677e8640/page/wD3uD/edit

</details>

