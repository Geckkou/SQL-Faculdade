/*1)Considerando a DATABASE disponívelem https://github.com/DIOGOBRODRIGUES/DBP_3MA2021_1/blob/master/aula5.sqlDesenvolva 
uma função queinsere um novo aluno na tabela “Aluno” e retorne o nome do aluno Inserido.*/

DELIMITER //
CREATE FUNCTION InserirAluno(cod_curso INTEGER,
    dat_nasc DATE, 
    tot_cred INTEGER,
    mgp DOUBLE,
    nom_alun VARCHAR (60), 
    email VARCHAR (30)) RETURNS VARCHAR(50) DETERMINISTIC
    
BEGIN
    INSERT INTO aluno VALUES(default,cod_curso,dat_nasc,tot_cred,mgp,nom_alun,email);
    RETURN nom_alun;
END//
DELIMITER ;

SELECT InserirAluno(5,'2001-07-11',60,8.75,'mamba','mamba@gmail.com') as Aluno;



/*2)Desenvolva um procedimento em MYSQL que imprima a sequênciade 5 números 
utilizando a estrutura de repetição WHILE, saída esperada abaixo.
str - 1, 2, 3, 4, 5, */

DELIMITER //
CREATE PROCEDURE contagem()
BEGIN
	DECLARE contador SMALLINT default 0;
    DECLARE aux varchar(20);
    DECLARE n1 SMALLINT;
    DECLARE n2 SMALLINT;
    DECLARE n3 SMALLINT;
    DECLARE n4 SMALLINT;

		WHILE contador < 5 DO 
		SET contador = contador + 1;
        
        SET n1 = contador - 4; ## 5 - 4 = 1
		SET n2 = contador - 3;  ## 5 - 3 = 2 
		SET n3 = contador - 2;  ## 5 - 2 = 3
		SET n4 = contador - 1;  ## 5 - 1 = 4
           
        SET aux = concat(n1,',',n2,',',n3,',',n4,',',contador);
		END WHILE;
        SELECT aux AS str;
END //
DELIMITER;

call contagem();


/*3)Faça um procedimento em MYSQL que use a estrutura de repetição REPEAT 
para concatenar números de 1 a 9 (função concatenar em MySQL “CONCAT”);
result - 1,2,3,4,5,6,7,8,9, */

DELIMITER //
CREATE PROCEDURE sequencia()
	BEGIN
	DECLARE contador int DEFAULT 0;
    DECLARE res VARCHAR(40);
    
	DECLARE n1 SMALLINT;
    DECLARE n2 SMALLINT;
    DECLARE n3 SMALLINT;
    DECLARE n4 SMALLINT;
	DECLARE n5 SMALLINT;
    DECLARE n6 SMALLINT;
    DECLARE n7 SMALLINT;
    DECLARE n8 SMALLINT;
    
    REPEAT
		 SET contador = contador + 1;
         
         SET n1 = contador - 8; ## 9 - 8 = 1
         SET n2 = contador - 7;  ## 9 - 7 = 2 
		 SET n3 = contador - 6;  ## 9 - 6 = 3
		 SET n4 = contador - 5;  ## 9 - 5 = 4
		 SET n5 = contador - 4;  ## 9 - 4 = 5
		 SET n6 = contador - 3;  ## 9 - 3 = 6
		 SET n7 = contador - 2;  ## 9 - 2 = 7
		 SET n8 = contador - 1;  ## 9 - 1 = 8
         
         SET res = concat(n1,',',n2,',',n3,',',n4,',',n5,',',n6,',',n7,',',n8,',',contador);
	UNTIL contador >= 9
    END REPEAT;
    SELECT res AS result;
END //
DELIMITER ;

CALL sequencia();



