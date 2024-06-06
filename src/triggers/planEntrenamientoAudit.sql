CREATE TRIGGER TR_PlanEntrenamiento_Audit
ON PlanEntrenamiento
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO PlanEntrenamiento_Audit (id_plan_entrenamiento, id_usuario, precio, descripcion, plan_entrenamiento_inactivo, operation_type)
        SELECT id_plan_entrenamiento, id_usuario, precio, descripcion, plan_entrenamiento_inactivo, 'I'
        FROM inserted;
    END

    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO PlanEntrenamiento_Audit (id_plan_entrenamiento, id_usuario, precio, descripcion, plan_entrenamiento_inactivo, operation_type)
        SELECT id_plan_entrenamiento, id_usuario, precio, descripcion, plan_entrenamiento_inactivo, 'D'
        FROM deleted;
    END

    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO PlanEntrenamiento_Audit (id_plan_entrenamiento, id_usuario, precio, descripcion, plan_entrenamiento_inactivo, operation_type)
        SELECT id_plan_entrenamiento, id_usuario, precio, descripcion, plan_entrenamiento_inactivo, 'U'
        FROM inserted;
    END
END;
