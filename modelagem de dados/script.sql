
CREATE TABLE Tb_EDITORA (
                cod_editoria VARCHAR2(10) NOT NULL,
                telefone_1 VARCHAR2(14) NOT NULL,
                telefone_2 VARCHAR2(14),
                email VARCHAR2(50) NOT NULL,
                nome_contato VARCHAR2(50) NOT NULL,
                CONSTRAINT TB_EDITORA_PK PRIMARY KEY (cod_editoria)
);


CREATE TABLE Tb_LIVRO (
                cod_livro VARCHAR2(10) NOT NULL,
                valor NUMBER NOT NULL,
                ano_publicacao NUMBER NOT NULL,
                categoria VARCHAR2(25) NOT NULL,
                titulo VARCHAR2(50) NOT NULL,
                nome_livro VARCHAR2(50) NOT NULL,
                isbn NUMBER NOT NULL,
                autor VARCHAR2(20) NOT NULL,
                cod_editoria VARCHAR2(10) NOT NULL,
                CONSTRAINT TB_LIVRO_PK PRIMARY KEY (cod_livro)
);


CREATE TABLE Tb_ESTOQUE (
                cod_livro VARCHAR2(10) NOT NULL,
                qtd_estoque NUMBER NOT NULL,
                CONSTRAINT TB_ESTOQUE_PK PRIMARY KEY (cod_livro)
);


CREATE TABLE Tb_CLIENTE (
                cod_cliente VARCHAR2(20) NOT NULL,
                nome VARCHAR2(50) NOT NULL,
                telefone_1 VARCHAR2(14),
                telefone_2 VARCHAR2(14),
                email VARCHAR2(50) NOT NULL,
                rua VARCHAR2(50) NOT NULL,
                bairro VARCHAR2(20) NOT NULL,
                cidade VARCHAR2(15) NOT NULL,
                estado VARCHAR2(10) NOT NULL,
                CONSTRAINT TB_CLIENTE_PK PRIMARY KEY (cod_cliente)
);


CREATE TABLE Tb_PESSOA_JURIDICA (
                cod_cliente VARCHAR2(20) NOT NULL,
                cnpj VARCHAR2(14) NOT NULL,
                ie VARCHAR2(14) NOT NULL,
                CONSTRAINT TB_PESSOA_JURIDICA_PK PRIMARY KEY (cod_cliente)
);


CREATE TABLE Tb_PESSOA_FISICA (
                cod_cliente VARCHAR2(20) NOT NULL,
                cpf VARCHAR2(11) NOT NULL,
                rg VARCHAR2(10) NOT NULL,
                CONSTRAINT TB_PESSOA_FISICA_PK PRIMARY KEY (cod_cliente)
);


CREATE TABLE Tb_PEDIDO (
                cod_pedido VARCHAR2(10) NOT NULL,
                data DATE NOT NULL,
                valor_pedido NUMBER NOT NULL,
                cod_cliente VARCHAR2(20) NOT NULL,
                CONSTRAINT TB_PEDIDO_PK PRIMARY KEY (cod_pedido)
);


CREATE TABLE Tb_ITEM_PEDIDO (
                cod_pedido VARCHAR2(10) NOT NULL,
                cod_livro VARCHAR2(10) NOT NULL,
                qtd_pedido NUMBER NOT NULL,
                valor_item NUMBER NOT NULL,
                CONSTRAINT TB_ITEM_PEDIDO_PK PRIMARY KEY (cod_pedido, cod_livro)
);


ALTER TABLE Tb_LIVRO ADD CONSTRAINT TB_EDITORA_TB_LIVRO_FK
FOREIGN KEY (cod_editoria)
REFERENCES Tb_EDITORA (cod_editoria)
NOT DEFERRABLE;

ALTER TABLE Tb_ITEM_PEDIDO ADD CONSTRAINT TB_LIVRO_TB_ITEM_PEDIDO_FK
FOREIGN KEY (cod_livro)
REFERENCES Tb_LIVRO (cod_livro)
NOT DEFERRABLE;

ALTER TABLE Tb_ESTOQUE ADD CONSTRAINT TB_LIVRO_TB_ESTOQUE_FK
FOREIGN KEY (cod_livro)
REFERENCES Tb_LIVRO (cod_livro)
NOT DEFERRABLE;

ALTER TABLE Tb_PEDIDO ADD CONSTRAINT TB_CLIENTE_TB_PEDIDO_FK
FOREIGN KEY (cod_cliente)
REFERENCES Tb_CLIENTE (cod_cliente)
NOT DEFERRABLE;

ALTER TABLE Tb_PESSOA_FISICA ADD CONSTRAINT TB_CLIENTE_TB_PESSOA_FISICA_FK
FOREIGN KEY (cod_cliente)
REFERENCES Tb_CLIENTE (cod_cliente)
NOT DEFERRABLE;

ALTER TABLE Tb_PESSOA_JURIDICA ADD CONSTRAINT TB_CLIENTE_TB_PESSOA_JURIDI530
FOREIGN KEY (cod_cliente)
REFERENCES Tb_CLIENTE (cod_cliente)
NOT DEFERRABLE;

ALTER TABLE Tb_ITEM_PEDIDO ADD CONSTRAINT TB_PEDIDO_TB_ITEM_PEDIDO_FK
FOREIGN KEY (cod_pedido)
REFERENCES Tb_PEDIDO (cod_pedido)
NOT DEFERRABLE;
