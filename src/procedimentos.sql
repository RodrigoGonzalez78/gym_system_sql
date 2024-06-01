
CREATE PROCEDURE CrearPlanEntrenamiento
    @id_usuario_instructor INT,
    @precio DECIMAL(10, 2),
    @descripcion TEXT
AS
BEGIN
    INSERT INTO PlanEntrenamiento (id_usuario, precio, descripcion)
    VALUES (@id_usuario_instructor, @precio, @descripcion);
END;




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


--Crear un nuevo estado fisico o avance de progreso
CREATE PROCEDURE CrearEstadoFisico
    @titulo VARCHAR(100),
    @peso DECIMAL(5, 2),
    @altura DECIMAL(5, 2),
    @notas TEXT,
    @inactivo_estado_fisico BIT,
    @id_alumno_suscripcion INT,
    @imagen_url VARCHAR(100)
AS
BEGIN
    INSERT INTO EstadoFisico (titulo, peso, altura, fecha_creacion, notas, inactivo_estado_fisico, id_alumno_suscripcion, imagen_url)
    VALUES (@titulo, @peso, @altura, GETDATE(), @notas, @inactivo_estado_fisico, @id_alumno_suscripcion, @imagen_url);
END;


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
