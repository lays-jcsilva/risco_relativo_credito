# Verificando se há valores nulos em todas as variáveis na tabela user_info:
SELECT 
  COUNT(*) AS total_linhas,
  COUNTIF(user_id IS NULL) AS user_id_nulos,
  COUNTIF(age IS NULL) AS age_nulos,
  COUNTIF(sex IS NULL) AS sex_nulos,
  COUNTIF(last_month_salary IS NULL) AS last_month_salary_nulos,
  COUNTIF(number_dependents IS NULL) AS number_dependents_nulos
FROM 
  `risco_credito.user_info`;
  --Resultados da tabela user_info: o total de dados é de 36.000 mil, foram identificados 7.199 valores nulos na variável last_month_salary e 943 valores nulos na variável number_dependents

#tratamento dos nulos na tabela user_info
SELECT 
user_id,
age,
sex,
IFNULL(last_month_salary, (SELECT APPROX_QUANTILES(last_month_salary, 2)[OFFSET(1)] FROM `risco_credito.user_info`)) AS last_month_salary,
  IFNULL(number_dependents, (SELECT APPROX_QUANTILES(number_dependents, 2)[OFFSET(1)] FROM `risco_credito.user_info`)) AS number_dependents
FROM 
  `risco_credito.user_info`;

  # Verificando se há valores nulos em todas as variáveis na tabela loans_detail:
SELECT 
  COUNT(*) AS total_linhas,
  COUNTIF(user_id IS NULL) AS user_id_nulos,
  COUNTIF(more_90_days_overdue IS NULL) AS more_90_days_overdue_nulos,
  COUNTIF(using_lines_not_secured_personal_assets IS NULL) AS using_lines_not_secured_personal_assets_nulos,
  COUNTIF(number_times_delayed_payment_loan_30_59_days IS NULL) AS number_times_delayed_payment_loan_30_59_days_nulos,
  COUNTIF(debt_ratio IS NULL) AS debt_ratio_nulos,
  COUNTIF(number_times_delayed_payment_loan_60_89_days IS NULL) AS number_times_delayed_payment_loan_60_89_days_nulos
FROM 
  `risco_credito.loans_detail`;
  --Resultados da consulta: o total de dados é de 36.000 mil, não foram identificados valores nulos

  # Verificando se há valores nulos em todas as variáveis na tabela loans_outstanding
SELECT 
  COUNT(*) AS total_linhas,
  COUNTIF(loan_id IS NULL) AS loan_id_nulos,
  COUNTIF(user_id IS NULL) AS user_id_nulos,
  COUNTIF(loan_type IS NULL) AS loan_type_nulos
FROM `risco_credito.loans_outstanding`;
-- Resultados da consulta:  o total de dados é de 305.335 mil, não foram identificados valores nulos
#Consulta para identificar valores duplicados na tabela loans_outstanding
SELECT
  loan_id,
  user_id,
  loan_type,
  COUNT(*) AS num_duplicatas
FROM
  `risco_credito.loans_outstanding`
GROUP BY
  loan_id,
  user_id,
  loan_type
HAVING
  COUNT(*) > 1;
--Resultado da consulta: Não constam valores duplicados

#Consulta para identificar valores duplicados na tabela user_info

SELECT
  user_id,
  age,
  sex,
  last_month_salary,
  number_dependents,
  COUNT(*) AS num_duplicatas
FROM
  `risco_credito.user_info`
GROUP BY
  user_id,
  age,
  sex,
  last_month_salary,
  number_dependents
HAVING
  COUNT(*) > 1;
-- Resultado da consulta: Não constam valores duplicados

#Verificando a correlação entre todas as variáveis 
SELECT 
CORR(more_90_days_overdue, number_times_delayed_payment_loan_60_89_days) AS corr_60_89,


CORR(more_90_days_overdue, number_times_delayed_payment_loan_30_59_days) AS corr_30_59,


CORR(number_times_delayed_payment_loan_30_59_days,number_times_delayed_payment_loan_60_89_days) AS correlacao,


CORR (using_lines_not_secured_personal_assets,debt_ratio) AS correlacao
##CORR 0,01##
FROM `risco_credito.loans_detail`

SELECT STDDEV_SAMP(number_times_delayed_payment_loan_30_59_days)  ,
       STDDEV_SAMP(more_90_days_overdue) AS more_90,
       STDDEV_SAMP(number_times_delayed_payment_loan_60_89_days) AS dias_89
FROM `risco_credito_loans_default`




SELECT 
CORR(default_flag, last_month_salary_) AS correlacao,


CORR(default_flag, number_dependents) AS correlacao
FROM `risco_relativo.default_user_info` 

SELECT CORR(emprestimo_imoveis, emprestimo_outros) AS correlacao, ##CORR 0.23##
CORR (taxa_endividamento, clientes_inadimplentes) as teste ##-0.007##
FROM  `risco_relativo.tb_consolidada`

#Criando os quartis
CREATE OR REPLACE TABLE `projeto-3-risco-relativo.risco_credito.tb_quartis_compilada` AS
WITH quartis AS (
  SELECT
    user_id,
    default_flag,
    age,
    faixa_etaria,
    last_month_salary,
    number_dependents,
    qtd_emprestimos_total,
    more_90_days_overdue,
    using_lines_not_secured_personal_assets_corrigida,
    number_times_delayed_payment_loan_30_59_days,
    number_times_delayed_payment_loan_60_89_days,
    debt_ratio_corrigida,
    NTILE(4) OVER (ORDER BY age) AS age_quartil,
    NTILE(4) OVER (ORDER BY faixa_etaria) AS faixa_etaria_quartil,
    NTILE(4) OVER (ORDER BY last_month_salary) AS salary_quartil,
    NTILE(4) OVER (ORDER BY number_dependents) AS dependent_quartil,
    NTILE(4) OVER (ORDER BY more_90_days_overdue) AS more_90_days_quartil,
    NTILE(4) OVER (ORDER BY using_lines_not_secured_personal_assets_corrigida) AS using_lines_quartil,
    NTILE(4) OVER (ORDER BY number_times_delayed_payment_loan_30_59_days) AS delayed_payment_30_59_quartil,
    NTILE(4) OVER (ORDER BY number_times_delayed_payment_loan_60_89_days) AS delayed_payment_60_89_quartil,
    NTILE(4) OVER (ORDER BY debt_ratio_corrigida) AS debt_ratio_quartil,
    NTILE(4) OVER (ORDER BY qtd_emprestimos_total) AS qtd_emprestimos_total_quartil
  FROM
    `projeto-3-risco-relativo.risco_credito.tb_compilada`
)
SELECT
  q.user_id,
  q.default_flag,
  q.age,
  q.faixa_etaria,
  q.last_month_salary,
  q.number_dependents,
  q.qtd_emprestimos_total, 
  q.more_90_days_overdue,
  q.using_lines_not_secured_personal_assets_corrigida,
  q.number_times_delayed_payment_loan_30_59_days,
  q.number_times_delayed_payment_loan_60_89_days,
  q.debt_ratio_corrigida,
  q.age_quartil,
  q.faixa_etaria_quartil,
  q.salary_quartil,
  q.dependent_quartil,
  q.more_90_days_quartil,
  q.delayed_payment_30_59_quartil,
  q.delayed_payment_60_89_quartil,
  q.debt_ratio_quartil,
  q.using_lines_quartil,
  q.qtd_emprestimos_total_quartil
FROM
  quartis q;


#Calculando o risco relativo 
CREATE OR REPLACE TABLE
  `projeto-3-risco-relativo.risco_credito.hipoteses` AS
WITH
  calc_risco AS (
  SELECT
    user_id,
    faixa_etaria,
    CASE
      WHEN qtd_emprestimos_total BETWEEN 1 AND 3 THEN '1 - 3'
      WHEN qtd_emprestimos_total BETWEEN 4
    AND 6 THEN '4 - 6'
      WHEN qtd_emprestimos_total BETWEEN 7 AND 9 THEN '7 - 9'
      WHEN qtd_emprestimos_total > 9 THEN '>= 10'
      ELSE NULL
  END
    fx_emprestimos,
    more_90_days_overdue,
    default_flag
  FROM
    `projeto-3-risco-relativo.risco_credito.tb_quartis_completa` ),
  tb_fx_etaria AS (
  SELECT
    '21-29' faixa_etaria,
    CASE
      WHEN SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(faixa_etaria='21-29' AND default_flag = 1),COUNTIF(faixa_etaria='21-29')),SAFE_DIVIDE(COUNTIF(faixa_etaria!='21-29' AND default_flag = 1),COUNTIF(faixa_etaria!='21-29'))) > 1 THEN 'Alto Risco'
      ELSE 'Baixo Risco'
  END
    risk_desc,
    SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(faixa_etaria='21-29'
          AND default_flag = 1),COUNTIF(faixa_etaria='21-29')),SAFE_DIVIDE(COUNTIF(faixa_etaria!='21-29'
          AND default_flag = 1),COUNTIF(faixa_etaria!='21-29'))) AS risk_calc
  FROM
    calc_risco
  UNION ALL
  SELECT
    '30-39' faixa_etaria,
    CASE
      WHEN SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(faixa_etaria='30-39' AND default_flag = 1),COUNTIF(faixa_etaria='30-39')),SAFE_DIVIDE(COUNTIF(faixa_etaria!='30-39' AND default_flag = 1),COUNTIF(faixa_etaria!='30-39'))) > 1 THEN 'Alto Risco'
      ELSE 'Baixo Risco'
  END
    risk_desc,
    SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(faixa_etaria='30-39'
          AND default_flag = 1),COUNTIF(faixa_etaria='30-39')),SAFE_DIVIDE(COUNTIF(faixa_etaria!='30-39'
          AND default_flag = 1),COUNTIF(faixa_etaria!='30-39'))) risk_calc
  FROM
    calc_risco
  UNION ALL
  SELECT
    '40-49' faixa_etaria,
    CASE
      WHEN SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(faixa_etaria='40-49' AND default_flag = 1),COUNTIF(faixa_etaria='40-49')),SAFE_DIVIDE(COUNTIF(faixa_etaria!='40-49' AND default_flag = 1),COUNTIF(faixa_etaria!='40-49'))) > 1 THEN 'Alto Risco'
      ELSE 'Baixo Risco'
  END
    risk_desc,
    SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(faixa_etaria='40-49'
          AND default_flag = 1),COUNTIF(faixa_etaria='40-49')),SAFE_DIVIDE(COUNTIF(faixa_etaria!='40-49'
          AND default_flag = 1),COUNTIF(faixa_etaria!='40-49'))) risk_calc
  FROM
    calc_risco
  UNION ALL
  SELECT
    '50-59' faixa_etaria,
    CASE
      WHEN SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(faixa_etaria='50-59' AND default_flag = 1),COUNTIF(faixa_etaria='50-59')),SAFE_DIVIDE(COUNTIF(faixa_etaria!='50-59' AND default_flag = 1),COUNTIF(faixa_etaria!='50-59'))) > 1 THEN 'Alto Risco'
      ELSE 'Baixo Risco'
  END
    risk_desc,
    SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(faixa_etaria='50-59'
          AND default_flag = 1),COUNTIF(faixa_etaria='50-59')),SAFE_DIVIDE(COUNTIF(faixa_etaria!='50-59'
          AND default_flag = 1),COUNTIF(faixa_etaria!='50-59'))) risk_calc
  FROM
    calc_risco
  UNION ALL
  SELECT
    '60-69' faixa_etaria,
    CASE
      WHEN SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(faixa_etaria='60-69' AND default_flag = 1),COUNTIF(faixa_etaria='60-69')),SAFE_DIVIDE(COUNTIF(faixa_etaria!='60-69' AND default_flag = 1),COUNTIF(faixa_etaria!='60-69'))) > 1 THEN 'Alto Risco'
      ELSE 'Baixo Risco'
  END
    risk_desc,
    SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(faixa_etaria='60-69'
          AND default_flag = 1),COUNTIF(faixa_etaria='60-69')),SAFE_DIVIDE(COUNTIF(faixa_etaria!='60-69'
          AND default_flag = 1),COUNTIF(faixa_etaria!='60-69'))) risk_calc
  FROM
    calc_risco
  UNION ALL
  SELECT
    '70+' faixa_etaria,
    CASE
      WHEN SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(faixa_etaria='70+' AND default_flag = 1),COUNTIF(faixa_etaria='70+')),SAFE_DIVIDE(COUNTIF(faixa_etaria!='70+' AND default_flag = 1),COUNTIF(faixa_etaria!='70+'))) > 1 THEN 'Alto Risco'
      ELSE 'Baixo Risco'
  END
    risk_desc,
    SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(faixa_etaria='70+'
          AND default_flag = 1),COUNTIF(faixa_etaria='70+')),SAFE_DIVIDE(COUNTIF(faixa_etaria!='70+'
          AND default_flag = 1),COUNTIF(faixa_etaria!='70+'))) risk_calc
  FROM
    calc_risco ),
  tb_emprestimo AS (
  SELECT
    '1 - 3' fx_emprestimos,
    CASE
      WHEN SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(fx_emprestimos='1 - 3' AND default_flag = 1),COUNTIF(fx_emprestimos='1 - 3')),SAFE_DIVIDE(COUNTIF(fx_emprestimos!='1 - 3' AND default_flag = 1),COUNTIF(fx_emprestimos!='1 - 3'))) > 1 THEN 'Alto Risco'
      ELSE 'Baixo Risco'
  END
    risk_desc,
    SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(fx_emprestimos='1 - 3'
          AND default_flag = 1),COUNTIF(fx_emprestimos='1 - 3')),SAFE_DIVIDE(COUNTIF(fx_emprestimos!='1 - 3'
          AND default_flag = 1),COUNTIF(fx_emprestimos!='1 - 3'))) risk_calc
  FROM
    calc_risco
  UNION ALL
  SELECT
    '4 - 6' fx_emprestimos,
    CASE
      WHEN SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(fx_emprestimos='4 - 6' AND default_flag = 1),COUNTIF(fx_emprestimos='4 - 6')),SAFE_DIVIDE(COUNTIF(fx_emprestimos!='4 - 6' AND default_flag = 1),COUNTIF(fx_emprestimos!='4 - 6'))) > 1 THEN 'Alto Risco'
      ELSE 'Baixo Risco'
  END
    risk_desc,
    SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(fx_emprestimos='4 - 6'
          AND default_flag = 1),COUNTIF(fx_emprestimos='4 - 6')),SAFE_DIVIDE(COUNTIF(fx_emprestimos!='4 - 6'
          AND default_flag = 1),COUNTIF(fx_emprestimos!='4 - 6'))) risk_calc
  FROM
    calc_risco
  UNION ALL
  SELECT
    '7 - 9' fx_emprestimos,
    CASE
      WHEN SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(fx_emprestimos='7 - 9' AND default_flag = 1),COUNTIF(fx_emprestimos='7 - 9')),SAFE_DIVIDE(COUNTIF(fx_emprestimos!='7 - 9' AND default_flag = 1),COUNTIF(fx_emprestimos!='7 - 9'))) > 1 THEN 'Alto Risco'
      ELSE 'Baixo Risco'
  END
    risk_desc,
    SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(fx_emprestimos='7 - 9'
          AND default_flag = 1),COUNTIF(fx_emprestimos='7 - 9')),SAFE_DIVIDE(COUNTIF(fx_emprestimos!='7 - 9'
          AND default_flag = 1),COUNTIF(fx_emprestimos!='7 - 9'))) risk_calc
  FROM
    calc_risco
  UNION ALL
  SELECT
    '>= 10' fx_emprestimos,
    CASE
      WHEN SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(fx_emprestimos='>= 10' AND default_flag = 1),COUNTIF(fx_emprestimos='>= 10')),SAFE_DIVIDE(COUNTIF(fx_emprestimos!='>= 10' AND default_flag = 1),COUNTIF(fx_emprestimos!='>= 10'))) > 1 THEN 'Alto Risco'
      ELSE 'Baixo Risco'
  END
    risk_desc,
    SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(fx_emprestimos='>= 10'
          AND default_flag = 1),COUNTIF(fx_emprestimos='>= 10')),SAFE_DIVIDE(COUNTIF(fx_emprestimos!='>= 10'
          AND default_flag = 1),COUNTIF(fx_emprestimos!='>= 10'))) risk_calc
  FROM
    calc_risco ),
  tb_over90 AS (
  SELECT
    'Sim' flg_atraso_90d,
    CASE
      WHEN SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(more_90_days_overdue=1 AND default_flag = 1),COUNTIF(more_90_days_overdue=1)),SAFE_DIVIDE(COUNTIF(more_90_days_overdue!=1 AND default_flag = 1),COUNTIF(more_90_days_overdue!=1))) > 1 THEN 'Alto Risco'
      ELSE 'Baixo Risco'
  END
    risk_desc,
    SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(more_90_days_overdue=1
          AND default_flag = 1),COUNTIF(more_90_days_overdue=1)),SAFE_DIVIDE(COUNTIF(more_90_days_overdue!=1
          AND default_flag = 1),COUNTIF(more_90_days_overdue!=1))) risk_calc
  FROM
    calc_risco
  UNION ALL
  SELECT
    'Não' flg_atraso_90d,
    CASE
      WHEN SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(more_90_days_overdue=0 AND default_flag = 1),COUNTIF(more_90_days_overdue=0)),SAFE_DIVIDE(COUNTIF(more_90_days_overdue!=1 AND default_flag = 1),COUNTIF(more_90_days_overdue!=1))) > 1 THEN 'Alto Risco'
      ELSE 'Baixo Risco'
  END
    risk_desc,
    SAFE_DIVIDE(SAFE_DIVIDE(COUNTIF(more_90_days_overdue=0
          AND default_flag = 1),COUNTIF(more_90_days_overdue=0)),SAFE_DIVIDE(COUNTIF(more_90_days_overdue!=0
          AND default_flag = 1),COUNTIF(more_90_days_overdue!=0))) risk_calc
  FROM
    calc_risco )
SELECT
  faixa_etaria dimensao_hipoteses,
  risk_desc,
  risk_calc,
  'faixa_etaria' descricao_tbl
FROM
  tb_fx_etaria
UNION ALL
SELECT
  fx_emprestimos dimensao_hipoteses,
  risk_desc,
  risk_calc,
  'emprestimos' descricao_tbl
FROM
  tb_emprestimo
UNION ALL
SELECT
  flg_atraso_90d dimensao_hipoteses,
  risk_desc,
  risk_calc,
  'over90' descricao_tbl
FROM
  tb_over90


#Criando faixa etária
WITH faixa_etaria AS (
  SELECT user_id,
         age,
         CASE
           WHEN age BETWEEN 21 AND 29 THEN '21-29'
           WHEN age BETWEEN 30 AND 39 THEN '30-39'
           WHEN age BETWEEN 40 AND 49 THEN '40-49'
           WHEN age BETWEEN 50 AND 59 THEN '50-59'
           WHEN age BETWEEN 60 AND 69 THEN '60-69' 
         END AS faixa_etaria
  FROM `risco_credito.tb_consolidada`
)
SELECT * FROM faixa_etaria;
WITH faixa_etaria AS (
  SELECT user_id,
         age,
         CASE
           WHEN age BETWEEN 21 AND 29 THEN '21-29'
           WHEN age BETWEEN 30 AND 39 THEN '30-39'
           WHEN age BETWEEN 40 AND 49 THEN '40-49'
           WHEN age BETWEEN 50 AND 59 THEN '50-59'
           WHEN age BETWEEN 60 AND 69 THEN '60-69'
           ELSE '70+'
         END AS faixa_etaria
  FROM `risco_credito.tb_consolidada`
)
SELECT * FROM faixa_etaria;




#Criando variável dummy
WITH dummy AS (
  SELECT
    user_id,
    default_flag,
    CASE WHEN age_quartil IN (1, 2) THEN 1 ELSE 0 END AS age_dummy,
    CASE WHEN dependent_quartil IN (3, 4) THEN 1 ELSE 0 END AS dependent_dummy,
    CASE WHEN salary_quartil IN (1, 2) THEN 1 ELSE 0 END AS salary_dummy,
    CASE WHEN qtd_emprestimos_total_quartil IN (1, 2) THEN 1 ELSE 0 END AS total_loans_dummy,
    CASE WHEN more_90_days_quartil = 4 THEN 1 ELSE 0 END AS more_90_days_dummy,
    CASE WHEN using_lines_quartil = 4 THEN 1 ELSE 0 END AS using_lines_dummy,
    CASE WHEN debt_ratio_quartil IN (3, 4) THEN 1 ELSE 0 END AS debt_ratio_dummy
  FROM
    `projeto-3-risco-relativo.risco_credito.tb_quartis_compilada`
),
score_final AS (
  SELECT
    *,
    age_dummy + salary_dummy + qtd_emprestimos_total_dummy + more_90_days_dummy + using_lines_dummy + dependent_dummy + debt_ratio_dummy
    AS score
  FROM
    dummy
)
SELECT
  *,
  CASE WHEN score >= 4 THEN 1 ELSE 0 END AS score_0_1
FROM
  score_final; 