CREATE TRIGGER TR_EstadoFisico_Audit
ON EstadoFisico
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO EstadoFisico_Audit (id_estado_fisico, titulo, peso, altura, fecha_creacion, notas, estado_fisico_inactivo, id_alumno_suscripcion, imagen_url, operation_type)
        SELECT id_estado_fisico, titulo, peso, altura, fecha_creacion, notas, estado_fisico_inactivo, id_alumno_suscripcion, imagen_url, 'I'
        FROM inserted;
    END

    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO EstadoFisico_Audit (id_estado_fisico, titulo, peso, altura, fecha_creacion, notas, estado_fisico_inactivo, id_alumno_suscripcion, imagen_url, operation_type)
        SELECT id_estado_fisico, titulo, peso, altura, fecha_creacion, notas, estado_fisico_inactivo, id_alumno_suscripcion, imagen_url, 'D'
        FROM deleted;
    END

    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO EstadoFisico_Audit (id_estado_fisico, titulo, peso, altura, fecha_creacion, notas, estado_fisico_inactivo, id_alumno_suscripcion, imagen_url, operation_type)
        SELECT id_estado_fisico, titulo, peso, altura, fecha_creacion, notas, estado_fisico_inactivo, id_alumno_suscripcion, imagen_url, 'U'
        FROM inserted;
    END
END;
