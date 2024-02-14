# Hospital Database Management System

O Hospital Database Management System é um projeto dedicado à criação de um banco de dados eficiente e seguro para armazenar informações vitais de pacientes, médicos e interações dentro de um ambiente hospitalar. Desde o desenvolvimento do Diagrama de Entidade-Relacionamento (ER) até a implementação do banco de dados em SQL, este projeto visa oferecer uma solução abrangente e bem-estruturada para as necessidades de gerenciamento de dados de um hospital.

## Objetivo do Projeto:

O principal objetivo deste projeto é fornecer uma plataforma robusta para o armazenamento e gerenciamento de informações críticas em um ambiente hospitalar. O banco de dados resultante é projetado para ser eficiente, seguro e altamente escalável, capaz de lidar com grandes volumes de dados enquanto mantém a integridade e a confidencialidade dos registros dos pacientes e outras informações sensíveis.

## Sumário

- [Simples](#parte-1)
- [Avançado](#parte-2)
- [Alimentação](#parte-3)
- [Alterações](#parte-4)
- [Licença](#licença)

## Parte 1

Para ajudar nas tarefas diárias da área clínica, foi feito o planejamento de um sistema que é capaz de controlar consultas realizadas. Atualmente, parte da operação ainda se apoia em planilhas e arquivos antigos, mas logo que este projeto for criado, os dados serão transferido para ele quando estiver funcional. Os médicos podem ser generalistas, especialistas ou residentes e têm seus dados pessoais cadastrados em tabelas digitais. Além de suas especialidades que podem ser uma ou mais, como por exemplo: pediatria, clínica geral, gastroenterologia e dermatologia.

Os pacientes também são cadastrados contendo dados pessoais (nome, data de nascimento, endereço, telefone e e-mail), documentos (CPF e RG) e o convênio, que é separado para cada nome, CNPJ e tempo de carência de cada paciente.

Por fim, as consultas são registradas com data e hora de realização, médico responsável, paciente, valor da consulta e a especialidade buscada pelo paciente. Logo após esta realização, será disponibilizada a receita de medicamentos que contém os medicamentos, a quantidade e as instruções de uso.

<div align=center>
  <img src="https://github.com/DvlprMatheus/SQL-Hospital/assets/125493286/f1feab9c-9de3-4d90-8594-54a3458ef325" alt="Hospital Model">
</div>

## Parte 2

Agora, imagine que as internações também são armazenadas em formulários digitais, gravando todos os dados. O ideal é que adicione no seu banco algumas tabelas, como por exemplo:

- <b>Internações</b> : Onde para cada uma são registrados a data de entrada, a data prevista de alta e a data efetiva de alta, além da descrição textual dos procedimentos a serem realizados.
- <b>Enfermeiros(as)</b> : É necessário controlar quais profissionais de enfermaria estarão responsáveis por acompanhar o paciente durante sua internação. Para cada enfermeiro(a), é necessário nome, CPF e registro no conselho de enfermagem (CRE).
- <b>Quartos</b> : Aqui serão feitos os gerenciamentos de ocupação, anotando qual a numeração e o tipo.
- <b>Tipo de Quartos</b> : Existem variações e todas tem sua descrição e o seu valor diário (a princípio, o hospital trabalha com apartamentos, quartos duplos e enfermaria).

E com isso, faça a ligação do diagrama acima ao diagrama desenvolvido na seção antrior, construindo relacionamentos com entidades relacionadas.

<div align=center>
  <img src="https://github.com/DvlprMatheus/SQL-Hospital/assets/125493286/bff7fecc-de33-41c8-a028-a9671bf7ab94" alt="Hospital Model2">
</div>

## Parte 3

Nessa parte, nós iremos construir o sistema realizado no último diagrama, enquanto corrige alguns erros que podem ter sido cometidos na parte conceitual. E para isso, você pode utilizar o MySQL Workbench ou UwAmp (phpMyAdmin), que são os softwares mais utilizados para trabalhar com banco. Após abrir o programa, comece criando todas as entidades e fazendo as relações corretamente, quando finalizar, para transferir os dados você irá seguir esta lista:

- Inclua ao menos dez médicos de diferentes especialidades.
- Ao menos sete especialidades (considere a afirmação de que “entre as especialidades há pediatria, clínica geral, gastrenterologia e dermatologia”).
- Inclua ao menos 15 pacientes.
- Registre 20 consultas de diferentes pacientes e diferentes médicos (alguns pacientes realizam mais que uma consulta). As consultas devem ter ocorrido entre 01/01/2015 e 01/01/2022. Ao menos dez consultas devem ter receituário com dois ou mais medicamentos.
- Inclua ao menos quatro convênios médicos, associe ao menos cinco pacientes.
- Criar entidade de relacionamento entre médico e especialidade.
- Criar Entidade de relacionamento entre internação e enfermeiro.
- Arrumar a chave estrangeira do relacionamento entre convênio e médico.
- Criar entidade entre internação e enfermeiro.
- Colocar chaves estrangeira dentro da internação (Chaves Médico e Paciente).
- Registre ao menos sete internações. Pelo menos dois pacientes devem ter se internado mais de uma vez. Ao menos três quartos devem ser cadastrados. As internações devem ter ocorrido entre 01/01/2015 e 01/01/2022.
- Considerando que “a princípio o hospital trabalha com apartamentos, quartos duplos e enfermaria”, inclua ao menos esses três tipos com valores diferentes.
- Inclua dados de dez profissionais de enfermaria. Associe cada internação a ao menos um enfermeiro(a).
- Os dados de tipo de quarto, convênio e especialidade são essenciais para a operação do sistema e, portanto, devem ser povoados assim que o sistema for instalado.

## Parte 4

Agora, como já modelamos e criamos o físico, vamos fazer alterações e atualizações no nosso projeto utilizando alguns códigos e entre eles:

- Crie um script onde você irá adicionar para os médicos a coluna "em_atividade" ou algo do gênero. Você pode utilizar o "ALTER TABLE nome_tabela ADD nome_coluna datatype" para fazer esta criação.
- Logo após, crie outro script que define os valores colocando "inativo" em pelo menos dois médicos e "ativo" nos demais.

Segue abaixo o modelo:

<div align=center>
  <img src="https://github.com/DvlprMatheus/JavaScript/assets/125493286/c7901182-05e5-454c-b3af-29154da66d34" alt="Hospital Model2">
</div>

## Licença

MIT License que permite que o software seja tratato sem restrições para o uso, modificação e distribuição.
