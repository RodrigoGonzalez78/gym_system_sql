CREATE TRIGGER TR_Usuario_Audit
ON Usuario
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO Usuario_Audit (id_usuario, id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_creacion, numero_telefono, sexo, usuario_inactivo, operation_type)
        SELECT id_usuario, id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_creacion, numero_telefono, sexo, usuario_inactivo, 'I'
        FROM inserted;
    END

    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Usuario_Audit (id_usuario, id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_creacion, numero_telefono, sexo, usuario_inactivo, operation_type)
        SELECT id_usuario, id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_creacion, numero_telefono, sexo, usuario_inactivo, 'D'
        FROM deleted;
    END

    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Usuario_Audit (id_usuario, id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_creacion, numero_telefono, sexo, usuario_inactivo, operation_type)
        SELECT id_usuario, id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_creacion, numero_telefono, sexo, usuario_inactivo, 'U'
        FROM inserted;
    END
END;
