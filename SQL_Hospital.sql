-- Criação Banco de Dados
DROP DATABASE IF EXISTS hospital;
CREATE DATABASE IF NOT EXISTS hospital;

-- Entrar no Banco de Dados
USE hospital;

-- Criação de Tabelas

CREATE TABLE convenio(
	`id_convenio` INT PRIMARY KEY AUTO_INCREMENT,
    `nome_convenio` VARCHAR(250) NOT NULL,
    `cnpj_convenio` INT(14) NOT NULL,
    `tmp_carencia_convenio` VARCHAR(45) NOT NULL
);

CREATE TABLE especialidade(
	`id_especialidade` INT PRIMARY KEY AUTO_INCREMENT,
    `nome_especialidade` VARCHAR(90) NOT NULL
);

CREATE TABLE paciente(
	`id_paciente` INT PRIMARY KEY AUTO_INCREMENT,
    `nome_paciente`  VARCHAR(250) NOT NULL,
    `dt_nasc_paciente` DATE NOT NULL,
    `email_paciente` VARCHAR(250) NOT NULL,
    `cpf_paciente` INT(11) NOT NULL,
    `rg_paciente` INT(9) NOT NULL,
    `convenio_id` INT NOT NULL,
    foreign key(convenio_id) references convenio (id_convenio) on delete cascade on update cascade
);

CREATE TABLE medico(
	`id_medico` INT PRIMARY KEY AUTO_INCREMENT,
    `nome_medico`  VARCHAR(250) NOT NULL,
    `dt_nasc_medico` DATE NOT NULL,
    `email_medico` VARCHAR(250) NOT NULL,
    `cpf_medico` INT NOT NULL,
    `crm_medico` VARCHAR(15) NOT NULL,
    `cargo_medico` VARCHAR(90) NOT NULL,
    `especialidade_id` INT NOT NULL,
    foreign key(especialidade_id) references especialidade (id_especialidade) on delete cascade on update cascade
);

CREATE TABLE telefone(
	`id_telefone` INT PRIMARY KEY AUTO_INCREMENT,
    `ddd_telefone` INT(2) NOT NULL,
    `numero_telefone` INT(9) NOT NULL,
    `paciente_id` INT,
    `medico_id` INT,
    foreign key(paciente_id) references paciente (id_paciente) on delete cascade on update cascade,
    foreign key(medico_id) references medico (id_medico) on delete cascade on update cascade
);

CREATE TABLE endereco(
	`id_endereco` INT PRIMARY KEY AUTO_INCREMENT,
    `logradouro_endereco` VARCHAR(250) NOT NULL,
    `bairro_endereco` VARCHAR(90) NOT NULL,
    `estado_endereco` VARCHAR(90) NOT NULL,
    `pais_endereco` VARCHAR(90) NOT NULL,
    `cep_endereco` INT(8) NOT NULL,
    `paciente_id` INT,
    `medico_id` INT,
    foreign key(paciente_id) references paciente (id_paciente) on delete cascade on update cascade,
    foreign key(medico_id) references medico (id_medico) on delete cascade on update cascade
);

CREATE TABLE consulta(
	`id_consulta` INT PRIMARY KEY AUTO_INCREMENT,
    `data_consulta` DATE NOT NULL,
    `medico_id` INT,
    `paciente_id` INT,
    `valor_consulta` VARCHAR(45),
    `especialidade_id` INT,
    foreign key(medico_id) references medico (id_medico) on delete cascade on update cascade,
    foreign key(paciente_id) references paciente (id_paciente) on delete cascade on update cascade,
    foreign key(especialidade_id) references especialidade (id_especialidade) on delete cascade on update cascade
);

CREATE TABLE receita(
	`id_receita` INT PRIMARY KEY AUTO_INCREMENT,
    `nome_receita` VARCHAR(250) NOT NULL,
    `medicamentos_receita` VARCHAR(250) NOT NULL,
    `qntd_medicamentos_receita` INT NOT NULL,
    `instrucoes_receita` LONGTEXT NOT NULL,
    `validade_receita` DATE,
    `consulta_id` INT,
    foreign key(consulta_id) references consulta (id_consulta) on delete cascade on update cascade
);

CREATE TABLE enfermeiro(
	`id_enfermeiro` INT PRIMARY KEY AUTO_INCREMENT,
    `nome_enfermeiro` VARCHAR(250) NOT NULL,
    `cpf_enfermeiro` INT(11) NOT NULL,
    `cre_enfermeiro` VARCHAR(15) NOT NULL
);

CREATE TABLE tipo_de_quarto(
	`id_tipo` INT PRIMARY KEY AUTO_INCREMENT,
    `valor_diaria` VARCHAR(20),
    `descricao_tipo` LONGTEXT NOT NULL
);

CREATE TABLE quarto(
	`id_quarto` INT PRIMARY KEY AUTO_INCREMENT,
    `numeracao_quarto` INT NOT NULL,
    `tipo_id` INT,
    foreign key(tipo_id) references tipo_de_quarto (id_tipo) on delete cascade on update cascade
);

CREATE TABLE internacao(
	`id_internacao` INT PRIMARY KEY AUTO_INCREMENT,
    `entrada_internacao` DATE NOT NULL,
    `prev_alta_internacao` DATE NOT NULL,
    `saida_internacao` DATE NOT NULL,
    `procedimentos_internacao` LONGTEXT NOT NULL,
    `paciente_id` INT,
    `medico_id` INT,
    `quarto_id` INT,
    `enfermeiro_id` INT,
    foreign key(paciente_id) references paciente (id_paciente) on delete cascade on update cascade,
    foreign key(medico_id) references medico (id_medico) on delete cascade on update cascade,
    foreign key(quarto_id) references quarto (id_quarto) on delete cascade on update cascade,
    foreign key(enfermeiro_id) references enfermeiro (id_enfermeiro) on delete cascade on update cascade
);

-- Inserir os tipos de quartos

INSERT INTO tipo_de_quarto(valor_diaria, descricao_tipo) VALUES ('R$500,00', 'Apartamento');
INSERT INTO tipo_de_quarto(valor_diaria, descricao_tipo) VALUES ('R$250,00', 'Duplo');
INSERT INTO tipo_de_quarto(valor_diaria, descricao_tipo) VALUES ('R$100,00', 'Enfermaria');

-- Inserir os convênios

INSERT INTO convenio(nome_convenio, cnpj_convenio, tmp_carencia_convenio) VALUES ('Unimed', '12345678', '8 meses');
INSERT INTO convenio(nome_convenio, cnpj_convenio, tmp_carencia_convenio) VALUES ('Amil', '98765432', '5 anos');
INSERT INTO convenio(nome_convenio, cnpj_convenio, tmp_carencia_convenio) VALUES ('Notredame Intermédica', '87654321', '74 horas');
INSERT INTO convenio(nome_convenio, cnpj_convenio, tmp_carencia_convenio) VALUES ('SulAmérica Saúde', '2345678', '10 anos');

-- Inserir as especialidades 

INSERT INTO especialidade(nome_especialidade) VALUES ('Pediatria');
INSERT INTO especialidade(nome_especialidade) VALUES ('Clínica Geral');
INSERT INTO especialidade(nome_especialidade) VALUES ('Gastrenterologia');
INSERT INTO especialidade(nome_especialidade) VALUES ('Dermatologia');
INSERT INTO especialidade(nome_especialidade) VALUES ('Oftalmologia');
INSERT INTO especialidade(nome_especialidade) VALUES ('Endocrinologia');
INSERT INTO especialidade(nome_especialidade) VALUES ('Cardiologia');

-- Inserir os médicos

INSERT INTO medico(nome_medico, dt_nasc_medico, email_medico, cpf_medico, crm_medico, cargo_medico, especialidade_id) VALUES ('Sofia Oliveira', '1990-01-01', 'sofiaoliveira@gmail.com', '124565', 'AB1845', 'Residente', 3);
INSERT INTO medico(nome_medico, dt_nasc_medico, email_medico, cpf_medico, crm_medico, cargo_medico, especialidade_id) VALUES ('Lucas Santos', '1989-02-02', 'lucassantos@gmail.com', '186355', 'KJ2547', 'Residente', 5);
INSERT INTO medico(nome_medico, dt_nasc_medico, email_medico, cpf_medico, crm_medico, cargo_medico, especialidade_id) VALUES ('Isabella Costa', '1997-03-03', 'isabellacosta@gmail.com', '721562', 'LA2546', 'Residente', 7);
INSERT INTO medico(nome_medico, dt_nasc_medico, email_medico, cpf_medico, crm_medico, cargo_medico, especialidade_id) VALUES ('Pedro Almeida', '1976-04-4', 'pedroalmeida@gmail.com', '348541', 'YU0485', 'Residente', 2);
INSERT INTO medico(nome_medico, dt_nasc_medico, email_medico, cpf_medico, crm_medico, cargo_medico, especialidade_id) VALUES ('Carolina Pereira', '1984-05-05', 'carolinapereira@gmail.com', '548995', 'GH4547', 'Interno', 1);
INSERT INTO medico(nome_medico, dt_nasc_medico, email_medico, cpf_medico, crm_medico, cargo_medico, especialidade_id) VALUES ('Gabriel Fernandes', '1991-06-06', 'gabrielfernandes@gmail.com', '924562', 'BG9874', 'Interno', 1);
INSERT INTO medico(nome_medico, dt_nasc_medico, email_medico, cpf_medico, crm_medico, cargo_medico, especialidade_id) VALUES ('Laura Rodrigues', '1988-07-07', 'laurarodrigues@gmail.com', '165215', 'QH7842', 'Interno', 4);
INSERT INTO medico(nome_medico, dt_nasc_medico, email_medico, cpf_medico, crm_medico, cargo_medico, especialidade_id) VALUES ('Rafaela Silva', '1979-08-08', 'rafaelasilva@gmail.com', '654187', 'BN5489', 'Especialista', 5);
INSERT INTO medico(nome_medico, dt_nasc_medico, email_medico, cpf_medico, crm_medico, cargo_medico, especialidade_id) VALUES ('Matheus Sousa', '2001-09-09', 'matheussousa@gmail.com', '284854', 'ZJ3214', 'Especialista', 3);
INSERT INTO medico(nome_medico, dt_nasc_medico, email_medico, cpf_medico, crm_medico, cargo_medico, especialidade_id) VALUES ('Beatriz Carvalho', '1999-10-20', 'beatrizcarvalho@gmail.com', '123456', 'ZY9876', 'Especialista', 7);

-- Inserir os pacientes

INSERT INTO paciente(nome_paciente, dt_nasc_paciente, email_paciente, cpf_paciente, rg_paciente, convenio_id) VALUES ('Valentina Cardoso', '2004-05-25', 'valentinacardoso@gmail.com', '123548', '158', 4);
INSERT INTO paciente(nome_paciente, dt_nasc_paciente, email_paciente, cpf_paciente, rg_paciente, convenio_id) VALUES ('João Carvalho', '1970-06-17', 'joaocarvalho@gmail.com', '627814', '698', 2);
INSERT INTO paciente(nome_paciente, dt_nasc_paciente, email_paciente, cpf_paciente, rg_paciente, convenio_id) VALUES ('Manuela Ferreira', '1996-11-29', 'manuelaferreira@gmail.com', '587406', '210', 1);
INSERT INTO paciente(nome_paciente, dt_nasc_paciente, email_paciente, cpf_paciente, rg_paciente, convenio_id) VALUES ('Miguel Gomes', '1987-01-30', 'miguelgomes@gmail.com', '205874', '145', 1);
INSERT INTO paciente(nome_paciente, dt_nasc_paciente, email_paciente, cpf_paciente, rg_paciente, convenio_id) VALUES ('Alice Ribeiro', '2012-08-06', 'aliceribeiro@gmail.com', '182146', '984', 3);
INSERT INTO paciente(nome_paciente, dt_nasc_paciente, email_paciente, cpf_paciente, rg_paciente, convenio_id) VALUES ('Guilherme Martins', '2008-09-14', 'guilhermemartins@gmail.com', '982214', '752', 2);
INSERT INTO paciente(nome_paciente, dt_nasc_paciente, email_paciente, cpf_paciente, rg_paciente, convenio_id) VALUES ('Helena Sousa', '2001-02-27', 'helenasousa@gmail.com', '305708', '771', 3);
INSERT INTO paciente(nome_paciente, dt_nasc_paciente, email_paciente, cpf_paciente, rg_paciente, convenio_id) VALUES ('Enzo Lima', '1983-03-31', 'enzolima@gmail.com', '578962', '654', 4);
INSERT INTO paciente(nome_paciente, dt_nasc_paciente, email_paciente, cpf_paciente, rg_paciente, convenio_id) VALUES ('Matheus Rodrigues', '1998-06-09', 'matheusrodrigues@gmail.com', '302541', '025', 4);
INSERT INTO paciente(nome_paciente, dt_nasc_paciente, email_paciente, cpf_paciente, rg_paciente, convenio_id) VALUES ('Lara Costa', '2000-12-30', 'laracosta@gmail.com', '984150', '980', 1);
INSERT INTO paciente(nome_paciente, dt_nasc_paciente, email_paciente, cpf_paciente, rg_paciente, convenio_id) VALUES ('Noah Foster', '1960-04-06', 'noahfoster@gmail.com', '478621', '435', 3);
INSERT INTO paciente(nome_paciente, dt_nasc_paciente, email_paciente, cpf_paciente, rg_paciente, convenio_id) VALUES ('Arthur Cervero', '1992-06-22', 'arthurcervero@gmail.com', '156201', '158', 4);
INSERT INTO paciente(nome_paciente, dt_nasc_paciente, email_paciente, cpf_paciente, rg_paciente, convenio_id) VALUES ('Cesar Cohen', '1990-01-05', 'angelofthenight@gmail.com', '545695', '666', 2);
INSERT INTO paciente(nome_paciente, dt_nasc_paciente, email_paciente, cpf_paciente, rg_paciente, convenio_id) VALUES ('Thiago Fritz', '1986-01-01', 'thiagofritz@gmail.com', '849621', '328', 2);
INSERT INTO paciente(nome_paciente, dt_nasc_paciente, email_paciente, cpf_paciente, rg_paciente, convenio_id) VALUES ('Elizabeth Webber', '1992-01-03', 'lizwebber@gmail.com', '010203', '012', 3);

-- Inserir os telefones

INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('11', '95551234', 1, null);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('11', '95555678', 2, null);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('11', '95559876', 3, null);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('12', '95552468', 4, null);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('12', '95554321', 5, null);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('13', '95557890', 6, null);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('47', '95556543', 7, null);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('67', '95558765', 8, null);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('91', '95551357', 9, null);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('91', '95558642', 10, null);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('91', '95559753', 11, null);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('68', '95553186', 12, null);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('68', '95556247', 13, null);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('68', '95557530', 14, null);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('27', '95554019', 15, null);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('27', '95558092', null, 1);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('21', '95559134', null, 2);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('21', '95552876', null, 3);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('21', '95556172', null, 4);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('32', '95553409', null, 5);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('32', '95557268', null, 6);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('32', '95559413', null, 7);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('32', '95555720', null, 8);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('32', '95554806', null, 9);
INSERT INTO telefone(ddd_telefone, numero_telefone, paciente_id, medico_id) VALUES ('32', '95556379', null, 10);

-- Inserir os endereços

INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Praça das Flores', 'Jardim Primavera', 'São Paulo', 'Brasil', '01234567', 1, null);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Avenida da Esperança', 'Centro', 'Rio de Janeiro', 'Brasil', '04567890', 2, null);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Avenida dos Ventos', 'Bela Vista', 'Minas Gerais', 'Brasil', '02345678', 3, null);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Rua das Flores', 'Jardim Botânico', 'Rio Grande do Norte', 'Brasil', '05678901', 4, null);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Avenida dos Sonhos', 'Vila Nova', 'São Paulo', 'Brasil', '03456789', 5, null);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Praça da Liberdade', 'Praia de Iracema', 'Ceará ', 'Brasil', '06789012', 6, null);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Rua das Palmeiras', 'Praia de Copacabana', 'Rio de Janeiro', 'Brasil', '07890123', 7, null);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Avenida do Sol', 'Boa Vista', 'São Paulo', 'Brasil', '05678901', 8, null);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Rua das Montanhas', 'Lagoa Azul', 'Rio Grande do Norte', 'Brasil', '01234567', 9, null);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Praça da Paz', 'Parque Feliz', 'Rio Grande do Sul', 'Brasil', '04567890', 10, null);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Avenida das Estrelas', 'Lagoa Verde', 'Minas Gerais', 'Brasil', '02345678', 11, null);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Rua das Águas', 'Centro', 'Rio de Janeiro', 'Brasil', '05678901', 12, null);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Avenida da Esperança', 'Centro', 'Rio de Janeiro', 'Brasil', '03456789', 13, null);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Rua do Sol', 'Praia Azul', 'Santa Catarina', 'Brasil', '06789012', 14, null);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Praça das Árvores', 'Centro', 'São Paulo', 'Brasil', '07890123', 15, null);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Avenida dos Ventos', 'Jardim Botânico', 'Goiás', 'Brasil', '05678901', null, 1);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Rua das Montanhas', 'Jardim Botânico', 'Goiás', 'Brasil', '01234567', null, 2);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Praça da Alegria', 'Vila Nova', 'Rio de Janeiro', 'Brasil', '04567890', null, 3);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Avenida das Ondas', 'Praia Laranja', 'Rio Grande do Norte', 'Brasil', '02345678', null, 4);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Rua das Estrelas', 'Jardim Celestial', 'São Paulo', 'Brasil', '03456789', null, 5);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Rua da Alegria', 'Centro Histórico', 'Bahia', 'Brasil', '06789012', null, 6);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Praça do Sol', 'Jardim Celestial', 'São Paulo', 'Brasil', '07890123', null, 7);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Avenida das Águas', 'Centro Histórico', 'Bahia', 'Brasil', '05678901', null, 8);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Rua do Amor', 'Lagoa Verde', 'Minas Gerais', 'Brasil', '01234567', null, 9);
INSERT INTO endereco(logradouro_endereco, bairro_endereco, estado_endereco, pais_endereco, cep_endereco, paciente_id, medico_id) VALUES ('Rua do Ódio', 'Jardim Celestial', 'São Paulo', 'Brasil', '04567890', null, 10);

-- Inserir as consultas

INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2015-01-05', 1, 13, 'R$200,9', 2);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2015-03-24', 10, 1, 'R$199,9', 5);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2015-06-26', 1, 12, 'R$58,9', 6);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2016-05-15', 9, 8, 'R$699,2', 4);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2016-11-09', 2, 1, 'R$1000,0', 1);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2017-08-11', 8, 15, 'R$32.000,21', 7);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2017-12-29', 3, 3, 'R$45,9', 3);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2018-03-31', 7, 5, 'R$32,9', 1);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2018-06-14', 4, 9, 'R$232,9', 3);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2018-09-17', 6, 6, 'R$469,9', 2);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2019-02-08', 5, 4, 'R$75,9', 6);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2019-08-09', 5, 12, 'R$235,9', 6);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2019-10-15', 6, 2, 'R$765,8', 5);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2020-01-30', 4, 11, 'R$234,8', 1);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2020-07-21', 7, 8, 'R$21,9', 1);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2021-04-05', 3, 3, 'R$274,9', 2);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2021-08-12', 2, 15, 'R$19.989,0', 7);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2021-12-22', 8, 15, 'R$21,323.9', 7);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2022-01-01', 9, 9, 'R$123,4', 2);
INSERT INTO consulta(data_consulta, medico_id, paciente_id, valor_consulta, especialidade_id) VALUES ('2022-01-01', 1, 10, 'R$543,2', 4);

-- Inserir as receitas

INSERT INTO receita(nome_receita, medicamentos_receita, qntd_medicamentos_receita, instrucoes_receita, validade_receita, consulta_id) VALUES ('Cesar Cohen', 'Tranquilomax, Alleviax e Revitalidex', '5', 'Tomar tranquilomax 1 dose a cada 12h. Dissolver Alleviax em água quente e tomar a cada 24h. Revitalidex tomar 2 a cada 8h. ', '2017-02-15', 1);
INSERT INTO receita(nome_receita, medicamentos_receita, qntd_medicamentos_receita, instrucoes_receita, validade_receita, consulta_id) VALUES ('Enzo Lima', 'Nervacalm e Respiroforte', '6', 'Nervocalm tomar 1 a cada 24h. Respiroforte tomar 6 em 6h.', '2019-06-10', 4);
INSERT INTO receita(nome_receita, medicamentos_receita, qntd_medicamentos_receita, instrucoes_receita, validade_receita, consulta_id) VALUES ('Valentina Cardoso', 'Regenerex, Dermacurex', '3', 'Regenerex tomar 1 a cada 72h. Dermacurex passar na pele todo dia de manhã, antes de pegar sol.', '2018-11-20', 5);
INSERT INTO receita(nome_receita, medicamentos_receita, qntd_medicamentos_receita, instrucoes_receita, validade_receita, consulta_id) VALUES ('Manuela Ferreira', 'Cardioprotec e Hepatovitae', '5', 'Cardioprotec tomar 3 comprimidos de 2 em 2h. Hepatovitae tomar quando sentir dor no estômago.', '2020-04-25', 7);
INSERT INTO receita(nome_receita, medicamentos_receita, qntd_medicamentos_receita, instrucoes_receita, validade_receita, consulta_id) VALUES ('Matheus Rodrigues', 'Osteoflex e Imunoguard', '8', 'Osteoflex tomar 70ml de 12 em 12h. Imunoguard tomar antes do almoço e da janta.', '2021-07-30', 9);
INSERT INTO receita(nome_receita, medicamentos_receita, qntd_medicamentos_receita, instrucoes_receita, validade_receita, consulta_id) VALUES ('Alice Ribeiro', 'Analgexil e Neurovital', '2', 'Analgexil tomar de 8 em 8h. Neurovital tomar 30ml a cada 2h.', '2022-08-10', 11);
INSERT INTO receita(nome_receita, medicamentos_receita, qntd_medicamentos_receita, instrucoes_receita, validade_receita, consulta_id) VALUES ('Noah Foster', 'Digestinex e Pulmosan', '9', 'Digestinex tomar 1 comprimido a cada 24h. Pulmosan tomar 2 comprimidos de 7 em 7 dias.', '2024-01-20', 14);
INSERT INTO receita(nome_receita, medicamentos_receita, qntd_medicamentos_receita, instrucoes_receita, validade_receita, consulta_id) VALUES ('Elizabeth Webber', 'Visioclare e Diuremax', '3', 'Visioclare pingar 5 gostas quando ressecar o olho. Diuremax tomar de 4 em 4h.', '2025-09-01', 16);
INSERT INTO receita(nome_receita, medicamentos_receita, qntd_medicamentos_receita, instrucoes_receita, validade_receita, consulta_id) VALUES ('Elizabeth Webber', 'Estabilol e Antiallerdex', '2', 'Estabilol tomar 15ml a cada 8 em 8h. Antialledrex tomar 2 comprimidos em 24 em 24h', '2024-11-30', 17);
INSERT INTO receita(nome_receita, medicamentos_receita, qntd_medicamentos_receita, instrucoes_receita, validade_receita, consulta_id) VALUES ('Lara Costa', 'Hiperfocusan e Ansiodoron', '6', 'Hiperfocusan pingar 3 gostas quando ressecar o olho. Ansiodoron tomar todo dia antes de dormir.', '2026-10-01', 20);

-- Inserir os enfermeiros

INSERT INTO enfermeiro(nome_enfermeiro, cpf_enfermeiro, cre_enfermeiro) VALUES ('Ethan Sullivan', '254895', '1001');
INSERT INTO enfermeiro(nome_enfermeiro, cpf_enfermeiro, cre_enfermeiro) VALUES ('Isabella Martinez', '234451', '1002');
INSERT INTO enfermeiro(nome_enfermeiro, cpf_enfermeiro, cre_enfermeiro) VALUES ('Alexander Schmidt', '548954', '1003');
INSERT INTO enfermeiro(nome_enfermeiro, cpf_enfermeiro, cre_enfermeiro) VALUES ('Charlie Müller', '145563', '1004');
INSERT INTO enfermeiro(nome_enfermeiro, cpf_enfermeiro, cre_enfermeiro) VALUES ('Sebastian Rodriguez', '785684', '1005');
INSERT INTO enfermeiro(nome_enfermeiro, cpf_enfermeiro, cre_enfermeiro) VALUES ('Olivia Nguyen', '9877221', '1006');
INSERT INTO enfermeiro(nome_enfermeiro, cpf_enfermeiro, cre_enfermeiro) VALUES ('Gabriel Kim', '457562', '1007');
INSERT INTO enfermeiro(nome_enfermeiro, cpf_enfermeiro, cre_enfermeiro) VALUES ('Mia Yamamoto', '489543', '1008');
INSERT INTO enfermeiro(nome_enfermeiro, cpf_enfermeiro, cre_enfermeiro) VALUES ('Julian Alves', '354851', '1009');
INSERT INTO enfermeiro(nome_enfermeiro, cpf_enfermeiro, cre_enfermeiro) VALUES ('Amelia Costa', '458785', '1100');

-- Inserir os quartos

INSERT INTO quarto(numeracao_quarto, tipo_id) VALUES ('102', 3);
INSERT INTO quarto(numeracao_quarto, tipo_id) VALUES ('102', 3);
INSERT INTO quarto(numeracao_quarto, tipo_id) VALUES ('102', 3);
INSERT INTO quarto(numeracao_quarto, tipo_id) VALUES ('208', 2);
INSERT INTO quarto(numeracao_quarto, tipo_id) VALUES ('208', 2);
INSERT INTO quarto(numeracao_quarto, tipo_id) VALUES ('309', 1);
INSERT INTO quarto(numeracao_quarto, tipo_id) VALUES ('309', 1);

-- Inserir as internações

INSERT INTO internacao(entrada_internacao, prev_alta_internacao, saida_internacao, procedimentos_internacao, paciente_id, medico_id, quarto_id, enfermeiro_id) VALUES ('2015-05-01', '2015-07-01', '2015-07-01', 'Admissão, Avaliação, Acomodação, Exames e Tratamento', 2, 4, 6, 5);
INSERT INTO internacao(entrada_internacao, prev_alta_internacao, saida_internacao, procedimentos_internacao, paciente_id, medico_id, quarto_id, enfermeiro_id) VALUES ('2016-06-05', '2016-06-30', '2016-07-04', 'Admissão, Avaliação, Acomodação, Exames e Tratamento', 3, 8, 3, 1);
INSERT INTO internacao(entrada_internacao, prev_alta_internacao, saida_internacao, procedimentos_internacao, paciente_id, medico_id, quarto_id, enfermeiro_id) VALUES ('2017-07-14', '2017-09-20', '2017-09-23', 'Admissão, Avaliação, Acomodação, Exames e Tratamento', 6, 1, 1, 2);
INSERT INTO internacao(entrada_internacao, prev_alta_internacao, saida_internacao, procedimentos_internacao, paciente_id, medico_id, quarto_id, enfermeiro_id) VALUES ('2018-08-20', '2018-09-08', '2018-09-17', 'Admissão, Avaliação, Acomodação, Exames e Tratamento', 9, 9, 4, 8);
INSERT INTO internacao(entrada_internacao, prev_alta_internacao, saida_internacao, procedimentos_internacao, paciente_id, medico_id, quarto_id, enfermeiro_id) VALUES ('2019-09-30', '2019-10-19', '2020-01-06', 'Admissão, Avaliação, Acomodação, Exames e Tratamento', 2, 10, 7, 6);
INSERT INTO internacao(entrada_internacao, prev_alta_internacao, saida_internacao, procedimentos_internacao, paciente_id, medico_id, quarto_id, enfermeiro_id) VALUES ('2020-10-31', '2021-11-15', '2021-12-03', 'Admissão, Avaliação, Acomodação, Exames e Tratamento', 6, 2, 2, 4);
INSERT INTO internacao(entrada_internacao, prev_alta_internacao, saida_internacao, procedimentos_internacao, paciente_id, medico_id, quarto_id, enfermeiro_id) VALUES ('2021-11-18', '2021-12-29', '2022-01-01', 'Admissão, Avaliação, Acomodação, Exames e Tratamento', 13, 5, 5, 9);

ALTER TABLE medico ADD atividade_medico VARCHAR(20);
UPDATE medico SET atividade_medico = 'Ativo' WHERE nome_medico = 'Sofia Oliveira';
UPDATE medico SET atividade_medico = 'Ativo' WHERE nome_medico = 'Lucas Santos';
UPDATE medico SET atividade_medico = 'Ativo' WHERE nome_medico = 'Isabella Costa';
UPDATE medico SET atividade_medico = 'Inativo' WHERE nome_medico = 'Pedro Almeida';
UPDATE medico SET atividade_medico = 'Ativo' WHERE nome_medico = 'Carolina Pereira';
UPDATE medico SET atividade_medico = 'Inativo' WHERE nome_medico = 'Gabriel Fernandes';
UPDATE medico SET atividade_medico = 'Ativo' WHERE nome_medico = 'Laura Rodrigues';
UPDATE medico SET atividade_medico = 'Ativo' WHERE nome_medico = 'Rafaela Silva';
UPDATE medico SET atividade_medico = 'Ativo' WHERE nome_medico = 'Matheus Sousa';
UPDATE medico SET atividade_medico = 'Inativo' WHERE nome_medico = 'Beatriz Carvalho';