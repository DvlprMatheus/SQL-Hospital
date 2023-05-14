# <div align=center> Como Criar um Banco de Dados de um Hospital? </div>

Neste projeto, o meu objetivo foi criar um banco de dados eficiente e seguro para armazenar informações relevantes de pacientes, médicos e interações de um hospital. Será utilizado a linguagem SQL desde o Diagrama ER (entidade-relacionamento), que me ajudou a visualizar as relações entre as diferentes entidades do banco de dados, até a sua própria criação.

## Sumário

- [Consultas ⭐️](#parte-1)
- [Internações 🌻](#parte-2)

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
