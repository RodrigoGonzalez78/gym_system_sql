CREATE PROCEDURE CrearPago
    @id_usuario INT,
    @id_tipo_pago INT,
    @cbu_destino VARCHAR(22),
    @cbu_origen VARCHAR(22),
    @monto DECIMAL(10, 2),
    @inactivo_pago BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar el nuevo pago en la tabla Pago
    INSERT INTO Pago (
        id_usuario, 
        id_tipo_pago, 
        cbu_destino, 
        cbu_origen, 
        fecha_creacion, 
        monto, 
        inactivo_pago
    )
    VALUES (
        @id_usuario, 
        @id_tipo_pago, 
        @cbu_destino, 
        @cbu_origen, 
        GETDATE(), 
        @monto, 
        @inactivo_pago
    );

    -- Devolver el ID del pago recién creado
    SELECT SCOPE_IDENTITY() AS id_pago;
END;