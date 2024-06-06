CREATE TRIGGER TR_TipoDePago_Audit
ON TipoDePago
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO TipoDePago_Audit (id_tipo_pago, nombre, tipo_pago_inactivo, operation_type)
        SELECT id_tipo_pago, nombre, tipo_pago_inactivo, 'I'
        FROM inserted;
    END

    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO TipoDePago_Audit (id_tipo_pago, nombre, tipo_pago_inactivo, operation_type)
        SELECT id_tipo_pago, nombre, tipo_pago_inactivo, 'D'
        FROM deleted;
    END

    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO TipoDePago_Audit (id_tipo_pago, nombre, tipo_pago_inactivo, operation_type)
        SELECT id_tipo_pago, nombre, tipo_pago_inactivo, 'U'
        FROM inserted;
    END
END;
