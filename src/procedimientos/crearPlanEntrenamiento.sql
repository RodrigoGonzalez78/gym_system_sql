CREATE PROCEDURE CrearPlanEntrenamiento
    @id_usuario_instructor INT,
    @precio DECIMAL(10, 2),
    @descripcion TEXT
AS
BEGIN
    INSERT INTO PlanEntrenamiento (id_usuario, precio, descripcion)
    VALUES (@id_usuario_instructor, @precio, @descripcion);
END;
