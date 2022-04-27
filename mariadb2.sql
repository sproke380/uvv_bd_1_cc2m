USE uvv;
CREATE TABLE funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(60),
                sexo CHAR(1) CHECK (sexo = 'M' OR sexo = 'F'),
                salario DECIMAL(10,2) CHECK (salario >= 0),
                cpf_supervisor CHAR(11) CHECK (cpf_supervisor != cpf),
                numero_departamento INT NOT NULL CHECK (numero_departamento >= 0),
                CONSTRAINT pk_funcionario PRIMARY KEY (cpf)
);

ALTER TABLE funcionario;

ALTER TABLE funcionario MODIFY COLUMN cpf CHAR(11) NOT NULL;

ALTER TABLE funcionario MODIFY COLUMN primeiro_nome VARCHAR(15) NOT NULL;

ALTER TABLE funcionario MODIFY COLUMN nome_meio CHAR(1) ;

ALTER TABLE funcionario MODIFY COLUMN ultimo_nome VARCHAR(15) NOT NULL;

ALTER TABLE funcionario MODIFY COLUMN data_nascimento DATE;

ALTER TABLE funcionario MODIFY COLUMN endereco VARCHAR(60);

ALTER TABLE funcionario MODIFY COLUMN sexo CHAR(1) CHECK (sexo = 'M' OR sexo = 'F');

ALTER TABLE funcionario MODIFY COLUMN salario DECIMAL(10, 2) CHECK (salario >= 0) ;

ALTER TABLE funcionario MODIFY COLUMN cpf_supervisor CHAR(11) CHECK (cpf_supervisor != cpf);

ALTER TABLE funcionario MODIFY COLUMN numero_departamento INTEGER NOT NULL CHECK (numero_departamento >= 0);

CREATE TABLE departamento (
                numero_departamento INT NOT NULL,
                nome_departamento VARCHAR(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                CONSTRAINT pk_departamento PRIMARY KEY (numero_departamento)
);

ALTER TABLE departamento MODIFY COLUMN numero_departamento INTEGER NOT NULL;

ALTER TABLE departamento MODIFY COLUMN nome_departamento VARCHAR(15) NOT NULL;

ALTER TABLE departamento MODIFY COLUMN cpf_gerente CHAR(11) NOT NULL ';

ALTER TABLE departamento MODIFY COLUMN data_inicio_gerente DATE;

CREATE UNIQUE INDEX ak_departamento
 ON departamento
 ( nome_departamento );

CREATE TABLE dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo CHAR(1) CHECK (sexo = 'M' OR sexo = 'F'),
                data_nascimento DATE,
                parentesco VARCHAR(15),
                CONSTRAINT pk_dependente PRIMARY KEY (cpf_funcionario, nome_dependente)
);

ALTER TABLE dependente MODIFY COLUMN cpf_funcionario CHAR(11) NOT NULL ;

ALTER TABLE dependente MODIFY COLUMN nome_dependente VARCHAR(15) NOT NULL;

ALTER TABLE dependente MODIFY COLUMN sexo CHAR(1) CHECK (sexo = 'M' OR sexo = 'F');

ALTER TABLE dependente MODIFY COLUMN data_nascimento DATE;

ALTER TABLE dependente MODIFY COLUMN parentesco VARCHAR(15);

CREATE TABLE localizacoes_departamento (
                numero_departamento INT NOT NULL CHECK (numero_departamento >= 0),
                local VARCHAR(15) NOT NULL,
                PRIMARY KEY (numero_departamento, local)
);

ALTER TABLE localizacoes_departamento MODIFY COLUMN numero_departamento INTEGER NOT NULL CHECK (numero_departamento >= 0);

ALTER TABLE localizacoes_departamento MODIFY COLUMN local VARCHAR(15) NOT NULL';

CREATE TABLE trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto INT NOT NULL CHECK (numero_projeto >= 0),
                horas DECIMAL(3,1) CHECK (horas >= 0),
                CONSTRAINT pk_trabalha_em PRIMARY KEY (cpf_funcionario, numero_projeto)
);


ALTER TABLE trabalha_em MODIFY COLUMN cpf_funcionario CHAR(11) NOT NULL ';

ALTER TABLE trabalha_em MODIFY COLUMN numero_projeto INTEGER  NOT NULL CHECK (numero_projeto >= 0);

ALTER TABLE trabalha_em MODIFY COLUMN horas DECIMAL(3, 1) CHECK (horas >= 0);

CREATE TABLE projeto (
                numero_projeto INT NOT NULL CHECK (numero_projeto >= 0),
                nome_projeto VARCHAR(15) NOT NULL,
                local_projeto VARCHAR(15) ,
                numero_departamento INT NOT NULL CHECK (numero_departamento >= 0),
                PRIMARY KEY (numero_projeto)
);

ALTER TABLE projeto MODIFY COLUMN numero_projeto INTEGER NOT NULL CHECK (numero_projeto >= 0);

ALTER TABLE projeto MODIFY COLUMN nome_projeto VARCHAR(15) NOT NULL;

ALTER TABLE projeto MODIFY COLUMN local_projeto VARCHAR(15)';

ALTER TABLE projeto MODIFY COLUMN numero_departamento INTEGER NOT NULL CHECK (numero_departamento >= 0);

CREATE UNIQUE INDEX ak_projeto
 ON projeto
 ( nome_projeto );

ALTER TABLE dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionari (cpf)
ON DELETE cascade
ON UPDATE cascade;

ALTER TABLE funcionario ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES funcionario (cpf)
ON DELETE cascade
ON UPDATE cascade;

ALTER TABLE trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE cascade
ON UPDATE cascade;

ALTER TABLE departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES funcionario (cpf)
ON DELETE cascade
ON UPDATE cascade;

ALTER TABLE localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE cascade
ON UPDATE cascade;

ALTER TABLE projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE cascade
ON UPDATE cascade;

ALTER TABLE trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES projeto (numero_projeto)
ON DELETE cascade
ON UPDATE cascade;

INSERT INTO funcionario(primeiro_nome,nome_meio,ultimo_nome,cpf,data_nascimento,endereco,sexo,salario,cpf_supervisor,numero_departamento) VALUES
	('Jorge','E','Brito','88866555576','1937-11-10','R.do Horto,35,São Paulo,SP','M',55000,null,1),
	('Fernando','T','Wong','33344555587','1955-12-08','R.da Lapa,34,São Paulo,SP','M',40000,'88866555576',5),
	('João','B','Silva','12345678966','1965-01-09','R.das Flores,751,São Paulo,SP','M',30000,'33344555587',5),
	('Jennifer','S','Souza','98765432168','1941-06-20','Av. Arthur de Lima,54,Santo André,SP','F',43000,'88866555576',4),
	('Ronaldo','K','Lima','66688444476','1962-09-15','R.Rebouças,65,Piracicaba,SP','M',38000,'33344555587',5),
	('Joice','A','Leite','45345345376','1972-07-31','Av.Lucas Obes,74,São Paulo,SP','F',25000,'33344555587',5),
	('André','V','Perreira','98798798733','1969-03-29','R.Timbira,35,São Paulo,SP','M',25000,'98765432168',4),
	('Alice','J','Zelaya','99988777767','1968-01-19','R.Souza Lima,35,Curitiba,PR','F',25000,'98765432168',4);

INSERT INTO departamento(nome_departamento,numero_departamento,cpf_gerente,data_inicio_gerente) VALUES
	('Pesquisa',5,'33344555587','1988-05-22'),
	('Administração',4,'98765432168','1995-01-01'),
	('Matriz',1,'88866555576','1981-06-19');

INSERT INTO localizacoes_departamento(numero_departamento,local) VALUES
	(1,'São Paulo'),
	(4,'Mauá'),
	(5,'Santo André'),
	(5,'Itu'),
(	5,'São Paulo');

INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento) VALUES
   	('ProdutoX', 1, 'Santo André', 5),
   	('ProdutoY', 2, 'Itu', 5),
   	('ProdutoZ', 3, 'São Paulo', 5),
   	('Informatização', 10, 'Maué', 4),
   	('Reorganização', 20, 'São Paulo', 1),
   	('Novosbenefícios', 30, 'Mauá', 4);

INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES
	('33344555587', 'Alicia', 'F', '1986-04-05', 'Filha'),
   	('33344555587', 'Tiago', 'M', '1983-10-25', 'Filho'),
   	('33344555587', 'Janaína', 'F', '1958-05-03', 'Esposa'),
   	('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido'),
   	('12345678966', 'Michael', 'M','1988-01-04', 'Filho'),
	('12345678966', 'Alicia', 'F', '1988-12-30', 'Filha'),
    	('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');

INSERT INTO trabalha_em (cpf_funcionario,numero_projeto,horas) VALUES
  	('12345678966', 1, 32.5),
  	('12345678966', 2, 7.5),
   	('66688444476', 3, 40.0),
   	('45345345376', 1, 20.0),
   	('45345345376', 2, 20.0),
   	('33344555587', 2, 10.0),
   	('33344555587', 3, 10.0),
   	('33344555587', 10, 10.0),
   	('33344555587', 20, 10.0),
   	('99988777767', 30, 30.0),
   	('99988777767', 10, 10.0),
   	('98798798733', 10, 35.0),
   	('98798798733', 30, 5.0),
   	('98765432168', 30, 20.0),
   	('98765432168', 20, 15.0),
   	('88866555576', 20, null);
