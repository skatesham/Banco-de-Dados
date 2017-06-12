/*mostrar nome_usuario e nome_dispositivo que foi acessado;*/
SELECT H.NOME_USUARIO,A.ID_USUARIO, D.NOME 
FROM USUARIO U,USUARIO H, ACESSOS A, DISPOSITVO D 
WHERE U.ID_USUARIO=A.ID_USUARIO AND A.ID_DISP=D.ID_DISP;

mostrar dispositivo mais acessado

mostrar usuario que mais acessou 

SELECT 