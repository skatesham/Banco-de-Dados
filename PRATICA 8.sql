

/*1. Quais as gravadoras que não possuem CDs cadastrados com preço inferior a 80,00? */

SELECT GRAV_NOME FROM GRAVADORA WHERE GRAV_CODIGO IN (SELECT GRAV_CODIGO FROM CD WHERE CD_PRECO_VENDA < 80);


/*2. Quais os CDs que têm o preço igual ao maior preço de cada gravadora?*/

SELECT CD_NOME, CD_PRECO_VENDA, GRAV_CODIGO FROM CD WHERE CD_PRECO_VENDA IN (SELECT MAX(CD_PRECO_VENDA) FROM CD GROUP BY GRAV_CODIGO);

/*3. Quais os CDs que têm preço inferior a qualquer outro CD da gravadora com código 10? */

SELECT CD_NOME, CD_PRECO_VENDA FROM CD WHERE CD_PRECO_VENDA < (SELECT MIN(CD_PRECO_VENDA) FROM CD WHERE GRAV_CODIGO = 2 GROUP BY GRAV_CODIGO);

/*4. Quais CDs têm o preço de venda menor que a média de preço de venda de todas as gravadoras?*/

SELECT CD_NOME, CD_PRECO_VENDA FROM CD WHERE CD_PRECO_VENDA < (SELECT AVG(CD_PRECO_VENDA) FROM CD);

/*5. Liste os nomes dos CDs que tenham preço de venda maior que 10,00 reais ou a gravadora seja a de código 3, ordenados por ordem alfabética decrescente dos nomes dos CDs. Exibir os nomes dos CDs em iniciando com a letra maiúscula.*/

SELECT CONCAT(UPPER(SUBSTR(CD_NOME,1,1)), LOWER(SUBSTR(CD_NOME,2,LENGTH(CD_NOME)))) AS NOME FROM CD WHERE CD_PRECO_VENDA < 15 OR GRAV_CODIGO = 3 ORDER BY CD_NOME DESC;

/*6. Exibir o nome, a data de lançamento e nome da gravadora dos CDs que possuem data de lançamento em um intervalo de datas. */

SELECT C.CD_NOME, C.CD_DATA_LANCAMENTO, G.GRAV_NOME FROM CD C INNER JOIN GRAVADORA G ON C.GRAV_CODIGO=G.GRAV_CODIGO WHERE C.CD_DATA_LANCAMENTO BETWEEN '10/06/17' AND '13/06/17';

/*7. Exibir o nome do Cd e de suas gravadoras, exiba também os CD´S que não possuam gravadoras.*/

SELECT C.CD_NOME, D.GRAV_NOME FROM CD C LEFT OUTER JOIN GRAVADORA D ON C.GRAV_CODIGO=D.GRAV_CODIGO;

/*8. Listar quantas músicas que há em cada CD. (Exibir código do CD e a quantidade de música).*/

SELECT CD_CODIGO, COUNT(CD_CODIGO) FROM FAIXA GROUP BY CD_CODIGO;

/*9. Definir a qual categoria (cat_codigo) cada Cd pertence.*/

SELECT * FROM CD_CATEGORIA;

SELECT C.CD_NOME, D.CAT_CODIGO FROM CD C INNER JOIN CD_CATEGORIA D ON C.CD_PRECO_VENDA BETWEEN D.MENOR_PRECO AND D.MEIOR_PRECO;

/*10. Listar o nome do CD indicado para cada CD gravado.*/

/*11. A tabela CD_CATEGORIA possui 3 categorias cadastradas, conforme mostra a figura abaixo. */

/*12. Liste o código, nome, preço de venda, o tempo de duração total, o nome da gravadora do CD de código 101.*/

/*13. Listar o nome das gravadoras que possuem mais de 2 Cds relacionados a ela.*/

/*14. Listar o nome da música de maior duração.*/

/*15. Listar o nome das músicas, a faixa e o nome do CD em que está a música, apenas os Cds de código 102 e 103.*/

/*16. Listar (um único resultado) os autores (código autor, nome autor) com código menor que 10 e as musicas (código musica, nome musica) com código menor que 15. (Utilizarem UNION). */
