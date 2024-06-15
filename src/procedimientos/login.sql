CREATE PROCEDURE LoginUsuario
    @apodo VARCHAR(20),
    @contrasena VARCHAR(100)
AS
BEGIN
    -- Declaración de variables
    DECLARE @id_usuario INT;
    DECLARE @usuario_inactivo BIT;

    -- Verificar las credenciales del usuario
    SELECT @id_usuario = id_usuario,
           @usuario_inactivo = usuario_inactivo
    FROM Usuario
    WHERE apodo = @apodo AND contrasena = @contrasena;

    -- Si las credenciales son correctas y el usuario no está inactivo
    IF @id_usuario IS NOT NULL AND @usuario_inactivo = 0
    BEGIN
        -- Devolver los datos del usuario excepto la contraseña
        SELECT id_usuario,
               id_rol,
               apodo,
               nombre,
               apellido,
               avatar_url,
               fecha_creacion,
               numero_telefono,
               sexo,
               usuario_inactivo
        FROM Usuario
        WHERE id_usuario = @id_usuario;
    END
    ELSE
    BEGIN
        -- Devolver un mensaje de error
        SELECT 'Credenciales inválidas o usuario inactivo' AS mensaje_error;
    END
END;