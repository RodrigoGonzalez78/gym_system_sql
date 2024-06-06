CREATE PROCEDURE CrearInstructor
    @apodo VARCHAR(20),
    @nombre VARCHAR(20),
    @apellido VARCHAR(20),
    @avatar_url VARCHAR(100),
    @contrasena VARCHAR(100),
    @numero_telefono VARCHAR(100),
    @sexo CHAR(1)
AS
BEGIN
    INSERT INTO Usuario (id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_creacion, numero_telefono, sexo)
    VALUES (2, @apodo, @nombre, @apellido, @avatar_url, @contrasena, GETDATE(), @numero_telefono, @sexo);
END;