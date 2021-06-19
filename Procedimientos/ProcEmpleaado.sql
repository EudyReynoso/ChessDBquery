USE ChessDB;
USE master

--Proceso Almacenado Seleccionar Empleados
IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'SP_SeleccionarTodosLosEmpleados'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.SP_SeleccionarTodosLosEmpleados
GO
CREATE PROCEDURE dbo.SP_SeleccionarTodosLosEmpleados
AS
BEGIN
    SELECT e.IdEmpleado, e.nombre, e.direccion, s.sexDescripcion, p.nombrePuesto, e.Departamento
    FROM dbo.Empleados e
        INNER JOIN Sexo s ON s.Idsexo = e.Idsexo
        INNER JOIN Puestos p on p.IdPuestos = e.IdPuesto
END
GO
--Ejecutar procedimineto
EXEC SP_SeleccionarTodosLosEmpleados