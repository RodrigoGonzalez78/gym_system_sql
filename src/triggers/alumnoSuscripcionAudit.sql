CREATE TRIGGER TR_AlumnoSuscripcion_Audit
ON AlumnoSuscripcion
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO AlumnoSuscripcion_Audit (id_alumno_suscripcion,id_alumno, id_plan_entrenamiento, fecha_expiracion, operation_type)
        SELECT id_alumno_suscripcion, id_alumno, id_plan_entrenamiento, fecha_expiracion, 'I'
        FROM inserted;
    END

    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO AlumnoSuscripcion_Audit (id_alumno_suscripcion, id_alumno, id_plan_entrenamiento, fecha_expiracion, operation_type)
        SELECT id_alumno_suscripcion, id_alumno, id_plan_entrenamiento, fecha_expiracion, 'D'
        FROM deleted;
    END

    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO AlumnoSuscripcion_Audit (id_alumno_suscripcion,id_alumno, id_plan_entrenamiento, fecha_expiracion, operation_type)
        SELECT id_alumno_suscripcion, id_alumno, id_plan_entrenamiento, fecha_expiracion, 'U'
        FROM inserted;
    END
END;
