USE [master]
GO
/****** Object:  Database [QLVT_DATHANG]    Script Date: 4/25/2021 12:20:42 PM ******/
CREATE DATABASE [QLVT_DATHANG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLVT_DATHANG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLVT_DATHANG.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLVT_DATHANG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLVT_DATHANG_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLVT_DATHANG] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLVT_DATHANG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLVT_DATHANG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLVT_DATHANG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLVT_DATHANG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLVT_DATHANG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLVT_DATHANG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLVT_DATHANG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLVT_DATHANG] SET  MULTI_USER 
GO
ALTER DATABASE [QLVT_DATHANG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLVT_DATHANG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLVT_DATHANG] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLVT_DATHANG] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLVT_DATHANG', N'ON'
GO
USE [QLVT_DATHANG]
GO
/****** Object:  Table [dbo].[CT_PHATSINH]    Script Date: 4/25/2021 12:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PHATSINH](
	[PHIEU] [nchar](8) NOT NULL,
	[MAVT] [nchar](4) NOT NULL,
	[SOLUONG] [int] NULL,
	[DONGIA] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[PHIEU] ASC,
	[MAVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHATSINH]    Script Date: 4/25/2021 12:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHATSINH](
	[PHIEU] [nchar](8) NOT NULL,
	[NGAY] [smalldatetime] NULL,
	[LOAI] [char](1) NULL,
	[HOTENKH] [nvarchar](50) NULL,
	[MANV] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PHIEU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VATTU]    Script Date: 4/25/2021 12:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VATTU](
	[MAVT] [nchar](4) NOT NULL,
	[TENVT] [nvarchar](50) NULL,
	[DVT] [nvarchar](20) NULL,
	[SOLUONGTON] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MAVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUN1 ', N'VT01', 1000, 100000000)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUN1 ', N'VT02', 500, 10000)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUN1 ', N'VT03', 500, 2000)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUN2 ', N'VT03', 1000, 1000)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUN3 ', N'VT06', 100, 125000000)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUN6 ', N'VT04', 1000, 1000)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUN6 ', N'VT06', 1250, 1000)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUX1 ', N'VT02', 500, 1)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUX1 ', N'VT03', 1000, 1)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUX1 ', N'VT04', 1000, 100000)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUX1 ', N'VT06', 12, 12)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUX2 ', N'VT01', 900, 1000)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUX2 ', N'VT04', 100, 1000)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUX3 ', N'VT03', 11, 11)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUX3 ', N'VT06', 88, 100)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUX4 ', N'VT01', 100, 100)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUX4 ', N'VT02', 100, 100)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUX4 ', N'VT03', 11, 1)
INSERT [dbo].[CT_PHATSINH] ([PHIEU], [MAVT], [SOLUONG], [DONGIA]) VALUES (N'PHIEUX5 ', N'VT02', 800, 1)
INSERT [dbo].[PHATSINH] ([PHIEU], [NGAY], [LOAI], [HOTENKH], [MANV]) VALUES (N'PHIEUN1 ', CAST(N'2021-03-10 00:00:00' AS SmallDateTime), N'N', N'BÙI NGỌC TUẤN', 1)
INSERT [dbo].[PHATSINH] ([PHIEU], [NGAY], [LOAI], [HOTENKH], [MANV]) VALUES (N'PHIEUN2 ', CAST(N'2021-03-13 00:00:00' AS SmallDateTime), N'N', N'BÙI NGỌC TUẤN', 1)
INSERT [dbo].[PHATSINH] ([PHIEU], [NGAY], [LOAI], [HOTENKH], [MANV]) VALUES (N'PHIEUN3 ', CAST(N'2021-03-26 00:00:00' AS SmallDateTime), N'N', N'BÙI NGỌC TUẤN', 2)
INSERT [dbo].[PHATSINH] ([PHIEU], [NGAY], [LOAI], [HOTENKH], [MANV]) VALUES (N'PHIEUN4 ', CAST(N'2021-03-26 00:00:00' AS SmallDateTime), N'N', N'PHAN VĂN ĐỨC', 2)
INSERT [dbo].[PHATSINH] ([PHIEU], [NGAY], [LOAI], [HOTENKH], [MANV]) VALUES (N'PHIEUN6 ', CAST(N'2021-03-20 00:00:00' AS SmallDateTime), N'N', N'NGUYỄN THANH HẬU', 4)
INSERT [dbo].[PHATSINH] ([PHIEU], [NGAY], [LOAI], [HOTENKH], [MANV]) VALUES (N'PHIEUN8 ', CAST(N'2021-03-18 00:00:00' AS SmallDateTime), N'N', N'TỐNG ĐỨC ANH', 4)
INSERT [dbo].[PHATSINH] ([PHIEU], [NGAY], [LOAI], [HOTENKH], [MANV]) VALUES (N'PHIEUX1 ', CAST(N'2021-03-26 00:00:00' AS SmallDateTime), N'X', N'NGUYỄN VĂN SANG', 1)
INSERT [dbo].[PHATSINH] ([PHIEU], [NGAY], [LOAI], [HOTENKH], [MANV]) VALUES (N'PHIEUX2 ', CAST(N'2021-03-26 00:00:00' AS SmallDateTime), N'X', N'NGUYỄN VĂN TOÀN', 2)
INSERT [dbo].[PHATSINH] ([PHIEU], [NGAY], [LOAI], [HOTENKH], [MANV]) VALUES (N'PHIEUX3 ', CAST(N'2021-03-18 00:00:00' AS SmallDateTime), N'X', N'NGUYỄN VĂN A', 100)
INSERT [dbo].[PHATSINH] ([PHIEU], [NGAY], [LOAI], [HOTENKH], [MANV]) VALUES (N'PHIEUX4 ', CAST(N'2021-03-24 00:00:00' AS SmallDateTime), N'X', N'NGUYỄN VĂN A', 100)
INSERT [dbo].[PHATSINH] ([PHIEU], [NGAY], [LOAI], [HOTENKH], [MANV]) VALUES (N'PHIEUX5 ', CAST(N'2021-04-06 00:00:00' AS SmallDateTime), N'X', N'ASDAD', 2)
INSERT [dbo].[VATTU] ([MAVT], [TENVT], [DVT], [SOLUONGTON]) VALUES (N'VT01', N'SAMSUNG M20', N'CÁI', 1000)
INSERT [dbo].[VATTU] ([MAVT], [TENVT], [DVT], [SOLUONGTON]) VALUES (N'VT02', N'SAMSUNG M30', N'CÁI', 100)
INSERT [dbo].[VATTU] ([MAVT], [TENVT], [DVT], [SOLUONGTON]) VALUES (N'VT03', N'SAMSUNG M40', N'CÁI', 478)
INSERT [dbo].[VATTU] ([MAVT], [TENVT], [DVT], [SOLUONGTON]) VALUES (N'VT04', N'SAMSUNG M50', N'CÁI', 2900)
INSERT [dbo].[VATTU] ([MAVT], [TENVT], [DVT], [SOLUONGTON]) VALUES (N'VT06', N'SAMSUNG S20', N'CÁI', 1250)
INSERT [dbo].[VATTU] ([MAVT], [TENVT], [DVT], [SOLUONGTON]) VALUES (N'VT07', N'SAMSUNG S21', N'CÁI', 0)
INSERT [dbo].[VATTU] ([MAVT], [TENVT], [DVT], [SOLUONGTON]) VALUES (N'VT08', N'SAMSUNG S21 ULTRA', N'CÁI', 0)
ALTER TABLE [dbo].[CT_PHATSINH]  WITH CHECK ADD  CONSTRAINT [FK_PS_CTPS] FOREIGN KEY([PHIEU])
REFERENCES [dbo].[PHATSINH] ([PHIEU])
GO
ALTER TABLE [dbo].[CT_PHATSINH] CHECK CONSTRAINT [FK_PS_CTPS]
GO
ALTER TABLE [dbo].[CT_PHATSINH]  WITH CHECK ADD  CONSTRAINT [FK_VT_CTPS] FOREIGN KEY([MAVT])
REFERENCES [dbo].[VATTU] ([MAVT])
GO
ALTER TABLE [dbo].[CT_PHATSINH] CHECK CONSTRAINT [FK_VT_CTPS]
GO
/****** Object:  StoredProcedure [dbo].[GET_DSPHIEUNHAP]    Script Date: 4/25/2021 12:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_DSPHIEUNHAP]
AS
	SELECT * FROM dbo.PHATSINH WHERE LOAI = 'N'

GO
/****** Object:  StoredProcedure [dbo].[GET_DSPHIEUXUAT]    Script Date: 4/25/2021 12:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_DSPHIEUXUAT]
AS
	SELECT * FROM dbo.PHATSINH WHERE LOAI = 'X'

GO
/****** Object:  StoredProcedure [dbo].[GET_VATTU]    Script Date: 4/25/2021 12:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_VATTU]
AS
	SELECT MAVT, TENVT, DVT, SOLUONGTON FROM DBO.VATTU

GO
/****** Object:  StoredProcedure [dbo].[GetMAPN]    Script Date: 4/25/2021 12:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GetMAPN]
AS
	SELECT PHIEU FROM dbo.PHATSINH WHERE LOAI = 'N'

GO
/****** Object:  StoredProcedure [dbo].[GetMAPX]    Script Date: 4/25/2021 12:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GetMAPX]
AS
	SELECT PHIEU FROM dbo.PHATSINH WHERE LOAI = 'X'

GO
/****** Object:  StoredProcedure [dbo].[KTRA_TRUNGPHIEU]    Script Date: 4/25/2021 12:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[KTRA_TRUNGPHIEU] @PHIEU nchar(8) AS
BEGIN
    IF(EXISTS(SELECT*FROM dbo.PHATSINH WHERE PHIEU = @PHIEU))
	BEGIN
	    RETURN 1;
	END
	ELSE
		RETURN 0;
END
GO
USE [master]
GO
ALTER DATABASE [QLVT_DATHANG] SET  READ_WRITE 
GO


----------------------------------------------------- trigger ---------------------------------------
USE [QLVT_DATHANG]
GO

/****** Object:  Trigger [dbo].[CAPNHAT_SLTON_AFTER_INSERT]    Script Date: 4/25/2021 12:21:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[CAPNHAT_SLTON_AFTER_INSERT] ON [dbo].[CT_PHATSINH]
    AFTER INSERT
AS
    DECLARE @COUNT INT; 
    DECLARE @LOAI CHAR(1);
    BEGIN
        SELECT  @LOAI = PS.LOAI
        FROM    Inserted I ,
                dbo.PHATSINH PS ,
                dbo.VATTU vt
        WHERE   vt.MAVT = I.MAVT
                AND I.PHIEU = PS.PHIEU;
        IF ( @LOAI = 'X' )
            BEGIN
                SELECT  @COUNT = COUNT(*)
                FROM    dbo.VATTU a ,
                        Inserted b ,
                        dbo.PHATSINH ps 
                WHERE   a.MAVT = b.MAVT
                        AND ps.PHIEU = b.PHIEU
                        AND ps.LOAI = 'X'
                        AND a.SOLUONGTON - b.SOLUONG < 0; 
                IF ( @COUNT > 0 )
                    BEGIN 
                        PRINT 'KHONG DU SO LUONG DE BAN';
                        ROLLBACK TRAN; --ngăn chặn xử lý update dữ liệu 
                        RETURN;
                    END;
                ELSE
                    BEGIN
			--Cập nhật số lượng tồn trong bảng vật tư khi ta lập 1 phiếu nhập hay xuất
                        UPDATE  dbo.VATTU
                        SET     SOLUONGTON = SOLUONGTON - b.SOLUONG
                        FROM    dbo.VATTU a ,
                                inserted b ,
                                dbo.PHATSINH ps
                        WHERE   a.MAVT = b.MAVT
                                AND ps.PHIEU = b.PHIEU
                                AND ps.LOAI = 'X';
                    END;

            END;
        ELSE
            UPDATE  VATTU
            SET     SOLUONGTON = SOLUONGTON + b.SOLUONG
            FROM    VATTU a ,
                    inserted b ,
                    dbo.PHATSINH ps
            WHERE   a.MAVT = b.MAVT
                    AND ps.PHIEU = b.PHIEU
                    AND ps.LOAI = 'N';

    END;

GO


USE [QLVT_DATHANG]
GO

/****** Object:  Trigger [dbo].[CAPNHAT_SLTON_AFTER_UPDATE]    Script Date: 4/25/2021 12:21:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--3/
CREATE TRIGGER [dbo].[CAPNHAT_SLTON_AFTER_UPDATE] ON [dbo].[CT_PHATSINH]
    AFTER UPDATE
AS
    DECLARE @COUNT INT;
    DECLARE @MAVT NCHAR(4);
    DECLARE @LOAI NCHAR(4);
    DECLARE @L INT;
    SET @L = 1;
    IF ( UPDATE(SOLUONG) )
        BEGIN
            IF EXISTS ( SELECT  *
                        FROM    deleted d ,
                                PHATSINH ps
                        WHERE   d.PHIEU = ps.PHIEU
                                AND ps.LOAI = 'X' )
                BEGIN
                    SET @L = -1;
                END;
            SELECT  @COUNT = COUNT(*)
            FROM    VATTU vt ,
                    deleted d ,
                    inserted i
            WHERE   vt.MAVT = d.MAVT
                    AND vt.MAVT = i.MAVT
                    AND vt.SOLUONGTON + @L * ( i.SOLUONG - d.SOLUONG ) < 0; 
            IF ( @COUNT = 0 )
                BEGIN
                    UPDATE  VATTU
                    SET     SOLUONGTON = vt.SOLUONGTON + @L * ( i.SOLUONG
                                                              - d.SOLUONG )
                    FROM    deleted d ,
                            inserted i ,
                            VATTU vt
                    WHERE   vt.MAVT = d.MAVT
                            AND vt.MAVT = i.MAVT;
                END;
            ELSE
                BEGIN
                    ROLLBACK TRAN;
                    PRINT 'SO LUONG VUOT QUA CHO PHEP';
                END;
        END;    
    IF ( UPDATE(MAVT) )
        BEGIN
            SET @COUNT = NULL;
            SET @LOAI = NULL;
            SET @MAVT = NULL;
			-- LAY MA CU
            SET @MAVT = ( SELECT    a.MAVT
                          FROM      VATTU a ,
                                    Deleted b ,
                                    Inserted i ,
                                    dbo.PHATSINH PS
                          WHERE     a.MAVT = b.MAVT
                                    AND a.MAVT = i.MAVT
                                    AND PS.PHIEU = b.PHIEU
                                    AND PS.PHIEU = i.PHIEU
                        );
			-- LAY LOAI
            SET @LOAI = ( SELECT    ps.LOAI
                          FROM      Deleted b ,
                                    dbo.VATTU vt ,
                                    PHATSINH ps
                          WHERE     b.PHIEU = ps.PHIEU
                                    AND b.MAVT = vt.MAVT
                        );
			-- KTRA MA MOI CO TON TAI HAY KHONG
            SELECT  @COUNT = COUNT(*)
            FROM    inserted b
            WHERE   b.MAVT = @MAVT;
			-- KHONG TON TAI
            IF ( @COUNT > 0 )
                BEGIN
                    PRINT ( 'MA VAT TU KHONG TON TAI TRONG KHO!' );
                    RETURN; 
                END;
			-- TON TAI MA VAT TU INSERTED
            ELSE
                BEGIN
					-- KTRA PHIEU XUAT
                    IF ( @LOAI = 'X' )
                        BEGIN
							-- KTRA MA MOI DU SL DE XUAT HAY KHONG?
                            SET @COUNT = 0;
                            SELECT  @COUNT = COUNT(*)
                            FROM    VATTU a ,
                                    Inserted b ,
                                    dbo.PHATSINH ps
                            WHERE   a.MAVT = b.MAVT
                                    AND ps.PHIEU = b.PHIEU
                                    AND a.SOLUONGTON < b.SOLUONG;
							-- KHONG DU SL
                            IF ( @COUNT > 0 )
                                BEGIN
                                    PRINT 'VAT TU NAY KHONG DU SO LUONG!';
                                    ROLLBACK TRAN;
                                    RETURN;
                                END;
							-- DU SL XUAT
                            ELSE
                                BEGIN
								--UPDATE CHO MAVT MOI
                                    UPDATE  VATTU
                                    SET     SOLUONGTON = SOLUONGTON
                                            - b.SOLUONG
                                    FROM    VATTU a ,
                                            inserted b ,
                                            dbo.PHATSINH ps
                                    WHERE   a.MAVT = b.MAVT
                                            AND ps.PHIEU = b.PHIEU;
								--UPDATE SOLUONGTON CHO MAVT CU
                                    UPDATE  VATTU
                                    SET     SOLUONGTON = SOLUONGTON
                                            + d.SOLUONG
                                    FROM    VATTU a ,
                                            deleted d ,
                                            dbo.PHATSINH ps
                                    WHERE   a.MAVT = d.MAVT
                                            AND ps.PHIEU = d.PHIEU;
                                END;
                        END;
					-- KTRA PHIEU NHAP
                    IF ( @LOAI = 'N' )
                        BEGIN
							-- KTRA SL TON CUA DELETED MAVT CU
                            SET @COUNT = NULL;
                            SELECT  @COUNT = COUNT(*)
                            FROM    VATTU a ,
                                    Deleted b ,
                                    dbo.PHATSINH ps
                            WHERE   a.MAVT = b.MAVT
                                    AND ps.PHIEU = b.PHIEU
                                    AND a.SOLUONGTON < b.SOLUONG;
                            IF ( @COUNT > 0 )
                                BEGIN
                                    PRINT 'VAT TU NAY KHONG DU SO LUONG!';
                                    ROLLBACK TRAN;
                                    RETURN;
                                END;
							-- DU SL TON MAVT CU
                            ELSE
                                BEGIN
							    --UPDATE SOLUONGTON CHO MAVT CU
                                    UPDATE  VATTU
                                    SET     SOLUONGTON = SOLUONGTON
                                            - b.SOLUONG
                                    FROM    VATTU a ,
                                            deleted b ,
                                            dbo.PHATSINH ps
                                    WHERE   a.MAVT = b.MAVT
                                            AND ps.PHIEU = b.PHIEU;
								--UPDATE CHO MAVT MOI
                                    UPDATE  VATTU
                                    SET     SOLUONGTON = SOLUONGTON
                                            + c.SOLUONG
                                    FROM    VATTU a ,
                                            inserted c ,
                                            dbo.PHATSINH ps
                                    WHERE   a.MAVT = c.MAVT
                                            AND ps.PHIEU = c.PHIEU;
                                END;

				
                        END;
                                    
                        
                END;

        END;

GO


USE [QLVT_DATHANG]
GO

/****** Object:  Trigger [dbo].[CAPNHAT_SLTON_FOR_DELETE]    Script Date: 4/25/2021 12:22:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE TRIGGER [dbo].[CAPNHAT_SLTON_FOR_DELETE] ON [dbo].[CT_PHATSINH]
    FOR DELETE
AS
    DECLARE @COUNT INT;
    DECLARE @LOAI CHAR(1);
    BEGIN

        SELECT  @LOAI = PS.LOAI
        FROM    Deleted D ,
                dbo.PHATSINH PS
        WHERE   D.PHIEU = PS.PHIEU;

        IF ( @LOAI = 'N' )
            BEGIN
                SELECT  @COUNT = COUNT(*)
                FROM    VATTU a ,
                        deleted b ,--DELETED CỦA BẢNG CT_PHAT SINH LOAI NHAP
                        dbo.PHATSINH ps
                WHERE   a.MAVT = b.MAVT
                        AND ps.LOAI = 'N'
                        AND ps.PHIEU = b.PHIEU
                        AND a.SOLUONGTON - b.SOLUONG < 0; --XEM sl khi ta update lên nó có lớn hơn số lượng tồn + số lượng trước khi update hay kHÔNG
                IF ( @COUNT > 0 )
                    BEGIN
                        PRINT 'VAT TU NAY DA XUAT KHO KHONG THE XOA!';
                        ROLLBACK TRAN;
                        RETURN;
                    END;
                ELSE
                    BEGIN
                        UPDATE  VATTU
                        SET     SOLUONGTON = SOLUONGTON - d.SOLUONG
                        FROM    VATTU a ,
                                deleted d ,
                                dbo.PHATSINH ps
                        WHERE   d.MAVT = a.MAVT
                                AND ps.LOAI = 'N'
                                AND ps.PHIEU = d.PHIEU;
                        RETURN; 
                    END;
            END;        
        ELSE
            UPDATE  VATTU
            SET     SOLUONGTON = SOLUONGTON + d.SOLUONG
            FROM    deleted d ,
                    dbo.PHATSINH ps
            WHERE   d.MAVT = VATTU.MAVT
                    AND ps.PHIEU = d.PHIEU
                    AND ps.LOAI = 'X';
    END;                 
GO


