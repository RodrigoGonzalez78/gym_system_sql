
--Desactiva o activa al usuario depende 
CREATE PROCEDURE CambiarEstadoUsuario
    @id_usuario INT
AS
BEGIN
    UPDATE Usuario
    SET usuario_inactivo = CASE 
                             WHEN usuario_inactivo = 1 THEN 0
                             ELSE 1
                           END
    WHERE id_usuario = @id_usuario;
END;
