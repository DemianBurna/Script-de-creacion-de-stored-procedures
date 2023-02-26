
DELIMITER $$
USE `base_de_ciberseguridad`$$
CREATE PROCEDURE `ordenar` (tabla  varchar(30), campo varchar(15), orden varchar(5))
BEGIN	
	
	SET @orden_campo= concat(" ORDER BY ", campo, " ",orden);
	SET @clausula = concat("SELECT * FROM ", tabla, @orden_campo);
	PREPARE ordenar FROM @clausula;
	EXECUTE ordenar;
	DEALLOCATE PREPARE ordenar;
END$$
DELIMITER ;

DELIMITER $$
USE `base_de_ciberseguridad`$$
CREATE PROCEDURE `eliminar_cliente` (id int)
BEGIN
	
    declare max int;
    select max(id_cliente) into max from cliente;
    
    if id <= max then
		delete from cliente where id_cliente = id;
        Select confirmacion(1,id) AS Estado;
	else
		Select confirmacion(0,id) AS Estado;
	end if;
END$$
DELIMITER ;

