CREATE PROCEDURE ObtenerClientesNoExpirados
    @id_entrenador INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        COUNT(*) AS CantidadClientesNoExpirados
    FROM 
        AlumnoSuscripcion AS ASuscripcion
    JOIN 
        PlanEntrenamiento AS PEntrenamiento ON ASuscripcion.id_plan_entrenamiento = PEntrenamiento.id_plan_entrenamiento
    WHERE 
        PEntrenamiento.id_entrenador = @id_entrenador
        AND ASuscripcion.fecha_expiracion >= GETDATE();
END;