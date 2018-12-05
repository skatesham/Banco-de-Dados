# Banco-de-Dados
Repositório para desenvolvimento de banco de dados

Nesse trabalho foi desenvolvido um banco de dados para um sistema de Casa Inteligente ficticio.

#### Modelo Conceitual
![alt text](https://raw.githubusercontent.com/skatesham/Banco-de-Dados/master/Modelo%20Conceitural%20Artefato2.jpg)



#### Modelo Lógico
![alt text](https://raw.githubusercontent.com/skatesham/Banco-de-Dados/master/Modelo%20logico%20-%20artefato%202.jpg)

#### Comando de criação das tabelas
```
CREATE TABLE USUARIO(
ID_USUARIO NUMBER(4) CONSTRAINT PK_USUARIO PRIMARY KEY,
NOME_USUARIO VARCHAR(252) NOT NULL,
USER_USUARIO VARCHAR(20) NOT NULL,
SENHA_USARIO VARCHAR(20) NOT NULL
);

CREATE TABLE DISPOSITIVO(
ID_DISP NUMBER(4) CONSTRAINT PK_DISPOSITIVO PRIMARY KEY,
ID_TIPO NUMBER(4),
ID_PREF NUMBER(4),
NOME VARCHAR(252) NOT NULL,
STATUS NUMBER(1),
TEMP_BANHEIRA NUMBER(4),
MASSA_BANHEIRA NUMBER(4),
NIVEL_BANHEIRA NUMBER(4),
CASCATA_PISCINA NUMBER(4),
FECHA_PORTAO NUMBER(4),
POTENCIA_LUZ NUMBER(4),
STATUS_SOM NUMBER(1),
AM_FM_RADIO VARCHAR(2) CONSTRAINT CK_RADIO CHECK(AM_FM_RADIO IN('FM', 'AM')),
CANAL_RADIO NUMBER(4),
VELOCIDADE_VENTILADOR NUMBER(4),
TEMP_AR NUMBER(4),
SAIDA_AR NUMBER(4),
POTENCIA_AR NUMBER(4),
TEMP_AQUECEDOR NUMBER(4),
POTENCIA_AQUECENDOR NUMBER(4)
);
CREATE TABLE ACESSOS(
ID_DISP NUMBER(4) CONSTRAINT PK_FK_DISPOSITIVO REFERENCES
DISPOSITIVO(ID_DISP),
ID_USUARIO NUMBER(4) CONSTRAINT PK_FK_USUARIO REFERENCES
USUARIO(ID_USUARIO),
DATA_ACESSO DATE DEFAULT(SYSDATE),
CONSTRAINT ACESSOS PRIMARY KEY(ID_DISP, ID_USUARIO)
);
CREATE TABLE HORARIO(
ID_HORARIO NUMBER(4) CONSTRAINT PK_HORARIO PRIMARY KEY,
ID_DISPOSITIVO NUMBER(4) NOT NULL CONSTRAINT FK_DISPOSITIVO REFERENCES
DISPOSITIVO(ID_DISP),
ID_USUARIO NUMBER(4) NOT NULL CONSTRAINT FK_USUARIO REFERENCES
USUARIO(ID_USUARIO),
DATA_HORARIO DATE NOT NULL,
TEMPO_HORARIO DATE NOT NULL
);
CREATE TABLE TIPO(
ID_TIPO NUMBER(4) CONSTRAINT PK_TIPO PRIMARY KEY,
NOME_TIPO VARCHAR(50) NOT NULL
);
ALTER TABLE DISPOSITIVO ADD CONSTRAINT FK_TIPO FOREIGN KEY(ID_TIPO)
REFERENCES TIPO(ID_TIPO);
CREATE TABLE RADIO_PREFERIDA(
ID_PREF NUMBER(4) CONSTRAINT PK_PREFERIDA PRIMARY KEY,
NOME_PREF VARCHAR(20),
AM_FM VARCHAR(2) CONSTRAINT CK_RADIO_PREFERIDA CHECK(AM_FM IN('FM', 'AM')),
CANAL_PREF NUMBER(4)
);
ALTER TABLE DISPOSITIVO ADD CONSTRAINT FK_RADIO_PREFERIDA FOREIGN
KEY(ID_PREF) REFERENCES RADIO_PREFERIDA(ID_PREF);
```

#### Criação de uma tabela log e um Trigger para registro
```
/*TRIGGER*/
CREATE TABLE ACESSO_LOG(
DATA DATE,
ID_DISP NUMBER(4),
ID_USUARIO NUMBER(4),
MSG VARCHAR2(30)
);

/*TRIGGER: QUANDO FOR ACESSADO CRIAR LOG DE ACESSO EM ACESSO_LOG*/
CREATE OR REPLACE TRIGGER TR_ACESSO
AFTER UPDATE OR  INSERT OR DELETE ON ACESSOS
BEGIN INSERT INTO ACESSO_LOG(DATA, MSG) VALUES(SYSDATE, 'ACESSO');
END;

SET SERVEROUTPUT ON;
```


#### Comando população das Tabelas
```
CREATE SEQUENCE ID_DISP;
CREATE SEQUENCE ID_USUARIO;
CREATE SEQUENCE ID_PREF;
CREATE SEQUENCE ID_HORARIO;
CREATE SEQUENCE ID_TIPO;

INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'SHAM','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'PEDRO','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'MATEUS','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'DAVI','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'LUIS','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'JHONISSON','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'JHONATAM','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'MICHAL','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'DANI','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'MARIA','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'SHAZAN','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'PETRA','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'MATEUSA','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'DAVINA','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'LUISA','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'JHONIL','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'JHON','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'MICHALON','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'DANIELE','LOGIN','PASSWORD');
INSERT INTO USUARIO VALUES(ID_USUARIO.NEXTVAL, 'MARIANA','LOGIN','PASSWORD');

INSERT INTO TIPO VALUES(ID_TIPO.NEXTVAL, 'SOM');
INSERT INTO TIPO VALUES(ID_TIPO.NEXTVAL, 'BANHEIRA');
INSERT INTO TIPO VALUES(ID_TIPO.NEXTVAL, 'LUZ');
INSERT INTO TIPO VALUES(ID_TIPO.NEXTVAL, 'TELEFONE');
INSERT INTO TIPO VALUES(ID_TIPO.NEXTVAL, 'RADIO');
INSERT INTO TIPO VALUES(ID_TIPO.NEXTVAL, 'CAMERA');
INSERT INTO TIPO VALUES(ID_TIPO.NEXTVAL, 'PORTAO');
INSERT INTO TIPO VALUES(ID_TIPO.NEXTVAL, 'PISCINA');
INSERT INTO TIPO VALUES(ID_TIPO.NEXTVAL, 'BANHEIRA');
INSERT INTO TIPO VALUES(ID_TIPO.NEXTVAL, 'PORTA');
INSERT INTO TIPO VALUES(ID_TIPO.NEXTVAL, 'ALARME');
INSERT INTO TIPO VALUES(ID_TIPO.NEXTVAL, 'VENTILADOR');
INSERT INTO TIPO VALUES(ID_TIPO.NEXTVAL, 'AQUECEDOR');
INSERT INTO TIPO VALUES(ID_TIPO.NEXTVAL, 'AR CONDICIONADO');

INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS ,TEMP_BANHEIRA) VALUES(ID_DISP.NEXTVAL, 2, 'BANHEIRA SUITE',0,0);
INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS,STATUS_SOM) VALUES(ID_DISP.NEXTVAL, 1, 'SOM SALA',0);
INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS, POTENCIA_LUZ) VALUES(ID_DISP.NEXTVAL, 3, 'LUZ VARANDA',0,60);
INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS) VALUES(ID_DISP.NEXTVAL, 4, 'TELEFONE POS PAGO',0);
INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS, ID_PREF) VALUES(ID_DISP.NEXTVAL, 5, 'RADIO QUARTO',1, 1);
INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS, ID_PREF) VALUES(ID_DISP.NEXTVAL, 5, 'RADIO VARANDA',1, 2);
INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS, ID_PREF) VALUES(ID_DISP.NEXTVAL, 5, 'RADIO SOTAO',1, 3);
INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS, ID_PREF) VALUES(ID_DISP.NEXTVAL, 5, 'RADIO MESANINO',1, 4);
INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS, ID_PREF) VALUES(ID_DISP.NEXTVAL, 5, 'RADIO PORAO',1, 8);
INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS, ID_PREF) VALUES(ID_DISP.NEXTVAL, 5, 'RADIO QUARTO DO PANICO',1, 9);
INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS, ID_PREF) VALUES(ID_DISP.NEXTVAL, 5, 'RADIO COFRE',1, 10);
INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS) VALUES(ID_DISP.NEXTVAL, 6, 'CAMERAS CORREDOR',0);
INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS) VALUES(ID_DISP.NEXTVAL, 7, 'PORTAO ENTRADA',0);
INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS) VALUES(ID_DISP.NEXTVAL, 8, 'MOTOR PISCINA',0);
INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS,SAIDA_AR,TEMP_AR, POTENCIA_AR) VALUES(ID_DISP.NEXTVAL, 14, 'AR CONDICIONADO QUARTO',1,0, 17, 90);
INSERT INTO DISPOSITIVO(ID_DISP,ID_TIPO,NOME,STATUS, TEMP_AQUECEDOR, POTENCIA_AQUECENDOR) VALUES(ID_DISP.NEXTVAL, 10, 'AQUECEDOR PÉ DA CAMA',0,25,100);

INSERT INTO HORARIO VALUES(ID_HORARIO.NEXTVAL,1,1,SYSDATE,SYSDATE+10);
INSERT INTO HORARIO VALUES(ID_HORARIO.NEXTVAL,2,2,SYSDATE,SYSDATE+10);
INSERT INTO HORARIO VALUES(ID_HORARIO.NEXTVAL,3,3,SYSDATE,SYSDATE+10);
INSERT INTO HORARIO VALUES(ID_HORARIO.NEXTVAL,4,4,SYSDATE,SYSDATE+10);
INSERT INTO HORARIO VALUES(ID_HORARIO.NEXTVAL,5,5,SYSDATE,SYSDATE+10);
INSERT INTO HORARIO VALUES(ID_HORARIO.NEXTVAL,6,6,SYSDATE,SYSDATE+10);
INSERT INTO HORARIO VALUES(ID_HORARIO.NEXTVAL,7,7,SYSDATE,SYSDATE+10);
INSERT INTO HORARIO VALUES(ID_HORARIO.NEXTVAL,8,8,SYSDATE,SYSDATE+10);
INSERT INTO HORARIO VALUES(ID_HORARIO.NEXTVAL,9,9,SYSDATE,SYSDATE+10);
INSERT INTO HORARIO VALUES(ID_HORARIO.NEXTVAL,2,4,SYSDATE,SYSDATE+10);

INSERT INTO ACESSOS VALUES(17,1,SYSDATE+1);
INSERT INTO ACESSOS VALUES(22,2,SYSDATE+1);
INSERT INTO ACESSOS VALUES(15,1,SYSDATE+1);
INSERT INTO ACESSOS VALUES(14,7,SYSDATE+1);
INSERT INTO ACESSOS VALUES(22,6,SYSDATE+1);
INSERT INTO ACESSOS VALUES(18,4,SYSDATE+1);
INSERT INTO ACESSOS VALUES(21,2,SYSDATE+1);
INSERT INTO ACESSOS VALUES(20,7,SYSDATE+1);
INSERT INTO ACESSOS VALUES(12,4,SYSDATE+1);
INSERT INTO ACESSOS VALUES(13,5,SYSDATE+1);
INSERT INTO ACESSOS VALUES(14,4,SYSDATE+1);

SELECT D.ID_DISP,D.NOME, U.ID_USUARIO FROM USUARIO U, DISPOSITIVO D; 

INSERT INTO RADIO_PREFERIDA VALUES(ID_PREF.NEXTVAL, 'RADIO BAND FM', 'FM', 62);
INSERT INTO RADIO_PREFERIDA VALUES(ID_PREF.NEXTVAL, 'BANDVALE', 'FM', 99);
INSERT INTO RADIO_PREFERIDA VALUES(ID_PREF.NEXTVAL, 'JOVEM PM', 'FM', 102);
INSERT INTO RADIO_PREFERIDA VALUES(ID_PREF.NEXTVAL, 'RADIO BAND FM', 'FM', 62);
INSERT INTO RADIO_PREFERIDA VALUES(ID_PREF.NEXTVAL, 'RADIO BAND FM', 'FM', 62);
INSERT INTO RADIO_PREFERIDA VALUES(ID_PREF.NEXTVAL, 'RADIO BAND FM', 'FM', 62);
INSERT INTO RADIO_PREFERIDA VALUES(ID_PREF.NEXTVAL, 'RADIO BAND FM', 'FM', 62);
INSERT INTO RADIO_PREFERIDA VALUES(ID_PREF.NEXTVAL, 'BANDVALE', 'FM', 99);
INSERT INTO RADIO_PREFERIDA VALUES(ID_PREF.NEXTVAL, 'JOVEM PM', 'FM', 102);
INSERT INTO RADIO_PREFERIDA VALUES(ID_PREF.NEXTVAL, 'RADIO BAND FM', 'FM', 62);
INSERT INTO RADIO_PREFERIDA VALUES(ID_PREF.NEXTVAL, 'RADIO BAND FM', 'FM', 62);
INSERT INTO RADIO_PREFERIDA VALUES(ID_PREF.NEXTVAL, 'RADIO BAND FM', 'FM', 62);
```


#### 20 Consultas (Query's) nesse banco
```
/*1 MOSTRAR NOME USUARIO E NOME DISPOSITIVO DOS ACESSOS*/
SELECT U.NOME_USUARIO, D.NOME
FROM USUARIO U, ACESSOS A, DISPOSITIVO D 
WHERE U.ID_USUARIO=A.ID_USUARIO AND A.ID_DISP=D.ID_DISP;
/*2. MOSTRAR NOME USUARIO E NOME DISPOSITIVO DATA HORARIO E TEMPO HORARIO DA TABELA HORARIO*/
SELECT U.NOME_USUARIO, D.NOME, A.DATA_HORARIO, A.TEMPO_HORARIO 
FROM USUARIO U, HORARIO A, DISPOSITIVO D 
WHERE U.ID_USUARIO=A.ID_USUARIO AND A.ID_DISPOSITIVO=D.ID_DISP;
/*3. MOSTRAR QUANTIDADE DE ACESSOS EM CADA DISPOSITIVO*/
SELECT D.NOME, COUNT(A.ID_DISP) 
FROM ACESSOS A RIGHT OUTER JOIN DISPOSITIVO D 
ON A.ID_DISP=D.ID_DISP 
GROUP BY A.ID_DISP, D.NOME;
/*4. MOSTRAR NOME DISPOSITIVOS COM NOME TIPO DO DISPOSITIVO*/
SELECT D.NOME, T.NOME_TIPO 
FROM DISPOSITIVO D, TIPO T 
WHERE D.ID_TIPO=T.ID_TIPO;
/*5. MOSTRAR NOME USUARIO QUE ADICIONOU NO HORARIO NA DATA '07/06'17' */
SELECT NOME_USUARIO FROM USUARIO WHERE ID_USUARIO IN (SELECT ID_USUARIO FROM HORARIO HAVING DATA_HORARIO = '07/06/17');
/*6. MOSTRAR NOME DISPOSITIVO E QUANTIDADE DE CADA TIME DE DISPOSITIVO*/
SELECT NOME, COUNT(ID_TIPO) FROM DISPOSITIVO GROUP BY ID_TIPO, NOME;
/*7. MOSTRAR QUANTIDADE DE ACESSOS DE CADA USUARIO*/
SELECT U.NOME_USUARIO, COUNT(A.ID_USUARIO) FROM USUARIO U, ACESSOS A WHERE U.ID_USUARIO=A.ID_USUARIO GROUP BY U.NOME_USUARIO, A.ID_USUARIO;
/*8. SELECIONAR DISPOSITIVOS QUE ESTAO DESLIGADO*/
SELECT NOME FROM DISPOSITIVO WHERE STATUS = 0;
/*9. SELECIONAR NOME USUARIO E NOME DISPOSITIVO DOS ACESSOS DE DISPOSITIVOS DESLIGADOS*/
SELECT U.NOME_USUARIO, A.ID_USUARIO, A.ID_DISP, D.NOME 
FROM USUARIO U, ACESSOS A, DISPOSITIVO D 
WHERE U.ID_USUARIO=A.ID_USUARIO AND A.ID_DISP=D.ID_DISP AND D.STATUS = 0;
/*10. MOSTRAR DISPOSITIVOS BANHEIRAS NOMES E SEUS ATRIBUTOS */
SELECT NOME, MASSA_BANHEIRA, NIVEL_BANHEIRA, TEMP_BANHEIRA 
FROM DISPOSITIVO WHERE ID_TIPO IN (SELECT ID_TIPO FROM TIPO 
WHERE NOME_TIPO='BANHEIRA');
/*11. MOSTRAR RAPIDO DE ID NUMERO 12*/
SELECT * FROM RADIO_PREFERIDA WHERE ID_PREF=12;
/*12. MOSTRAR DIPOSITIVO MAIS CONFIGURADO EM HORARIO*/
SELECT * FROM (SELECT D.NOME, H.ID_DISPOSITIVO, COUNT(H.ID_DISPOSITIVO) 
FROM HORARIO H, DISPOSITIVO D WHERE H.ID_DISPOSITIVO=D.ID_DISP 
GROUP BY H.ID_DISPOSITIVO, D.NOME 
ORDER BY COUNT(H.ID_DISPOSITIVO) DESC) 
WHERE ROWNUM = 1;
/*13. USUARIO MAIS CONFIGUROU EM HORARIO */
SELECT * FROM (SELECT U.NOME_USUARIO, H.ID_USUARIO, COUNT(H.ID_USUARIO) 
FROM USUARIO U, HORARIO H 
WHERE H.ID_USUARIO=U.ID_USUARIO
GROUP BY U.NOME_USUARIO, H.ID_USUARIO) WHERE ROWNUM = 1;
/*14. MOSTRAR TIPO DO DISPOSITIVO SELECIONADO CASO 8*/
SELECT D.NOME, D.ID_TIPO, T.NOME_TIPO 
FROM DISPOSITIVO D, TIPO T 
WHERE D.ID_TIPO=T.ID_TIPO AND T.ID_TIPO = 8;

/*15. MOSTRAR RADIOS CADASTRADOS E SEUS NOMES DE RADIOS PREFERIDAS */
SELECT D.NOME,D.ID_PREF, R.NOME_PREF  
FROM DISPOSITIVO D, RADIO_PREFERIDA R 
WHERE D.ID_PREF=R.ID_PREF AND D.ID_TIPO = (SELECT ID_TIPO FROM TIPO WHERE NOME_TIPO='RADIO');
/*16. MOSTRAR RAPIDO MAIS ESCUDA ENTRE OS RADIOS CADASTRADO PROCURANDO POR TIPO DE RADIO*/
SELECT * FROM (SELECT NOME_PREF, COUNT(NOME_PREF) FROM (SELECT R.NOME_PREF  
FROM DISPOSITIVO D, RADIO_PREFERIDA R 
WHERE D.ID_PREF=R.ID_PREF AND D.ID_TIPO = (SELECT ID_TIPO FROM TIPO WHERE NOME_TIPO='RADIO')) GROUP BY NOME_PREF ORDER BY COUNT(NOME_PREF) DESC) WHERE ROWNUM = 1;
/*17. MOSTRAR DISPOSITIVOS MAIS ESCUTADOS ENTRE OS CADASTRADOS PROCURANDO POR DISPOSITIVO QUE TENHA RADIO PREFERIDA*/
SELECT * FROM (SELECT NOME_PREF, COUNT(NOME_PREF) FROM RADIO_PREFERIDA WHERE  ID_PREF IN (SELECT ID_PREF FROM DISPOSITIVO) GROUP BY NOME_PREF ORDER BY COUNT(NOME_PREF) DESC) WHERE ROWNUM = 1;
/*18. MOSTRAR NOME DOS USUARIOS QUE FIZERAM ACESSOS QUE EM RADIOS E SUA RADIO PREFERIDA*/
SELECT U.NOME_USUARIO, D.NOME, R.NOME_PREF 
FROM ACESSOS A, USUARIO U, DISPOSITIVO D, RADIO_PREFERIDA R 
WHERE A.ID_USUARIO=U.ID_USUARIO AND A.ID_DISP=D.ID_DISP AND D.ID_PREF=R.ID_PREF;
/*19. MOSTRAR QUANTIDADE DE ACESSOS POR DATA*/
SELECT COUNT(DATA), DATA FROM ACESSO_LOG GROUP BY DATA;
/*20. MOSTRAR LOGS FEITOS POR ACESSOS */
SELECT * FROM ACESSO_LOG;
```
