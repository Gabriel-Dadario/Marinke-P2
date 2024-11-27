-- c) Implemente uma store procedure que exiba redefine o status de uma Mesa para o Status "Livre".

DELIMITER $$

CREATE PROCEDURE Redefinir_Status (IN p_numero_mesa INT )

BEGIN 

	UPDATE mesa 
	SET  status = 0
	WHERE id_mesa = id_mesa;

SELECT CONCAT('status da mesa: ', p_numero_mesa , ' Redefinido para livre') AS Mensagem;

END;
DELIMITER $$

CALL Redefinir_Status(3);
