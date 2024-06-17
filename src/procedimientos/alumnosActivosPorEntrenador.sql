CREATE PROCEDURE ObtenerAlumnosActivosPorEntrenador
    @id_entrenador INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        U.id_usuario AS id_alumno,
        U.apodo,
        U.nombre,
        U.apellido,
        U.avatar_url,
        U.fecha_nacimiento,
        U.numero_telefono,
        U.sexo,
        U.usuario_inactivo
    FROM 
        AlumnoSuscripcion AS ASuscripcion
    JOIN 
        PlanEntrenamiento AS PEntrenamiento ON ASuscripcion.id_plan_entrenamiento = PEntrenamiento.id_plan_entrenamiento
    JOIN 
        Usuario AS U ON ASuscripcion.id_alumno = U.id_usuario
    WHERE 
        PEntrenamiento.id_entrenador = @id_entrenador
        AND ASuscripcion.fecha_expiracion >= GETDATE()
    ORDER BY 
        U.apellido, U.nombre;
END;

