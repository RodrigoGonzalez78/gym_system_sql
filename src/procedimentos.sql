CREATE PROCEDURE CrearPlanEntrenamiento
    @id_instructor INT,
    @precio DECIMAL(10, 2),
    @descripcion VARCHAR(255),
    @inactivo_plan_entrenamiento BIT
AS
BEGIN
    INSERT INTO PlanEntrenamiento (id_instructor, precio, descripcion, inactivo_plan_entrenamiento)
    VALUES (@id_instructor, @precio, @descripcion, @inactivo_plan_entrenamiento);
END;





CREATE PROCEDURE CrearInstructor
    @apodo VARCHAR(20),
    @nombre VARCHAR(20),
    @apellido VARCHAR(20),
    @avatar_url VARCHAR(100),
    @contrasena VARCHAR(100),
    @numero_telefono VARCHAR(100),
    @sexo CHAR(1),
    @usuario_inactivo BIT,
    @instructor_inactivo BIT
AS
BEGIN
    DECLARE @id_usuario INT;

    -- Crear el usuario con id_rol = 2
    INSERT INTO Usuario (id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_creacion, numero_telefono, sexo, usuario_inactivo)
    VALUES (2, @apodo, @nombre, @apellido, @avatar_url, @contrasena, GETDATE(), @numero_telefono, @sexo, @usuario_inactivo);

    -- Obtener el id_usuario del usuario recién creado
    SELECT @id_usuario = SCOPE_IDENTITY();

    -- Crear el instructor
    INSERT INTO Instructor (id_usuario, instructor_inactivo)
    VALUES (@id_usuario, @instructor_inactivo);
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
    @sexo CHAR(1),
    @usuario_inactivo BIT
AS
BEGIN
    -- Crear el usuario con id_rol = 3
    INSERT INTO Usuario (id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_creacion, numero_telefono, sexo, usuario_inactivo)
    VALUES (3, @apodo, @nombre, @apellido, @avatar_url, @contrasena, GETDATE(), @numero_telefono, @sexo, @usuario_inactivo);
END;
