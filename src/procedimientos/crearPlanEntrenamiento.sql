CREATE PROCEDURE CrearPlanEntrenamiento
    @id_entrenador INT,
    @precio DECIMAL(10, 2),
    @descripcion TEXT
AS
BEGIN
    INSERT INTO PlanEntrenamiento (id_entrenador, precio, descripcion)
    VALUES (@id_entrenador, @precio, @descripcion);
END;
