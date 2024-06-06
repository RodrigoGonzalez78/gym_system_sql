--Crear un nuevo estado fisico o avance de progreso
CREATE PROCEDURE CrearEstadoFisico
    @titulo VARCHAR(100),
    @peso DECIMAL(5, 2),
    @altura DECIMAL(5, 2),
    @notas TEXT,
    @id_alumno_suscripcion INT,
    @imagen_url VARCHAR(100)
AS
BEGIN
    INSERT INTO EstadoFisico (titulo, peso, altura, fecha_creacion, notas, id_alumno_suscripcion, imagen_url)
    VALUES (@titulo, @peso, @altura, GETDATE(), @notas, @id_alumno_suscripcion, @imagen_url);
END;
