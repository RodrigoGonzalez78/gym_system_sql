CREATE TRIGGER TR_Rol_Audit
ON Rol
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO Rol_Audit (id_rol, nombre, rol_inactivo, operation_type)
        SELECT id_rol, nombre, rol_inactivo, 'I'
        FROM inserted;
    END

    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Rol_Audit (id_rol, nombre, rol_inactivo, operation_type)
        SELECT id_rol, nombre, rol_inactivo, 'D'
        FROM deleted;
    END

    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Rol_Audit (id_rol, nombre, rol_inactivo, operation_type)
        SELECT id_rol, nombre, rol_inactivo, 'U'
        FROM inserted;
    END
END;
