# PBL: Banco de Dados para E-commerce "Melhores Compras"

## 🎯 Sobre o Projeto

Este projeto corresponde ao **PBL (Project Based Learning)** da disciplina de Banco de Dados do 1º ano na FIAP. O objetivo foi aplicar os conceitos de modelagem e implementação de um banco de dados relacional para uma empresa fictícia de e-commerce chamada "Melhores Compras".

O escopo abrange desde a criação dos modelos lógico e físico até a implementação do schema em um SGBD Oracle, incluindo a documentação de regras de negócio e a criação de scripts complementares.

## 👥 Integrantes do Grupo 52

* Hiago Cezar Ribeiro Fidalgo (RM 562809)
* Isack Rafael Lagares Santos (RM 561943)
* Nicole Lourival (RM 563762)
* Tiphany Nemet Martins (RM 566355)
* Vinicius Mugnes Ferreira Vitorino (RM 563106)

## 🚀 Tecnologias e Ferramentas

* **Banco de Dados:** Oracle SQL Developer
* **Modelagem:** Oracle SQL Developer Data Modeler
* **Linguagens:** `SQL (DDL)`, `Python`

## 📂 Estrutura de Arquivos

O projeto está organizado da seguinte forma:

* [cite_start]**/1_Modelagem_BD:** Contém os diagramas do Modelo Lógico [cite: 1] [cite_start]e do Modelo Físico/Relacional [cite: 56] do banco de dados.
* [cite_start]**/2_Script_SQL:** Contém o script `DDL (Data Definition Language)` completo para a criação de todas as tabelas[cite: 22, 27, 29, 31, 33, 35, 38, 40, 41, 44, 45, 46, 47, 49, 50, 53, 54], constraints e comentários no padrão Oracle.
* **/3_Script_Python:** Inclui um código em Python que classifica o nível de satisfação de um atendimento do SAC com base em uma nota de 0 a 100.
* [cite_start]**/4_Documentacao_e_Evidencias:** Armazena os documentos de apoio, como a descrição de regras de negócio (RN24 [cite: 12][cite_start]) e as evidências de teste da criação das tabelas [cite: 19, 20] [cite_start]e da execução do script Python[cite: 15, 16, 17, 18].

## 📖 Destaques do Projeto

* **Modelagem de Dados:** Criação de um esquema relacional com 19 tabelas, abrangendo Clientes (Pessoa Física e Jurídica), Produtos, Pedidos (Chamados), SAC, Funcionários e Endereços.
* **Script DDL:** Geração de um script SQL robusto com `CREATE TABLE`, `CONSTRAINTS` (Primary Key, Foreign Key, Check, Unique) e `COMMENTS` para documentar cada tabela e coluna.
* **Lógica de Negócio em Python:** Desenvolvimento de um script simples para categorizar o atendimento do SAC como "Qualidade", "Neutro" ou "Insatisfatório" com base na nota de satisfação.