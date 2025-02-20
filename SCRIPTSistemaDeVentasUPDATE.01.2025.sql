USE [master]
GO
/****** Object:  Database [DBVENTA_CORE]    Script Date: 29/1/2025 11:36:54 ******/
CREATE DATABASE [DBVENTA_CORE]

GO
ALTER DATABASE [DBVENTA_CORE] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBVENTA_CORE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBVENTA_CORE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBVENTA_CORE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBVENTA_CORE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBVENTA_CORE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBVENTA_CORE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET RECOVERY FULL 
GO
ALTER DATABASE [DBVENTA_CORE] SET  MULTI_USER 
GO
ALTER DATABASE [DBVENTA_CORE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBVENTA_CORE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBVENTA_CORE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBVENTA_CORE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBVENTA_CORE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBVENTA_CORE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBVENTA_CORE', N'ON'
GO
ALTER DATABASE [DBVENTA_CORE] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBVENTA_CORE] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBVENTA_CORE]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_VENTA]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_VENTA](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[PrecioVenta] [decimal](10, 2) NULL,
	[Cantidad] [int] NULL,
	[Total] [decimal](10, 2) NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](100) NULL,
	[IdCategoria] [int] NULL,
	[Descripcion] [varchar](100) NULL,
	[PrecioCompra] [decimal](10, 2) NULL,
	[PrecioVenta] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROL]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](100) NULL,
	[FechaRegistro] [datetime] NULL,
	[IdRol] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[TipoPago] [varchar](50) NULL,
	[NumeroDocumento] [varchar](50) NULL,
	[DocumentoCliente] [varchar](50) NULL,
	[NombreCliente] [varchar](100) NULL,
	[MontoPagoCon] [decimal](10, 2) NULL,
	[MontoCambio] [decimal](10, 2) NULL,
	[MontoSubTotal] [decimal](10, 2) NULL,
	[MontoIGV] [decimal](10, 2) NULL,
	[MontoTotal] [decimal](10, 2) NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[DETALLE_VENTA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[ROL] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[VENTA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[ROL] ([IdRol])
GO
ALTER TABLE [dbo].[USUARIO] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
/****** Object:  StoredProcedure [dbo].[sp_detalle_venta]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_detalle_venta](
@nrodocumento varchar(50)
)
as
begin
		select
		v.TipoPago,
		v.NumeroDocumento,
		isnull(v.DocumentoCliente,'0')[DocumentoCliente],
		isnull(v.NombreCliente,'0')[NombreCliente],
		isnull(v.MontoPagoCon,'0')[MontoPagoCon],
		isnull(v.MontoCambio,'0')[MontoCambio],
		v.MontoSubTotal,
		v.MontoIGV,
		v.MontoTotal,
		convert(char(10),v.FechaRegistro,103)[FechaRegistro],
		(
			select p.Descripcion,dv.Cantidad,dv.PrecioVenta,dv.Total from DETALLE_VENTA dv
			inner join PRODUCTO p on dv.IdProducto = p.IdProducto
			where dv.IdVenta = v.IdVenta
			FOR XML PATH ('Item'),TYPE
		) [DetalleVenta]

		from venta v where v.NumeroDocumento= @nrodocumento
		FOR XML PATH ('') , ROOT('Venta') 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_editar_categoria]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_editar_categoria]
(
@IdCategoria int,
@Descripcion varchar(100)
)
as
begin

	update CATEGORIA set Descripcion = @Descripcion where IdCategoria = @IdCategoria

end

GO
/****** Object:  StoredProcedure [dbo].[sp_editar_producto]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_editar_producto]
(
@IdProducto int,
@Codigo varchar(100),
@IdCategoria int,
@Descripcion varchar(100),
@PrecioCompra decimal(10,2),
@PrecioVenta decimal(10,2),
@Stock int
)
as
begin
	update PRODUCTO set Codigo = @Codigo, IdCategoria = @IdCategoria, Descripcion = @Descripcion, PrecioCompra = @PrecioCompra,
	PrecioVenta = @PrecioVenta, Stock = @Stock where IdProducto = @IdProducto

end

GO
/****** Object:  StoredProcedure [dbo].[sp_editar_usuario]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_editar_usuario]
(
    @IdUsuario INT,
    @NombreCompleto VARCHAR(100),
    @Correo VARCHAR(100),
    @Clave VARCHAR(100),
	@IdRol INT
)
AS
BEGIN
    UPDATE USUARIO 
    SET 
        NombreCompleto = @NombreCompleto, 
        Correo = @Correo, 
        Clave = @Clave,
		IdRol = @IdRol
    WHERE IdUsuario = @IdUsuario;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_categoria]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[sp_eliminar_categoria]
(
@IdCategoria int
)
as
begin
	delete from CATEGORIA where IdCategoria = @IdCategoria
end

GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_producto]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_eliminar_producto]
(
@IdProducto int
)
as
begin
	delete from PRODUCTO where IdProducto = @IdProducto
end

GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_usuario]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[sp_eliminar_usuario]
(
@IdUsuario int
)
as
begin
	delete from USUARIO where IdUsuario = @IdUsuario
end

GO
/****** Object:  StoredProcedure [dbo].[sp_guardar_categoria]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_guardar_categoria]
(
@Descripcion varchar(100)
)
as
begin
	
	insert into CATEGORIA(Descripcion) values
	(@Descripcion)

end

GO
/****** Object:  StoredProcedure [dbo].[sp_guardar_producto]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_guardar_producto]
(
@Codigo varchar(100),
@IdCategoria int,
@Descripcion varchar(100),
@PrecioCompra decimal(10,2),
@PrecioVenta decimal(10,2),
@Stock int
)
as
begin
	
	insert into PRODUCTO(Codigo,IdCategoria,Descripcion,PrecioCompra,PrecioVenta,Stock) values
	(@Codigo,@IdCategoria,@Descripcion,@PrecioCompra,@PrecioVenta,@Stock)

end

GO
/****** Object:  StoredProcedure [dbo].[sp_guardar_usuario]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_guardar_usuario]
(
@NombreCompleto varchar(100),
@Correo varchar(100),
@Clave varchar(100),
@IdRol INT
)
as
begin
	
	insert into USUARIO(NombreCompleto,Correo,Clave,IdRol) values
	(@NombreCompleto,@Correo,@Clave,@IdRol)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_listar_categoria]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listar_categoria]
as
begin
	select IdCategoria,Descripcion from CATEGORIA

end

GO
/****** Object:  StoredProcedure [dbo].[sp_listar_producto]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listar_producto]
as
begin
	select 
	p.IdProducto,
	p.Codigo,
	c.IdCategoria,c.Descripcion[DesCategoria],
	p.Descripcion,
	p.PrecioCompra,
	p.PrecioVenta,
	p.Stock
	from PRODUCTO p
	inner join CATEGORIA c on c.IdCategoria = p.IdCategoria
	order by p.IdProducto desc
end

GO
/****** Object:  StoredProcedure [dbo].[sp_listar_usuario]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_listar_usuario]
AS
SELECT
    u.IdUsuario,
    u.NombreCompleto,
    u.Correo,
    u.Clave,
    r.IdRol,
    r.Descripcion
FROM
    Usuario u
INNER JOIN
    Rol r ON u.IdRol = r.IdRol;
GO
/****** Object:  StoredProcedure [dbo].[sp_registrar_venta]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_registrar_venta](
@Venta_xml xml,
@NroDocumento varchar(6) output
)
as
begin

	
	declare @venta table (
	TipoPago varchar(50),
	NumeroDocumento varchar(50),
	DocumentoCliente varchar(50),
	NombreCliente varchar(50),
	MontoPagoCon decimal(10,2),
	MontoCambio decimal(10,2),
	MontoSubTotal decimal(10,2),
	MontoIGV decimal(10,2),
	MontoTotal decimal(10,2)
	)

	declare @detalleventa table (
	IdVenta int default 0,
	IdProducto int,
	PrecioVenta decimal(10,2),
	Cantidad int,
	Total decimal(10,2)
	)
	
	BEGIN TRY
		BEGIN TRANSACTION

		insert into @venta(TipoPago,NumeroDocumento,DocumentoCliente,NombreCliente,MontoPagoCon,MontoCambio,MontoSubTotal,MontoIGV,MontoTotal)
		select 
			nodo.elemento.value('TipoPago[1]','varchar(50)') as TipoPago,
			nodo.elemento.value('NumeroDocumento[1]','varchar(50)') as NumeroDocumento,
			nodo.elemento.value('DocumentoCliente[1]','varchar(50)') as DocumentoCliente,
			nodo.elemento.value('NombreCliente[1]','varchar(50)') as NombreCliente,
			nodo.elemento.value('MontoPagoCon[1]','decimal(10,2)') as MontoPagoCon,
			nodo.elemento.value('MontoCambio[1]','decimal(10,2)') as MontoCambio,
			nodo.elemento.value('MontoSubTotal[1]','decimal(10,2)') as MontoSubTotal,
			nodo.elemento.value('MontoIGV[1]','decimal(10,2)') as MontoIGV,
			nodo.elemento.value('MontoTotal[1]','decimal(10,2)') as MontoTotal
		from @Venta_xml.nodes('Venta') nodo(elemento)

		insert into @detalleventa(IdProducto,PrecioVenta,Cantidad,Total)
		select 
			nodo.elemento.value('IdProducto[1]','int') as IdProducto,
			nodo.elemento.value('PrecioVenta[1]','decimal(10,2)') as PrecioVenta,
			nodo.elemento.value('Cantidad[1]','int') as Cantidad,
			nodo.elemento.value('Total[1]','decimal(10,2)') as Total
		from @Venta_xml.nodes('Venta/Detalle_Venta/Item') nodo(elemento)


		--================================================
		-- EMPIEZA EL REGISTRO DE LA VENTA
		--================================================
		declare @identity as table(ID int)
		declare @id int = (SELECT isnull(max(IdVenta),0) +1 FROM VENTA)
		declare @tempnrodocumento varchar(50) = RIGHT('000000' + convert(varchar(max),@id),6)

		INSERT INTO VENTA(TipoPago,NumeroDocumento,DocumentoCliente,NombreCliente,MontoPagoCon,MontoCambio,MontoSubTotal,MontoIGV,MontoTotal)
		output inserted.IdVenta into @identity
		select TipoPago,@tempnrodocumento ,DocumentoCliente,NombreCliente,MontoPagoCon,MontoCambio,MontoSubTotal,MontoIGV,MontoTotal from @venta
		

		update @detalleventa set IdVenta = (select ID from @identity)

		insert into DETALLE_VENTA(IdVenta,IdProducto,PrecioVenta,Cantidad,Total)
		select IdVenta,IdProducto,PrecioVenta,Cantidad,Total from @detalleventa


		update p set p.Stock = p.Stock - dv.Cantidad from PRODUCTO p
		inner join @detalleventa dv on dv.IdProducto = p.IdProducto

		COMMIT
		set @NroDocumento = @tempnrodocumento

	END TRY
	BEGIN CATCH
		ROLLBACK
		set @NroDocumento = ''
	END CATCH

end

GO
/****** Object:  StoredProcedure [dbo].[sp_reporte_venta]    Script Date: 29/1/2025 11:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_reporte_venta](
@fechaInicio varchar(10),
@fechaFin varchar(10)
)
as
begin

	set dateformat dmy
	
	select v.TipoPago,v.NumeroDocumento,v.MontoTotal,
	--concat(convert(char(10),v.FechaRegistro,103),' ',convert(char(8),v.FechaRegistro,108))[FechaRegistro],
	convert(char(10),v.FechaRegistro,103)[FechaRegistro],
	p.Descripcion[DesProducto], dv.Cantidad,dv.PrecioVenta,dv.Total
	from VENTA v
	inner join DETALLE_VENTA dv on v.IdVenta = dv.IdVenta
	inner join PRODUCTO p on p.IdProducto = dv.IdProducto
	where convert(date, v.FechaRegistro) between @fechaInicio and @fechaFin
end
GO
USE [master]
GO
ALTER DATABASE [DBVENTA_CORE] SET  READ_WRITE 
GO
