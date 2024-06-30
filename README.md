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
user_info: dados gerais dos clientes
loans_outstanding: dados referente ao tipo de empréstimos e quantidade
loans_detail: dados sobre o número de atrasos de pagamento de empréstimos, uso de linhas de crédito e relação ao seu limit e taxa de endividamento 
default: dados dos clientes inadimplentes e adimplentes

# Processo de análise
  
*

**Importação da base de dados**

A primeira fase deste projeto consistiu na importação das bases de dados para o ambiente do BigQuery no Google Cloud. Dentro da opção "BigQuery", foi criada uma pasta denominada "projeto-2-hipoteses". Para isso, foram importadas as tabelas diretamente através do upload de arquivos, adicionando os três arquivos CSV correspondentes a  "track_in_spotify", "track_in_competition" e "track_technical_info" dentro de uma subpasta denominada "dados_spotify". Essa abordagem permitiu uma organização estruturada e acessível dos dados, facilitando sua manipulação e análise subsequentes.

* Descrição das tabelas:

**track_in_spotify:** A tabela "track_in_spotify" contém informações sobre as músicas disponíveis no Spotify. Ela inclui o identificador exclusivo da música (track_id), o nome da música (track_name), o nome do(s) artista(s) (artist(s)_name), o número de artistas que contribuíram na música (artist_count), o ano, mês e dia em que a música foi lançada (released_year, released_month, released_day), o número de listas de reprodução do Spotify em que a música está incluída (in_spotify_playlists), a presença e posição da música nas paradas do Spotify (in_spotify_charts) e o número total de streams, representando o número de vezes que a música foi ouvida pelos usuários do Spotify (streams). Essa tabela fornece uma visão abrangente das características e do desempenho das músicas na plataforma de streaming.

**track_in_competition:** A tabela "track_in_competition" oferece insights sobre a competição das músicas em outras plataformas de streaming, além do Spotify. Ela inclui o identificador exclusivo da música (track_id) e informações sobre sua presença e desempenho em serviços como Apple Music, Deezer e Shazam. Para cada plataforma, são registrados o número de listas de reprodução em que a música está incluída (in_apple_playlists, in_deezer_playlists), bem como sua posição e classificação nas respectivas paradas de sucesso (in_apple_charts, in_deezer_charts, in_shazam_charts). Essa tabela permite uma análise comparativa do desempenho das músicas em diferentes plataformas de streaming, fornecendo uma visão abrangente da sua popularidade e alcance entre os usuários.

**track_technical_info:** A tabela "track_technical_info" contém informações técnicas detalhadas sobre as músicas. Ela inclui o identificador exclusivo da música (track_id) e uma série de métricas que descrevem características musicais específicas. Estas métricas incluem o número de batidas por minuto (bpm), indicando o ritmo da música, a porcentagem de danceability, que representa o quão adequada a música é para dançar, o valence, indicando a positividade do conteúdo musical, a energia (energy) percebida da música, a acústica(acusticness), representando a quantidade de som acústico presente, a instrumentabilidade (instrumentality_),  indicando a quantidade de conteúdo instrumental, a porcentagem de liveness, que reflete a presença de elementos de performance ao vivo, e a speechiness, que representa a quantidade de palavras faladas na música. Essas informações fornecem uma compreensão detalhada das características musicais de cada faixa, possibilitando análises mais profundas sobre seu estilo, apelo emocional e potencial de engajamento com o público.

</details>

<details>
<summary><b> Limpeza dos dados</b></summary>

**Dados Nulos:**
Para identificar e tratar valores nulos no BigQuery, foram empregados comandos SQL, incluindo SELECT, FROM, WHERE e IS NULL, para localizar os valores nulos dentro de cada uma das variáveis das tabelas. Durante a análise, constatou-se a presença de 50 valores nulos na variável "in_shazam_charts" e 95 valores nulos na variável "key". Para abordar os valores nulos na variável "in_shazam_charts", optou-se por utilizar o valor da mediana para preenchê-los, uma vez que esse método resultou em uma variação mínima na média dos dados. Essa estratégia de tratamento foi escolhida para preservar a integridade e a representatividade dos dados, garantindo a qualidade da análise subsequente.

**Dados Duplicados:**
Para identificar e tratar valores duplicados no BigQuery, foram utilizados os comandos SQL COUNT, GROUP BY e HAVING. Durante a análise, foram identificados 10 valores duplicados para a variável "track_name". Para lidar com essa duplicidade, foram removidos 5 valores duplicados, garantindo a integridade e a consistência dos dados. Essa abordagem foi adotada para assegurar a precisão e a confiabilidade da análise subsequente, evitando distorções nos resultados devido a entradas duplicadas.
</details>

<details>
<summary><b> Transformação dos dados</b></summary>

**Dados fora do escopo da análise e discrepantes:**
Através de comandos SQL, como SELECT EXCEPT, foi decidido remover as variáveis "key" (tom musical da música) e "mode" (modo de música -maior ou menor), pois foram consideradas irrelevantes para o propósito da análise. Em relação aos dados discrepantes, foi utilizado o comando REGEXP REPLACE para manipulação de strings, corrigindo caracteres nas variáveis "track_name" e "artist_s__name". Para identificar discrepâncias em variáveis numéricas, como "streams", originalmente armazenada como string, empregaram-se os comandos MAX, MIN e AVG. Essa abordagem permitiu a identificação e correção de valores discrepantes, garantindo a qualidade e a confiabilidade dos dados.


**Conversão do tipo de dados da variável 'streams':**
A variável "streams", que originalmente estava no formato de string, foi convertida para um formato numérico utilizando o comando SAFE_CAST. Essa conversão permite que os dados sejam tratados e analisados de forma mais eficiente, possibilitando a realização de cálculos e análises estatísticas relevantes,proporcionando uma compreensão mais precisa do número total de streams de cada música no Spotify.


**Criação de novas variáveis:** 
Através dos comandos CONCAT, CAST e JOIN, foram criadas as seguintes variáveis:


* "release_date_concat": Esta variável foi criada com o propósito de combinar três variáveis: *"released_year", "released_month" e "released_day", formando uma única data que representa o ano, mês e dia de lançamento de uma música.

* "soma_playlists": Esta variável representa a soma de uma música em playlists do Spotify, Deezer e Apple, sendo criada através da concatenação das variáveis "in_spotify_playlists", "in_apple_playlists" e "in_deezer_playlists".

Obs: Não consideramos o Shazam, pois se trata de um aplicativo que identifica o nome da música que está tocando no ambiente, ele é útil para quem não conhece ou se esqueceu do nome da canção reproduzida.

* "count_music_artosolo": Esta variável foi criada para representar a quantidade de músicas por artista solo. Para sua criação, foram utilizados os comandos SQL WITH, COUNT e GROUP BY.

Essas variáveis foram criadas utilizando uma combinação de funções e comandos SQL para agregar e manipular os dados de forma significativa, proporcionando insights valiosos para análises posteriores.


**Consolidação dos dados:**
Ao término do processo, foi realizada a integração das tabelas 'track_in_competition', 'track_in_spotify' e 'track_technical_info' por meio dos comandos CREATE TABLE, LEFT JOIN e JOIN, resultando na criação da tabela 'dados_spotify_final'."

</details>

</details>


<details>
<summary><b> Análise Exploratória dos dados </b></summary>


<details>
<summary><b> Comportamento e visualização dos dados </b></summary>
  
Após importar os dados tratados para o ambiente do Power BI, realizamos uma análise exploratória para entender o comportamento dos dados e extrair insights valiosos. Esta etapa envolveu várias técnicas de visualização e análise estatística para compreender melhor as características dos dados.

* Agrupamento por Artista e por Música: Inicialmente, realizamos um agrupamento para verificar quantos streams havia por artista e por música. Essa análise nos permitiu entender a distribuição dos streams em relação aos artistas e às músicas, identificando padrões de popularidade e engajamento.

* Gráfico de Barras: Para visualizar essas distribuições, criamos gráficos de barras que destacavam a quantidade de streams por artista e por música. Esses gráficos proporcionaram uma representação visual clara e intuitiva da popularidade das músicas e dos artistas no Spotify.

* Estatísticas Descritivas: Além disso, calculamos os valores de média, mediana e desvio padrão das variáveis numéricas da tabela. Essas estatísticas descritivas nos forneceram insights sobre a tendência central e a dispersão dos dados, ajudando a identificar possíveis outliers e padrões de comportamento.
  
* Histograma: Para uma compreensão mais detalhada da distribuição das variáveis numéricas, criamos um histograma que mostra a frequência de ocorrência de diferentes faixas de valores. Esse histograma nos permitiram visualizar a forma e a dispersão dos dados, facilitando a identificação de padrões e tendências.
  
* Gráfico de Linhas:
Por fim, geramos um gráfico de linhas para visualizar o número de músicas lançadas por ano. Esse gráfico nos ajudou a entender a evolução temporal da produção musical e a identificar tendências ao longo do tempo.
  
</details>  

<details>
<summary><b> Cálculo de quartis </b></summary>

Para uma análise mais granular das características das músicas (“bpm”, “danceability”, “valence”, “energy”, “acousticness”, “instrumentalness”, “liveness” e “speechiness”) , decidimos categorizar as variáveis ​​que representam essas características em quartis, atribuindo valores de 1 a 4. . Essa abordagem nos permitiu agrupar as músicas com base em diferentes níveis dessas características, proporcionando uma compreensão mais detalhada de sua diversidade e distribuição.

Utilizamos uma combinação de comandos SQL, incluindo WITH, NTILE, OVER e ORDER BY, para realizar essa categorização de maneira eficiente e escalável. Primeiramente, definimos a lógica para a categorização dos quartis, atribuindo valores de 1 a 4 com base na distribuição das características das músicas na amostra de dados.

Essa categorização nos permitiu analisar as características das músicas de forma mais abrangente, identificando padrões e tendências em diferentes faixas de valores. Além disso, facilitou a comparação entre músicas com características semelhantes e a identificação de grupos distintos com base em suas características musicais.

</details>

<details>
<summary><b> Segmentação de Dados por Quartis </b></summary>
  
Para uma análise mais simplificada e interpretável, decidimos segmentar os dados em duas categorias distintas, denominadas "alta" e "baixa", para os quartis das variáveis que representam as características das músicas. Essa segmentação nos permitiu agrupar os valores dos quartis de maneira mais intuitiva, facilitando a comparação e interpretação dos resultados.



**Metodologia de Segmentação:**
Utilizamos uma abordagem baseada em regras simples para atribuir os valores dos quartis às categorias "alta" e "baixa". Os valores 1 e 2 foram agrupados na categoria "baixa", enquanto os valores 3 e 4 foram agrupados na categoria "alta". Para realizar essa segmentação, empregamos o comando IF para criar uma lógica de classificação e agregamos os resultados por meio do comando JOIN.

**Criação de Tabelas Matrizes:**
Para avaliar o comportamento das variáveis das características das músicas em relação ao número médio de streams, criamos tabelas matriz para cada uma das variáveis. Essas tabelas permitiram verificar o valor médio de streams para cada uma das duas categorias criadas (alta e baixa) em relação a cada variável.

Ao final, foi criada uma nova tabela utilizando o comando CREATE TABLE chamada “dados_spotify_categorizados".

</details>

<details>
<summary><b> Teste de correlação </b></summary>

Para validar as hipóteses inicialmente propostas neste projeto, realizamos o teste de correlação dentro do ambiente do BigQuery. Utilizamos o comando CORR para calcular a correlação entre as variáveis relevantes e investigar possíveis relações entre elas.

**Metodologia do Teste:**
Utilizamos uma abordagem estatística para avaliar a correlação entre as variáveis selecionadas. O teste de correlação nos permitiu determinar se existe uma relação linear entre duas variáveis e a direção (positiva ou negativa) e a força dessa relação.

**Comando Utilizado:**

* CORR: Utilizamos o comando CORR dentro do ambiente do BigQuery para calcular a matriz de correlação entre as variáveis de interesse. Esse comando nos forneceu uma visão geral das relações entre as variáveis e ajudou a identificar possíveis associações significativas.

**Benefícios do Teste:**
O teste de correlação nos permitiu avaliar a presença e a magnitude das relações entre as variáveis, fornecendo insights valiosos para a validação das hipóteses levantadas no início do projeto. Ao identificar correlações significativas, pudemos confirmar ou refutar  as relações esperadas entre as variáveis e orientar análises posteriores com base nos resultados obtidos. Esse teste foi essencial para fundamentar nossas conclusões e recomendações finais com base em evidências estatísticas sólidas.

</details>

<details>
<summary><b> Teste de significância (Mann-Whitney) </b></summary>

No ambiente do Google Colab, empregamos a linguagem Python para conduzir o teste de significância não paramétrico de Mann-Whitney, como parte da análise das hipóteses deste projeto. O objetivo principal desse teste foi determinar se existe uma diferença significativa entre dois grupos independentes de dados.

**Metodologia do Teste:**
O teste de Mann-Whitney é uma técnica estatística robusta que não requer que os dados sigam uma distribuição normal, tornando-o ideal para situações em que a normalidade dos dados é desconhecida. Ele avalia se existe uma diferença estatisticamente significativa entre as distribuições de duas amostras independentes, com base nos valores das observações.

**Vantagens do Teste:**
Uma das principais vantagens do teste de Mann-Whitney é sua capacidade de lidar com dados que não seguem uma distribuição normal. Isso o torna uma ferramenta valiosa para análises estatísticas em que a normalidade dos dados não pode ser assumida. Além disso, por ser um teste não paramétrico, ele é menos sensível a outliers e é mais robusto em relação a violações de pressupostos estatísticos.

**Implementação em Python:**
Utilizamos a linguagem Python no ambiente do Google Colab para implementar o teste de Mann-Whitney. Isso nos permitiu realizar uma análise estatística precisa e eficiente, aproveitando as bibliotecas e ferramentas disponíveis na linguagem para conduzir o teste de forma adequada.

**Importância do Teste:**
O teste de Mann-Whitney desempenhou um papel crucial na validação das hipóteses deste trabalho, fornecendo evidências estatísticas sólidas para suportar nossas conclusões. Ao determinar se existem diferenças significativas entre os grupos de dados analisados, este teste nos permitiu identificar padrões e tendências importantes, contribuindo para uma compreensão mais profunda do fenômeno em estudo.
</details>

<details>
<summary><b> Teste de Regressão Linear </b></summary>
  
Utilizando a linguagem Python, conduzimos uma análise de regressão linear como parte da investigação das hipóteses deste projeto. O objetivo principal dessa análise foi examinar as relações entre as variáveis selecionadas e determinar se existem associações significativas entre elas.

**Metodologia do Teste:**
A análise de regressão linear é uma técnica estatística poderosa que nos permite modelar e investigar a relação entre uma variável dependente e uma ou mais variáveis independentes. Neste contexto, empregamos a regressão linear para avaliar o impacto de determinadas variáveis sobre uma variável de interesse e identificar padrões ou tendências nos dados.

**Visualização dos Resultados:**
Além da análise estatística, criamos gráficos de dispersão para visualizar o comportamento das variáveis em cada uma das hipóteses do projeto. Esses gráficos nos forneceram uma representação visual das relações entre as variáveis e ajudaram a identificar padrões ou tendências nos dados.

**Importância da Análise:**
A análise de regressão linear desempenhou um papel crucial na investigação das hipóteses deste projeto, fornecendo insights sobre a natureza das relações entre as variáveis estudadas. Ao identificar associações significativas, pudemos validar nossas hipóteses e compreender melhor os fatores que influenciam as variáveis de interesse.

**Implementação em Python:**
Utilizamos a linguagem Python para implementar a análise de regressão linear, aproveitando as bibliotecas e ferramentas disponíveis na linguagem para conduzir a análise de forma eficiente e precisa. A flexibilidade e a robustez do Python nos permitiram explorar as relações entre as variáveis e extrair insights valiosos dos dados.
</details>

</details>

<details>
<summary><b> Resultados e Conclusões </b></summary>

Conclusões da Análise Exploratória dos Dados

<details>
<summary><b> Hipótese 1 - Impacto BPM nos Streams </b></summary>

A suposição inicial de que músicas com um maior número de batidas por minuto (BPM) teriam um maior número de streams não foi confirmada pela análise exploratória dos dados. Os resultados dos testes estatísticos revelaram o seguinte:

**Teste de Correlação:**
O coeficiente de correlação entre as variáveis "bpm" e "streams" foi calculado como -0.0009, indicando uma correlação negativa muito fraca entre elas. Esse valor sugere que não há uma associação significativa entre o BPM e o número de streams das músicas.

**Teste de Significância (Mann-Whitney):**
Ao analisar as categorias "alta" e "baixa" da variável "bpm" em relação ao número de streams, não foi encontrada diferença significativa entre elas. Isso indica que o BPM não parece influenciar de forma significativa o número de streams das músicas.

**Teste de Regressão Linear:**
O teste de regressão linear apresentou um valor de p = 0.944 para a variável independente "bpm". Esse valor elevado de p indica que o BPM não é estatisticamente significativo para prever os streams. Em outras palavras, o BPM não é um bom preditor do número de streams das músicas.

**Conclusão Geral:**
Com base nos resultados desses testes estatísticos, não encontramos evidências estatísticas que sustentem a ideia de uma relação significativa entre as variáveis "bpm" e "streams". Portanto, não podemos afirmar que o BPM das músicas influencia diretamente o número de streams no Spotify. Outros fatores podem ter um papel mais significativo na popularidade e no sucesso das músicas na plataforma.


</details>

<details>
<summary><b> Hipótese 2 - Correlação entre o Ranking do Spotify e Outras Plataformas </b></summary>

Os testes realizados confirmaram a hipótese inicial de que as músicas mais populares no ranking do Spotify também têm um desempenho semelhante nas plataformas Deezer e Apple. Os resultados dos testes estatísticos são os seguintes:

**Teste de Correlação:**
As correlações entre o ranking do Spotify e as plataformas Deezer e Apple foram calculadas como 0.5998 e 0.5519, respectivamente. Esses valores indicam uma correlação positiva entre as plataformas, sugerindo que as músicas populares no Spotify tendem a ter um desempenho semelhante nas plataformas Deezer e Apple.

**Teste de Regressão Linear:**
As regressões aplicadas apresentaram valores de p < 0.05, o que indica que há uma evidência estatisticamente significativa para a relação entre as músicas populares no ranking do Spotify e seu desempenho nas plataformas Deezer e Apple. Em outras palavras, as músicas que são populares no Spotify têm uma associação estatisticamente significativa com as plataformas Deezer e Apple.

**Conclusão Geral:**
Com base nos resultados desses testes estatísticos, podemos concluir que há uma associação estatisticamente significativa entre a popularidade das músicas no ranking do Spotify e seu desempenho nas plataformas Deezer e Apple. Portanto, a hipótese de que as músicas mais populares no Spotify também são populares nas plataformas Deezer e Apple foi validada. Isso sugere que o sucesso de uma música em uma plataforma de streaming pode influenciar seu desempenho em outras plataformas, indicando uma tendência geral no comportamento dos usuários.
</details>

<details>
<summary><b> Hipótese 3 - Correlação entre a Presença em Playlists e o Número de Streams  </b></summary>
Os testes realizados confirmaram a hipótese de que a presença de uma música em um maior número de playlists está correlacionada com um aumento significativo no número de streams. Abaixo estão os resultados dos testes estatísticos:

**Teste de Correlação:**
Após análises, verificou-se uma correlação positiva entre a presença de uma música em playlists e o número de streams, com um valor de p = 0.7835. Esse resultado indica que há uma correlação significativa entre as duas variáveis, confirmando a hipótese de que uma maior presença em playlists está associada a um aumento no número de streams.

**Teste de Regressão Linear:**
O teste de regressão revelou um R-quadrado de 0.625, o que significa que aproximadamente 62.5% da variabilidade nos streams pode ser explicada pela presença de uma música em playlists. Esse valor indica uma relação moderadamente forte entre as variáveis e sugere que a presença em playlists é um fator significativo na determinação do número de streams de uma música.

**Conclusão Geral:**
Com base nos resultados dos testes estatísticos, pode-se concluir que há uma relação significativa entre a presença de uma música em playlists e o aumento no número de streams. Isso confirma a importância das playlists como impulsionadores de sucesso para as músicas no ambiente de streaming. Portanto, a hipótese de que a presença em playlists está correlacionada com o número de streams foi validada.

</details>

<details>
<summary><b> Hipótese 4 - Relação entre o Número de Músicas de um Artista e o Total de Streams no Spotify  </b></summary>

Os resultados da análise indicam uma correlação positiva e significativa entre o número de músicas disponíveis de um artista no Spotify e o total de streams acumulados. Os testes estatísticos realizados revelaram o seguinte:

**Teste de Correlação:**
Foi observada uma correlação positiva entre o número de músicas de um artista e o total de streams no Spotify, com um valor de p = 0.7783. Esse resultado sugere uma associação significativa entre as duas variáveis, apoiando a hipótese de que um maior catálogo de músicas está relacionado a um aumento nos streams.

**Teste de Regressão Linear:**
O teste de regressão linear apresentou um R-quadrado de 0.606, indicando que aproximadamente 60.6% da variação nos streams pode ser explicada pelo número de músicas de um artista no Spotify. Esse valor aponta para uma relação positiva e substancial entre as variáveis, evidenciando que um aumento no número de faixas está associado a um aumento significativo na quantidade de streams.

**Conclusão Geral:**
Com base nos resultados dos testes estatísticos, podemos concluir que existe uma relação estatisticamente significativa entre o número de músicas de um artista e o total de streams no Spotify. Isso destaca a importância da disponibilidade do catálogo de um artista para o sucesso na plataforma de streaming. Portanto, a hipótese de que o número de faixas de um artista está relacionado ao número de streams foi validada.

</details>

<details>
<summary><b> Hipótese 5- Influência das Características Musicais no Número de Streams no Spotify  </b></summary>

Após análise, concluiu-se que as características das músicas têm impacto variado no sucesso em termos de número de streams no Spotify. Os resultados dos testes estatísticos são os seguintes:

**Teste de Correlação:**
Observou-se uma correlação negativa muito fraca entre todas as características das músicas e o número de streams no Spotify, com valores próximos de zero. Isso sugere uma relação mínima ou inexistente entre essas variáveis.

**Teste de Significância:**
Apenas a variável "speechiness" apresentou diferença significativa entre suas categorias e o número de streams. Isso indica que o conteúdo falado na música tem alguma influência no número de streams, mas as outras características não demonstraram uma diferença significativa.

**Teste de Regressão Linear:**
A análise de regressão linear mostrou que algumas características da música, como "danceability" e "speechiness", têm uma influência significativa no número de streams. No entanto, outras características, como "valence", "energy", "acousticness", "instrumentalness" e "liveness", não apresentaram uma relação estatisticamente significativa com os streams.

**Conclusão Geral:**
Considerando os resultados dos testes estatísticos e a análise dos coeficientes de regressão, optou-se por refutar a hipótese de que as características das músicas influenciam o sucesso em termos de número de streams no Spotify. Embora algumas características, como "danceability" e "speechiness", pareçam ter impacto significativo, outras não demonstraram uma associação clara com o número de streams. Portanto, a influência das características musicais no sucesso das músicas em termos de streams no Spotify não pode ser generalizada, e a relação entre essas variáveis é mais complexa do que inicialmente previsto.
</details>

</details>

<details>
<summary><b> 💡 Recomendações  </b></summary>

Com base nas conclusões da análise exploratória dos dados e no objetivo de ajudar o novo artista a alcançar o sucesso, aqui estão algumas sugestões:

**Diversificação do Conteúdo Musical:** Embora as características das músicas não demonstram uma influência clara no número de streams, é importante diversificar o conteúdo musical para atrair uma ampla audiência. É recomendável experimentar criar músicas com diferentes estilos, ritmos e letras para atingir diferentes públicos-alvo.

**Aproveitar Plataformas de Playlist:** A presença em playlists é um fator significativo para o sucesso no Spotify. Portanto, é recomendável concentrar-se em promover músicas para curadores de playlists (responsável por criar as playlists editoriais da maneira mais segmentada possível, casando com o público alvo daquele gênero e organizando as músicas que fazem sentido estar dentro da playlist) e tentar garantir inclusões em playlists populares. Isso pode ser feito através de networking, promoção ativa e envio direto das  músicas do novo artista para os curadores.

**Foco na Qualidade do Conteúdo Falado:** A variável "speechiness" mostrou ter alguma influência no número de streams. Embora refutamos a análise olhando para o contexto geral, é importante prestar atenção à qualidade e ao conteúdo das partes faladas em suas músicas, como letras e interlúdios, garantindo que sejam cativantes e envolventes para os ouvintes.

**Engajamento com a Audiência:** É recomendável construir uma forte presença nas redes sociais e interagir regularmente com a base de fãs. Respondendo a comentários, participando de conversas e compartilhando conteúdos exclusivos para manter os fãs engajados e criar uma comunidade em torno da música do novo artista.

**Replicação de Estratégias Bem-Sucedidas:** Observar a correlação positiva entre as músicas mais populares no Spotify e seu desempenho nas plataformas Deezer e Apple sugere que estratégias bem-sucedidas no Spotify podem ser replicadas em outras plataformas de streaming. A gravadora pode explorar essas oportunidades para maximizar o alcance do novo artista e aumentar sua base de fãs em diferentes plataformas.

**Análise Contínua de Dados:** É recomendável se manter atualizado com as tendências do mercado musical e analisar continuamente os dados de streaming das  músicas do novo artista. Isso permitirá ajustes e adaptações em sua estratégia conforme necessário para maximizar seu potencial de sucesso.

**Colaborações com Artistas Reconhecidos:** Se possível  sugerimos parcerias com artistas já estabelecidos que podem ajudar a aumentar a visibilidade do novo artista. Procure colaborações com artistas que tenham um grande número de seguidores nas plataformas de streaming, o que pode levar a um aumento no número de streams.

Ao implementar essas sugestões e permanecer flexível e adaptável ao ambiente em constante mudança da indústria musical, o novo artista terá uma melhor chance de alcançar o sucesso desejado.


</details>

<details>
<summary><b> Links de interesse  </b></summary>

Teste não paramétrico: https://www.inf.ufsc.br/~vera.carmo/Testes_de_Hipoteses/Testes_nao_parametricos_Mann-Whitney.pdf

</details>

