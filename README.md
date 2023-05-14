# <div align=center> Como Criar um Banco de Dados de um Hospital? </div>

Neste projeto, o meu objetivo foi criar um banco de dados eficiente e seguro para armazenar informações relevantes de pacientes, médicos e interações de um hospital. Será utilizado a linguagem SQL desde o Diagrama ER (entidade-relacionamento), que me ajudou a visualizar as relações entre as diferentes entidades do banco de dados, até a sua própria criação.

## Sumário

- [Diagrama ⭐️](#parte-1)

## Parte 1

Para ajudar nas tarefas diárias da área clínica, foi feito o planejamento de um sistema que é capaz de controlar consultas realizadas. Atualmente, parte da operação ainda se apoia em planilhas e arquivos antigos, mas logo que este projeto for criado, os dados serão transferido para ele quando estiver funcional. Os médicos podem ser generalistas, especialistas ou residentes e têm seus dados pessoais cadastrados em tabelas digitais. Além de suas especialidades que podem ser uma ou mais, como por exemplo: pediatria, clínica geral, gastroenterologia e dermatologia.

Os pacientes também são cadastrados contendo dados pessoais (nome, data de nascimento, endereço, telefone e e-mail), documentos (CPF e RG) e o convênio, que é separado para cada nome, CNPJ e tempo de carência de cada paciente.

Por fim, as consultas são registradas com data e hora de realização, médico responsável, paciente, valor da consulta e a especialidade buscada pelo paciente. Logo após esta realização, será disponibilizada a receita de medicamentos que contém os medicamentos, a quantidade e as instruções de uso.

<div align=center>
  <img src="https://github.com/DvlprMatheus/SQL-Hospital/assets/125493286/f1feab9c-9de3-4d90-8594-54a3458ef325" alt="Hospital Model">
</div>
