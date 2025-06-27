-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-03-23 15:52:09 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE MC_BAIRRO CASCADE CONSTRAINTS 
;

DROP TABLE MC_CATEGORIA CASCADE CONSTRAINTS 
;

DROP TABLE MC_CHAMADO CASCADE CONSTRAINTS 
;

DROP TABLE MC_CIDADE CASCADE CONSTRAINTS 
;

DROP TABLE MC_CLAS_VIDEO CASCADE CONSTRAINTS 
;

DROP TABLE MC_CLI_FISICA CASCADE CONSTRAINTS 
;

DROP TABLE MC_CLI_JURIDICA CASCADE CONSTRAINTS 
;

DROP TABLE MC_CLIENTE CASCADE CONSTRAINTS 
;

DROP TABLE MC_DEPARTAMENTO CASCADE CONSTRAINTS 
;

DROP TABLE MC_ENDERECO CASCADE CONSTRAINTS 
;

DROP TABLE MC_ESTADO CASCADE CONSTRAINTS 
;

DROP TABLE MC_FUNCIONARIO CASCADE CONSTRAINTS 
;

DROP TABLE MC_HISTORICO CASCADE CONSTRAINTS 
;

DROP TABLE MC_LOGRADURADO CASCADE CONSTRAINTS 
;

DROP TABLE MC_PRODUTO CASCADE CONSTRAINTS 
;

DROP TABLE MC_SAC CASCADE CONSTRAINTS 
;

DROP TABLE MC_TELEFONE CASCADE CONSTRAINTS 
;

DROP TABLE MC_VIDEO CASCADE CONSTRAINTS 
;

DROP TABLE MC_VISUA CASCADE CONSTRAINTS 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE MC_BAIRRO 
    ( 
     CD_BAIRRO    NUMBER (8)  NOT NULL , 
     CD_CIDADE    NUMBER (8)  NOT NULL , 
     NM_BAIRRO    VARCHAR2 (50)  NOT NULL , 
     NM_ZN_BAIRRO VARCHAR2 (20) 
    ) 
;

COMMENT ON COLUMN MC_BAIRRO.CD_BAIRRO IS 'Esta coluna irá receber o codigo do bairro e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_BAIRRO.CD_CIDADE IS 'Esta coluna irá receber o codigo da cidade e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_BAIRRO.NM_BAIRRO IS 'Esta coluna ira receber o nome do Bairro. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_BAIRRO.NM_ZN_BAIRRO IS 'sta coluna irá receber a localização da zona onde se encontra o bairro. Alguns exemplos: Zona Norte, Zona Sul, Zona Leste, Zona Oeste, Centro.' 
;

ALTER TABLE MC_BAIRRO 
    ADD CONSTRAINT PK_MC_BAIRRO PRIMARY KEY ( CD_BAIRRO ) ;

CREATE TABLE MC_CATEGORIA 
    ( 
     CD_CAT    NUMBER GENERATED ALWAYS AS IDENTITY , 
     DS_CAT    VARCHAR2 (500)  NOT NULL , 
     TP_CAT    CHAR (1)  NOT NULL , 
     DT_INICIO DATE  NOT NULL , 
     DT_TERM   DATE , 
     ST_CAT    CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_CATEGORIA.CD_CAT IS 'Essa coluna irá armazenar a chave primária da tabela de categoria de produtos da Melhorees Compras. Cada categoria nova cadastrada  será acionada a Sequence  SQ_MC_CATEGORIA que se encarregará de gerar o próximo número único da categoria..' 
;

COMMENT ON COLUMN MC_CATEGORIA.DS_CAT IS 'Essa coluna irá armazenar descrição da categoria de produtos da Melhorees Compras. Cada categoria tem uma  descrição única e serve para organizar os produtos em categorias simliares, melhorando a tomada de decisão.' 
;

COMMENT ON COLUMN MC_CATEGORIA.TP_CAT IS 'Nessa  coluna  será  armazenada o tipo de categoria que poderá  ser (V)ídeo ou (P)rodudto. Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CATEGORIA.DT_INICIO IS 'Essa coluna irá receber  a data de início da categoria. Seu formato é dd/mm/yyyy e seu conteúdo deve ser sempre  obrigatório.' 
;

COMMENT ON COLUMN MC_CATEGORIA.DT_TERM IS 'Essa coluna irá receber  a data de encerramento  da categoria. Seu formato é dd/mm/yyyy e seu conteúdo deve ser sempre  opcional. Conteúdo obrigatório significa que a categoria foi encerrada a partir da data término. Já o conteúdo opcional indica que a categoria está ativa e operante.' 
;

COMMENT ON COLUMN MC_CATEGORIA.ST_CAT IS 'Essa coluna irá armazenar o stauts da categoria da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).' 
;

ALTER TABLE MC_CATEGORIA 
    ADD CONSTRAINT CK_MC_CATEGORIA_ST 
    CHECK (ST_CAT='A'OR ST_CAT='I')
;
ALTER TABLE MC_CATEGORIA 
    ADD CONSTRAINT PK_MC_CAT PRIMARY KEY ( CD_CAT ) ;

ALTER TABLE MC_CATEGORIA 
    ADD CONSTRAINT UN_MC_CAT_DESCR UNIQUE ( DS_CAT ) ;

CREATE TABLE MC_CHAMADO 
    ( 
     CD_CHAM         NUMBER  GENERATED ALWAYS AS IDENTITY , 
     NR_CLIENTE      NUMBER (10)  NOT NULL , 
     CD_PROD         NUMBER (10)  NOT NULL , 
     NR_SAC          NUMBER  NOT NULL , 
     CD_HISTOR       NUMBER  NOT NULL , 
     TP_CHAMADO      CHAR (1)  NOT NULL , 
     DS_DET_CHAM     VARCHAR2 (4000)  NOT NULL , 
     ST_CHAMADO      CHAR (1)  NOT NULL , 
     NR_INDI_SAT     NUMBER (2) , 
     DT_HR_ABE_CHA   DATE  NOT NULL , 
     DT_HR_ATEND_SAC DATE , 
     DT_HR_TERM_ATEN DATE 
    ) 
;

COMMENT ON COLUMN MC_CHAMADO.CD_CHAM IS 'Chave primária da tabela, identificador único do chamado.' 
;

COMMENT ON COLUMN MC_CHAMADO.NR_CLIENTE IS 'Esta coluna irá receber o codigo de cliente e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_CHAMADO.CD_PROD IS 'Esta coluna irá receber o codigo de produto e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_CHAMADO.NR_SAC IS 'Esta coluna irá receber o numero do sac, e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_CHAMADO.TP_CHAMADO IS 'Essa coluna  irá  receber o TIPO  do chamado  aberto pelo cliente.  Seu conteúdo deve ser  obrigatório e os possíveis valores são:  Sugestão (1) ou Reclamação (2).' 
;

COMMENT ON COLUMN MC_CHAMADO.DS_DET_CHAM IS 'Essa coluna  irá  receber a descrição completa do CHAMADO  aberto pelo cliente. Seu conteudo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CHAMADO.ST_CHAMADO IS 'Essa coluna  irá  receber o STATUS  do CHANADO aberto pelo cliente.  Seu conteúdo deve ser  obrigatório e os possíveis valores são: (E)m Atendimento; (C)ancelado; (F)echado ou (X)Fechado com Insatisfação do cliente.' 
;

COMMENT ON COLUMN MC_CHAMADO.NR_INDI_SAT IS 'Essa coluna  irá  receber o índice de satisfação, , computado como um valor simples de 1 a 10, onde 1 refere-se ao cliente menos satisfeito e 10 o cliente mais satisfeito. Esse índice de satisfação é opcional e informado pelo cliente ao final do atendimento.' 
;

COMMENT ON COLUMN MC_CHAMADO.DT_HR_ABE_CHA IS 'Essa coluna  irá  receber a data e horário do CHAMADO aberto pelo cliente. Seu conteudo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CHAMADO.DT_HR_ATEND_SAC IS 'Essa coluna  irá  receber a data e horário do SAC aberto pelo funcionario. Seu conteudo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CHAMADO.DT_HR_TERM_ATEN IS 'Essa coluna  irá  receber a data de termino e horário do encerramento do chamdo, seu conteudo é opcional ' 
;
CREATE UNIQUE INDEX MC_CHAMADO__IDX ON MC_CHAMADO 
    ( 
     NR_SAC ASC 
    ) 
;
CREATE UNIQUE INDEX MC_CHAMADO__IDXv1 ON MC_CHAMADO 
    ( 
     CD_HISTOR ASC 
    ) 
;

ALTER TABLE MC_CHAMADO 
    ADD CONSTRAINT CK_MC_CHAMADO_ST 
    CHECK (ST_CHAMADO IN ('A', 'E', 'C', 'F', 'X'))
    ;


ALTER TABLE MC_CHAMADO 
    ADD CONSTRAINT CK_MC_CHAMADO_IND 
    CHECK (NR_INDI_SAT >=1 AND NR_INDI_SAT <=10)
;


ALTER TABLE MC_CHAMADO 
    ADD CONSTRAINT CK_MC_CHAMADO_TP 
    CHECK (TP_CHAMADO IN ('1', '2'))
;
ALTER TABLE MC_CHAMADO 
    ADD CONSTRAINT PK_MC_CHAM PRIMARY KEY ( CD_CHAM ) ;

CREATE TABLE MC_CIDADE 
    ( 
     CD_CIDADE NUMBER (8)  NOT NULL , 
     SG_ESTADO CHAR (2)  NOT NULL , 
     NM_CIDADE VARCHAR2 (60)  NOT NULL , 
     CD_IBGE   NUMBER (8) , 
     NR_DDD    NUMBER (3) 
    ) 
;

COMMENT ON COLUMN MC_CIDADE.CD_CIDADE IS 'Esta coluna irá receber o codigo da cidade e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_CIDADE.SG_ESTADO IS 'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_CIDADE.NM_CIDADE IS 'Esta coluna ira receber o nome da Cidade. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_CIDADE.CD_IBGE IS 'Esta coluna irá receber o código do IBGE que fornece informações para geração da NFe.' 
;

COMMENT ON COLUMN MC_CIDADE.NR_DDD IS 'Esta coluna irá receber o número do DDD da cidade para ser utilizado no contato telefônico. Seu conteudo é opcional.' 
;

ALTER TABLE MC_CIDADE 
    ADD CONSTRAINT PK_MC_CIDADE PRIMARY KEY ( CD_CIDADE ) ;

CREATE TABLE MC_CLAS_VIDEO 
    ( 
     CD_CLAS NUMBER  NOT NULL , 
     DS_CLAS VARCHAR2 (4000)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_CLAS_VIDEO.CD_CLAS IS 'Esta coluna irá receber o codigo da classificação do video e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_CLAS_VIDEO.DS_CLAS IS 'Descrição do Video, seu preenchimento é obrigatório.' 
;

ALTER TABLE MC_CLAS_VIDEO 
    ADD CONSTRAINT PK_MC_CLASS PRIMARY KEY ( CD_CLAS ) ;

CREATE TABLE MC_CLI_FISICA 
    ( 
     NR_CLIENTE         NUMBER (10)  NOT NULL , 
     DT_NASC            DATE  NOT NULL , 
     FL_SX_BIO          CHAR (1)  NOT NULL , 
     DS_GENERO          VARCHAR2 (100)  NOT NULL , 
     NR_CPF             VARCHAR2 (14)  NOT NULL , 
     MC_ENDERECO_CD_END NUMBER  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_CLI_FISICA.NR_CLIENTE IS 'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. ' 
;

COMMENT ON COLUMN MC_CLI_FISICA.DT_NASC IS 'Essa coluna irá armazenar a data de nascimento do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório. ' 
;

COMMENT ON COLUMN MC_CLI_FISICA.FL_SX_BIO IS 'Essa coluna irá armazenar o sexo biológico do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CLI_FISICA.DS_GENERO IS 'Genero do sexo do Cliente. Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CLI_FISICA.NR_CPF IS 'Essa coluna irá armazenar o número do CPF do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório. ' 
;

ALTER TABLE MC_CLI_FISICA 
    ADD CONSTRAINT CK_MC_CLI_FISICA_SX 
    CHECK (FL_SX_BIO = 'M'OR FL_SX_BIO = 'F')
;
ALTER TABLE MC_CLI_FISICA 
    ADD CONSTRAINT PK_MC_CLI_FISICA PRIMARY KEY ( NR_CLIENTE ) ;

ALTER TABLE MC_CLI_FISICA 
    ADD CONSTRAINT UN_MC_CLI_FIS_CPF UNIQUE ( NR_CPF ) ;

CREATE TABLE MC_CLI_JURIDICA 
    ( 
     NR_CLIENTE NUMBER (10)  NOT NULL , 
     DT_FUND    DATE  NOT NULL , 
     NR_CNPJ    VARCHAR2 (20)  NOT NULL , 
     NR_INC_EST VARCHAR2 (15) 
    ) 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.NR_CLIENTE IS 'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. ' 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.DT_FUND IS 'Essa coluna irá armazenar data  de fundação do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.NR_CNPJ IS 'Essa coluna irá armazenar o  numero do CNPJ do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.NR_INC_EST IS 'Essa coluna irá armazenar o  numero da Inscrição Estadual  do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser opcional.' 
;

ALTER TABLE MC_CLI_JURIDICA 
    ADD CONSTRAINT PK_MC_CLI_JUR PRIMARY KEY ( NR_CLIENTE ) ;

ALTER TABLE MC_CLI_JURIDICA 
    ADD CONSTRAINT UN_MC_CLI_JUR_CNPJ UNIQUE ( NR_CNPJ ) ;

CREATE TABLE MC_CLIENTE 
    ( 
     NR_CLIENTE  NUMBER (10)  NOT NULL , 
     NM_CLIENTE  VARCHAR2 (100)  NOT NULL , 
     QT_ESTRELAS NUMBER (1)  NOT NULL , 
     ST_CLIENTE  CHAR (1)  NOT NULL , 
     DS_EMAIL    VARCHAR2 (100) , 
     NR_LOGIN    VARCHAR2 (50)  NOT NULL , 
     DS_SENHA    VARCHAR2 (50)  NOT NULL , 
     TP_CLIENTE  CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_CLIENTE.NR_CLIENTE IS 'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da chamada de sequence  SQ_MC_CLIENTE, a qual terá sempre o número disponivel para uso.' 
;

COMMENT ON COLUMN MC_CLIENTE.NM_CLIENTE IS 'Essa coluna irá armazenar o nome do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CLIENTE.QT_ESTRELAS IS 'Essa coluna irá armazenar a quantiade de estrelas do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório e ser possível de estar entre 1 e 5 estrelas.' 
;

COMMENT ON COLUMN MC_CLIENTE.ST_CLIENTE IS 'Essa coluna irá armazenar o stauts do cliente da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).' 
;

COMMENT ON COLUMN MC_CLIENTE.DS_EMAIL IS 'Essa coluna irá armazenar o email  do cliente da Melhorees Compras. No minimo é esperado um email contendo o caractere (@) em seu conteúdo.' 
;

COMMENT ON COLUMN MC_CLIENTE.NR_LOGIN IS 'Essa coluna irá armazenar o login de cada cliente na plataforma ecommerce da Melhores Compras. Seu conteúdo deve ser obrigatório e  único para cada cliente.' 
;

COMMENT ON COLUMN MC_CLIENTE.DS_SENHA IS 'Essa coluna irá armazenar a senha de cada cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.' 
;

ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT CK_MC_CLIENTE_ST 
    CHECK (ST_CLIENTE='A'OR ST_CLIENTE='I')
;


ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT CK_MC_CLIENTE_EST 
    CHECK (QT_ESTRELAS >= 1 AND QT_ESTRELAS <= 5)
;


ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT CK_MC_CLIENTE_TP 
    CHECK (TP_CLIENTE='J' OR TP_CLIENTE='F')
;
ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT PK_MC_CLI PRIMARY KEY ( NR_CLIENTE ) ;

ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT UN_MC_CLI_EMAIL UNIQUE ( DS_EMAIL ) ;

ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT UN_MC_CLI_LOGIN UNIQUE ( NR_LOGIN ) ;
    

CREATE TABLE MC_DEPARTAMENTO 
    ( 
     CD_DEPTO NUMBER  NOT NULL , 
     NM_DEPTO VARCHAR2 (20)  NOT NULL ,  
     ST_DEPTO CHAR (1)  NOT NULL 
    ) 
;

ALTER TABLE MC_DEPARTAMENTO 
    ADD CONSTRAINT CK_MC_DEPTO_ST 
    CHECK (ST_DEPTO = 'A' OR ST_DEPTO = 'I')
;
ALTER TABLE MC_DEPARTAMENTO 
    ADD CONSTRAINT PK_MC_DEPARTAMENTO PRIMARY KEY ( CD_DEPTO ) ;

CREATE TABLE MC_ENDERECO 
    ( 
     CD_END     NUMBER  NOT NULL , 
     CD_LOGR    NUMBER (10)  NOT NULL , 
     CD_FUNC    NUMBER (10)  NOT NULL , 
     NR_CLIENTE NUMBER (10)  NOT NULL , 
     NR_END     NUMBER (8)  NOT NULL , 
     DT_INICIO  DATE  NOT NULL , 
     ST_END     CHAR (1)  NOT NULL , 
     DS_COMP    VARCHAR2 (80) , 
     DT_TERM    DATE , 
     TP_DN_END  CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_ENDERECO.CD_END IS 'Esta coluna irá receber o codigo de endereço e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_ENDERECO.CD_LOGR IS 'Esta coluna irá receber o codigo do Logradouro e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_ENDERECO.CD_FUNC IS 'Esta coluna irá receber o codigo do funcionário e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_ENDERECO.NR_CLIENTE IS 'Esta coluna irá receber o codigo de cliente e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_ENDERECO.NR_END IS 'Essa tabela receberá o numero do endereço, que é essencial para localização, seu preenchimento é obrigatório.' 
;

COMMENT ON COLUMN MC_ENDERECO.DT_INICIO IS 'Essa tabela define quando o endereço passou a ser utilizado, seu preenchimeto é obrigatório.' 
;

COMMENT ON COLUMN MC_ENDERECO.ST_END IS 'Essa tabela indica o estado do endereço.(A)tivo ou (I)nativo, seu preenchimento é obrigatório.' 
;

COMMENT ON COLUMN MC_ENDERECO.DS_COMP IS 'Essa tabela representa o complemento do endereço, por nem todos endereços terem complemento seu preechimento é opcional.' 
;

COMMENT ON COLUMN MC_ENDERECO.DT_TERM IS 'Data de término do endereço.' 
;

COMMENT ON COLUMN MC_ENDERECO.TP_DN_END IS 'Receberá a inicação se o endereço pertece ao (F)uncionário ou á um (C)liente. Seu preechimento é obrigatório,' 
;

ALTER TABLE MC_ENDERECO 
    ADD CONSTRAINT PK_MC_END PRIMARY KEY ( CD_END ) ;

CREATE TABLE MC_ESTADO 
    ( 
     SG_ESTADO CHAR (2)  NOT NULL , 
     NM_ESTADO VARCHAR2 (30)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_ESTADO.SG_ESTADO IS 'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_ESTADO.NM_ESTADO IS 'Esta coluna irá receber o nome do estado' 
;

ALTER TABLE MC_ESTADO 
    ADD CONSTRAINT PK_MC_ESTADO PRIMARY KEY ( SG_ESTADO ) ;

CREATE TABLE MC_FUNCIONARIO 
    ( 
     CD_FUNC    NUMBER (10)  GENERATED ALWAYS AS IDENTITY , 
     CD_DEPTO   NUMBER  NOT NULL , 
     CD_GERENTE NUMBER (10)  NOT NULL , 
     NR_CPF     VARCHAR2 (14)  NOT NULL , 
     NM_FUNC    VARCHAR2 (160)  NOT NULL , 
     DT_NASC    DATE  NOT NULL , 
     FL_SX_BIO  CHAR (1) , 
     DS_GENERO  VARCHAR2 (160) , 
     DS_CARGO   VARCHAR2 (80)  NOT NULL , 
     VL_SALARIO NUMBER (10,2) , 
     DS_EMAIL   VARCHAR2 (80) , 
     ST_FUNC    CHAR (1)  NOT NULL , 
     DT_CADAST  DATE  NOT NULL , 
     DT_DESLI   DATE , 
     TP_FUNC    CHAR (1)  NOT NULL , 
     NR_CPF1    VARCHAR2 (14)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_FUNCIONARIO.CD_FUNC IS 'Chave primária da tabela, identificador único do funcionário.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.CD_DEPTO IS 'Chave estrangeira para identificar o departamento ao qual o funcionário pertence.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.CD_GERENTE IS 'Auto-relacionamento, indicando qual funcionário é o gerente desse funcionário.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.NM_FUNC IS 'Esta coluna irá receber o nome do funcionário e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DT_NASC IS 'Data de nascimento do funcionário.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.FL_SX_BIO IS 'Flag para sexo biológico do funcionário.Os valores permitidos aqui seriam: (F)eminino; (M)asculino ou (Hermafrodita)' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DS_GENERO IS 'Identificação de gênero do funcionário.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DS_CARGO IS 'Cargo ou função exercida pelo funcionário.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.VL_SALARIO IS 'Valor do salário do funcionário.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DS_EMAIL IS '	E-mail corporativo do funcionário.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.ST_FUNC IS 'Status do funcionário (Ativo/Inativo).' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DT_CADAST IS 'Data de admissão do funcionário.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DT_DESLI IS 'Data de saída da empresa (se aplicável).' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.TP_FUNC IS '(G)erente, (F)uncionário' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.NR_CPF1 IS 'Esse campo irá compor o CPF do funcionario, preenchimeto obrigatorio.' 
;
CREATE UNIQUE INDEX MC_FUNCIONARIO__IDX ON MC_FUNCIONARIO 
    ( 
     CD_GERENTE ASC 
    ) 
;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT CK_MC_FUNC_SX 
    CHECK (FL_SX_BIO = 'M'OR FL_SX_BIO = 'F')
;


ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT CK_MC_FUNC_TP 
    CHECK (TP_FUNC = 'G' OR TP_FUNC = 'F')
;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT PK_MC_FUNC PRIMARY KEY ( CD_FUNC ) ;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT UN_MC_FUNC_EMAIL UNIQUE ( DS_EMAIL ) ;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT UN_MC_FUNC_CPF UNIQUE ( NR_CPF ) ;

CREATE TABLE MC_HISTORICO 
    ( 
     CD_HISTOR       NUMBER  GENERATED ALWAYS AS IDENTITY , 
     DT_HR_HIST_INIC DATE  NOT NULL , 
     ST_HIST         CHAR (1)  NOT NULL , 
     DT_HR_HIST_TERM DATE 
    ) 
;

COMMENT ON COLUMN MC_HISTORICO.DT_HR_HIST_INIC IS 'data e hora do historico' 
;

COMMENT ON COLUMN MC_HISTORICO.ST_HIST IS '(A)tivo, (I)nativo' 
;

ALTER TABLE MC_HISTORICO 
    ADD CONSTRAINT CK_MC_HISTORICO_STATUS 
    CHECK (ST_HIST='A'OR ST_HIST='I')
;
ALTER TABLE MC_HISTORICO 
    ADD CONSTRAINT PK_MC_HISTORICO PRIMARY KEY ( CD_HISTOR ) ;

CREATE TABLE MC_LOGRADURADO 
    ( 
     CD_LOGR   NUMBER (10)  NOT NULL , 
     CD_BAIRRO NUMBER (8)  NOT NULL , 
     NR_CEP    NUMBER (8)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_LOGRADURADO.CD_LOGR IS 'Esta coluna irá receber o código do logradouro e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_LOGRADURADO.CD_BAIRRO IS 'Esta coluna irá receber o codigo do bairro e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_LOGRADURADO.NR_CEP IS 'Esta coluna irá receber o numero do CEP do Logradouro e seu conteúdo é obrigatório.' 
;

ALTER TABLE MC_LOGRADURADO 
    ADD CONSTRAINT PK_MC_LOGR PRIMARY KEY ( CD_LOGR ) ;
  
CREATE TABLE MC_PRODUTO 
    ( 
     CD_PROD        NUMBER (10) GENERATED ALWAYS AS IDENTITY , 
     CD_CAT         NUMBER  NOT NULL , 
     DS_PRODUTO     VARCHAR2 (100)  NOT NULL , 
     NM_CD_BAR_PROD VARCHAR2 (50) , 
     VL_UNIT        NUMBER (8,2)  NOT NULL , 
     TP_EMB         VARCHAR2 (15) , 
     ST_PRODUTO     CHAR (1)  NOT NULL , 
     VL_PERC_LUCRO  NUMBER (8,2) , 
     DS_CPL_PROD    VARCHAR2 (4000)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_PRODUTO.CD_PROD IS 'Essa coluna irá armazenar a chave primária da tabela de produtos da Melhorees Compras. A cada produto cadastrado será acionada a Sequence  SQ_MC_PRODUTO que se encarregará de gerar o próximo número único do produto.' 
;

COMMENT ON COLUMN MC_PRODUTO.CD_CAT IS 'Essa coluna irá armazenar a chave primária da tabela de categoria de produtos da Melhorees Compras. Cada categoria nova cadastrada  será acionada a Sequence  SQ_MC_CATEGORIA que se encarregará de gerar o próximo número único da categoria..' 
;

COMMENT ON COLUMN MC_PRODUTO.DS_PRODUTO IS 'Essa coluna irá armazenar a descrição principal do produto. Seu conteúdo deve ser  obrigatorio.' 
;

COMMENT ON COLUMN MC_PRODUTO.NM_CD_BAR_PROD IS 'Essa coluna irá armazenar o número do codigo de barras  do produto. Seu conteúdo deve ser opcional.' 
;

COMMENT ON COLUMN MC_PRODUTO.VL_UNIT IS 'Essa coluna irá armazenar o valor unitário do produto. Seu conteúdo deve ser > 0 ' 
;

COMMENT ON COLUMN MC_PRODUTO.TP_EMB IS 'Essa coluna irá armazenar o tipo de embalagem do produto. Seu conteúdo pode ser opcional.' 
;

COMMENT ON COLUMN MC_PRODUTO.ST_PRODUTO IS 'Essa coluna irá armazenar o stauts do produto da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).' 
;

COMMENT ON COLUMN MC_PRODUTO.VL_PERC_LUCRO IS 'Essa coluna irá armazenar o percentual  do lucro médio para cada produto. Seu conteúdo deve ser opcional.' 
;

COMMENT ON COLUMN MC_PRODUTO.DS_CPL_PROD IS 'Essa coluna irá armazenar a descrição completa do produto. Seu conteúdo deve ser  obrigatorio.' 
;

ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT CK_MC_PRODUTO_ST 
    CHECK ((ST_PRODUTO IN ('A','I')))
;


ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT CK_MC_PRODUTO_PERC 
    CHECK (VL_PERC_LUCRO >= 0)
;


ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT CK_MC_PRODUTO_UNI 
    CHECK (VL_UNIT > 0)
;
ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT PK_MC_PROD PRIMARY KEY ( CD_PROD ) ;

ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT UN_MC_PROD_DESC UNIQUE ( DS_PRODUTO ) ;

ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT UN_MC_PROD_CODB UNIQUE ( NM_CD_BAR_PROD ) ;
    


CREATE TABLE MC_SAC 
    ( 
     NR_SAC         NUMBER  NOT NULL , 
     CD_CHAM        NUMBER  NOT NULL , 
     CD_FUNC        NUMBER (10)  NOT NULL , 
     DT_ABR_SAC     DATE  NOT NULL , 
     HR_ABR_SAC     DATE  NOT NULL , 
     DT_ATEN        DATE , 
     HR_ATEN        DATE , 
     NR_TEMP_T_SAC  DATE  NOT NULL , 
     DS_DTL_RET_SAC VARCHAR2 (4000)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_SAC.NR_SAC IS 'Chave primária da tabela, identificador único do SAC.' 
;

COMMENT ON COLUMN MC_SAC.CD_CHAM IS 'Esta coluna irá receber o codigo do chamado e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_SAC.CD_FUNC IS 'Esta coluna irá receber o codigo do funcionário e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_SAC.DT_ABR_SAC IS 'Essa coluna  irá  receber a data e horário do SAC aberto pelo funcionario. Seu conteudo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_SAC.HR_ABR_SAC IS 'Essa coluna  irá  receber a hora do SAC aberto pelo funcionario. Seu conteudo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_SAC.DT_ATEN IS 'Essa coluna  irá  receber a data e horário do atendmiento SAC feita pelo funcionário da Melhores Compras. Seu conteudo deve ser opcional..' 
;

COMMENT ON COLUMN MC_SAC.HR_ATEN IS 'Essa coluna  irá  receber a hora do SAC do atendimento  feito  pelo funcionario da Melhores Compras. Seu conteudo deve ser opcional.' 
;

COMMENT ON COLUMN MC_SAC.NR_TEMP_T_SAC IS 'Essa coluna  irá  receber o tempo total em horas  (HH24) computado desde a abertura até a conclusão dele. A unidade de medida é horas, ou seja, em quantas horas o chamado foi concluído desde a sua abertura.' 
;

COMMENT ON COLUMN MC_SAC.DS_DTL_RET_SAC IS 'Essa coluna  irá  receber a descrição detalhada do retorno feito pelo funcionário a partir da solicitação do cliente. Seu conteúdo deve ser opcional e preenchido pelo funcionário.' 
;
CREATE UNIQUE INDEX MC_SAC__IDX ON MC_SAC 
    ( 
     CD_CHAM ASC 
    ) 
;

ALTER TABLE MC_SAC 
    ADD CONSTRAINT PK_MC_SAC PRIMARY KEY ( NR_SAC ) ;

CREATE TABLE MC_TELEFONE 
    ( 
     ID_TEL     NUMBER  NOT NULL , 
     NR_CLIENTE NUMBER (10)  NOT NULL , 
     CD_FUNC    NUMBER (10)  NOT NULL , 
     NR_TEL     VARCHAR2 (20) , 
     TIPO_TEL   CHAR (2)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_TELEFONE.ID_TEL IS 'Esta coluna irá receber o ID do Telefone e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_TELEFONE.NR_CLIENTE IS 'Esta coluna irá receber o numero do cliente e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_TELEFONE.CD_FUNC IS 'Esta coluna irá receber o codigo do funcionário e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_TELEFONE.NR_TEL IS 'Essa coluna irá armazenar o número do cliente da Melhorees Compras. A mascara de armazenamento deve ser: (<nr_ddd>) 99999-9999 e  deve ser utilizada pré definida.' 
;

COMMENT ON COLUMN MC_TELEFONE.TIPO_TEL IS 'Tipo do telefone (CE)lular, (RE)sidencial, (CO)mercial, seu preenchimento é obrigatório.' 
;

ALTER TABLE MC_TELEFONE 
    ADD CONSTRAINT PK_MC_TEL PRIMARY KEY ( ID_TEL ) ;

CREATE TABLE MC_VIDEO 
    ( 
     CD_VIDEO  NUMBER  NOT NULL , 
     CD_PROD   NUMBER (10)  NOT NULL , 
     CD_CLAS   NUMBER  NOT NULL , 
     URL_VIDEO BLOB  NOT NULL , 
     ST_VIDEO  CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_VIDEO.CD_VIDEO IS 'Esta coluna irá receber o codigo de video e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_VIDEO.CD_PROD IS 'Esta coluna irá receber o codigo de produto e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_VIDEO.ST_VIDEO IS 'O status do vídeo pode ser apenas "A" (Ativo) ou "I" (Inativo)' 
;

ALTER TABLE MC_VIDEO 
    ADD CONSTRAINT CK_MC_VIDEO_1 
    CHECK (ST_VIDEO = 'A' OR ST_VIDEO = 'I')
;
ALTER TABLE MC_VIDEO 
    ADD CONSTRAINT PK_MC_VIDEO PRIMARY KEY ( CD_VIDEO ) ;

CREATE TABLE MC_VISUA 
    ( 
     CD_VISUA    NUMBER  NOT NULL , 
     CD_VIDEO    NUMBER  NOT NULL , 
     NR_CLIENTE  NUMBER (10) , 
     DT_HR_VISUA DATE  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_VISUA.CD_VISUA IS 'Esta coluna irá receber o codigo da visualização e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_VISUA.CD_VIDEO IS 'Esta coluna irá receber o codigo de video e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_VISUA.NR_CLIENTE IS 'Esta coluna irá receber o codigo de cliente e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_VISUA.DT_HR_VISUA IS 'recebera data e hora da visualição.' 
;

ALTER TABLE MC_VISUA 
    ADD CONSTRAINT CK_MC_VISUA_1 
    CHECK (DT_HR_VISUA IS NOT NULL);
    
ALTER TABLE MC_VISUA 
    ADD CONSTRAINT PK_MC_VIS PRIMARY KEY ( CD_VISUA ) ;

ALTER TABLE MC_BAIRRO 
    ADD CONSTRAINT FK_MC_BAIR_MC_CID FOREIGN KEY 
    ( 
     CD_CIDADE
    ) 
    REFERENCES MC_CIDADE 
    ( 
     CD_CIDADE
    ) 
;

ALTER TABLE MC_CHAMADO 
    ADD CONSTRAINT FK_MC_CHAM_MC_CLI FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_CHAMADO 
    ADD CONSTRAINT FK_MC_CHAM_MC_HIST FOREIGN KEY 
    ( 
     CD_HISTOR
    ) 
    REFERENCES MC_HISTORICO 
    ( 
     CD_HISTOR
    ) 
;

ALTER TABLE MC_CHAMADO 
    ADD CONSTRAINT FK_MC_CHAM_MC_PROD FOREIGN KEY 
    ( 
     CD_PROD
    ) 
    REFERENCES MC_PRODUTO 
    ( 
     CD_PROD
    ) 
;

ALTER TABLE MC_CHAMADO 
    ADD CONSTRAINT FK_MC_CHAM_MC_SAC FOREIGN KEY 
    ( 
     NR_SAC
    ) 
    REFERENCES MC_SAC 
    ( 
     NR_SAC
    ) 
;

ALTER TABLE MC_CIDADE 
    ADD CONSTRAINT FK_MC_CID_MC_ESTADO FOREIGN KEY 
    ( 
     SG_ESTADO
    ) 
    REFERENCES MC_ESTADO 
    ( 
     SG_ESTADO
    ) 
;

ALTER TABLE MC_CLI_FISICA 
    ADD CONSTRAINT FK_MC_CLI_FIS_MC_CLI FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_CLI_JURIDICA 
    ADD CONSTRAINT FK_MC_CLI_JUR_MC_CLI FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_ENDERECO 
    ADD CONSTRAINT FK_MC_END_MC_CLI FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_ENDERECO 
    ADD CONSTRAINT FK_MC_END_MC_FUNC FOREIGN KEY 
    ( 
     CD_FUNC
    ) 
    REFERENCES MC_FUNCIONARIO 
    ( 
     CD_FUNC
    ) 
;

ALTER TABLE MC_ENDERECO 
    ADD CONSTRAINT FK_MC_END_MC_LOGR FOREIGN KEY 
    ( 
     CD_LOGR
    ) 
    REFERENCES MC_LOGRADURADO 
    ( 
     CD_LOGR
    ) 
;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT FK_MC_FUNC_MC_DEPTO FOREIGN KEY 
    ( 
     CD_DEPTO
    ) 
    REFERENCES MC_DEPARTAMENTO 
    ( 
     CD_DEPTO
    ) 
;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT FK_MC_FUNC_MC_FUNC FOREIGN KEY 
    ( 
     CD_GERENTE
    ) 
    REFERENCES MC_FUNCIONARIO 
    ( 
     CD_FUNC
    ) 
;

ALTER TABLE MC_LOGRADURADO 
    ADD CONSTRAINT FK_MC_LOGR_MC_BAIR FOREIGN KEY 
    ( 
     CD_BAIRRO
    ) 
    REFERENCES MC_BAIRRO 
    ( 
     CD_BAIRRO
    ) 
;

ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT FK_MC_PROD_MC_CAT FOREIGN KEY 
    ( 
     CD_CAT
    ) 
    REFERENCES MC_CATEGORIA 
    ( 
     CD_CAT
    ) 
;

ALTER TABLE MC_SAC 
    ADD CONSTRAINT FK_MC_SAC_MC_CHAM FOREIGN KEY 
    ( 
     CD_CHAM
    ) 
    REFERENCES MC_CHAMADO 
    ( 
     CD_CHAM
    ) 
;

ALTER TABLE MC_SAC 
    ADD CONSTRAINT FK_MC_SAC_MC_FUNC FOREIGN KEY 
    ( 
     CD_FUNC
    ) 
    REFERENCES MC_FUNCIONARIO 
    ( 
     CD_FUNC
    ) 
;

ALTER TABLE MC_TELEFONE 
    ADD CONSTRAINT FK_MC_TEL_MC_CLI FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_TELEFONE 
    ADD CONSTRAINT FK_MC_TEL_MC_FUNC FOREIGN KEY 
    ( 
     CD_FUNC
    ) 
    REFERENCES MC_FUNCIONARIO 
    ( 
     CD_FUNC
    ) 
;

ALTER TABLE MC_VIDEO 
    ADD CONSTRAINT FK_MC_VID_MC_CLAS_VID FOREIGN KEY 
    ( 
     CD_CLAS
    ) 
    REFERENCES MC_CLAS_VIDEO 
    ( 
     CD_CLAS
    ) 
;

ALTER TABLE MC_VIDEO 
    ADD CONSTRAINT FK_MC_VID_MC_PROD FOREIGN KEY 
    ( 
     CD_PROD
    ) 
    REFERENCES MC_PRODUTO 
    ( 
     CD_PROD
    ) 
;

ALTER TABLE MC_VISUA 
    ADD CONSTRAINT FK_MC_VISUA_MC_CLI FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_VISUA 
    ADD CONSTRAINT FK_MC_VISUA_MC_VID FOREIGN KEY 
    ( 
     CD_VIDEO
    ) 
    REFERENCES MC_VIDEO 
    ( 
     CD_VIDEO
    ) 
;

CREATE OR REPLACE TRIGGER ARC_Arc_1_MC_CLI_FISICA 
BEFORE INSERT OR UPDATE OF NR_CLIENTE 
ON MC_CLI_FISICA 
FOR EACH ROW 
DECLARE 
    d CHAR (1); 
BEGIN 
    SELECT A.TP_CLIENTE INTO d 
    FROM MC_CLIENTE A 
    WHERE A.NR_CLIENTE = :new.NR_CLIENTE; 
    IF (d IS NULL OR d <> 'F') THEN 
        raise_application_error(-20223,'FK FK_MC_CLI_FIS_MC_CLI in Table MC_CLI_FISICA violates Arc constraint on Table MC_CLIENTE - discriminator column TP_CLIENTE doesn''t have value ''F'''); 
    END IF; 
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        NULL; 
    WHEN OTHERS THEN 
        RAISE; 
END; 
/

CREATE OR REPLACE TRIGGER ARC_Arc_1_MC_CLI_JURIDICA 
BEFORE INSERT OR UPDATE OF NR_CLIENTE 
ON MC_CLI_JURIDICA 
FOR EACH ROW 
DECLARE 
    d CHAR (1); 
BEGIN 
    SELECT A.TP_CLIENTE INTO d 
    FROM MC_CLIENTE A 
    WHERE A.NR_CLIENTE = :new.NR_CLIENTE; 
    IF (d IS NULL OR d <> 'J') THEN 
        raise_application_error(-20223,'FK FK_MC_CLI_JUR_MC_CLI in Table MC_CLI_JURIDICA violates Arc constraint on Table MC_CLIENTE - discriminator column TP_CLIENTE doesn''t have value ''J'''); 
    END IF; 
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        NULL; 
    WHEN OTHERS THEN 
        RAISE; 
END; 
/


-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            19
-- CREATE INDEX                             4
-- ALTER TABLE                             68
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
