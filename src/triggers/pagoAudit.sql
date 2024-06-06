CREATE TRIGGER TR_Pago_Audit
ON Pago
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO Pago_Audit (id_pago, id_usuario, id_tipo_pago, cbu_destino, cbu_origen, fecha_creacion, monto, inactivo_pago, operation_type)
        SELECT id_pago, id_usuario, id_tipo_pago, cbu_destino, cbu_origen, fecha_creacion, monto, inactivo_pago, 'I'
        FROM inserted;
    END

    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Pago_Audit (id_pago, id_usuario, id_tipo_pago, cbu_destino, cbu_origen, fecha_creacion, monto, inactivo_pago, operation_type)
        SELECT id_pago, id_usuario, id_tipo_pago, cbu_destino, cbu_origen, fecha_creacion, monto, inactivo_pago, 'D'
        FROM deleted;
    END

    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Pago_Audit (id_pago, id_usuario, id_tipo_pago, cbu_destino, cbu_origen, fecha_creacion, monto, inactivo_pago, operation_type)
        SELECT id_pago, id_usuario, id_tipo_pago, cbu_destino, cbu_origen, fecha_creacion, monto, inactivo_pago, 'U'
        FROM inserted;
    END
END;
