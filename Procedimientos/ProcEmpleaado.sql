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

TRUNCATE TABLE dbo.Empleados
--Ejecutar procedimineto
EXEC SP_SeleccionarTodosLosEmpleados

--Procedimineto para agregar un nuevo empleado
IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'SP_InsertEmpleado'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.SP_InsertEmpleado
GO
CREATE PROCEDURE dbo.SP_InsertEmpleado
    @Nombre VARCHAR(50),
    @Direccion VARCHAR(60),
    @Sexo INT,
    @Puesto INT,
    @Departmento VARCHAR(50)
AS
BEGIN
    INSERT INTO  Empleados
    VALUES
        (@Nombre, @Direccion, @Sexo, @Puesto, @Departmento)

    --Procedimineto alamcenado para eliminar empleados

    IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE SPECIFIC_SCHEMA = N'dbo'
        AND SPECIFIC_NAME = N'SP_EliminarEmpleado'
        AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.SP_EliminarEmpleado
GO
CREATE PROCEDURE dbo.SP_EliminarEmpleado
    @IdEmpleado INT
AS
BEGIN
    delete dbo.Empleados
    WHERE IdEmpleado = @IdEmpleado
END
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.SP_EliminarEmpleado @IdEmpleado = 2
GO

--Procedimientto almacenado para eliminar empleados

IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'SP_ActualizarEmpleados'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.SP_ActualizarEmpleados
GO
CREATE PROCEDURE dbo.SP_ActualizarEmpleados
    @IdEmpleado INT,
    @Nombre VARCHAR(50),
    @Direccion VARCHAR(60),
    @Sexo INT,
    @Puesto INT,
    @Departmento VARCHAR(50)
AS
BEGIN
--UPDATE dbo.Empleados SET nombre = @Nombre, direccion = @Direccion, Idsexo = @Sexo,IdPuesto = @Puesto, Departamento = @Departmento
--WHERE IdEmpleado = @IdEmpleado
--END
--GO