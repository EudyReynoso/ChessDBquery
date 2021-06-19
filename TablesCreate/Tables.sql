USE master
GO
IF NOT EXISTS (
    SELECT [name]
FROM sys.databases
WHERE [name] = N'ChessDB'
)
CREATE DATABASE ChessDB
GO

USE ChessDB
--Tabla Sexo
CREATE TABLE Sexo
(
    Idsexo INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
    sexDescripcion NVARCHAR(20)
)
--Tabla Puestos
CREATE TABLE Puestos
(
    IdPuestos INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    salario NUMERIC(10,2),
    nombrePuesto NVARCHAR(50)
)
--Tabla empleados
CREATE TABLE Empleados
(
    IdEmpleado INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(40),
    direccion NVARCHAR(70),
    Idsexo INT,
    IdPuesto INT,
    Departamento NVARCHAR(60),

    FOREIGN KEY(Idsexo) REFERENCES Sexo(Idsexo),
    FOREIGN KEY(IdPuesto) REFERENCES Puestos(IdPuestos)
)
select *
FROM dbo.Empleados

--Tabla Recolector
CREATE TABLE Recolector
(
    IdRecolector INT IDENTITY(1,1) not NULL PRIMARY KEY,
    Nombre NVARCHAR(60)
)

--Tabla suplidor
CREATE TABLE suplidor
(
    IdSuplidor INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50),
    Apellidos NVARCHAR(40),
    Direccion NVARCHAR(60)
)
--Tabla departamentos
CREATE TABLE EntradaDeLeche 
(
    IdEntrada INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
    Codigo NVARCHAR(40),
    IdSuplidor INT,
    IdRecolector INT,
    CantidadBotellas INT,
    Fecha DATE,

    FOREIGN KEY(IdSuplidor) REFERENCES Suplidor(IdSuplidor),
    FOREIGN KEY(IdRecolector) REFERENCES Recolector(IdRecolector)
)