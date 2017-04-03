CREATE TABLE Cliente(
    cod number(6) not null,
    nome varchar2(30),
    ativo number(2) DEFAULT 1,
    data_nasc date);
    
INSERT INTO CLIENTE VALUES(1,'Sham', 0, '08/11/1993');
INSERT INTO CLIENTE(COD,NOME,DATA_NASC) VALUES(2, 'Marie','21/09/1995');

SELECT * FROM CLIENTE;

INSERT INTO CLIENTE(COD,NOME,DATA_NASC) VALUES(3, 'Isabela','20/04/2017');

INSERT INTO CLIENTE(COD,NOME) VALUES(4, 'Aruã');

INSERT INTO CLIENTE VALUES(5,'James',0, '11/11/1956');

CREATE TABLE ALUNO(
  COD_ALUNO number(4) NOT NULL,
  MATRICULA number(4) NOT NULL,
  NOME varchar2(40),
  CPF varchar2(11),
  CONSTRAINT UK_CPF Unique(CPF)
  );
  
INSERT INTO ALUNO VALUES(1,42, 'Candido', 05325855182);
INSERT INTO ALUNO VALUES(1,42, 'Naiana',  15692564852);
INSERT INTO ALUNO VALUES(1,42, 'Naiana',  15692564852);

SELECT * FROM ALUNO;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS, SEARCH_CONDITION FROM USER_CONSTRAINTS WHERE TABLE_NAME='ALUNO';


CREATE TABLE PEDIDO(
    ped_cod number(6) CONSTRAINT ped_cod_pk PRIMARY KEY,
    ped_data date,
    ped_valor number(8,2)
)

CREATE TABLE PRODUTO(
    pro_cod number(6) CONSTRAINT pro_cod_pk PRIMARY KEY,
    pro_quant NUMBER(6),
    pro_valor number(8,2)
)

CREATE TABLE ITEMPEDIDO(
    ped_cod number(6) constraint ped_cod_fk references pedido(ped_cod),
    pro_cod number(6) constraint ped_pro references produto(pro_cod),
    ite_quant number(6),
    ite_valor number(8,2),
    constraint ped_pro_cod_pk primary key(ped_cod, pro_cod)
    );

Select * From Produto;
Select * From pedido;
Select * From itempedido;

INSERT INTO PRODUTO VALUES(0, 23, 99.99);
INSERT INTO PRODUTO VALUES(1, 55, 1.99);

INSERT INTO pedido VALUES(0, '08/11/1993', 25.5);
INSERT INTO pedido VALUES(1, '21/09/1995', 100.99);

INSERT INTO itempedido VALUES(0,0,10, 299.99);

INSERT INTO itempedido VALUES(1,1,20, 999.66);

Select * From Produto;

Select * From pedido;

Select * From itempedido;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS, SEARCH_CONDITION FROM USER_CONSTRAINTS WHERE TABLE_NAME='PRODUTO';

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS, SEARCH_CONDITION FROM USER_CONSTRAINTS WHERE TABLE_NAME='PEDIDO';

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS, SEARCH_CONDITION FROM USER_CONSTRAINTS WHERE TABLE_NAME='ITEMPEDIDO';
