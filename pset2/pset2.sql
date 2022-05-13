-- Questão 1 
SELECT numero_departamento, nome_departamento,
AVG (Salário) AS media_salario
FROM funcionarios
ORDER BY numero_departamento, nome_departamento;


-- Questão 2
SELECT sexo,
AVG (Salário) AS media_genero
FROM funcionarios
GROUP BY sexo;


-- Questão 3
SELECT d . nome_departamento,
(f . primeiro_nome, '', f . ultimo_nome, '', f . nome_meio) AS nome_completo, f . data_nascimento, AS idade_anos
DE funcionario AS f,
JOIN d . numero_departamento = f . numero_departamento
ORDER BY nome_departamento ASC;


-- Questão 4
SELECT 
f . primeiro_nome, '', f . ultimo_nome, '', f . nome_meio AS nome_completo,
f . data_nascimento,
DATE('year' , AGE(f . data_nascimento)) AS idade,
f . Salário AS salario_atual.
(quando( f . salario < '3500') f . salario * 1 . 20
quando( f . salario >= '3500' ) f . salario * 1.15 end) AS salario_reajuste
FROM funcionario f 


-- Questão 5
SELECT d. _ nome_departamento ,
CAST (caso quando d . cpf_gerente  =  f . cpf THEN
	 f . primeiro_nome '' f . nome_meio '' f . ultimo_nome  END AS  varchar ( 31 )) as nome_gerente,
	 f . primeiro_nome '' f . nome_meio '' f . ultimo_nome  AS nome_funcionario,
	f . salario
DE funcionario f	
	
INNER JOIN departamento d
EM  f. _ numero_departamento  =  d. numero_departamento
ORDER BY d. nome_departamento  ASC , f. salario  DESC ;


-- Questão 6
SELECT  F. _ numero_departamento ,
 f. primeiro_nome '' f. nome_meio '' f. ultimo_nome AS nome_completo ,
d. _ nome_dependente ,
	DATE_PART( ' ano ' , IDADE( d. data_nascimento )) AS idade_dependente,
	(CASO QUANDO ( d. sexo = ' M ' ) ENTÃO ' Masculino ' QUANDO ( d. sexo = ' F ' ) ENTÃO ' Feminino ' END ) COMO sexo
	-- idade do funcionário através da função AGE
	FROM funcionario AS F, dependente AS d
	ONDE  f. _ cpf  =  d. _ cpf_funcionario ;


-- Questão 7
 SELECT  f . primeiro_nome '' f . nome_meio '' f . ultimo_nome  AS nome_funcionario,
f . _ numero_departamento ,
f . _ salario
	DO funcionario AS F
	ONDE  f . _ cpf NOT IN ( SELECT  d . cpf_funcionario  FROM dependente AS d);


-- Questão 8
SELECT  d. _ nome_departamento , P . nome_projeto ,
f . primeiro_nome '' f . nome_meio '' f . ultimo_nome ) AS nome_funcionario,
CAST (CASE WHEN T . horas é nulo então 0 senão T . horas terminam como  DECIMAL ( 3 , 1 )) as horas

	DO funcionario AS F
		
	INNER JOIN trabalha_em AS T
	EM  f. _ cpf  =  T . cpf_funcionario
	INNER JOIN projeto AS P
	EM  T. _ numero_projeto  =  P . numero_projeto
	INNER JOIN departamento AS D
	EM  f. _ numero_departamento  =  D . numero_departamento
	ORDER BY D. nome_departamento , P . nome_projeto , f. _ salario  DESC ;


-- Questão 9
    SELECT  d. _ nome_departamento , P . nome_projeto ,
CAST (CASE WHEN SUM ( T . horas ) é nulo então 0 senão SUM ( T . horas ) termina como  DECIMAL ( 3 , 1 )) AS total_horas

	DO funcionario AS F
		
	INNER JOIN trabalha_em AS T
	EM  f. _ cpf  =  T . cpf_funcionario
	INNER JOIN projeto AS P
	EM  T. _ numero_projeto  =  P . numero_projeto
	INNER JOIN departamento AS d
	EM  f. _ numero_departamento  =  d . numero_departamento
	GRUPO  DE d. nome_departamento , P . nome_projeto ;


-- Questão 10
    SELECT  d. _ nome_departamento ,
CAST ( AVG (salário) AS  DECIMAL ( 10 , 2 )) AS media_salário
	A PARTIR DE 
		funcionario AS f
	INNER JOIN departamento AS d
	EM  f. _ numero_departamento  =  d . numero_departamento
	GRUPO  DE d. nome_departamento ;


-- Questão 11
   SELECT f . primeiro_nome '' f . nome_meio '' f . ultimo_nome  AS nome_funcionario,
P. _ nome_projeto , CAST ( CASE WHEN T . horas é nulo então 0 else ( T . horas  *  50 ) END AS  DECIMAL ( 10 , 2 )) AS valor_total   	
DO funcionario AS f
	INNER JOIN trabalha_em AS T
	EM  f . _ cpf  =  T . cpf_funcionario
	INNER JOIN projeto AS P
	EM  T. _ numero_projeto  =  P . numero_projeto
	ORDER BY f. salario  DESC ;


-- Questão 12
    SELECT  d. _ nome_departamento , P . nome_projeto ,
 f . primeiro_nome '' f . nome_meio '' f . ultimo_nome ) AS nome_funcionario_sem_horas
DO funcionario AS F
	INNER JOIN departamento AS d
	EM  f . _ numero_departamento  =  d . numero_departamento
	INNER JOIN trabalha_em AS T
	EM  f . _ cpf  =  T . cpf_funcionario
	INNER JOIN projeto AS P
	EM  T. _ numero_projeto  =  P . numero_projeto
	ONDE  T. _ horas É NULO ;


-- Questão 13
    SELECT f . primeiro_nome '' f . nome_meio '' f . ultimo_nome ) AS nome_completo ,
(caso quando ( f . sexo = ' M ' ) então ' Masculino ' quando ( f . sexo = ' F ' ) então ' Feminino ' end) como sexo,		
	DATE_PART( ' ano ' , IDADE( f . data_nascimento )) AS idade
	FROM funcionario AS f							 
	
	union   									
	
	SELECT ( d . nome_dependente ) AS nome_completo ,
	(caso quando ( d . sexo = ' M ' ) então ' Masculino ' quando ( d . sexo = ' F ' ) então ' Feminino ' end) como sexo,
	DATE_PART( ' ano ' , IDADE( d . data_nascimento )) AS idade
	FROM dependente AS d							 
	ORDER BY idade DESC ;


-- Questão 14
   SELECT  d . _ nome_departamento , COUNT ( f . cpf ) AS quantidade_funcionarios 		 
	DO funcionario AS f
	INNER JOIN departamento AS d
	EM  f . _ numero_departamento  =  d . numero_departamento
	GRUPO  DE d . nome_departamento ;


-- Questão 15
          SELECT f . primeiro_nome '' f . nome_meio '' f . ultimo_nome  AS nome_funcionario, d . nome_departamento ,
P. _ nome_projeto
	DO funcionario AS f
	INNER JOIN trabalha_em AS T
	EM  f . _ cpf  =  T . cpf_funcionario
	INNER JOIN projeto AS P
	EM  T. _ numero_projeto  =  P . numero_projeto
	INNER JOIN departamento AS D
	EM  f . _ numero_departamento  =  d . numero_departamento
	ORDER BY nome_funcionario;

    


