USE [master]
GO
/****** Object:  Database [DBCARRITO]    Script Date: 19/10/2023 9:34:16 a. m. ******/
CREATE DATABASE [DBCARRITO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBCARRITO', FILENAME = N'C:\SQL data\DBCARRITO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBCARRITO_log', FILENAME = N'C:\SQL data\DBCARRITO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBCARRITO] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBCARRITO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBCARRITO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBCARRITO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBCARRITO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBCARRITO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBCARRITO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBCARRITO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBCARRITO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBCARRITO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBCARRITO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBCARRITO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBCARRITO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBCARRITO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBCARRITO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBCARRITO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBCARRITO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBCARRITO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBCARRITO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBCARRITO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBCARRITO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBCARRITO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBCARRITO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBCARRITO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBCARRITO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBCARRITO] SET  MULTI_USER 
GO
ALTER DATABASE [DBCARRITO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBCARRITO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBCARRITO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBCARRITO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBCARRITO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBCARRITO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBCARRITO] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBCARRITO] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBCARRITO]
GO
/****** Object:  User [ORLANDO]    Script Date: 19/10/2023 9:34:16 a. m. ******/
CREATE USER [ORLANDO] FOR LOGIN [ORLANDO] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[BARRIO]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BARRIO](
	[idBarrio] [int] NOT NULL,
	[idCiudad] [int] NULL,
	[descripción] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[idBarrio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CARRITO]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARRITO](
	[IdCarrito] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[IdProducto] [int] NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripción] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CIUDAD]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CIUDAD](
	[idCiudad] [int] NOT NULL,
	[idDepartamento] [int] NULL,
	[descripción] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](150) NULL,
	[Reestablecer] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
	[rol] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEPARTAMENTO]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPARTAMENTO](
	[idDepartamento] [int] NOT NULL,
	[descripción] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_VENTA]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_VENTA](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[Total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCA]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCA](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[Descripción] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](500) NULL,
	[Descripción] [varchar](100) NULL,
	[IdMarca] [int] NULL,
	[IdCategoria] [int] NULL,
	[Precio] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[RutaImagen] [varchar](100) NULL,
	[NombreImagen] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](150) NULL,
	[Reestablecer] [bit] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[TotalProducto] [int] NULL,
	[MontoTotal] [decimal](10, 2) NULL,
	[Contacto] [varchar](50) NULL,
	[IdDistrito] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Direccion] [varchar](500) NULL,
	[IdTransaccion] [varchar](50) NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON 

INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripción], [Activo], [FechaRegistro]) VALUES (1, N'Teccnologia', 1, CAST(N'2023-08-10T14:53:24.770' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripción], [Activo], [FechaRegistro]) VALUES (2, N'Muebles', 1, CAST(N'2023-08-10T14:53:24.770' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripción], [Activo], [FechaRegistro]) VALUES (3, N'Dormitorio', 1, CAST(N'2023-08-10T14:53:24.770' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripción], [Activo], [FechaRegistro]) VALUES (4, N'Deportes', 1, CAST(N'2023-08-10T14:53:24.770' AS DateTime))
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
SET IDENTITY_INSERT [dbo].[MARCA] ON 

INSERT [dbo].[MARCA] ([IdMarca], [Descripción], [Activo], [FechaRegistro]) VALUES (2, N'HPTE', 1, CAST(N'2023-08-10T14:57:00.607' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripción], [Activo], [FechaRegistro]) VALUES (3, N'LGTE', 1, CAST(N'2023-08-10T14:57:00.607' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripción], [Activo], [FechaRegistro]) VALUES (4, N'HYUNDAITE', 1, CAST(N'2023-08-10T14:57:00.607' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripción], [Activo], [FechaRegistro]) VALUES (5, N'CANONTE', 1, CAST(N'2023-08-10T14:57:00.607' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripción], [Activo], [FechaRegistro]) VALUES (6, N'ROBERTA ALLENTE', 1, CAST(N'2023-08-10T14:57:00.607' AS DateTime))
SET IDENTITY_INSERT [dbo].[MARCA] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Reestablecer], [Activo], [FechaRegistro]) VALUES (46, N'aa', N'a', N'monsalveserrato42@gmail.com', N'BXg8VA1qlZysjvkJp+/NFA==', 1, 1, CAST(N'2023-10-14T07:34:47.477' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Reestablecer], [Activo], [FechaRegistro]) VALUES (47, N'p', N'p', N'ivanandresbernalhernandez595@gmail.com', N'aWMkPiReRLWomASPoW3hvQ==', 1, 1, CAST(N'2023-10-14T07:39:03.500' AS DateTime))
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ((1)) FOR [Reestablecer]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[MARCA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[MARCA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((0)) FOR [Precio]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [Reestablecer]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[VENTA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[BARRIO]  WITH CHECK ADD FOREIGN KEY([idCiudad])
REFERENCES [dbo].[CIUDAD] ([idCiudad])
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[CLIENTE] ([IdCliente])
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[CIUDAD]  WITH CHECK ADD FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[DEPARTAMENTO] ([idDepartamento])
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[VENTA] ([IdVenta])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[CATEGORIA] ([IdCategoria])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdMarca])
REFERENCES [dbo].[MARCA] ([IdMarca])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[CLIENTE] ([IdCliente])
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarMarca]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[sp_EditarMarca]
(
@IdMarca int,
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado bit output
)
as 
	begin
	
	SET @Resultado = 0
	IF NOT EXISTS(SELECT * FROM MARCA WHERE Descripción = @Descripcion and IdMarca != @IdMarca)
	begin
		update top (1) MARCA SET
		Descripción = @Descripcion,
		Activo = @Activo
		WHERE IdMarca = @IdMarca

		SET @Resultado = 1
		
	end
	else
		SET @Mensaje= 'La marca ya existe'

end
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarProducto]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EditarProducto](
@IdProducto int,
@Nombre varchar(100),
@Descripcion varchar(100),
@IdMarca varchar(100),
@IdCategoria varchar(100),
@Precio decimal(10,2),
@Stock int,
@Activo bit,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Nombre = @Nombre and IdProducto != @IdProducto)
	begin
		
		UPDATE PRODUCTO SET
		Nombre = @Nombre, 
		Descripcion = @Descripcion, 
		IdMarca = @IdMarca, 
		IdCategoria = @IdCategoria,
		Precio = @Precio, 
		Stock = @Stock, 
		Activo = @Activo 
		WHERE IdProducto = @IdProducto
		SET @Resultado = 1
		end 
		else
		SET @Mensaje = 'El producto ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarUsuario]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EditarUsuario](

@IdUsuario int,

@Nombres varchar(100),

@Apellidos varchar(100),

@Correo varchar(100),

@Activo bit,

@Mensaje varchar(500) output,

@Resultado bit output
)
as
begin

SET @Resultado = 0

IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo and IdUsuario != @IdUsuario)
begin
update top (1) USUARIO set
Nombres = @Nombres,
Apellidos = @Apellidos, 
Correo = @Correo,
Activo = @Activo 
where IdUsuario = @IdUsuario
SET @Resultado = 1
end
else
set @Mensaje = 'El correo del usuario ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarCategoria]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EliminarCategoria](
@IdCategoria int,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
    SET @Resultado = 0
    IF NOT EXISTS (SELECT * FROM PRODUCTO p
	inner join CATEGORIA c on c.IdCategoria =p.IdCategoria
	WHERE p.IdCategoria = @IdCategoria)
    begin
        delete top (1) FROM CATEGORIA where IdCategoria = @IdCategoria
        SET @Resultado = 1
    end
    else
     set @Mensaje = 'La categoria se encuentra relacionada a un producto'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarMarca]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[sp_EliminarMarca]
(
@IdMarca int,
@Mensaje varchar(500) output,
@Resultado bit output
)
as 
	begin
	
	SET @Resultado = 0
	IF NOT EXISTS(SELECT * FROM PRODUCTO p INNER JOIN MARCA m on m.IdMarca = p.IdMarca
	WHERE p.IdMarca = @IdMarca)
	begin
		delete top (1) FROM MARCA WHERE IdMarca = @IdMarca
		SET @Resultado = 1
		
	end
	else
		SET @Mensaje= 'La marca Se encuentra relacionada a un producto'

end
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarrProducto]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EliminarrProducto](
@IdProducto int,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM DETALLE_VENTA dv INNER JOIN PRODUCTO p on p.IdProducto = dv.IdProducto
	where p.IdProducto = @IdProducto)
	begin
		
		DELETE TOP (1) FROM PRODUCTO WHERE IdProducto = @IdProducto
		SET @Resultado = 1
	end 
	else
	SET @Mensaje = 'El producto Se encuentra relacionado a una venta'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarCategoria]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarCategoria](
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
    SET @Resultado = 0
    IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)
    begin
         insert into CATEGORIA (Descripcion, Activo) values
         (@Descripcion, @Activo)
        SET @Resultado = scope_identity()
    end
    else
     set @Mensaje = 'La categoria ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarMarca]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[sp_RegistrarMarca]
(
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as 
	begin
	
	SET @Resultado = 0
	IF NOT EXISTS(SELECT * FROM MARCA WHERE Descripción = @Descripcion)
	begin
		insert into MARCA(Descripción, Activo) values
		(@Descripcion, @Activo)	
		SET @Resultado = SCOPE_IDENTITY()
		
	end
	else
		SET @Mensaje= 'La marca ya existe'

end
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarProducto]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarProducto](
@Nombre varchar(100),
@Descripcion varchar(100),
@IdMarca varchar(100),
@IdCategoria varchar(100),
@Precio decimal(10,2),
@Stock int,
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Nombre = @Nombre)
	begin
		insert into PRODUCTO(Nombre, Descripcion, IdMarca, IdCategoria, Precio, Stock, Activo) values
		(@Nombre, @Descripcion, @IdMarca, @IdCategoria, @Precio, @Stock, @Activo)

		SET @Resultado = scope_identity()

		end 
		else
		SET @Mensaje = 'El producto ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarUsuario]    Script Date: 19/10/2023 9:34:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarUsuario](
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Clave varchar(100), 
@Activo bit, 
@Mensaje varchar(500) output, 
@Resultado int output ) as
begin

SET @Resultado = 0

IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo)
begin
insert into USUARIO (Nombres, Apellidos, Correo, Clave, Activo) values (@Nombres, @Apellidos, @Correo, @Clave, @Activo)
SET @Resultado = scope_identity() end
else
set @Mensaje = 'El correo del usuario ya existe'
end
GO
USE [master]
GO
ALTER DATABASE [DBCARRITO] SET  READ_WRITE 
GO
