/****** Object:  Table [dbo].[authorities]    Script Date: 6/24/2024 9:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorities](
	[username] [nvarchar](300) NULL,
	[authority] [nvarchar](300) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategorija]    Script Date: 6/24/2024 9:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategorija](
	[IDKategorija] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDKategorija] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginHistory]    Script Date: 6/24/2024 9:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginHistory](
	[IDLoginHistory] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](300) NULL,
	[VrijemeLogina] [nvarchar](300) NULL,
	[IPAdresa] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDLoginHistory] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proizvod]    Script Date: 6/24/2024 9:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvod](
	[IDProizvod] [int] IDENTITY(1,1) NOT NULL,
	[KategorijaID] [int] NULL,
	[Naziv] [nvarchar](300) NULL,
	[Cijena] [float] NULL,
	[DostupnaKolicina] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProizvod] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Racun]    Script Date: 6/24/2024 9:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Racun](
	[IDRacun] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](300) NULL,
	[VrijemeKupovine] [nvarchar](300) NULL,
	[NacinKupovine] [nvarchar](300) NULL,
	[UkupnaCijena] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDRacun] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestHistory]    Script Date: 6/24/2024 9:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[RequestTime] [datetime] NULL,
	[RequestType] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stavka]    Script Date: 6/24/2024 9:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stavka](
	[IDStavka] [int] IDENTITY(1,1) NOT NULL,
	[RacunID] [int] NULL,
	[ProizvodID] [int] NULL,
	[Kolicina] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDStavka] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/24/2024 9:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [nvarchar](300) NOT NULL,
	[password] [nvarchar](300) NULL,
	[enabled] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[Proizvod]  WITH CHECK ADD FOREIGN KEY([KategorijaID])
REFERENCES [dbo].[Kategorija] ([IDKategorija])
GO
ALTER TABLE [dbo].[Racun]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[Stavka]  WITH CHECK ADD FOREIGN KEY([ProizvodID])
REFERENCES [dbo].[Proizvod] ([IDProizvod])
GO
ALTER TABLE [dbo].[Stavka]  WITH CHECK ADD FOREIGN KEY([RacunID])
REFERENCES [dbo].[Racun] ([IDRacun])
GO
