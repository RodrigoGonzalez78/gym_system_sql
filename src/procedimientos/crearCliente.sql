CREATE PROCEDURE CrearCliente
    @apodo VARCHAR(20),
    @nombre VARCHAR(20),
    @apellido VARCHAR(20),
    @avatar_url VARCHAR(100),
    @contrasena VARCHAR(100),
    @numero_telefono VARCHAR(100),
    @sexo CHAR(1)
AS
BEGIN
    -- Crear el usuario con id_rol = 3
    INSERT INTO Usuario (id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_creacion, numero_telefono, sexo)
    VALUES (3, @apodo, @nombre, @apellido, @avatar_url, @contrasena, GETDATE(), @numero_telefono, @sexo);
END;
