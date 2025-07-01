# PBL Fase 4: Stored Procedures e Análise de Dados com Python

## 🎯 Sobre o Projeto

Esta é a quarta e última fase do Project Based Learning (PBL) da "Melhores Compras". O foco desta etapa foi refinar e profissionalizar as rotinas de banco de dados e introduzir uma camada de análise de dados, demonstrando um fluxo de trabalho completo, desde a engenharia de dados no backend até a geração de insights com Python.

As entregas incluem a conversão do bloco de carga de dados em uma **Stored Procedure** formal e a criação de um **Jupyter Notebook** para análise e visualização das ocorrências de SAC.

## 👥 Integrantes do Grupo

* Hiago Cezar Ribeiro Fidalgo
* Isack Rafael Lagares Santos
* Nicole Lourival
* Tiphany Nemet Martins
* Vinícius Mugnes Ferreira Vitorino

## 🚀 Tecnologias e Ferramentas

* **Banco de Dados:** Oracle
* **Linguagens:** `PL/SQL`, `Python`
* **Bibliotecas Python:** `Pandas`, `Matplotlib`
* **Ambiente de Análise:** `Jupyter Notebook`

## 📂 Destaques da Fase 4

### 1. Stored Procedure de Carga de Dados (ETL)

O bloco PL/SQL desenvolvido na Fase 3 foi encapsulado em uma **Stored Procedure** chamada `PR_SGV_CARGA_RESUMO_OCORR_SAC`. Essa evolução torna o processo de ETL (Extração, Transformação e Carga) modular, reutilizável e mais fácil de gerenciar. A procedure automatiza a carga de dados na tabela de resumo `mc_sgv_ocorrencia_sac`, limpando os dados antigos (`TRUNCATE TABLE`) antes de popular com novas informações processadas.

### 2. Análise de Dados de Ocorrências do SAC com Python

Foi desenvolvido um Jupyter Notebook (`Analise_Ocorrencias_SAC.ipynb`) para analisar um conjunto de dados de ocorrências do SAC. O processo incluiu:
* **Leitura e Manipulação:** Utilização da biblioteca `Pandas` para ler um arquivo `.csv` e converter a coluna de data para o formato adequado.
* **Análise de Frequência:** Contagem do número de ocorrências de SAC por dia.
* **Visualização de Dados:** Uso da biblioteca `Matplotlib` para gerar um histograma que mostra a distribuição de frequência das ocorrências diárias, permitindo uma análise visual do volume de chamados ao longo do tempo.