IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'SP_SeleccionarPuestos'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.SP_SeleccionarPuestos
GO
CREATE PROCEDURE dbo.SP_SeleccionarPuestos
AS
BEGIN
    -- body of the stored procedure
    SELECT * FROM dbo.Puestos
END
GO


EXECUTE dbo.SP_SeleccionarPuestos 
GO
