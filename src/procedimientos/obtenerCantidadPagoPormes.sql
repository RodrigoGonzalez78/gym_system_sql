
--Consulta para obtener la cantidad de pagos por mes realizados por los usuarios con id_rol = 3 en un año determinado.
CREATE PROCEDURE ObtenerCantidadPagosPorMes
    @year INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        MONTH(P.fecha_creacion) AS Mes,
        COUNT(P.id_pago) AS CantidadPagos
    FROM 
        Pago P
    JOIN 
        Usuario U ON P.id_usuario = U.id_usuario
    WHERE 
        U.id_rol = 3
        AND YEAR(P.fecha_creacion) = @year
    GROUP BY 
        MONTH(P.fecha_creacion)
    ORDER BY 
        Mes;
END;
GO
