DELIMITER //
	CREATE TRIGGER tri_vendas_ai
    AFTER INSERT ON comivenda
    FOR EACH ROW
BEGIN
	
    DECLARE vtotal_itens FLOAT(10,2);
	DECLARE nVenda FLOAT(10,2);
	DECLARE idVenda FLOAT(10,2);
    DECLARE venda FLOAT(10,2);
    DECLARE fimLoop INT DEFAULT 0;
    
    
    DECLARE busca_itens CURSOR FOR 
		SELECT e.n_numeivenda,e.n_valoivenda,v.n_valovenda
        FROM comivenda e
        inner join comvenda v
        WHERE e.n_numevenda = v.c_codivenda;
        
	
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET fimLoop = 1;
    OPEN busca_itens;
    
    itens : LOOP 
    IF fimLoop = 1 THEN 
			LEAVE itens;
		END IF;
    
		FETCH busca_itens into idVenda,venda,nVenda;
        
        SET vtotal_itens = (venda + nVenda);
        
	END LOOP itens;
		CLOSE busca_itens;
         
        UPDATE comvenda SET n_totavenda = vtotal_itens
        WHERE n_numevenda = NEW.n_numevenda limit 1;
END //
DELIMITER ;


        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        