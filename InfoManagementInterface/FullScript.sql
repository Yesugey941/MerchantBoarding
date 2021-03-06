USE [master]
GO
/****** Object:  Database [InformationManagement]    Script Date: 30/12/2016 13:49:06 ******/
CREATE DATABASE [InformationManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InformationManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\InformationManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'InformationManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\InformationManagement_log.ldf' , SIZE = 2560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [InformationManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InformationManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InformationManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InformationManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InformationManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InformationManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InformationManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [InformationManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InformationManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InformationManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InformationManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InformationManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InformationManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InformationManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InformationManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InformationManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InformationManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InformationManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InformationManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InformationManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InformationManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InformationManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InformationManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InformationManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InformationManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InformationManagement] SET  MULTI_USER 
GO
ALTER DATABASE [InformationManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InformationManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InformationManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InformationManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [InformationManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [InformationManagement]
GO
/****** Object:  Table [dbo].[AC_Notes]    Script Date: 30/12/2016 13:49:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AC_Notes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[ActivityDate] [datetime] NULL,
	[Desc] [ntext] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_MerchantHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Account]    Script Date: 30/12/2016 13:49:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MerchantStatusId] [int] NULL,
	[SourceOfIntroductionId] [int] NULL,
	[TypeOfIntroducerId] [int] NULL,
	[LegalName] [nvarchar](50) NULL,
	[TradingAsName] [nvarchar](50) NULL,
	[CompanyTypeId] [int] NULL,
	[MainContactPerson] [nvarchar](50) NULL,
	[ContactPhone] [nvarchar](50) NULL,
	[ContactEmail] [nvarchar](150) NULL,
	[URL1] [nvarchar](50) NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[Address3] [nvarchar](50) NULL,
	[TradingAddress1] [nvarchar](50) NULL,
	[TradingAddress2] [nvarchar](50) NULL,
	[TradingAddress3] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
	[PostCode] [nvarchar](50) NULL,
	[BusinessDesc] [nvarchar](50) NULL,
	[IsRegulatedBusiness] [bit] NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AcpMerchant]    Script Date: 30/12/2016 13:49:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AcpMerchant](
	[MerchantId] [int] IDENTITY(1,1) NOT NULL,
	[MerchantName] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[SalesChannel] [varchar](150) NULL,
	[MerchantDistributorCode] [varchar](10) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[Address3] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](50) NULL,
	[PostCode] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[HoldbackPercentage] [decimal](6, 2) NULL,
	[TxDescription] [varchar](150) NULL,
	[BankName] [varchar](50) NULL,
	[BankAddress] [varchar](50) NULL,
	[BankAccountName] [varchar](50) NULL,
	[BankAccountNumber] [varchar](50) NULL,
	[SwiftCode] [varchar](50) NULL,
	[MinFundAmount] [int] NULL,
	[StatementFrequency] [varchar](20) NULL,
	[StatementStart] [varchar](50) NULL,
	[StatementEnd] [varchar](50) NULL,
	[StatementUSTime] [bit] NULL,
	[AllowNoCVV] [bit] NULL,
	[PaymentTerminalType] [char](1) NOT NULL,
	[Enabled] [bit] NULL,
	[CBEmail] [varchar](50) NULL,
	[IntroducerId] [int] NULL,
	[SageAccountRef] [varchar](50) NULL,
	[VATNumber] [varchar](50) NULL,
	[ProgrammeId] [int] NULL,
	[MerchantTypeId] [int] NULL,
	[MerchantURLCheck] [bit] NULL,
	[MerchantIPCheck] [bit] NULL,
	[FraudAlertEmail] [varchar](50) NULL,
	[PaymentFacilitator] [bit] NULL,
	[PaymentFacilitatorID] [int] NULL,
	[PaymentFacilitatorName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AddressStatus]    Script Date: 30/12/2016 13:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_AddressStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApplicationFormStatus]    Script Date: 30/12/2016 13:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationFormStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_ApplicationFormStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BoardingStatus]    Script Date: 30/12/2016 13:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoardingStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_BoardingStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompanyType]    Script Date: 30/12/2016 13:49:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CompanyType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 30/12/2016 13:49:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[ContactTypeId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[DOB] [nvarchar](50) NULL,
	[IDDOC] [nvarchar](50) NULL,
	[AVDOC] [nvarchar](50) NULL,
	[Shareholding] [int] NULL,
	[Info] [nvarchar](500) NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactEmail]    Script Date: 30/12/2016 13:49:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactEmail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MerchantId] [int] NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_MerchantEmail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactPerson]    Script Date: 30/12/2016 13:49:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactPerson](
	[Id] [nvarchar](100) NOT NULL,
	[NameSurname] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[PersonTitleId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactType]    Script Date: 30/12/2016 13:49:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_ContactType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContractStatus]    Script Date: 30/12/2016 13:49:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_ContractStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 30/12/2016 13:49:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](2) NOT NULL,
	[Desc] [nvarchar](150) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Currency]    Script Date: 30/12/2016 13:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](3) NOT NULL,
	[Desc] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Director]    Script Date: 30/12/2016 13:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Director](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MerchantBoardingId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](250) NULL,
	[DOB] [nvarchar](50) NULL,
	[IDDOC] [nvarchar](50) NULL,
	[AVDOC] [nvarchar](50) NULL,
	[Shareholding] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Director] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HearSource]    Script Date: 30/12/2016 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HearSource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](150) NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_HearSource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Industry]    Script Date: 30/12/2016 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Industry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Industry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IntegrationMethod]    Script Date: 30/12/2016 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntegrationMethod](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](150) NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_IntegrationMethod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Introducer]    Script Date: 30/12/2016 13:49:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Introducer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameSurname] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Introducer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KYBStatus]    Script Date: 30/12/2016 13:49:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KYBStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_KYBStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MatchStatus]    Script Date: 30/12/2016 13:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_MatchStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MB_Commercials]    Script Date: 30/12/2016 13:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MB_Commercials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MBId] [int] NOT NULL,
	[IsTrafficAvailable] [int] NULL,
	[WhenVolumesRampUp] [datetime] NULL,
	[TmvEUR] [decimal](18, 2) NULL,
	[AtvEUR] [decimal](18, 2) NULL,
	[MtvEUR] [decimal](18, 2) NULL,
	[TcrEUR] [decimal](18, 2) NULL,
	[GexEUR] [decimal](18, 2) NULL,
	[MDRRateEUR] [decimal](18, 2) NULL,
	[CreditEUR] [decimal](18, 2) NULL,
	[DebitEUR] [decimal](18, 2) NULL,
	[PerDeclineEUR] [decimal](18, 2) NULL,
	[PerRefundEUR] [decimal](18, 2) NULL,
	[ChargebackEUR] [decimal](18, 2) NULL,
	[WireTransferFeeEUR] [decimal](18, 2) NULL,
	[MinimumTransactionFeeEUR] [decimal](18, 2) NULL,
	[MinimumSettlementFeeEUR] [decimal](18, 2) NULL,
	[AnnualRenewalFeeEUR] [decimal](18, 2) NULL,
	[MinimumWeeklyFeeEUR] [decimal](18, 2) NULL,
	[RollingReserveEUR] [decimal](18, 2) NULL,
	[RollingReserveMonthsEUR] [int] NULL,
	[FXRateEUR] [decimal](18, 2) NULL,
	[GatewayProcessingFeeEUR] [decimal](18, 2) NULL,
	[ProcessorFeeEUR] [decimal](18, 2) NULL,
	[SetupFeeEUR] [decimal](18, 2) NULL,
	[SchemeFeeEUR] [decimal](18, 2) NULL,
	[OCTMCSendEUR] [decimal](18, 2) NULL,
	[Band1EUR] [decimal](18, 2) NULL,
	[Band2EUR] [decimal](18, 2) NULL,
	[Band3EUR] [decimal](18, 2) NULL,
	[TmvEUR_I1] [decimal](18, 2) NULL,
	[AtvEUR_I1] [decimal](18, 2) NULL,
	[MtvEUR_I1] [decimal](18, 2) NULL,
	[TcrEUR_I1] [decimal](18, 2) NULL,
	[GexEUR_I1] [decimal](18, 2) NULL,
	[MDRRateEUR_I1] [decimal](18, 2) NULL,
	[CreditEUR_I1] [decimal](18, 2) NULL,
	[DebitEUR_I1] [decimal](18, 2) NULL,
	[PerDeclineEUR_I1] [decimal](18, 2) NULL,
	[PerRefundEUR_I1] [decimal](18, 2) NULL,
	[ChargebackEUR_I1] [decimal](18, 2) NULL,
	[WireTransferFeeEUR_I1] [decimal](18, 2) NULL,
	[MinimumTransactionFeeEUR_I1] [decimal](18, 2) NULL,
	[MinimumSettlementFeeEUR_I1] [decimal](18, 2) NULL,
	[AnnualRenewalFeeEUR_I1] [decimal](18, 2) NULL,
	[MinimumWeeklyFeeEUR_I1] [decimal](18, 2) NULL,
	[RollingReserveEUR_I1] [decimal](18, 2) NULL,
	[RollingReserveMonthsEUR_I1] [int] NULL,
	[FXRateEUR_I1] [decimal](18, 2) NULL,
	[GatewayProcessingFeeEUR_I1] [decimal](18, 2) NULL,
	[ProcessorFeeEUR_I1] [decimal](18, 2) NULL,
	[SetupFeeEUR_I1] [decimal](18, 2) NULL,
	[SchemeFeeEUR_I1] [decimal](18, 2) NULL,
	[OCTMCSendEUR_I1] [decimal](18, 2) NULL,
	[Band1EUR_I1] [decimal](18, 2) NULL,
	[Band2EUR_I1] [decimal](18, 2) NULL,
	[Band3EUR_I1] [decimal](18, 2) NULL,
	[TmvEUR_I2] [decimal](18, 2) NULL,
	[AtvEUR_I2] [decimal](18, 2) NULL,
	[MtvEUR_I2] [decimal](18, 2) NULL,
	[TcrEUR_I2] [decimal](18, 2) NULL,
	[GexEUR_I2] [decimal](18, 2) NULL,
	[MDRRateEUR_I2] [decimal](18, 2) NULL,
	[CreditEUR_I2] [decimal](18, 2) NULL,
	[DebitEUR_I2] [decimal](18, 2) NULL,
	[PerDeclineEUR_I2] [decimal](18, 2) NULL,
	[PerRefundEUR_I2] [decimal](18, 2) NULL,
	[ChargebackEUR_I2] [decimal](18, 2) NULL,
	[WireTransferFeeEUR_I2] [decimal](18, 2) NULL,
	[MinimumTransactionFeeEUR_I2] [decimal](18, 2) NULL,
	[MinimumSettlementFeeEUR_I2] [decimal](18, 2) NULL,
	[AnnualRenewalFeeEUR_I2] [decimal](18, 2) NULL,
	[MinimumWeeklyFeeEUR_I2] [decimal](18, 2) NULL,
	[RollingReserveEUR_I2] [decimal](18, 2) NULL,
	[RollingReserveMonthsEUR_I2] [int] NULL,
	[FXRateEUR_I2] [decimal](18, 2) NULL,
	[GatewayProcessingFeeEUR_I2] [decimal](18, 2) NULL,
	[ProcessorFeeEUR_I2] [decimal](18, 2) NULL,
	[SetupFeeEUR_I2] [decimal](18, 2) NULL,
	[SchemeFeeEUR_I2] [decimal](18, 2) NULL,
	[OCTMCSendEUR_I2] [decimal](18, 2) NULL,
	[Band1EUR_I2] [decimal](18, 2) NULL,
	[Band2EUR_I2] [decimal](18, 2) NULL,
	[Band3EUR_I2] [decimal](18, 2) NULL,
	[TmvGBP] [decimal](18, 2) NULL,
	[AtvGBP] [decimal](18, 2) NULL,
	[MtvGBP] [decimal](18, 2) NULL,
	[TcrGBP] [decimal](18, 2) NULL,
	[GexGBP] [decimal](18, 2) NULL,
	[MDRRateGBP] [decimal](18, 2) NULL,
	[CreditGBP] [decimal](18, 2) NULL,
	[DebitGBP] [decimal](18, 2) NULL,
	[PerDeclineGBP] [decimal](18, 2) NULL,
	[PerRefundGBP] [decimal](18, 2) NULL,
	[ChargebackGBP] [decimal](18, 2) NULL,
	[WireTransferFeeGBP] [decimal](18, 2) NULL,
	[MinimumTransactionFeeGBP] [decimal](18, 2) NULL,
	[MinimumSettlementFeeGBP] [decimal](18, 2) NULL,
	[AnnualRenewalFeeGBP] [decimal](18, 2) NULL,
	[MinimumWeeklyFeeGBP] [decimal](18, 2) NULL,
	[RollingReserveGBP] [decimal](18, 2) NULL,
	[RollingReserveMonthsGBP] [int] NULL,
	[FXRateGBP] [decimal](18, 2) NULL,
	[GatewayProcessingFeeGBP] [decimal](18, 2) NULL,
	[ProcessorFeeGBP] [decimal](18, 2) NULL,
	[SetupFeeGBP] [decimal](18, 2) NULL,
	[SchemeFeeGBP] [decimal](18, 2) NULL,
	[OCTMCSendGBP] [decimal](18, 2) NULL,
	[Band1GBP] [decimal](18, 2) NULL,
	[Band2GBP] [decimal](18, 2) NULL,
	[Band3GBP] [decimal](18, 2) NULL,
	[TmvGBP_I1] [decimal](18, 2) NULL,
	[AtvGBP_I1] [decimal](18, 2) NULL,
	[MtvGBP_I1] [decimal](18, 2) NULL,
	[TcrGBP_I1] [decimal](18, 2) NULL,
	[GexGBP_I1] [decimal](18, 2) NULL,
	[MDRRateGBP_I1] [decimal](18, 2) NULL,
	[CreditGBP_I1] [decimal](18, 2) NULL,
	[DebitGBP_I1] [decimal](18, 2) NULL,
	[PerDeclineGBP_I1] [decimal](18, 2) NULL,
	[PerRefundGBP_I1] [decimal](18, 2) NULL,
	[ChargebackGBP_I1] [decimal](18, 2) NULL,
	[WireTransferFeeGBP_I1] [decimal](18, 2) NULL,
	[MinimumTransactionFeeGBP_I1] [decimal](18, 2) NULL,
	[MinimumSettlementFeeGBP_I1] [decimal](18, 2) NULL,
	[AnnualRenewalFeeGBP_I1] [decimal](18, 2) NULL,
	[MinimumWeeklyFeeGBP_I1] [decimal](18, 2) NULL,
	[RollingReserveGBP_I1] [decimal](18, 2) NULL,
	[RollingReserveMonthsGBP_I1] [int] NULL,
	[FXRateGBP_I1] [decimal](18, 2) NULL,
	[GatewayProcessingFeeGBP_I1] [decimal](18, 2) NULL,
	[ProcessorFeeGBP_I1] [decimal](18, 2) NULL,
	[SetupFeeGBP_I1] [decimal](18, 2) NULL,
	[SchemeFeeGBP_I1] [decimal](18, 2) NULL,
	[OCTMCSendGBP_I1] [decimal](18, 2) NULL,
	[Band1GBP_I1] [decimal](18, 2) NULL,
	[Band2GBP_I1] [decimal](18, 2) NULL,
	[Band3GBP_I1] [decimal](18, 2) NULL,
	[TmvGBP_I2] [decimal](18, 2) NULL,
	[AtvGBP_I2] [decimal](18, 2) NULL,
	[MtvGBP_I2] [decimal](18, 2) NULL,
	[TcrGBP_I2] [decimal](18, 2) NULL,
	[GexGBP_I2] [decimal](18, 2) NULL,
	[MDRRateGBP_I2] [decimal](18, 2) NULL,
	[CreditGBP_I2] [decimal](18, 2) NULL,
	[DebitGBP_I2] [decimal](18, 2) NULL,
	[PerDeclineGBP_I2] [decimal](18, 2) NULL,
	[PerRefundGBP_I2] [decimal](18, 2) NULL,
	[ChargebackGBP_I2] [decimal](18, 2) NULL,
	[WireTransferFeeGBP_I2] [decimal](18, 2) NULL,
	[MinimumTransactionFeeGBP_I2] [decimal](18, 2) NULL,
	[MinimumSettlementFeeGBP_I2] [decimal](18, 2) NULL,
	[AnnualRenewalFeeGBP_I2] [decimal](18, 2) NULL,
	[MinimumWeeklyFeeGBP_I2] [decimal](18, 2) NULL,
	[RollingReserveGBP_I2] [decimal](18, 2) NULL,
	[RollingReserveMonthsGBP_I2] [int] NULL,
	[FXRateGBP_I2] [decimal](18, 2) NULL,
	[GatewayProcessingFeeGBP_I2] [decimal](18, 2) NULL,
	[ProcessorFeeGBP_I2] [decimal](18, 2) NULL,
	[SetupFeeGBP_I2] [decimal](18, 2) NULL,
	[SchemeFeeGBP_I2] [decimal](18, 2) NULL,
	[OCTMCSendGBP_I2] [decimal](18, 2) NULL,
	[Band1GBP_I2] [decimal](18, 2) NULL,
	[Band2GBP_I2] [decimal](18, 2) NULL,
	[Band3GBP_I2] [decimal](18, 2) NULL,
	[TmvUSD] [decimal](18, 2) NULL,
	[AtvUSD] [decimal](18, 2) NULL,
	[MtvUSD] [decimal](18, 2) NULL,
	[TcrUSD] [decimal](18, 2) NULL,
	[GexUSD] [decimal](18, 2) NULL,
	[MDRRateUSD] [decimal](18, 2) NULL,
	[CreditUSD] [decimal](18, 2) NULL,
	[DebitUSD] [decimal](18, 2) NULL,
	[PerDeclineUSD] [decimal](18, 2) NULL,
	[PerRefundUSD] [decimal](18, 2) NULL,
	[ChargebackUSD] [decimal](18, 2) NULL,
	[WireTransferFeeUSD] [decimal](18, 2) NULL,
	[MinimumTransactionFeeUSD] [decimal](18, 2) NULL,
	[MinimumSettlementFeeUSD] [decimal](18, 2) NULL,
	[AnnualRenewalFeeUSD] [decimal](18, 2) NULL,
	[MinimumWeeklyFeeUSD] [decimal](18, 2) NULL,
	[RollingReserveUSD] [decimal](18, 2) NULL,
	[RollingReserveMonthsUSD] [int] NULL,
	[FXRateUSD] [decimal](18, 2) NULL,
	[GatewayProcessingFeeUSD] [decimal](18, 2) NULL,
	[ProcessorFeeUSD] [decimal](18, 2) NULL,
	[SetupFeeUSD] [decimal](18, 2) NULL,
	[SchemeFeeUSD] [decimal](18, 2) NULL,
	[OCTMCSendUSD] [decimal](18, 2) NULL,
	[Band1USD] [decimal](18, 2) NULL,
	[Band2USD] [decimal](18, 2) NULL,
	[Band3USD] [decimal](18, 2) NULL,
	[TmvUSD_I1] [decimal](18, 2) NULL,
	[AtvUSD_I1] [decimal](18, 2) NULL,
	[MtvUSD_I1] [decimal](18, 2) NULL,
	[TcrUSD_I1] [decimal](18, 2) NULL,
	[GexUSD_I1] [decimal](18, 2) NULL,
	[MDRRateUSD_I1] [decimal](18, 2) NULL,
	[CreditUSD_I1] [decimal](18, 2) NULL,
	[DebitUSD_I1] [decimal](18, 2) NULL,
	[PerDeclineUSD_I1] [decimal](18, 2) NULL,
	[PerRefundUSD_I1] [decimal](18, 2) NULL,
	[ChargebackUSD_I1] [decimal](18, 2) NULL,
	[WireTransferFeeUSD_I1] [decimal](18, 2) NULL,
	[MinimumTransactionFeeUSD_I1] [decimal](18, 2) NULL,
	[MinimumSettlementFeeUSD_I1] [decimal](18, 2) NULL,
	[AnnualRenewalFeeUSD_I1] [decimal](18, 2) NULL,
	[MinimumWeeklyFeeUSD_I1] [decimal](18, 2) NULL,
	[RollingReserveUSD_I1] [decimal](18, 2) NULL,
	[RollingReserveMonthsUSD_I1] [int] NULL,
	[FXRateUSD_I1] [decimal](18, 2) NULL,
	[GatewayProcessingFeeUSD_I1] [decimal](18, 2) NULL,
	[ProcessorFeeUSD_I1] [decimal](18, 2) NULL,
	[SetupFeeUSD_I1] [decimal](18, 2) NULL,
	[SchemeFeeUSD_I1] [decimal](18, 2) NULL,
	[OCTMCSendUSD_I1] [decimal](18, 2) NULL,
	[Band1USD_I1] [decimal](18, 2) NULL,
	[Band2USD_I1] [decimal](18, 2) NULL,
	[Band3USD_I1] [decimal](18, 2) NULL,
	[TmvUSD_I2] [decimal](18, 2) NULL,
	[AtvUSD_I2] [decimal](18, 2) NULL,
	[MtvUSD_I2] [decimal](18, 2) NULL,
	[TcrUSD_I2] [decimal](18, 2) NULL,
	[GexUSD_I2] [decimal](18, 2) NULL,
	[MDRRateUSD_I2] [decimal](18, 2) NULL,
	[CreditUSD_I2] [decimal](18, 2) NULL,
	[DebitUSD_I2] [decimal](18, 2) NULL,
	[PerDeclineUSD_I2] [decimal](18, 2) NULL,
	[PerRefundUSD_I2] [decimal](18, 2) NULL,
	[ChargebackUSD_I2] [decimal](18, 2) NULL,
	[WireTransferFeeUSD_I2] [decimal](18, 2) NULL,
	[MinimumTransactionFeeUSD_I2] [decimal](18, 2) NULL,
	[MinimumSettlementFeeUSD_I2] [decimal](18, 2) NULL,
	[AnnualRenewalFeeUSD_I2] [decimal](18, 2) NULL,
	[MinimumWeeklyFeeUSD_I2] [decimal](18, 2) NULL,
	[RollingReserveUSD_I2] [decimal](18, 2) NULL,
	[RollingReserveMonthsUSD_I2] [int] NULL,
	[FXRateUSD_I2] [decimal](18, 2) NULL,
	[GatewayProcessingFeeUSD_I2] [decimal](18, 2) NULL,
	[ProcessorFeeUSD_I2] [decimal](18, 2) NULL,
	[SetupFeeUSD_I2] [decimal](18, 2) NULL,
	[SchemeFeeUSD_I2] [decimal](18, 2) NULL,
	[OCTMCSendUSD_I2] [decimal](18, 2) NULL,
	[Band1USD_I2] [decimal](18, 2) NULL,
	[Band2USD_I2] [decimal](18, 2) NULL,
	[Band3USD_I2] [decimal](18, 2) NULL,
	[TmvAUD] [decimal](18, 2) NULL,
	[AtvAUD] [decimal](18, 2) NULL,
	[MtvAUD] [decimal](18, 2) NULL,
	[TcrAUD] [decimal](18, 2) NULL,
	[GexAUD] [decimal](18, 2) NULL,
	[MDRRateAUD] [decimal](18, 2) NULL,
	[CreditAUD] [decimal](18, 2) NULL,
	[DebitAUD] [decimal](18, 2) NULL,
	[PerDeclineAUD] [decimal](18, 2) NULL,
	[PerRefundAUD] [decimal](18, 2) NULL,
	[ChargebackAUD] [decimal](18, 2) NULL,
	[WireTransferFeeAUD] [decimal](18, 2) NULL,
	[MinimumTransactionFeeAUD] [decimal](18, 2) NULL,
	[MinimumSettlementFeeAUD] [decimal](18, 2) NULL,
	[AnnualRenewalFeeAUD] [decimal](18, 2) NULL,
	[MinimumWeeklyFeeAUD] [decimal](18, 2) NULL,
	[RollingReserveAUD] [decimal](18, 2) NULL,
	[RollingReserveMonthsAUD] [int] NULL,
	[FXRateAUD] [decimal](18, 2) NULL,
	[GatewayProcessingFeeAUD] [decimal](18, 2) NULL,
	[ProcessorFeeAUD] [decimal](18, 2) NULL,
	[SetupFeeAUD] [decimal](18, 2) NULL,
	[SchemeFeeAUD] [decimal](18, 2) NULL,
	[OCTMCSendAUD] [decimal](18, 2) NULL,
	[Band1AUD] [decimal](18, 2) NULL,
	[Band2AUD] [decimal](18, 2) NULL,
	[Band3AUD] [decimal](18, 2) NULL,
	[TmvAUD_I1] [decimal](18, 2) NULL,
	[AtvAUD_I1] [decimal](18, 2) NULL,
	[MtvAUD_I1] [decimal](18, 2) NULL,
	[TcrAUD_I1] [decimal](18, 2) NULL,
	[GexAUD_I1] [decimal](18, 2) NULL,
	[MDRRateAUD_I1] [decimal](18, 2) NULL,
	[CreditAUD_I1] [decimal](18, 2) NULL,
	[DebitAUD_I1] [decimal](18, 2) NULL,
	[PerDeclineAUD_I1] [decimal](18, 2) NULL,
	[PerRefundAUD_I1] [decimal](18, 2) NULL,
	[ChargebackAUD_I1] [decimal](18, 2) NULL,
	[WireTransferFeeAUD_I1] [decimal](18, 2) NULL,
	[MinimumTransactionFeeAUD_I1] [decimal](18, 2) NULL,
	[MinimumSettlementFeeAUD_I1] [decimal](18, 2) NULL,
	[AnnualRenewalFeeAUD_I1] [decimal](18, 2) NULL,
	[MinimumWeeklyFeeAUD_I1] [decimal](18, 2) NULL,
	[RollingReserveAUD_I1] [decimal](18, 2) NULL,
	[RollingReserveMonthsAUD_I1] [int] NULL,
	[FXRateAUD_I1] [decimal](18, 2) NULL,
	[GatewayProcessingFeeAUD_I1] [decimal](18, 2) NULL,
	[ProcessorFeeAUD_I1] [decimal](18, 2) NULL,
	[SetupFeeAUD_I1] [decimal](18, 2) NULL,
	[SchemeFeeAUD_I1] [decimal](18, 2) NULL,
	[OCTMCSendAUD_I1] [decimal](18, 2) NULL,
	[Band1AUD_I1] [decimal](18, 2) NULL,
	[Band2AUD_I1] [decimal](18, 2) NULL,
	[Band3AUD_I1] [decimal](18, 2) NULL,
	[TmvAUD_I2] [decimal](18, 2) NULL,
	[AtvAUD_I2] [decimal](18, 2) NULL,
	[MtvAUD_I2] [decimal](18, 2) NULL,
	[TcrAUD_I2] [decimal](18, 2) NULL,
	[GexAUD_I2] [decimal](18, 2) NULL,
	[MDRRateAUD_I2] [decimal](18, 2) NULL,
	[CreditAUD_I2] [decimal](18, 2) NULL,
	[DebitAUD_I2] [decimal](18, 2) NULL,
	[PerDeclineAUD_I2] [decimal](18, 2) NULL,
	[PerRefundAUD_I2] [decimal](18, 2) NULL,
	[ChargebackAUD_I2] [decimal](18, 2) NULL,
	[WireTransferFeeAUD_I2] [decimal](18, 2) NULL,
	[MinimumTransactionFeeAUD_I2] [decimal](18, 2) NULL,
	[MinimumSettlementFeeAUD_I2] [decimal](18, 2) NULL,
	[AnnualRenewalFeeAUD_I2] [decimal](18, 2) NULL,
	[MinimumWeeklyFeeAUD_I2] [decimal](18, 2) NULL,
	[RollingReserveAUD_I2] [decimal](18, 2) NULL,
	[RollingReserveMonthsAUD_I2] [int] NULL,
	[FXRateAUD_I2] [decimal](18, 2) NULL,
	[GatewayProcessingFeeAUD_I2] [decimal](18, 2) NULL,
	[ProcessorFeeAUD_I2] [decimal](18, 2) NULL,
	[SetupFeeAUD_I2] [decimal](18, 2) NULL,
	[SchemeFeeAUD_I2] [decimal](18, 2) NULL,
	[OCTMCSendAUD_I2] [decimal](18, 2) NULL,
	[Band1AUD_I2] [decimal](18, 2) NULL,
	[Band2AUD_I2] [decimal](18, 2) NULL,
	[Band3AUD_I2] [decimal](18, 2) NULL,
	[TmvNOK] [decimal](18, 2) NULL,
	[AtvNOK] [decimal](18, 2) NULL,
	[MtvNOK] [decimal](18, 2) NULL,
	[TcrNOK] [decimal](18, 2) NULL,
	[GexNOK] [decimal](18, 2) NULL,
	[MDRRateNOK] [decimal](18, 2) NULL,
	[CreditNOK] [decimal](18, 2) NULL,
	[DebitNOK] [decimal](18, 2) NULL,
	[PerDeclineNOK] [decimal](18, 2) NULL,
	[PerRefundNOK] [decimal](18, 2) NULL,
	[ChargebackNOK] [decimal](18, 2) NULL,
	[WireTransferFeeNOK] [decimal](18, 2) NULL,
	[MinimumTransactionFeeNOK] [decimal](18, 2) NULL,
	[MinimumSettlementFeeNOK] [decimal](18, 2) NULL,
	[AnnualRenewalFeeNOK] [decimal](18, 2) NULL,
	[MinimumWeeklyFeeNOK] [decimal](18, 2) NULL,
	[RollingReserveNOK] [decimal](18, 2) NULL,
	[RollingReserveMonthsNOK] [int] NULL,
	[FXRateNOK] [decimal](18, 2) NULL,
	[GatewayProcessingFeeNOK] [decimal](18, 2) NULL,
	[ProcessorFeeNOK] [decimal](18, 2) NULL,
	[SetupFeeNOK] [decimal](18, 2) NULL,
	[SchemeFeeNOK] [decimal](18, 2) NULL,
	[OCTMCSendNOK] [decimal](18, 2) NULL,
	[Band1NOK] [decimal](18, 2) NULL,
	[Band2NOK] [decimal](18, 2) NULL,
	[Band3NOK] [decimal](18, 2) NULL,
	[TmvNOK_I1] [decimal](18, 2) NULL,
	[AtvNOK_I1] [decimal](18, 2) NULL,
	[MtvNOK_I1] [decimal](18, 2) NULL,
	[TcrNOK_I1] [decimal](18, 2) NULL,
	[GexNOK_I1] [decimal](18, 2) NULL,
	[MDRRateNOK_I1] [decimal](18, 2) NULL,
	[CreditNOK_I1] [decimal](18, 2) NULL,
	[DebitNOK_I1] [decimal](18, 2) NULL,
	[PerDeclineNOK_I1] [decimal](18, 2) NULL,
	[PerRefundNOK_I1] [decimal](18, 2) NULL,
	[ChargebackNOK_I1] [decimal](18, 2) NULL,
	[WireTransferFeeNOK_I1] [decimal](18, 2) NULL,
	[MinimumTransactionFeeNOK_I1] [decimal](18, 2) NULL,
	[MinimumSettlementFeeNOK_I1] [decimal](18, 2) NULL,
	[AnnualRenewalFeeNOK_I1] [decimal](18, 2) NULL,
	[MinimumWeeklyFeeNOK_I1] [decimal](18, 2) NULL,
	[RollingReserveNOK_I1] [decimal](18, 2) NULL,
	[RollingReserveMonthsNOK_I1] [int] NULL,
	[FXRateNOK_I1] [decimal](18, 2) NULL,
	[GatewayProcessingFeeNOK_I1] [decimal](18, 2) NULL,
	[ProcessorFeeNOK_I1] [decimal](18, 2) NULL,
	[SetupFeeNOK_I1] [decimal](18, 2) NULL,
	[SchemeFeeNOK_I1] [decimal](18, 2) NULL,
	[OCTMCSendNOK_I1] [decimal](18, 2) NULL,
	[Band1NOK_I1] [decimal](18, 2) NULL,
	[Band2NOK_I1] [decimal](18, 2) NULL,
	[Band3NOK_I1] [decimal](18, 2) NULL,
	[TmvNOK_I2] [decimal](18, 2) NULL,
	[AtvNOK_I2] [decimal](18, 2) NULL,
	[MtvNOK_I2] [decimal](18, 2) NULL,
	[TcrNOK_I2] [decimal](18, 2) NULL,
	[GexNOK_I2] [decimal](18, 2) NULL,
	[MDRRateNOK_I2] [decimal](18, 2) NULL,
	[CreditNOK_I2] [decimal](18, 2) NULL,
	[DebitNOK_I2] [decimal](18, 2) NULL,
	[PerDeclineNOK_I2] [decimal](18, 2) NULL,
	[PerRefundNOK_I2] [decimal](18, 2) NULL,
	[ChargebackNOK_I2] [decimal](18, 2) NULL,
	[WireTransferFeeNOK_I2] [decimal](18, 2) NULL,
	[MinimumTransactionFeeNOK_I2] [decimal](18, 2) NULL,
	[MinimumSettlementFeeNOK_I2] [decimal](18, 2) NULL,
	[AnnualRenewalFeeNOK_I2] [decimal](18, 2) NULL,
	[MinimumWeeklyFeeNOK_I2] [decimal](18, 2) NULL,
	[RollingReserveNOK_I2] [decimal](18, 2) NULL,
	[RollingReserveMonthsNOK_I2] [int] NULL,
	[FXRateNOK_I2] [decimal](18, 2) NULL,
	[GatewayProcessingFeeNOK_I2] [decimal](18, 2) NULL,
	[ProcessorFeeNOK_I2] [decimal](18, 2) NULL,
	[SetupFeeNOK_I2] [decimal](18, 2) NULL,
	[SchemeFeeNOK_I2] [decimal](18, 2) NULL,
	[OCTMCSendNOK_I2] [decimal](18, 2) NULL,
	[Band1NOK_I2] [decimal](18, 2) NULL,
	[Band2NOK_I2] [decimal](18, 2) NULL,
	[Band3NOK_I2] [decimal](18, 2) NULL,
	[Introducer1Id] [int] NULL,
	[Introducer2Id] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [_PK_MB_Commercials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MB_Contract]    Script Date: 30/12/2016 13:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MB_Contract](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MBId] [int] NOT NULL,
	[IsContractIssued] [bit] NULL,
	[ContractIssuedDate] [datetime] NULL,
	[ClientSignatureName] [nvarchar](50) NULL,
	[ClientSignatureDate] [datetime] NULL,
	[EcommSignatureName] [nvarchar](50) NULL,
	[EcommSignatureSignedDate] [datetime] NULL,
	[IsReviewedBySales] [bit] NULL,
	[ReviewDate] [datetime] NULL,
	[Term] [int] NULL,
	[RenewalDate] [datetime] NULL,
	[RenewalPeriod] [int] NULL,
	[NotificationPeriod] [int] NULL,
	[TerminationNoticeFromEMS] [nvarchar](50) NULL,
	[TerminationNoticeFromClient] [nvarchar](50) NULL,
	[IsClosed] [int] NULL,
	[CloseDate] [datetime] NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_MB_Contract] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MB_IPAddress]    Script Date: 30/12/2016 13:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MB_IPAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MBId] [int] NOT NULL,
	[IpTypeId] [int] NULL,
	[Desc] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_MB_IPAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MB_Onboarding]    Script Date: 30/12/2016 13:49:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MB_Onboarding](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MBId] [int] NULL,
	[MerchantTypeId] [int] NULL,
	[IsApiIntegrationComplete] [bit] NULL,
	[ApiIntegrationCompleteDate] [datetime] NULL,
	[IsClientConfiguredOnACP] [bit] NULL,
	[ClientConfiguredOnACPDate] [datetime] NULL,
	[IsClientTrainedOnACP] [bit] NULL,
	[ClientTrainedOnACPDate] [datetime] NULL,
	[MID] [nvarchar](50) NULL,
	[IBANEUR] [nvarchar](50) NULL,
	[IBANGBP] [nvarchar](50) NULL,
	[IBANUSD] [nvarchar](50) NULL,
	[MCCCode1] [nvarchar](50) NULL,
	[MCCCode2] [nvarchar](50) NULL,
	[MCCCode3] [nvarchar](50) NULL,
	[MCCCode4] [nvarchar](50) NULL,
	[URL1] [nvarchar](50) NULL,
	[URL2] [nvarchar](50) NULL,
	[URL3] [nvarchar](50) NULL,
	[URL4] [nvarchar](50) NULL,
	[IsComplete] [int] NULL,
	[CompleteDate] [datetime] NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_MB_Onboarding] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MB_Opportunity]    Script Date: 30/12/2016 13:49:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MB_Opportunity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MBId] [int] NULL,
	[IFrame] [nvarchar](50) NULL,
	[HostedPayment] [nvarchar](50) NULL,
	[DirectIntegration] [nvarchar](50) NULL,
	[MOTO] [nvarchar](50) NULL,
	[AVS] [nvarchar](50) NULL,
	[CVV] [nvarchar](50) NULL,
	[MCCMerchantWantsId] [int] NULL,
	[Tokenisation] [nvarchar](50) NULL,
	[ExtraDataFields] [nvarchar](50) NULL,
	[StagingIp] [nvarchar](50) NULL,
	[LiveIp] [nvarchar](50) NULL,
	[RecurringBilling] [nvarchar](50) NULL,
	[APIDocumentsSent] [bit] NULL,
	[APIDocumentsSentDate] [datetime] NULL,
	[ReqAcquiring] [bit] NULL,
	[ReqIssuing] [bit] NULL,
	[ReqOCT] [bit] NULL,
	[ReqProcessing] [bit] NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_MB_Opportunity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MCC]    Script Date: 30/12/2016 13:49:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCC](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](5) NOT NULL,
	[Desc] [nvarchar](150) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_MCC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Merchant]    Script Date: 30/12/2016 13:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Merchant](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CompanyWebsite] [nvarchar](150) NULL,
	[CompanyTypeId] [int] NOT NULL,
	[MerchantStatusId] [int] NOT NULL,
	[ContactPerson] [nvarchar](100) NULL,
	[ContactEmailAddress] [nvarchar](100) NULL,
	[ApplicationFormStatusId] [int] NOT NULL,
	[OutageNotificationEmail] [nvarchar](80) NULL,
	[KYBStatusId] [int] NOT NULL,
	[EUCorp] [bit] NOT NULL,
	[ContractStatusId] [int] NOT NULL,
	[LiveInACP] [bit] NOT NULL,
	[Processing] [bit] NOT NULL,
	[UpdatesNotes] [nvarchar](max) NULL,
	[CountryId] [int] NOT NULL,
	[MCCId] [int] NOT NULL,
	[RegisteredAddress] [nvarchar](150) NULL,
	[SepaEntityAddress] [nvarchar](150) NULL,
	[StageId] [int] NOT NULL,
	[SalesChannelId] [int] NOT NULL,
	[IndustryId] [int] NOT NULL,
	[IntroducedBy] [nvarchar](100) NULL,
	[OwnershipId] [int] NOT NULL,
	[DocumentsOutstanding] [nvarchar](500) NULL,
	[AddressOnContractId] [int] NOT NULL,
	[AddressOnPRSId] [int] NOT NULL,
	[AddressOnCOIId] [int] NOT NULL,
	[ThirdParty] [nvarchar](150) NULL,
	[ThirdPartyContractId] [int] NOT NULL,
	[PCICertId] [int] NOT NULL,
	[IntegrationMethodId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Merchant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MerchantBoarding]    Script Date: 30/12/2016 13:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantBoarding](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[DateRiskAppReceived] [datetime] NULL,
	[DateFullAppreceived] [datetime] NULL,
	[BoardingStatusId] [int] NULL,
	[LegalName] [nvarchar](50) NULL,
	[Url1] [nvarchar](50) NULL,
	[Url2] [nvarchar](50) NULL,
	[Url3] [nvarchar](50) NULL,
	[Url4] [nvarchar](50) NULL,
	[Url5] [nvarchar](50) NULL,
	[PrincipalContact] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[BusinessIncorpDate] [datetime] NULL,
	[CompanyRegNumber] [nvarchar](50) NULL,
	[AddressLine1] [nvarchar](50) NULL,
	[AddressLine2] [nvarchar](50) NULL,
	[AddressLine3] [nvarchar](50) NULL,
	[AddressLine4] [nvarchar](50) NULL,
	[PostCode] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
	[AgentReferral] [nvarchar](50) NULL,
	[Contact] [nvarchar](50) NULL,
	[Mids] [nvarchar](50) NULL,
	[ProcessingType] [nvarchar](50) NULL,
	[MCC] [nvarchar](50) NULL,
	[Currencies] [nvarchar](50) NULL,
	[BusinessDescription] [nvarchar](50) NULL,
	[ChargebacksContact] [nvarchar](50) NULL,
	[TechContact] [nvarchar](50) NULL,
	[TechEmail] [nvarchar](50) NULL,
	[TechPhoneNumber] [nvarchar](50) NULL,
	[AverageTicket] [nvarchar](50) NULL,
	[MinTicket] [nvarchar](50) NULL,
	[MaxTicket] [nvarchar](50) NULL,
	[ProjectedMonthlyVol] [decimal](18, 0) NULL,
	[Descriptor] [nvarchar](50) NULL,
	[TestLoginEmail] [nvarchar](50) NULL,
	[TestLoginPassword] [nvarchar](50) NULL,
	[AffiliateProgramme] [bit] NULL,
	[FreeTrailProduct] [bit] NULL,
	[RecurringBilling] [bit] NULL,
	[InstallmentBilling] [bit] NULL,
	[DeliveryMethod] [nvarchar](50) NULL,
	[RegulatedByAuthority] [bit] NULL,
	[DeliveryTime] [nvarchar](50) NULL,
	[BicSwift] [nvarchar](50) NULL,
	[IBAN] [nvarchar](50) NULL,
	[SortCode] [nvarchar](50) NULL,
	[AccountHolderName] [nvarchar](50) NULL,
	[BankNameAddress] [nvarchar](50) NULL,
	[AdditionalInfo] [nvarchar](150) NULL,
	[CurrentPrevAcquirer] [nvarchar](50) NULL,
	[PrevAcquirerLocation] [nvarchar](50) NULL,
	[HasEverTerminated] [bit] NULL,
	[HasEverTerminatedReason] [nvarchar](150) NULL,
	[CurrentTerminateReason] [nvarchar](50) NULL,
	[CompleteApplication] [bit] NULL,
	[CertOfIncorpRegistration] [bit] NULL,
	[ConfirmationOfCompanyDirectors] [bit] NULL,
	[ConfirmationOfShareholding] [bit] NULL,
	[IDForAllDirectorShareholders] [bit] NULL,
	[AVForAllDirectorShareholders] [bit] NULL,
	[ThreeMonthsProcessingHistory] [bit] NULL,
	[LicenceToOperateIfRequired] [bit] NULL,
	[TaxIDOrVATNumber] [bit] NULL,
	[ConfirmationOfCompanyBankDetails] [bit] NULL,
	[SupplierBills] [bit] NULL,
	[SampleCustomerInvoices] [bit] NULL,
	[WrittenBusinessDescriptionPlan] [bit] NULL,
	[SalesComments] [ntext] NULL,
	[OutStanding] [ntext] NULL,
	[MerchantStatusId] [int] NULL,
	[LegalOpinion] [bit] NULL,
	[TaxVatChecker] [bit] NULL,
	[IbanChecker] [bit] NULL,
	[ReqLicence] [bit] NULL,
	[LegalOpinionProvided] [bit] NULL,
	[WOTCheck] [bit] NULL,
	[SSLChecker] [bit] NULL,
	[WhoIsCheck] [bit] NULL,
	[InputOnC6] [bit] NULL,
	[MediaSearchCompany] [bit] NULL,
	[MediaSearchDirectorsSH] [bit] NULL,
	[GoogleMapsCheck] [bit] NULL,
	[OfacSearch] [bit] NULL,
	[Match] [bit] NULL,
	[VMAS] [bit] NULL,
	[CompanyUrlsOntoWebshield] [bit] NULL,
	[CheckPhoneNumbers] [bit] NULL,
	[ObtainAffiliate] [bit] NULL,
	[IsPCICompliant] [bit] NULL,
	[SecurityAccessorName] [nvarchar](150) NULL,
	[MidDataCompromise] [bit] NULL,
	[DataCompromiseDetails] [nvarchar](150) NULL,
	[SSLEncrypted] [bit] NULL,
	[PrivacyPolicy] [bit] NULL,
	[RefundReturnPolicy] [bit] NULL,
	[TermsAndConditions] [bit] NULL,
	[ClearlyDisplayed] [bit] NULL,
	[ClearlyDescribed] [bit] NULL,
	[ClearPricing] [bit] NULL,
	[DeliveryShippingPolicy] [int] NULL,
	[TickBoxOnCheckout] [int] NULL,
	[NameMatchActivity] [int] NULL,
	[VMLogoDisplayed] [bit] NULL,
	[AllSubstancesLegal] [int] NULL,
	[AffiliatesListed] [bit] NULL,
	[LegalEntityMentioned] [int] NULL,
	[CompanyAddressListed] [bit] NULL,
	[CustomerServiceOnSite] [bit] NULL,
	[AvgSalesPerMonthVisa] [decimal](18, 2) NULL,
	[AvgSalesPerMonthMC] [decimal](18, 2) NULL,
	[AvgFraudToSalesPerMonthVisa] [int] NULL,
	[AvgFraudToSalesPerMonthMC] [int] NULL,
	[AvgNumberOfCheckbacksPerMonthVisa] [decimal](18, 2) NULL,
	[AvgNumberOfCheckbacksPerMonthMC] [decimal](18, 2) NULL,
	[AvgMonthlyCheckbackRatioVisa] [int] NULL,
	[AvgMonthlyCheckbackRatioMC] [int] NULL,
	[TC403MonthsDataProvidedVisa] [bit] NULL,
	[TC403MonthsDataProvidedMC] [bit] NULL,
	[Safe3MonthsDataProvidedVisa] [bit] NULL,
	[Safe3MonthsDataProvidedMC] [bit] NULL,
	[EverBreachedSchemeVisa] [bit] NULL,
	[EverBreachedSchemeMC] [bit] NULL,
	[BreachedSchemeProgrammeDetails] [nvarchar](150) NULL,
	[Confirm3DsWillBeEnabled] [bit] NULL,
	[ConfirmMerchantAsksCustomers] [bit] NULL,
	[ConfirmMerchantCanProduceInvoices] [bit] NULL,
	[ConfirmInvoicesContainInfo] [bit] NULL,
	[FullCustomerName] [nvarchar](50) NULL,
	[FullCustomerAddress] [nvarchar](50) NULL,
	[FullProductDescription] [nvarchar](50) NULL,
	[QuantityOfGoodsSold] [nvarchar](50) NULL,
	[PriceOfTransactionDisplayed] [nvarchar](50) NULL,
	[DateOfTransaction] [nvarchar](50) NULL,
	[CapturesKYCDocs] [bit] NULL,
	[KYCMeasuresConsistOf] [bit] NULL,
	[ConfirmGenuineCHName] [bit] NULL,
	[Confirm3DForAllInitialTransaction] [bit] NULL,
	[IntroduceSignOnDelivery] [bit] NULL,
	[EmailNotificationToTrialExpiring] [bit] NULL,
	[EmailNotificationToSpecifyTheAmount] [bit] NULL,
	[Skype] [nvarchar](50) NULL,
	[IsLicensed] [bit] NULL,
	[LicensedCountryId] [int] NULL,
	[LicenseNumber] [nvarchar](50) NULL,
	[RegulatedCountryID] [int] NULL,
	[HearSourceId] [int] NULL,
	[TransactionModel] [nvarchar](50) NULL,
	[CardholderGeographies] [nvarchar](500) NULL,
	[MixOfIntEEATransactions] [nvarchar](50) NULL,
	[NDAInPlace] [bit] NULL,
	[NDASignedDate] [datetime] NULL,
	[ReqAcquiring] [bit] NULL,
	[ReqIssuing] [bit] NULL,
	[ReqOCT] [bit] NULL,
	[ReqProcessing] [bit] NULL,
	[ReqPOS] [bit] NULL,
	[StageId] [int] NULL,
	[Probability] [int] NULL,
	[RiskProfileId] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_MerchantBoarding] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MerchantMid]    Script Date: 30/12/2016 13:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantMid](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MerchantId] [int] NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[Mid] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Mid] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MerchantStatus]    Script Date: 30/12/2016 13:49:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NOT NULL,
	[UserRoleResponsibleId] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_MerchantStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MerchantType]    Script Date: 30/12/2016 13:49:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_MerchantType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PCICert]    Script Date: 30/12/2016 13:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCICert](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](150) NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_PCICert] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonTitle]    Script Date: 30/12/2016 13:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonTitle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_PersonTitle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PSPISODirect]    Script Date: 30/12/2016 13:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PSPISODirect](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Desc] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_PSPISODirect] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QueryStatus]    Script Date: 30/12/2016 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QueryStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_QueryStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegisteredAddress]    Script Date: 30/12/2016 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisteredAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MerchantId] [int] NOT NULL,
	[RegisteredAddress] [nvarchar](150) NULL,
	[SepaEntityAddress] [nvarchar](150) NULL,
	[AddressStatusId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rel_MerchantCurrency]    Script Date: 30/12/2016 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rel_MerchantCurrency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MerchantId] [int] NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_rel_MerchantCurrency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rel_UserScreen]    Script Date: 30/12/2016 13:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rel_UserScreen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ScreenId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_rel_UserScreen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesChannel]    Script Date: 30/12/2016 13:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesChannel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SalesChannel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Screen]    Script Date: 30/12/2016 13:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Screen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NULL,
	[Path] [nvarchar](500) NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Screen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShareHolder]    Script Date: 30/12/2016 13:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShareHolder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MerchantBoardingId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Owned] [int] NULL,
	[DOB] [int] NULL,
	[PersonalAdd] [int] NULL,
	[IDDOC] [nvarchar](50) NULL,
	[AVDOC] [nvarchar](50) NULL,
	[AddInfo] [nvarchar](250) NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_ShareHolder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stage]    Script Date: 30/12/2016 13:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Stage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThirdPartyContract]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThirdPartyContract](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](150) NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_ThirdPartyContract] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[UserRoleId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [nvarchar](50) NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserCreatedId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[AcpMerchant] ADD  CONSTRAINT [DF_AcpMerchant_StatementFrequency]  DEFAULT ('Weekly') FOR [StatementFrequency]
GO
ALTER TABLE [dbo].[AcpMerchant] ADD  CONSTRAINT [DF_AcpMerchant_PaymentTerminalType]  DEFAULT ('S') FOR [PaymentTerminalType]
GO
ALTER TABLE [dbo].[AcpMerchant] ADD  CONSTRAINT [DF_tblMerchant_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[AcpMerchant] ADD  DEFAULT ((0)) FOR [PaymentFacilitator]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TmvEUR]  DEFAULT ((0)) FOR [TmvEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AtvEUR]  DEFAULT ((0)) FOR [AtvEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MtvEUR]  DEFAULT ((0)) FOR [MtvEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TcrEUR]  DEFAULT ((0)) FOR [TcrEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GexEUR]  DEFAULT ((0)) FOR [GexEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MDRRateEUR]  DEFAULT ((0)) FOR [MDRRateEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_CreditEUR]  DEFAULT ((0)) FOR [CreditEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_DebitEUR]  DEFAULT ((0)) FOR [DebitEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerDeclineEUR]  DEFAULT ((0)) FOR [PerDeclineEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerRefundEUR]  DEFAULT ((0)) FOR [PerRefundEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ChargebackEUR]  DEFAULT ((0)) FOR [ChargebackEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_WireTransferFeeEUR]  DEFAULT ((0)) FOR [WireTransferFeeEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumTransactionFeeEUR]  DEFAULT ((0)) FOR [MinimumTransactionFeeEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumSettlementFeeEUR]  DEFAULT ((0)) FOR [MinimumSettlementFeeEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AnnualRenewalFeeEUR]  DEFAULT ((0)) FOR [AnnualRenewalFeeEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumWeeklyFeeEUR]  DEFAULT ((0)) FOR [MinimumWeeklyFeeEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveEUR]  DEFAULT ((0)) FOR [RollingReserveEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveMonthsEUR]  DEFAULT ((0)) FOR [RollingReserveMonthsEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_FXRateEUR]  DEFAULT ((0)) FOR [FXRateEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GatewayProcessingFeeEUR]  DEFAULT ((0)) FOR [GatewayProcessingFeeEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ProcessorFeeEUR]  DEFAULT ((0)) FOR [ProcessorFeeEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SetupFeeEUR]  DEFAULT ((0)) FOR [SetupFeeEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SchemeFeeEUR]  DEFAULT ((0)) FOR [SchemeFeeEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_OCTMCSendEUR]  DEFAULT ((0)) FOR [OCTMCSendEUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band1EUR]  DEFAULT ((0)) FOR [Band1EUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band2EUR]  DEFAULT ((0)) FOR [Band2EUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band3EUR]  DEFAULT ((0)) FOR [Band3EUR]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TmvEUR_I1]  DEFAULT ((0)) FOR [TmvEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AtvEUR_I1]  DEFAULT ((0)) FOR [AtvEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MtvEUR_I1]  DEFAULT ((0)) FOR [MtvEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TcrEUR_I1]  DEFAULT ((0)) FOR [TcrEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GexEUR_I1]  DEFAULT ((0)) FOR [GexEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MDRRateEUR_I1]  DEFAULT ((0)) FOR [MDRRateEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_CreditEUR_I1]  DEFAULT ((0)) FOR [CreditEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_DebitEUR_I1]  DEFAULT ((0)) FOR [DebitEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerDeclineEUR_I1]  DEFAULT ((0)) FOR [PerDeclineEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerRefundEUR_I1]  DEFAULT ((0)) FOR [PerRefundEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ChargebackEUR_I1]  DEFAULT ((0)) FOR [ChargebackEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_WireTransferFeeEUR_I1]  DEFAULT ((0)) FOR [WireTransferFeeEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumTransactionFeeEUR_I1]  DEFAULT ((0)) FOR [MinimumTransactionFeeEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumSettlementFeeEUR_I1]  DEFAULT ((0)) FOR [MinimumSettlementFeeEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AnnualRenewalFeeEUR_I1]  DEFAULT ((0)) FOR [AnnualRenewalFeeEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumWeeklyFeeEUR_I1]  DEFAULT ((0)) FOR [MinimumWeeklyFeeEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveEUR_I1]  DEFAULT ((0)) FOR [RollingReserveEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveMonthsEUR_I1]  DEFAULT ((0)) FOR [RollingReserveMonthsEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_FXRateEUR_I1]  DEFAULT ((0)) FOR [FXRateEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GatewayProcessingFeeEUR_I1]  DEFAULT ((0)) FOR [GatewayProcessingFeeEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ProcessorFeeEUR_I1]  DEFAULT ((0)) FOR [ProcessorFeeEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SetupFeeEUR_I1]  DEFAULT ((0)) FOR [SetupFeeEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SchemeFeeEUR_I1]  DEFAULT ((0)) FOR [SchemeFeeEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_OCTMCSendEUR_I1]  DEFAULT ((0)) FOR [OCTMCSendEUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band1EUR_I1]  DEFAULT ((0)) FOR [Band1EUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band2EUR_I1]  DEFAULT ((0)) FOR [Band2EUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band3EUR_I1]  DEFAULT ((0)) FOR [Band3EUR_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TmvEUR_I2]  DEFAULT ((0)) FOR [TmvEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AtvEUR_I2]  DEFAULT ((0)) FOR [AtvEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MtvEUR_I2]  DEFAULT ((0)) FOR [MtvEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TcrEUR_I2]  DEFAULT ((0)) FOR [TcrEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GexEUR_I2]  DEFAULT ((0)) FOR [GexEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MDRRateEUR_I2]  DEFAULT ((0)) FOR [MDRRateEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_CreditEUR_I2]  DEFAULT ((0)) FOR [CreditEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_DebitEUR_I2]  DEFAULT ((0)) FOR [DebitEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerDeclineEUR_I2]  DEFAULT ((0)) FOR [PerDeclineEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerRefundEUR_I2]  DEFAULT ((0)) FOR [PerRefundEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ChargebackEUR_I2]  DEFAULT ((0)) FOR [ChargebackEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_WireTransferFeeEUR_I2]  DEFAULT ((0)) FOR [WireTransferFeeEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumTransactionFeeEUR_I2]  DEFAULT ((0)) FOR [MinimumTransactionFeeEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumSettlementFeeEUR_I2]  DEFAULT ((0)) FOR [MinimumSettlementFeeEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AnnualRenewalFeeEUR_I2]  DEFAULT ((0)) FOR [AnnualRenewalFeeEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumWeeklyFeeEUR_I2]  DEFAULT ((0)) FOR [MinimumWeeklyFeeEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveEUR_I2]  DEFAULT ((0)) FOR [RollingReserveEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveMonthsEUR_I2]  DEFAULT ((0)) FOR [RollingReserveMonthsEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_FXRateEUR_I2]  DEFAULT ((0)) FOR [FXRateEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GatewayProcessingFeeEUR_I2]  DEFAULT ((0)) FOR [GatewayProcessingFeeEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ProcessorFeeEUR_I2]  DEFAULT ((0)) FOR [ProcessorFeeEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SetupFeeEUR_I2]  DEFAULT ((0)) FOR [SetupFeeEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SchemeFeeEUR_I2]  DEFAULT ((0)) FOR [SchemeFeeEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_OCTMCSendEUR_I2]  DEFAULT ((0)) FOR [OCTMCSendEUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band1EUR_I2]  DEFAULT ((0)) FOR [Band1EUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band2EUR_I2]  DEFAULT ((0)) FOR [Band2EUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band3EUR_I2]  DEFAULT ((0)) FOR [Band3EUR_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TmvGBP]  DEFAULT ((0)) FOR [TmvGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AtvGBP]  DEFAULT ((0)) FOR [AtvGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MtvGBP]  DEFAULT ((0)) FOR [MtvGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TcrGBP]  DEFAULT ((0)) FOR [TcrGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GexGBP]  DEFAULT ((0)) FOR [GexGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MDRRateGBP]  DEFAULT ((0)) FOR [MDRRateGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_CreditGBP]  DEFAULT ((0)) FOR [CreditGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_DebitGBP]  DEFAULT ((0)) FOR [DebitGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerDeclineGBP]  DEFAULT ((0)) FOR [PerDeclineGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerRefundGBP]  DEFAULT ((0)) FOR [PerRefundGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ChargebackGBP]  DEFAULT ((0)) FOR [ChargebackGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_WireTransferFeeGBP]  DEFAULT ((0)) FOR [WireTransferFeeGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumTransactionFeeGBP]  DEFAULT ((0)) FOR [MinimumTransactionFeeGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumSettlementFeeGBP]  DEFAULT ((0)) FOR [MinimumSettlementFeeGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AnnualRenewalFeeGBP]  DEFAULT ((0)) FOR [AnnualRenewalFeeGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumWeeklyFeeGBP]  DEFAULT ((0)) FOR [MinimumWeeklyFeeGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveGBP]  DEFAULT ((0)) FOR [RollingReserveGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveMonthsGBP]  DEFAULT ((0)) FOR [RollingReserveMonthsGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_FXRateGBP]  DEFAULT ((0)) FOR [FXRateGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GatewayProcessingFeeGBP]  DEFAULT ((0)) FOR [GatewayProcessingFeeGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ProcessorFeeGBP]  DEFAULT ((0)) FOR [ProcessorFeeGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SetupFeeGBP]  DEFAULT ((0)) FOR [SetupFeeGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SchemeFeeGBP]  DEFAULT ((0)) FOR [SchemeFeeGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_OCTMCSendGBP]  DEFAULT ((0)) FOR [OCTMCSendGBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band1GBP]  DEFAULT ((0)) FOR [Band1GBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band2GBP]  DEFAULT ((0)) FOR [Band2GBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band3GBP]  DEFAULT ((0)) FOR [Band3GBP]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TmvGBP_I1]  DEFAULT ((0)) FOR [TmvGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AtvGBP_I1]  DEFAULT ((0)) FOR [AtvGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MtvGBP_I1]  DEFAULT ((0)) FOR [MtvGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TcrGBP_I1]  DEFAULT ((0)) FOR [TcrGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GexGBP_I1]  DEFAULT ((0)) FOR [GexGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MDRRateGBP_I1]  DEFAULT ((0)) FOR [MDRRateGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_CreditGBP_I1]  DEFAULT ((0)) FOR [CreditGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_DebitGBP_I1]  DEFAULT ((0)) FOR [DebitGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerDeclineGBP_I1]  DEFAULT ((0)) FOR [PerDeclineGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerRefundGBP_I1]  DEFAULT ((0)) FOR [PerRefundGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ChargebackGBP_I1]  DEFAULT ((0)) FOR [ChargebackGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_WireTransferFeeGBP_I1]  DEFAULT ((0)) FOR [WireTransferFeeGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumTransactionFeeGBP_I1]  DEFAULT ((0)) FOR [MinimumTransactionFeeGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumSettlementFeeGBP_I1]  DEFAULT ((0)) FOR [MinimumSettlementFeeGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AnnualRenewalFeeGBP_I1]  DEFAULT ((0)) FOR [AnnualRenewalFeeGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumWeeklyFeeGBP_I1]  DEFAULT ((0)) FOR [MinimumWeeklyFeeGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveGBP_I1]  DEFAULT ((0)) FOR [RollingReserveGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveMonthsGBP_I1]  DEFAULT ((0)) FOR [RollingReserveMonthsGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_FXRateGBP_I1]  DEFAULT ((0)) FOR [FXRateGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GatewayProcessingFeeGBP_I1]  DEFAULT ((0)) FOR [GatewayProcessingFeeGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ProcessorFeeGBP_I1]  DEFAULT ((0)) FOR [ProcessorFeeGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SetupFeeGBP_I1]  DEFAULT ((0)) FOR [SetupFeeGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SchemeFeeGBP_I1]  DEFAULT ((0)) FOR [SchemeFeeGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_OCTMCSendGBP_I1]  DEFAULT ((0)) FOR [OCTMCSendGBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band1GBP_I1]  DEFAULT ((0)) FOR [Band1GBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band2GBP_I1]  DEFAULT ((0)) FOR [Band2GBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band3GBP_I1]  DEFAULT ((0)) FOR [Band3GBP_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TmvGBP_I2]  DEFAULT ((0)) FOR [TmvGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AtvGBP_I2]  DEFAULT ((0)) FOR [AtvGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MtvGBP_I2]  DEFAULT ((0)) FOR [MtvGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TcrGBP_I2]  DEFAULT ((0)) FOR [TcrGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GexGBP_I2]  DEFAULT ((0)) FOR [GexGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MDRRateGBP_I2]  DEFAULT ((0)) FOR [MDRRateGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_CreditGBP_I2]  DEFAULT ((0)) FOR [CreditGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_DebitGBP_I2]  DEFAULT ((0)) FOR [DebitGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerDeclineGBP_I2]  DEFAULT ((0)) FOR [PerDeclineGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerRefundGBP_I2]  DEFAULT ((0)) FOR [PerRefundGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ChargebackGBP_I2]  DEFAULT ((0)) FOR [ChargebackGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_WireTransferFeeGBP_I2]  DEFAULT ((0)) FOR [WireTransferFeeGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumTransactionFeeGBP_I2]  DEFAULT ((0)) FOR [MinimumTransactionFeeGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumSettlementFeeGBP_I2]  DEFAULT ((0)) FOR [MinimumSettlementFeeGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AnnualRenewalFeeGBP_I2]  DEFAULT ((0)) FOR [AnnualRenewalFeeGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumWeeklyFeeGBP_I2]  DEFAULT ((0)) FOR [MinimumWeeklyFeeGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveGBP_I2]  DEFAULT ((0)) FOR [RollingReserveGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveMonthsGBP_I2]  DEFAULT ((0)) FOR [RollingReserveMonthsGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_FXRateGBP_I2]  DEFAULT ((0)) FOR [FXRateGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GatewayProcessingFeeGBP_I2]  DEFAULT ((0)) FOR [GatewayProcessingFeeGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ProcessorFeeGBP_I2]  DEFAULT ((0)) FOR [ProcessorFeeGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SetupFeeGBP_I2]  DEFAULT ((0)) FOR [SetupFeeGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SchemeFeeGBP_I2]  DEFAULT ((0)) FOR [SchemeFeeGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_OCTMCSendGBP_I2]  DEFAULT ((0)) FOR [OCTMCSendGBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band1GBP_I2]  DEFAULT ((0)) FOR [Band1GBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band2GBP_I2]  DEFAULT ((0)) FOR [Band2GBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band3GBP_I2]  DEFAULT ((0)) FOR [Band3GBP_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TmvUSD]  DEFAULT ((0)) FOR [TmvUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AtvUSD]  DEFAULT ((0)) FOR [AtvUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MtvUSD]  DEFAULT ((0)) FOR [MtvUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TcrUSD]  DEFAULT ((0)) FOR [TcrUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GexUSD]  DEFAULT ((0)) FOR [GexUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MDRRateUSD]  DEFAULT ((0)) FOR [MDRRateUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_CreditUSD]  DEFAULT ((0)) FOR [CreditUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_DebitUSD]  DEFAULT ((0)) FOR [DebitUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerDeclineUSD]  DEFAULT ((0)) FOR [PerDeclineUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerRefundUSD]  DEFAULT ((0)) FOR [PerRefundUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ChargebackUSD]  DEFAULT ((0)) FOR [ChargebackUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_WireTransferFeeUSD]  DEFAULT ((0)) FOR [WireTransferFeeUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumTransactionFeeUSD]  DEFAULT ((0)) FOR [MinimumTransactionFeeUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumSettlementFeeUSD]  DEFAULT ((0)) FOR [MinimumSettlementFeeUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AnnualRenewalFeeUSD]  DEFAULT ((0)) FOR [AnnualRenewalFeeUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumWeeklyFeeUSD]  DEFAULT ((0)) FOR [MinimumWeeklyFeeUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveUSD]  DEFAULT ((0)) FOR [RollingReserveUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveMonthsUSD]  DEFAULT ((0)) FOR [RollingReserveMonthsUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_FXRateUSD]  DEFAULT ((0)) FOR [FXRateUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GatewayProcessingFeeUSD]  DEFAULT ((0)) FOR [GatewayProcessingFeeUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ProcessorFeeUSD]  DEFAULT ((0)) FOR [ProcessorFeeUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SetupFeeUSD]  DEFAULT ((0)) FOR [SetupFeeUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SchemeFeeUSD]  DEFAULT ((0)) FOR [SchemeFeeUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_OCTMCSendUSD]  DEFAULT ((0)) FOR [OCTMCSendUSD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band1USD]  DEFAULT ((0)) FOR [Band1USD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band2USD]  DEFAULT ((0)) FOR [Band2USD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band3USD]  DEFAULT ((0)) FOR [Band3USD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TmvUSD_I1]  DEFAULT ((0)) FOR [TmvUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AtvUSD_I1]  DEFAULT ((0)) FOR [AtvUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MtvUSD_I1]  DEFAULT ((0)) FOR [MtvUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TcrUSD_I1]  DEFAULT ((0)) FOR [TcrUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GexUSD_I1]  DEFAULT ((0)) FOR [GexUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MDRRateUSD_I1]  DEFAULT ((0)) FOR [MDRRateUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_CreditUSD_I1]  DEFAULT ((0)) FOR [CreditUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_DebitUSD_I1]  DEFAULT ((0)) FOR [DebitUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerDeclineUSD_I1]  DEFAULT ((0)) FOR [PerDeclineUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerRefundUSD_I1]  DEFAULT ((0)) FOR [PerRefundUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ChargebackUSD_I1]  DEFAULT ((0)) FOR [ChargebackUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_WireTransferFeeUSD_I1]  DEFAULT ((0)) FOR [WireTransferFeeUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumTransactionFeeUSD_I1]  DEFAULT ((0)) FOR [MinimumTransactionFeeUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumSettlementFeeUSD_I1]  DEFAULT ((0)) FOR [MinimumSettlementFeeUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AnnualRenewalFeeUSD_I1]  DEFAULT ((0)) FOR [AnnualRenewalFeeUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumWeeklyFeeUSD_I1]  DEFAULT ((0)) FOR [MinimumWeeklyFeeUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveUSD_I1]  DEFAULT ((0)) FOR [RollingReserveUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveMonthsUSD_I1]  DEFAULT ((0)) FOR [RollingReserveMonthsUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_FXRateUSD_I1]  DEFAULT ((0)) FOR [FXRateUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GatewayProcessingFeeUSD_I1]  DEFAULT ((0)) FOR [GatewayProcessingFeeUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ProcessorFeeUSD_I1]  DEFAULT ((0)) FOR [ProcessorFeeUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SetupFeeUSD_I1]  DEFAULT ((0)) FOR [SetupFeeUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SchemeFeeUSD_I1]  DEFAULT ((0)) FOR [SchemeFeeUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_OCTMCSendUSD_I1]  DEFAULT ((0)) FOR [OCTMCSendUSD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band1USD_I1]  DEFAULT ((0)) FOR [Band1USD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band2USD_I1]  DEFAULT ((0)) FOR [Band2USD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band3USD_I1]  DEFAULT ((0)) FOR [Band3USD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TmvUSD_I2]  DEFAULT ((0)) FOR [TmvUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AtvUSD_I2]  DEFAULT ((0)) FOR [AtvUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MtvUSD_I2]  DEFAULT ((0)) FOR [MtvUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TcrUSD_I2]  DEFAULT ((0)) FOR [TcrUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GexUSD_I2]  DEFAULT ((0)) FOR [GexUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MDRRateUSD_I2]  DEFAULT ((0)) FOR [MDRRateUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_CreditUSD_I2]  DEFAULT ((0)) FOR [CreditUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_DebitUSD_I2]  DEFAULT ((0)) FOR [DebitUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerDeclineUSD_I2]  DEFAULT ((0)) FOR [PerDeclineUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerRefundUSD_I2]  DEFAULT ((0)) FOR [PerRefundUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ChargebackUSD_I2]  DEFAULT ((0)) FOR [ChargebackUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_WireTransferFeeUSD_I2]  DEFAULT ((0)) FOR [WireTransferFeeUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumTransactionFeeUSD_I2]  DEFAULT ((0)) FOR [MinimumTransactionFeeUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumSettlementFeeUSD_I2]  DEFAULT ((0)) FOR [MinimumSettlementFeeUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AnnualRenewalFeeUSD_I2]  DEFAULT ((0)) FOR [AnnualRenewalFeeUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumWeeklyFeeUSD_I2]  DEFAULT ((0)) FOR [MinimumWeeklyFeeUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveUSD_I2]  DEFAULT ((0)) FOR [RollingReserveUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveMonthsUSD_I2]  DEFAULT ((0)) FOR [RollingReserveMonthsUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_FXRateUSD_I2]  DEFAULT ((0)) FOR [FXRateUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GatewayProcessingFeeUSD_I2]  DEFAULT ((0)) FOR [GatewayProcessingFeeUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ProcessorFeeUSD_I2]  DEFAULT ((0)) FOR [ProcessorFeeUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SetupFeeUSD_I2]  DEFAULT ((0)) FOR [SetupFeeUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SchemeFeeUSD_I2]  DEFAULT ((0)) FOR [SchemeFeeUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_OCTMCSendUSD_I2]  DEFAULT ((0)) FOR [OCTMCSendUSD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band1USD_I2]  DEFAULT ((0)) FOR [Band1USD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band2USD_I2]  DEFAULT ((0)) FOR [Band2USD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band3USD_I2]  DEFAULT ((0)) FOR [Band3USD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TmvAUD]  DEFAULT ((0)) FOR [TmvAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AtvAUD]  DEFAULT ((0)) FOR [AtvAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MtvAUD]  DEFAULT ((0)) FOR [MtvAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TcrAUD]  DEFAULT ((0)) FOR [TcrAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GexAUD]  DEFAULT ((0)) FOR [GexAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MDRRateAUD]  DEFAULT ((0)) FOR [MDRRateAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_CreditAUD]  DEFAULT ((0)) FOR [CreditAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_DebitAUD]  DEFAULT ((0)) FOR [DebitAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerDeclineAUD]  DEFAULT ((0)) FOR [PerDeclineAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerRefundAUD]  DEFAULT ((0)) FOR [PerRefundAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ChargebackAUD]  DEFAULT ((0)) FOR [ChargebackAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_WireTransferFeeAUD]  DEFAULT ((0)) FOR [WireTransferFeeAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumTransactionFeeAUD]  DEFAULT ((0)) FOR [MinimumTransactionFeeAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumSettlementFeeAUD]  DEFAULT ((0)) FOR [MinimumSettlementFeeAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AnnualRenewalFeeAUD]  DEFAULT ((0)) FOR [AnnualRenewalFeeAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumWeeklyFeeAUD]  DEFAULT ((0)) FOR [MinimumWeeklyFeeAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveAUD]  DEFAULT ((0)) FOR [RollingReserveAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveMonthsAUD]  DEFAULT ((0)) FOR [RollingReserveMonthsAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_FXRateAUD]  DEFAULT ((0)) FOR [FXRateAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GatewayProcessingFeeAUD]  DEFAULT ((0)) FOR [GatewayProcessingFeeAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ProcessorFeeAUD]  DEFAULT ((0)) FOR [ProcessorFeeAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SetupFeeAUD]  DEFAULT ((0)) FOR [SetupFeeAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SchemeFeeAUD]  DEFAULT ((0)) FOR [SchemeFeeAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_OCTMCSendAUD]  DEFAULT ((0)) FOR [OCTMCSendAUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band1AUD]  DEFAULT ((0)) FOR [Band1AUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band2AUD]  DEFAULT ((0)) FOR [Band2AUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band3AUD]  DEFAULT ((0)) FOR [Band3AUD]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TmvAUD_I1]  DEFAULT ((0)) FOR [TmvAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AtvAUD_I1]  DEFAULT ((0)) FOR [AtvAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MtvAUD_I1]  DEFAULT ((0)) FOR [MtvAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TcrAUD_I1]  DEFAULT ((0)) FOR [TcrAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GexAUD_I1]  DEFAULT ((0)) FOR [GexAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MDRRateAUD_I1]  DEFAULT ((0)) FOR [MDRRateAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_CreditAUD_I1]  DEFAULT ((0)) FOR [CreditAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_DebitAUD_I1]  DEFAULT ((0)) FOR [DebitAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerDeclineAUD_I1]  DEFAULT ((0)) FOR [PerDeclineAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerRefundAUD_I1]  DEFAULT ((0)) FOR [PerRefundAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ChargebackAUD_I1]  DEFAULT ((0)) FOR [ChargebackAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_WireTransferFeeAUD_I1]  DEFAULT ((0)) FOR [WireTransferFeeAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumTransactionFeeAUD_I1]  DEFAULT ((0)) FOR [MinimumTransactionFeeAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumSettlementFeeAUD_I1]  DEFAULT ((0)) FOR [MinimumSettlementFeeAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AnnualRenewalFeeAUD_I1]  DEFAULT ((0)) FOR [AnnualRenewalFeeAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumWeeklyFeeAUD_I1]  DEFAULT ((0)) FOR [MinimumWeeklyFeeAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveAUD_I1]  DEFAULT ((0)) FOR [RollingReserveAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveMonthsAUD_I1]  DEFAULT ((0)) FOR [RollingReserveMonthsAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_FXRateAUD_I1]  DEFAULT ((0)) FOR [FXRateAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GatewayProcessingFeeAUD_I1]  DEFAULT ((0)) FOR [GatewayProcessingFeeAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ProcessorFeeAUD_I1]  DEFAULT ((0)) FOR [ProcessorFeeAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SetupFeeAUD_I1]  DEFAULT ((0)) FOR [SetupFeeAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SchemeFeeAUD_I1]  DEFAULT ((0)) FOR [SchemeFeeAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_OCTMCSendAUD_I1]  DEFAULT ((0)) FOR [OCTMCSendAUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band1AUD_I1]  DEFAULT ((0)) FOR [Band1AUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band2AUD_I1]  DEFAULT ((0)) FOR [Band2AUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band3AUD_I1]  DEFAULT ((0)) FOR [Band3AUD_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TmvAUD_I2]  DEFAULT ((0)) FOR [TmvAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AtvAUD_I2]  DEFAULT ((0)) FOR [AtvAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MtvAUD_I2]  DEFAULT ((0)) FOR [MtvAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TcrAUD_I2]  DEFAULT ((0)) FOR [TcrAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GexAUD_I2]  DEFAULT ((0)) FOR [GexAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MDRRateAUD_I2]  DEFAULT ((0)) FOR [MDRRateAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_CreditAUD_I2]  DEFAULT ((0)) FOR [CreditAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_DebitAUD_I2]  DEFAULT ((0)) FOR [DebitAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerDeclineAUD_I2]  DEFAULT ((0)) FOR [PerDeclineAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerRefundAUD_I2]  DEFAULT ((0)) FOR [PerRefundAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ChargebackAUD_I2]  DEFAULT ((0)) FOR [ChargebackAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_WireTransferFeeAUD_I2]  DEFAULT ((0)) FOR [WireTransferFeeAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumTransactionFeeAUD_I2]  DEFAULT ((0)) FOR [MinimumTransactionFeeAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumSettlementFeeAUD_I2]  DEFAULT ((0)) FOR [MinimumSettlementFeeAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AnnualRenewalFeeAUD_I2]  DEFAULT ((0)) FOR [AnnualRenewalFeeAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumWeeklyFeeAUD_I2]  DEFAULT ((0)) FOR [MinimumWeeklyFeeAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveAUD_I2]  DEFAULT ((0)) FOR [RollingReserveAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveMonthsAUD_I2]  DEFAULT ((0)) FOR [RollingReserveMonthsAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_FXRateAUD_I2]  DEFAULT ((0)) FOR [FXRateAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GatewayProcessingFeeAUD_I2]  DEFAULT ((0)) FOR [GatewayProcessingFeeAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ProcessorFeeAUD_I2]  DEFAULT ((0)) FOR [ProcessorFeeAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SetupFeeAUD_I2]  DEFAULT ((0)) FOR [SetupFeeAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SchemeFeeAUD_I2]  DEFAULT ((0)) FOR [SchemeFeeAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_OCTMCSendAUD_I2]  DEFAULT ((0)) FOR [OCTMCSendAUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band1AUD_I2]  DEFAULT ((0)) FOR [Band1AUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band2AUD_I2]  DEFAULT ((0)) FOR [Band2AUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band3AUD_I2]  DEFAULT ((0)) FOR [Band3AUD_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TmvNOK]  DEFAULT ((0)) FOR [TmvNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AtvNOK]  DEFAULT ((0)) FOR [AtvNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MtvNOK]  DEFAULT ((0)) FOR [MtvNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TcrNOK]  DEFAULT ((0)) FOR [TcrNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GexNOK]  DEFAULT ((0)) FOR [GexNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MDRRateNOK]  DEFAULT ((0)) FOR [MDRRateNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_CreditNOK]  DEFAULT ((0)) FOR [CreditNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_DebitNOK]  DEFAULT ((0)) FOR [DebitNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerDeclineNOK]  DEFAULT ((0)) FOR [PerDeclineNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerRefundNOK]  DEFAULT ((0)) FOR [PerRefundNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ChargebackNOK]  DEFAULT ((0)) FOR [ChargebackNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_WireTransferFeeNOK]  DEFAULT ((0)) FOR [WireTransferFeeNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumTransactionFeeNOK]  DEFAULT ((0)) FOR [MinimumTransactionFeeNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumSettlementFeeNOK]  DEFAULT ((0)) FOR [MinimumSettlementFeeNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AnnualRenewalFeeNOK]  DEFAULT ((0)) FOR [AnnualRenewalFeeNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumWeeklyFeeNOK]  DEFAULT ((0)) FOR [MinimumWeeklyFeeNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveNOK]  DEFAULT ((0)) FOR [RollingReserveNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveMonthsNOK]  DEFAULT ((0)) FOR [RollingReserveMonthsNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_FXRateNOK]  DEFAULT ((0)) FOR [FXRateNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GatewayProcessingFeeNOK]  DEFAULT ((0)) FOR [GatewayProcessingFeeNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ProcessorFeeNOK]  DEFAULT ((0)) FOR [ProcessorFeeNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SetupFeeNOK]  DEFAULT ((0)) FOR [SetupFeeNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SchemeFeeNOK]  DEFAULT ((0)) FOR [SchemeFeeNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_OCTMCSendNOK]  DEFAULT ((0)) FOR [OCTMCSendNOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band1NOK]  DEFAULT ((0)) FOR [Band1NOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band2NOK]  DEFAULT ((0)) FOR [Band2NOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band3NOK]  DEFAULT ((0)) FOR [Band3NOK]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TmvNOK_I1]  DEFAULT ((0)) FOR [TmvNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AtvNOK_I1]  DEFAULT ((0)) FOR [AtvNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MtvNOK_I1]  DEFAULT ((0)) FOR [MtvNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TcrNOK_I1]  DEFAULT ((0)) FOR [TcrNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GexNOK_I1]  DEFAULT ((0)) FOR [GexNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MDRRateNOK_I1]  DEFAULT ((0)) FOR [MDRRateNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_CreditNOK_I1]  DEFAULT ((0)) FOR [CreditNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_DebitNOK_I1]  DEFAULT ((0)) FOR [DebitNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerDeclineNOK_I1]  DEFAULT ((0)) FOR [PerDeclineNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerRefundNOK_I1]  DEFAULT ((0)) FOR [PerRefundNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ChargebackNOK_I1]  DEFAULT ((0)) FOR [ChargebackNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_WireTransferFeeNOK_I1]  DEFAULT ((0)) FOR [WireTransferFeeNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumTransactionFeeNOK_I1]  DEFAULT ((0)) FOR [MinimumTransactionFeeNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumSettlementFeeNOK_I1]  DEFAULT ((0)) FOR [MinimumSettlementFeeNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AnnualRenewalFeeNOK_I1]  DEFAULT ((0)) FOR [AnnualRenewalFeeNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumWeeklyFeeNOK_I1]  DEFAULT ((0)) FOR [MinimumWeeklyFeeNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveNOK_I1]  DEFAULT ((0)) FOR [RollingReserveNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveMonthsNOK_I1]  DEFAULT ((0)) FOR [RollingReserveMonthsNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_FXRateNOK_I1]  DEFAULT ((0)) FOR [FXRateNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GatewayProcessingFeeNOK_I1]  DEFAULT ((0)) FOR [GatewayProcessingFeeNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ProcessorFeeNOK_I1]  DEFAULT ((0)) FOR [ProcessorFeeNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SetupFeeNOK_I1]  DEFAULT ((0)) FOR [SetupFeeNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SchemeFeeNOK_I1]  DEFAULT ((0)) FOR [SchemeFeeNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_OCTMCSendNOK_I1]  DEFAULT ((0)) FOR [OCTMCSendNOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band1NOK_I1]  DEFAULT ((0)) FOR [Band1NOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band2NOK_I1]  DEFAULT ((0)) FOR [Band2NOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band3NOK_I1]  DEFAULT ((0)) FOR [Band3NOK_I1]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TmvNOK_I2]  DEFAULT ((0)) FOR [TmvNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AtvNOK_I2]  DEFAULT ((0)) FOR [AtvNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MtvNOK_I2]  DEFAULT ((0)) FOR [MtvNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_TcrNOK_I2]  DEFAULT ((0)) FOR [TcrNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GexNOK_I2]  DEFAULT ((0)) FOR [GexNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MDRRateNOK_I2]  DEFAULT ((0)) FOR [MDRRateNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_CreditNOK_I2]  DEFAULT ((0)) FOR [CreditNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_DebitNOK_I2]  DEFAULT ((0)) FOR [DebitNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerDeclineNOK_I2]  DEFAULT ((0)) FOR [PerDeclineNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_PerRefundNOK_I2]  DEFAULT ((0)) FOR [PerRefundNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ChargebackNOK_I2]  DEFAULT ((0)) FOR [ChargebackNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_WireTransferFeeNOK_I2]  DEFAULT ((0)) FOR [WireTransferFeeNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumTransactionFeeNOK_I2]  DEFAULT ((0)) FOR [MinimumTransactionFeeNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumSettlementFeeNOK_I2]  DEFAULT ((0)) FOR [MinimumSettlementFeeNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_AnnualRenewalFeeNOK_I2]  DEFAULT ((0)) FOR [AnnualRenewalFeeNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_MinimumWeeklyFeeNOK_I2]  DEFAULT ((0)) FOR [MinimumWeeklyFeeNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveNOK_I2]  DEFAULT ((0)) FOR [RollingReserveNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_RollingReserveMonthsNOK_I2]  DEFAULT ((0)) FOR [RollingReserveMonthsNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_FXRateNOK_I2]  DEFAULT ((0)) FOR [FXRateNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_GatewayProcessingFeeNOK_I2]  DEFAULT ((0)) FOR [GatewayProcessingFeeNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_ProcessorFeeNOK_I2]  DEFAULT ((0)) FOR [ProcessorFeeNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SetupFeeNOK_I2]  DEFAULT ((0)) FOR [SetupFeeNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_SchemeFeeNOK_I2]  DEFAULT ((0)) FOR [SchemeFeeNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_OCTMCSendNOK_I2]  DEFAULT ((0)) FOR [OCTMCSendNOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band1NOK_I2]  DEFAULT ((0)) FOR [Band1NOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band2NOK_I2]  DEFAULT ((0)) FOR [Band2NOK_I2]
GO
ALTER TABLE [dbo].[MB_Commercials] ADD  CONSTRAINT [DF__MB_Commercials_Band3NOK_I2]  DEFAULT ((0)) FOR [Band3NOK_I2]
GO
ALTER TABLE [dbo].[ContactEmail]  WITH CHECK ADD  CONSTRAINT [FK_ContactEmail_Merchant] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[Merchant] ([Id])
GO
ALTER TABLE [dbo].[ContactEmail] CHECK CONSTRAINT [FK_ContactEmail_Merchant]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_AddressOnContract] FOREIGN KEY([AddressOnContractId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_AddressOnContract]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_AddressOnPRS] FOREIGN KEY([AddressOnPRSId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_AddressOnPRS]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_ApplicationFormStatus1] FOREIGN KEY([ApplicationFormStatusId])
REFERENCES [dbo].[ApplicationFormStatus] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_ApplicationFormStatus1]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_CompanyType] FOREIGN KEY([CompanyTypeId])
REFERENCES [dbo].[CompanyType] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_CompanyType]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_ContractStatus] FOREIGN KEY([ContractStatusId])
REFERENCES [dbo].[ContractStatus] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_ContractStatus]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_Country]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_Country1] FOREIGN KEY([AddressOnCOIId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_Country1]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_Industry] FOREIGN KEY([IndustryId])
REFERENCES [dbo].[Industry] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_Industry]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_IntegrationMethod] FOREIGN KEY([IntegrationMethodId])
REFERENCES [dbo].[IntegrationMethod] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_IntegrationMethod]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_KYBStatus1] FOREIGN KEY([KYBStatusId])
REFERENCES [dbo].[KYBStatus] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_KYBStatus1]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_MCC] FOREIGN KEY([MCCId])
REFERENCES [dbo].[MCC] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_MCC]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_Ownership] FOREIGN KEY([OwnershipId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_Ownership]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_PCICert] FOREIGN KEY([PCICertId])
REFERENCES [dbo].[PCICert] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_PCICert]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_SalesChannel] FOREIGN KEY([SalesChannelId])
REFERENCES [dbo].[SalesChannel] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_SalesChannel]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_Stage] FOREIGN KEY([StageId])
REFERENCES [dbo].[Stage] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_Stage]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_ThirdPartyContract] FOREIGN KEY([ThirdPartyContractId])
REFERENCES [dbo].[ThirdPartyContract] ([Id])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_ThirdPartyContract]
GO
ALTER TABLE [dbo].[MerchantBoarding]  WITH CHECK ADD  CONSTRAINT [FK_MerchantBoarding_MerchantBoarding] FOREIGN KEY([Id])
REFERENCES [dbo].[MerchantBoarding] ([Id])
GO
ALTER TABLE [dbo].[MerchantBoarding] CHECK CONSTRAINT [FK_MerchantBoarding_MerchantBoarding]
GO
ALTER TABLE [dbo].[MerchantMid]  WITH CHECK ADD  CONSTRAINT [FK_MerchantMid_Merchant] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[Merchant] ([Id])
GO
ALTER TABLE [dbo].[MerchantMid] CHECK CONSTRAINT [FK_MerchantMid_Merchant]
GO
ALTER TABLE [dbo].[PersonTitle]  WITH CHECK ADD  CONSTRAINT [FK_PersonTitle_PersonTitle] FOREIGN KEY([Id])
REFERENCES [dbo].[PersonTitle] ([Id])
GO
ALTER TABLE [dbo].[PersonTitle] CHECK CONSTRAINT [FK_PersonTitle_PersonTitle]
GO
ALTER TABLE [dbo].[rel_MerchantCurrency]  WITH CHECK ADD  CONSTRAINT [FK_rel_MerchantCurrency_Currency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currency] ([Id])
GO
ALTER TABLE [dbo].[rel_MerchantCurrency] CHECK CONSTRAINT [FK_rel_MerchantCurrency_Currency]
GO
ALTER TABLE [dbo].[rel_MerchantCurrency]  WITH CHECK ADD  CONSTRAINT [FK_rel_MerchantCurrency_Merchant] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[Merchant] ([Id])
GO
ALTER TABLE [dbo].[rel_MerchantCurrency] CHECK CONSTRAINT [FK_rel_MerchantCurrency_Merchant]
GO
/****** Object:  StoredProcedure [dbo].[AC_NOTES_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AC_NOTES_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE AC_Notes SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[AC_NOTES_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AC_NOTES_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [ACN].Id
		,[ACN].AccountId, [A].LegalName AS AccountLegalName
		,[ACN].ActivityDate
		,[ACN].[Desc]
		,[ACN].DateCreated
		,[ACN].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM AC_Notes [ACN]
		LEFT JOIN Account [A] ON [A].Id = [ACN].AccountId
		LEFT JOIN [User] [U] ON [U].Id = [ACN].UserCreatedId 
	WHERE [ACN].Id = @Id
	AND [ACN].Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[AC_NOTES_GET_BY_MERCHANT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AC_NOTES_GET_BY_MERCHANT]
@AccountId INT
AS
BEGIN
	SELECT 
		 [ACN].Id
		,[ACN].AccountId, [A].LegalName AS AccountLegalName
		,[ACN].ActivityDate
		,[ACN].[Desc]
		,[ACN].DateCreated
		,[ACN].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM AC_Notes [ACN]
		LEFT JOIN Account [A] ON [A].Id = [ACN].AccountId AND [A].Id = @AccountId
		LEFT JOIN [User] [U] ON [U].Id = [ACN].UserCreatedId 
			WHERE
			[ACN].Deleted = 0
	 ORDER BY [ACN].DateCreated DESC
END


GO
/****** Object:  StoredProcedure [dbo].[AC_NOTES_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AC_NOTES_GETALL]
AS
BEGIN
SELECT 
		 [ACN].Id
		,[ACN].AccountId, [A].LegalName AS AccountLegalName
		,[ACN].ActivityDate
		,[ACN].[Desc]
		,[ACN].DateCreated
		,[ACN].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM AC_Notes [ACN]
		LEFT JOIN Account [A] ON [A].Id = [ACN].AccountId
		LEFT JOIN [User] [U] ON [ACN].UserCreatedId = [U].Id
	WHERE
	[ACN].Deleted = 0
	ORDER BY [ACN].DateCreated DESC
END


GO
/****** Object:  StoredProcedure [dbo].[AC_NOTES_GETALLBYACCOUNTID]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AC_NOTES_GETALLBYACCOUNTID]
@AccountId INT
AS
BEGIN
SELECT 
		 [ACN].Id
		,[ACN].AccountId, [A].LegalName AS AccountLegalName
		,[ACN].ActivityDate
		,[ACN].[Desc]
		,[ACN].DateCreated
		,[ACN].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM AC_Notes [ACN]
		LEFT JOIN Account [A] ON [A].Id = [ACN].AccountId
		LEFT JOIN [User] [U] ON [U].Id = [ACN].UserCreatedId 
			WHERE
		[ACN].AccountId = @AccountId
	AND [ACN].Deleted = 0
	ORDER BY [ACN].DateCreated DESC
END


GO
/****** Object:  StoredProcedure [dbo].[AC_NOTES_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AC_NOTES_INSERT]
	 @AccountId INT
	,@Activitydate DATETIME
	,@Desc NVARCHAR(250)
	,@UserId INT
AS
BEGIN
   INSERT INTO AC_Notes 
	   (AccountId
	   ,ActivityDate
	   ,[Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@AccountId
	   ,@ActivityDate
	   ,@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END


GO
/****** Object:  StoredProcedure [dbo].[AC_NOTES_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AC_NOTES_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
SELECT 
		 [ACN].Id
		,[ACN].AccountId, [A].LegalName AS AccountLegalName
		,[ACN].ActivityDate
		,[ACN].[Desc]
		,[ACN].DateCreated
		,[ACN].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM AC_Notes [ACN]
		LEFT JOIN Account [A] ON [A].Id = [ACN].AccountId
		LEFT JOIN [User] [U] ON [U].Id = [ACN].UserCreatedId
	WHERE
	 ([ACN].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
	AND [ACN].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[AC_NOTES_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AC_NOTES_UPDATE]
	-- Add the parameters for the stored procedure here
	 @Id INT
	,@AccountId INT
	,@ActivityDate DATETIME
	,@Desc NVARCHAR(MAX)
AS
BEGIN
   UPDATE AC_Notes SET 
     AccountId = @AccountId
	,ActivityDate = @ActivityDate
	,[Desc] = @Desc
   WHERE Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[ACCOUNT_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ACCOUNT_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE Account SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[ACCOUNT_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ACCOUNT_GET]
@Id INT
AS
BEGIN
	SELECT 
			 [A].Id
			,[A].MerchantStatusId, [MS].[Desc]	--int	Checked
			,[A].SourceOfIntroductionId, [SOI].LegalName AS SourceOfIntroductionLegalName
			,[A].TypeOfIntroducerId	, [TOI].[Desc] AS TypeOfIntroducerDesc
			,[A].LegalName	--nvarchar(50)	Checked
			,[A].TradingAsName	--nvarchar(50)	Checked
			,[A].CompanyTypeId, [CT].[Desc]	--int	Checked
			,[A].MainContactPerson	--nvarchar(50)	Checked
			,[A].ContactPhone	--nvarchar(50)	Checked
			,[A].ContactEmail	--nvarchar(150)	Checked
			,[A].URL1	--nvarchar(50)	Checked
			,[A].Address1	--nvarchar(50)	Checked
			,[A].Address2	--nvarchar(50)	Checked
			,[A].Address3	--nvarchar(50)	Checked
			,[A].TradingAddress1	--nvarchar(50)	Checked
			,[A].TradingAddress2	--nvarchar(50)	Checked
			,[A].TradingAddress3	--nvarchar(50)	Checked
			,[A].CountryId	--int	Checked
			,[A].PostCode	--nvarchar(50)	Checked
			,[A].BusinessDesc	--nvarchar(50)	Checked
			,[A].IsRegulatedBusiness	--bit	Checked
			,[A].DateCreated
			,[A].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Account [A]
		LEFT JOIN [MerchantStatus] [MS] ON [MS].Id = [A].MerchantStatusId
		LEFT JOIN [Account] [SOI] ON [SOI].Id = [A].SourceOfIntroductionId
		LEFT JOIN [CompanyType] [TOI] ON [TOI].Id = [A].TypeOfIntroducerId
		LEFT JOIN [CompanyType] [CT] ON [CT].Id = [A].CompanyTypeId
		LEFT JOIN [Country] [C] ON [C].Id = [A].CountryId
		LEFT JOIN [User] [U] ON [A].UserCreatedId = [U].Id
	WHERE [A].Id = @Id
	AND [A].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[ACCOUNT_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ACCOUNT_GETALL]
AS
BEGIN
	SELECT  
			 [A].Id
			,[A].MerchantStatusId, [MS].[Desc]	--int	Checked
			,[A].SourceOfIntroductionId, [SOI].LegalName AS SourceOfIntroductionLegalName
			,[A].TypeOfIntroducerId	, [TOI].[Desc] AS TypeOfIntroducerDesc
			,[A].LegalName	--nvarchar(50)	Checked
			,[A].TradingAsName	--nvarchar(50)	Checked
			,[A].CompanyTypeId, [CT].[Desc]	--int	Checked
			,[A].MainContactPerson	--nvarchar(50)	Checked
			,[A].ContactPhone	--nvarchar(50)	Checked
			,[A].ContactEmail	--nvarchar(150)	Checked
			,[A].URL1	--nvarchar(50)	Checked
			,[A].Address1	--nvarchar(50)	Checked
			,[A].Address2	--nvarchar(50)	Checked
			,[A].Address3	--nvarchar(50)	Checked
			,[A].TradingAddress1	--nvarchar(50)	Checked
			,[A].TradingAddress2	--nvarchar(50)	Checked
			,[A].TradingAddress3	--nvarchar(50)	Checked
			,[A].CountryId	--int	Checked
			,[A].PostCode	--nvarchar(50)	Checked
			,[A].BusinessDesc	--nvarchar(50)	Checked
			,[A].IsRegulatedBusiness	--bit	Checked
			,[A].DateCreated
			,[A].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Account [A]
		LEFT JOIN [MerchantStatus] [MS] ON [MS].Id = [A].MerchantStatusId
		LEFT JOIN [Account] [SOI] ON [SOI].Id = [A].SourceOfIntroductionId
		LEFT JOIN [CompanyType] [TOI] ON [TOI].Id = [A].TypeOfIntroducerId
		LEFT JOIN [CompanyType] [CT] ON [CT].Id = [A].CompanyTypeId
		LEFT JOIN [Country] [C] ON [C].Id = [A].CountryId
		LEFT JOIN [User] [U] ON [A].UserCreatedId = [U].Id
	WHERE
	[A].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[ACCOUNT_GETISOPSP]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ACCOUNT_GETISOPSP]
AS
BEGIN
	SELECT  
			 [A].Id
			,[A].MerchantStatusId, [MS].[Desc]	--int	Checked
			,[A].SourceOfIntroductionId, [SOI].LegalName AS SourceOfIntroductionLegalName
			,[A].TypeOfIntroducerId	, [TOI].[Desc] AS TypeOfIntroducerDesc
			,[A].LegalName	--nvarchar(50)	Checked
			,[A].TradingAsName	--nvarchar(50)	Checked
			,[A].CompanyTypeId, [CT].[Desc]	--int	Checked
			,[A].MainContactPerson	--nvarchar(50)	Checked
			,[A].ContactPhone	--nvarchar(50)	Checked
			,[A].ContactEmail	--nvarchar(150)	Checked
			,[A].URL1	--nvarchar(50)	Checked
			,[A].Address1	--nvarchar(50)	Checked
			,[A].Address2	--nvarchar(50)	Checked
			,[A].Address3	--nvarchar(50)	Checked
			,[A].TradingAddress1	--nvarchar(50)	Checked
			,[A].TradingAddress2	--nvarchar(50)	Checked
			,[A].TradingAddress3	--nvarchar(50)	Checked
			,[A].CountryId	--int	Checked
			,[A].PostCode	--nvarchar(50)	Checked
			,[A].BusinessDesc	--nvarchar(50)	Checked
			,[A].IsRegulatedBusiness	--bit	Checked
			,[A].DateCreated
			,[A].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Account [A]
		LEFT JOIN [MerchantStatus] [MS] ON [MS].Id = [A].MerchantStatusId
		LEFT JOIN [Account] [SOI] ON [SOI].Id = [A].SourceOfIntroductionId
		LEFT JOIN [CompanyType] [TOI] ON [TOI].Id = [A].TypeOfIntroducerId
		LEFT JOIN [CompanyType] [CT] ON [CT].Id = [A].CompanyTypeId
		LEFT JOIN [Country] [C] ON [C].Id = [A].CountryId
		LEFT JOIN [User] [U] ON [A].UserCreatedId = [U].Id
	WHERE
		[A].Deleted = 0
	AND ([A].CompanyTypeId = 1 OR [A].CompanyTypeId = 2) -- ISO and PSP
END


GO
/****** Object:  StoredProcedure [dbo].[ACCOUNT_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ACCOUNT_INSERT]
		 @MerchantStatusId	int	
	    ,@SourceOfIntroductionId int	
		,@TypeOfIntroducerId int	
		,@LegalName	nvarchar(50)	
		,@TradingAsName	nvarchar(50)	
		,@CompanyTypeId	int	
		,@MainContactPerson	nvarchar(50)	
		,@ContactPhone	nvarchar(50)	
		,@ContactEmail nvarchar(50)
		,@URL1	nvarchar(50)	
		,@Address1	nvarchar(50)	
		,@Address2	nvarchar(50)	
		,@Address3	nvarchar(50)
		,@TradingAddress1	nvarchar(50)	
		,@TradingAddress2	nvarchar(50)	
		,@TradingAddress3	nvarchar(50)		
		,@CountryId	int	
		,@PostCode	nvarchar(50)	
		,@BusinessDesc	nvarchar(50)	
		,@IsRegulatedBusiness	bit	
		,@UserCreatedId	int	
AS
BEGIN
   INSERT INTO Account 
	    (MerchantStatusId
		,SourceOfIntroductionId 	
		,TypeOfIntroducerId 	
		,LegalName
		,TradingAsName
		,CompanyTypeId
		,MainContactPerson
		,ContactPhone
		,ContactEmail
		,URL1
		,Address1
		,Address2
		,Address3
		,TradingAddress1
		,TradingAddress2
		,TradingAddress3
		,CountryId
		,PostCode
		,BusinessDesc
		,IsRegulatedBusiness
	    ,DateCreated
	    ,UserCreatedId
	    ,Deleted)
	VALUES
	   (@MerchantStatusId	--int	Checked
	    ,@SourceOfIntroductionId 	
		,@TypeOfIntroducerId 
		,@LegalName	--nvarchar(50)	Checked
		,@TradingAsName	--nvarchar(50)	Checked
		,@CompanyTypeId	--int	Checked
		,@MainContactPerson	--nvarchar(50)	Checked
		,@ContactPhone	--nvarchar(50)	Checked
		,@ContactEmail--nvarchar(150)	Checked
		,@URL1	--nvarchar(50)	Checked
		,@Address1	--nvarchar(50)	Checked
		,@Address2	--nvarchar(50)	Checked
		,@Address3	--nvarchar(50)	Checked
		,@TradingAddress1	--nvarchar(50)	Checked
		,@TradingAddress2	--nvarchar(50)	Checked
		,@TradingAddress3	--nvarchar(50)	Checked
		,@CountryId	--int	Checked
		,@PostCode	--nvarchar(50)	Checked
		,@BusinessDesc	--nvarchar(50)	Checked
		,@IsRegulatedBusiness	--bit	Checked
		,GETDATE()
		,@UserCreatedId
		,0)
END

SELECT CONVERT(INT, SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[ACCOUNT_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ACCOUNT_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
	SELECT 
 			 [A].Id
			,[A].MerchantStatusId, [MS].[Desc]	--int	Checked
			,[A].SourceOfIntroductionId, [SOI].LegalName AS SourceOfIntroductionLegalName
			,[A].TypeOfIntroducerId	, [TOI].[Desc] AS TypeOfIntroducerDesc
			,[A].LegalName	--nvarchar(50)	Checked
			,[A].TradingAsName	--nvarchar(50)	Checked
			,[A].CompanyTypeId, [CT].[Desc]	--int	Checked
			,[A].MainContactPerson	--nvarchar(50)	Checked
			,[A].ContactPhone	--nvarchar(50)	Checked
			,[A].ContactEmail --nvarchar(150)	Checked
			,[A].URL1	--nvarchar(50)	Checked
			,[A].Address1	--nvarchar(50)	Checked
			,[A].Address2	--nvarchar(50)	Checked
			,[A].Address3	--nvarchar(50)	Checked
			,[A].TradingAddress1	--nvarchar(50)	Checked
			,[A].TradingAddress2	--nvarchar(50)	Checked
			,[A].TradingAddress3	--nvarchar(50)	Checked
			,[A].CountryId	--int	Checked
			,[A].PostCode	--nvarchar(50)	Checked
			,[A].BusinessDesc	--nvarchar(50)	Checked
			,[A].IsRegulatedBusiness	--bit	Checked
			,[A].DateCreated
			,[A].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Account [A]
		LEFT JOIN [MerchantStatus] [MS] ON [MS].Id = [A].MerchantStatusId
		LEFT JOIN [Account] [SOI] ON [SOI].Id = [A].SourceOfIntroductionId
		LEFT JOIN [CompanyType] [TOI] ON [TOI].Id = [A].TypeOfIntroducerId
		LEFT JOIN [CompanyType] [CT] ON [CT].Id = [A].CompanyTypeId
		LEFT JOIN [Country] [C] ON [C].Id = [A].CountryId
		LEFT JOIN [User] [U] ON [A].UserCreatedId = [U].Id
	WHERE ([A].LegalName LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
	AND [A].Deleted = 0
   
END


GO
/****** Object:  StoredProcedure [dbo].[ACCOUNT_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ACCOUNT_UPDATE]
	-- Add the parameters for the stored procedure here
		 @Id	int	
		,@MerchantStatusId	int	
		,@SourceOfIntroductionId	int	
		,@TypeOfIntroducerId	int	
		,@LegalName	nvarchar(50)	
		,@TradingAsName	nvarchar(50)	
		,@CompanyTypeId	int	
		,@MainContactPerson	nvarchar(50)	
		,@ContactPhone	nvarchar(50)	
		,@ContactEmail	nvarchar(150)	
		,@URL1	nvarchar(50)	
		,@Address1	nvarchar(50)	
		,@Address2	nvarchar(50)	
		,@Address3	nvarchar(50)	
		,@TradingAddress1	nvarchar(50)	
		,@TradingAddress2	nvarchar(50)	
		,@TradingAddress3	nvarchar(50)	
		,@CountryId	int	
		,@PostCode	nvarchar(50)	
		,@BusinessDesc	nvarchar(50)	
		,@IsRegulatedBusiness	bit	
AS
BEGIN
   UPDATE Account SET 
	 MerchantStatusId = @MerchantStatusId	--int	Checked
	,SourceOfIntroductionId = @SourceOfIntroductionId	
	,TypeOfIntroducerId = @TypeOfIntroducerId	
	,LegalName = @LegalName	--nvarchar(50)	Checked
	,TradingAsName = @TradingAsName	--nvarchar(50)	Checked
	,CompanyTypeId = @CompanyTypeId	--int	Checked
	,MainContactPerson = @MainContactPerson	--nvarchar(50)	Checked
	,ContactPhone = @ContactPhone	--nvarchar(50)	Checked
	,ContactEmail = @ContactEmail	--nvarchar(50)	Checked
	,URL1 = @URL1	--nvarchar(50)	Checked
	,Address1	= @Address1	--nvarchar(50)	Checked
	,Address2	= @Address2	--nvarchar(50)	Checked
	,Address3	= @Address3	--nvarchar(50)	Checked
	,TradingAddress1 = @TradingAddress1	--nvarchar(50)	Checked
	,TradingAddress2 = @TradingAddress2	--nvarchar(50)	Checked
	,TradingAddress3 = @TradingAddress3	--nvarchar(50)	Checked
	,CountryId = @CountryId	--int	Checked
	,PostCode = @PostCode	--nvarchar(50)	Checked
	,BusinessDesc = @BusinessDesc	--nvarchar(50)	Checked
	,IsRegulatedBusiness = @IsRegulatedBusiness	--bit	Checked
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[ADDRESSSTATUS_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ADDRESSSTATUS_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE AddressStatus SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[ADDRESSSTATUS_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ADDRESSSTATUS_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [AS].Id
		,[AS].[Desc]
		,[AS].DateCreated
		,[AS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM AddressStatus [AS], [User] [U]
	WHERE [AS].Id = @Id
	AND [AS].UserCreatedId = [U].Id
	AND [AS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[ADDRESSSTATUS_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ADDRESSSTATUS_GETALL]
AS
BEGIN
	SELECT  
		 [AS].Id
		,[AS].[Desc]
		,[AS].DateCreated
		,[AS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM AddressStatus [AS], [User] U
	WHERE 
		[AS].UserCreatedId = [U].Id
	AND [AS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[ADDRESSSTATUS_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ADDRESSSTATUS_INSERT]
	 @Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO AddressStatus 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[ADDRESSSTATUS_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ADDRESSSTATUS_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [AS].Id
		,[AS].[Desc]
		,[AS].DateCreated
		,[AS].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM AddressStatus [AS], [User] [U]
    WHERE 
   ([AS].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [AS].UserCreatedId = [U].Id
   AND [AS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[ADDRESSSTATUS_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ADDRESSSTATUS_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE AddressStatus SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[APPLICATIONFORMSTATUS_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[APPLICATIONFORMSTATUS_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE ApplicationFormStatus SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[APPLICATIONFORMSTATUS_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[APPLICATIONFORMSTATUS_GET]
@Id INT
AS
BEGIN
	SELECT  
		 [AFS].Id
		,[AFS].[Desc]
		,[AFS].DateCreated
		,[AFS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM ApplicationFormStatus [AFS], [User] [U]
	WHERE  [AFS].Id = @Id
	AND [AFS].UserCreatedId = [U].Id
	AND [AFS].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[APPLICATIONFORMSTATUS_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[APPLICATIONFORMSTATUS_GETALL]
AS
BEGIN
	SELECT  
		 [AFS].Id
		,[AFS].[Desc]
		,[AFS].DateCreated
		,[AFS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM ApplicationFormStatus [AFS], [User] [U]
	WHERE  
	 [AFS].UserCreatedId = [U].Id
	AND [AFS].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[APPLICATIONFORMSTATUS_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[APPLICATIONFORMSTATUS_INSERT]
	@Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO ApplicationFormStatus 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[APPLICATIONFORMSTATUS_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[APPLICATIONFORMSTATUS_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT  
		 [AFS].Id
		,[AFS].[Desc]
		,[AFS].DateCreated
		,[AFS].UserCreatedId
		,U.Id AS UserId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM ApplicationFormStatus AFS, [User] U WHERE 
     ([AFS].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [AFS].UserCreatedId = U.Id
   AND [AFS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[APPLICATIONFORMSTATUS_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[APPLICATIONFORMSTATUS_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE ApplicationFormStatus SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[BOARDINGSTATUS_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BOARDINGSTATUS_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE BoardingStatus SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[BOARDINGSTATUS_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BOARDINGSTATUS_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [BS].Id
		,[BS].[Desc]
		,[BS].DateCreated
		,[BS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM BoardingStatus [BS], UserRole [UR], [User] [U]
	WHERE [BS].Id = @Id
	AND [BS].UserCreatedId = [U].Id
	AND [BS].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[BOARDINGSTATUS_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BOARDINGSTATUS_GETALL]
AS
BEGIN
	SELECT 
		 [BS].Id
		,[BS].[Desc]
		,[BS].DateCreated
		,[BS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM BoardingStatus [BS], UserRole [UR], [User] [U]
	WHERE 
		[BS].UserCreatedId = [U].Id
		AND [BS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[BOARDINGSTATUS_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BOARDINGSTATUS_INSERT]
	 @Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO BoardingStatus 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[BOARDINGSTATUS_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BOARDINGSTATUS_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT  
		 [BS].Id
		,[BS].[Desc]
		,[BS].DateCreated
		,[BS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM BoardingStatus [BS], UserRole [UR], [User] [U]
		   WHERE 
   ([BS].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
    AND [BS].UserCreatedId = [U].Id
	AND [BS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[BOARDINGSTATUS_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BOARDINGSTATUS_UPDATE]
	-- Add the parameters for the stored procedure here
	 @Id INT
	,@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE BoardingStatus SET 
    [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[COMPANYTYPE_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[COMPANYTYPE_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE CompanyType SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[COMPANYTYPE_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[COMPANYTYPE_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [CT].Id
		,[CT].[Desc]
		,[CT].DateCreated
		,[CT].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM CompanyType [CT], [User] [U]
	WHERE  [CT].Id = @Id
	AND [CT].UserCreatedId = [U].Id
	AND [CT].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[COMPANYTYPE_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[COMPANYTYPE_GETALL]
AS
BEGIN
	SELECT 
		 [CT].Id
		,[CT].[Desc]
		,[CT].DateCreated
		,[CT].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM CompanyType [CT], [User] [U]
	WHERE  
	 [CT].UserCreatedId = [U].Id
	AND [CT].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[COMPANYTYPE_GETTYPEOFINTRODUCER]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[COMPANYTYPE_GETTYPEOFINTRODUCER]
AS
BEGIN
	SELECT 
		 [CT].Id
		,[CT].[Desc]
		,[CT].DateCreated
		,[CT].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM CompanyType [CT], [User] [U]
	WHERE  
	 [CT].UserCreatedId = [U].Id
	AND [CT].Deleted = 0
	AND ([CT].Id = 1 OR [CT].Id = 2 OR [CT].Id = 9)
END

GO
/****** Object:  StoredProcedure [dbo].[COMPANYTYPE_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[COMPANYTYPE_INSERT]
	@Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO CompanyType 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END


GO
/****** Object:  StoredProcedure [dbo].[COMPANYTYPE_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[COMPANYTYPE_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
  SELECT
		 [CT].Id
		,[CT].[Desc]
		,[CT].DateCreated
		,[CT].UserCreatedId
		,U.Id AS UserId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM CompanyType [CT], [User] U
		WHERE 
    ([CT].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [CT].UserCreatedId = U.Id
   AND [CT].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[COMPANYTYPE_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[COMPANYTYPE_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE CompanyType SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[CONTACT_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACT_DELETE] 
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE Contact SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[CONTACT_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACT_GET]
@Id INT
AS
BEGIN
	SELECT 
	     [C].Id
		,[C].AccountId 
		,[C].ContactTypeId AS ContactTypeId, [CT].[Desc] AS ContactTypeDesc
		,[C].Name	
		,[C].[Address]	
		,[C].DOB	
		,[C].IDDOC
		,[C].AVDOC
		,[C].Shareholding
		,[C].Info
		,[C].DateCreated
		,[C].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM Contact [C], [User] [U], ContactType [CT]
	WHERE [C].Id = @Id
	AND [C].UserCreatedId = [U].Id
	AND [C].ContactTypeId = [CT].Id
	AND [C].Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[CONTACT_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACT_GETALL]
AS
BEGIN
	SELECT  
		 [C].Id
		,[C].AccountId AS AccountId
		,[C].ContactTypeId AS ContactTypeId, [CT].[Desc] AS ContactTypeDesc
		,[C].Name	
		,[C].[Address]	
		,[C].DOB	
		,[C].IDDOC
		,[C].AVDOC
		,[C].Shareholding
		,[C].Info
		,[C].DateCreated
		,[C].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM Contact [C], ContactType [CT], [User] [U], Account [A]
	WHERE 
		[C].ContactTypeId = [CT].Id 
	AND [C].UserCreatedId = [U].Id
	AND [C].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[CONTACT_GETBYACCOUNTID]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACT_GETBYACCOUNTID]
@AccountId INT
AS
BEGIN
	SELECT  
		 [C].Id
		,[C].AccountId AS AccountId
		,[C].ContactTypeId AS ContactTypeId, [CT].[Desc] AS ContactTypeDesc
		,[C].Name	
		,[C].[Address]	
		,[C].DOB	
		,[C].IDDOC
		,[C].AVDOC
		,[C].Shareholding
		,[C].Info
		,[C].DateCreated
		,[C].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM Contact [C]
		LEFT JOIN ContactType [CT] ON  [CT].Id = [C].ContactTypeId
		LEFT JOIN [User] [U] ON [U].Id = [C].UserCreatedId
	WHERE 
		[C].AccountId = @AccountId
	AND [C].Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[CONTACT_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACT_INSERT]
		 @AccountId	INT
		,@ContactTypeId	INT
		,@Name	NVARCHAR(50)
		,@Address NVARCHAR(150)
		,@DOB	NVARCHAR(150)
		,@IDDOC	NVARCHAR(50)	
		,@AVDOC	NVARCHAR(50)	
		,@Shareholding	INT
		,@Info	NVARCHAR(250)	
		,@UserCreatedId INT
AS
BEGIN
   INSERT INTO Contact 
		(
		 AccountId	
		,ContactTypeId	
		,Name	
		,Address
		,DOB	
		,IDDOC	
		,AVDOC	
		,Shareholding	
		,Info
		,DateCreated
		,UserCreatedId
		,Deleted
		)
		VALUES
	    (
		 @AccountId	
		,@ContactTypeId	
		,@Name	
		,@Address 
		,@DOB	
		,@IDDOC	
		,@AVDOC	
		,@Shareholding
		,@Info	
		,GETDATE()
		,@UserCreatedId
		,0
			)
END

GO
/****** Object:  StoredProcedure [dbo].[CONTACT_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACT_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [C].Id
		,[C].AccountId AS AccountId
		,[C].ContactTypeId AS ContactTypeId, [CT].[Desc] AS ContactTypeDesc
		,[C].Name	
		,[C].[Address]	
		,[C].DOB	
		,[C].IDDOC
		,[C].AVDOC
		,[C].Shareholding
		,[C].Info
		,[C].DateCreated
		,[C].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM Contact [C] 
		LEFT JOIN ContactType [CT] ON [CT].Id = [C].ContactTypeId 
		LEFT JOIN [User] [U] ON [U].Id = [C].UserCreatedId 
		LEFT JOIN [Account] [A] ON [A].Id = [C].AccountId
    WHERE 
   ([C].[Name] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
	AND [C].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[CONTACT_SEARCHBYACCOUNTID]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACT_SEARCHBYACCOUNTID]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
	,@AccountId INT
AS
BEGIN
   SELECT 
		 [C].Id
		,[C].AccountId AS AccountId
		,[C].ContactTypeId AS ContactTypeId, [CT].[Desc] AS ContactTypeDesc
		,[C].Name	
		,[C].[Address]	
		,[C].DOB	
		,[C].IDDOC
		,[C].AVDOC
		,[C].Shareholding
		,[C].Info
		,[C].DateCreated
		,[C].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM Contact [C] 
		LEFT JOIN ContactType [CT] ON [CT].Id = [C].ContactTypeId 
		LEFT JOIN [User] [U] ON [U].Id = [C].UserCreatedId 
		LEFT JOIN [Account] [A] ON [A].Id = [C].AccountId
    WHERE 
   ([C].[Name] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
	AND [C].AccountId = @AccountId
	AND [C].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[CONTACT_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACT_UPDATE]
	-- Add the parameters for the stored procedure here
		 @Id INT
		,@AccountId	INT
		,@ContactTypeId	INT
		,@Name	NVARCHAR(50)
		,@Address NVARCHAR(150)
		,@DOB	NVARCHAR(150)	
		,@IDDOC	NVARCHAR(50)	
		,@AVDOC	NVARCHAR(50)	
		,@Shareholding	INT
		,@Info	NVARCHAR(250)	
AS
BEGIN
   UPDATE Contact SET 
		 AccountId	=  @AccountId	
		,ContactTypeId	= @ContactTypeId	
		,Name	=@Name	
		,[Address] = @Address 
		,DOB	= @DOB
		,IDDOC = @IDDOC
		,AVDOC = @AVDOC	
		,Shareholding = @Shareholding
		,Info	 = @Info

   		
   WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[CONTACTEMAIL_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTEMAIL_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE ContactEmail SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[CONTACTEMAIL_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTEMAIL_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [CE].Id
		,[CE].MerchantId, [M].Name AS MerchantName
		,[CE].Email
		,[CE].DateCreated
		,[CE].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM ContactEmail [CE], Merchant [M], [User] [U]
	WHERE [CE].Id = @Id
	AND [CE].MerchantId = [M].Id
	AND [CE].UserCreatedId = [U].Id
	AND [CE].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[CONTACTEMAIL_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTEMAIL_GETALL]
AS
BEGIN
	SELECT  
		 [CE].Id
		,[CE].MerchantId, [M].Name AS MerchantName
		,[CE].Email
		,[CE].DateCreated
		,[CE].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM ContactEmail [CE], Merchant [M], [User] [U]
	WHERE 
			[CE].UserCreatedId = [U].Id
		AND [CE].MerchantId = [M].Id
		AND [CE].Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[CONTACTEMAIL_GETBYMERCHANT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTEMAIL_GETBYMERCHANT]
@MerchantId INT
AS
BEGIN
	SELECT 
		 [CE].Id
		,[CE].MerchantId, [M].Name AS MerchantName
		,[CE].Email
		,[CE].DateCreated
		,[CE].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM ContactEmail [CE], Merchant [M], [User] [U]
	WHERE [CE].MerchantId = @MerchantId
	AND [CE].MerchantId = [M].Id
	AND [CE].UserCreatedId = [U].Id
	AND [CE].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[CONTACTEMAIL_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTEMAIL_INSERT]
	 @MerchantId INT
	,@Email NVARCHAR(250)
	,@UserCreatedId INT
AS
BEGIN
   INSERT INTO ContactEmail 
	   (MerchantId
	   ,Email
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@MerchantId
	   ,@Email
	   ,GETDATE()
	   ,@UserCreatedId
	   ,0)
END
GO
/****** Object:  StoredProcedure [dbo].[CONTACTEMAIL_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTEMAIL_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [CE].Id
		,[CE].MerchantId, [M].Name AS MerchantName
		,[CE].Email
		,[CE].DateCreated
		,[CE].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM ContactEmail [CE], Merchant [M], [User] [U]
    WHERE 
   ([M].Name LIKE '%'+ @SearchText +'%' OR [CE].Email LIKE '%'+ @SearchText +'%' 
   OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [CE].MerchantId = [M].Id
   AND [CE].UserCreatedId = [U].Id
   AND [CE].Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[CONTACTEMAIL_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTEMAIL_UPDATE]
	 @Id INT
	,@MerchantId INT
	,@Email NVARCHAR(250)
AS
BEGIN
   UPDATE ContactEmail SET 
    MerchantId = @MerchantId
   ,Email = @Email
   WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[CONTACTPERSON_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTPERSON_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE ContactPerson SET Deleted = 1
   WHERE Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[CONTACTPERSON_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTPERSON_GET]
@Id INT
AS
BEGIN
	SELECT 
	 [CP].[Id]
	,[CP].NameSurname
	,[CP].EmailAddress
	,[CP].PersonTitleId
	,[CP].DateCreated
    ,[CP].UserCreatedId AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	FROM ContactPerson [CP], [User] [U]
	WHERE [CP].Id = @Id
	AND [CP].UserCreatedId = [U].Id
	AND [CP].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[CONTACTPERSON_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTPERSON_GETALL]
AS
BEGIN
	SELECT 
	 [CP].[Id]
	,[CP].NameSurname
	,[CP].EmailAddress
	,[CP].PersonTitleId
	,[CP].DateCreated
    ,[CP].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	FROM ContactPerson [CP], [User] [U]
	WHERE 
	 [CP].UserCreatedId = [U].Id
	AND [CP].Deleted = 0
END



GO
/****** Object:  StoredProcedure [dbo].[CONTACTPERSON_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTPERSON_INSERT]
	@NameSurname NVARCHAR(100)
	,@EmailAddress NVARCHAR(100)
	,@PersonTitleId INT
	,@UserId INT
AS
BEGIN
   INSERT INTO ContactPerson
    (NameSurname
	,EmailAddress
	,PersonTitleId
	,DateCreated
    ,UserCreatedId
	,Deleted)
   VALUES
		(@NameSurname
		,@EmailAddress
		,@PersonTitleId
		,GETDATE()
		,@UserId
		,0)
END

GO
/****** Object:  StoredProcedure [dbo].[CONTACTPERSON_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTPERSON_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
	SELECT CP.Id AS Id
	,CP.NameSurname
	,CP.EmailAddress
	,CP.PersonTitleId
	,CP.Deleted
	,PT.Id AS PersonTitleId, PT.[Desc]
	,U.Id AS UserId ,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
	FROM ContactPerson CP, PersonTitle PT, [User] U
	 WHERE 
   (CP.[NameSurname] LIKE '%'+ @SearchText +'%' 
   OR CP.[EmailAddress] LIKE '%'+ @SearchText +'%' 
   OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND CP.PersonTitleId = PT.Id
   AND CP.UserCreatedId = U.Id
   AND CP.Deleted = 0
   AND PT.Deleted = 0
END



GO
/****** Object:  StoredProcedure [dbo].[CONTACTPERSON_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTPERSON_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@NameSurname NVARCHAR(100),
	@EmailAddress NVARCHAR(100),
	@PersonTitleId int
AS
BEGIN
	UPDATE ContactPerson SET 
	NameSurname =  @NameSurname,
	EmailAddress =	@EmailAddress,
	PersonTitleId = @PersonTitleId 
	WHERE Id = @Id
END



GO
/****** Object:  StoredProcedure [dbo].[CONTACTTYPE_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTTYPE_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE ContactType SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[CONTACTTYPE_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTTYPE_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [CT].Id
		,[CT].[Desc]
		,[CT].DateCreated
		,[CT].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM ContactType [CT], [User] [U]
	WHERE [CT].Id = @Id
	AND [CT].UserCreatedId = [U].Id
	AND [CT].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[CONTACTTYPE_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTTYPE_GETALL]
AS
BEGIN
	SELECT 
		 [CT].Id
		,[CT].[Desc]
		,[CT].DateCreated
		,[CT].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM ContactType [CT], [User] [U]
	WHERE 
		[CT].UserCreatedId = [U].Id
	AND [CT].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[CONTACTTYPE_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTTYPE_INSERT]
	 @Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO ContactType 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[CONTACTTYPE_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTTYPE_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
	SELECT
		 [CT].Id
		,[CT].[Desc]
		,[CT].DateCreated
		,[CT].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM ContactType [CT], [User] [U]
		  WHERE 
    ([CT].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [CT].UserCreatedId = [U].Id
   AND [CT].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[CONTACTTYPE_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTACTTYPE_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE ContactType SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[CONTRACTSTATUS_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTRACTSTATUS_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE ContractStatus SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[CONTRACTSTATUS_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTRACTSTATUS_GET]
@Id INT
AS
	BEGIN
		SELECT 
			 [CS].Id
			,[CS].[Desc]
			,[CS].DateCreated
			,[CS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
			FROM ContractStatus [CS], [User] [U]
		WHERE  [CS].Id = @Id
		AND [CS].UserCreatedId = [U].Id
		AND [CS].Deleted = 0
	END


GO
/****** Object:  StoredProcedure [dbo].[CONTRACTSTATUS_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTRACTSTATUS_GETALL]
AS
BEGIN
		SELECT 
			 [CS].Id
			,[CS].[Desc]
			,[CS].DateCreated
			,[CS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
			FROM ContractStatus [CS], [User] [U]
		WHERE 
			[CS].UserCreatedId = [U].Id
		AND [CS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[CONTRACTSTATUS_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTRACTSTATUS_INSERT]
	@Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO ContractStatus 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END


GO
/****** Object:  StoredProcedure [dbo].[CONTRACTSTATUS_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTRACTSTATUS_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT  [CS].Id
		,[CS].[Desc]
		,[CS].DateCreated
		,[CS].UserCreatedId
		,U.Id AS UserId ,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM ContractStatus [CS], [User] U 
		WHERE 
  ([CS].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [CS].UserCreatedId = U.Id
   AND [CS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[CONTRACTSTATUS_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTRACTSTATUS_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE ContractStatus SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[COUNTRY_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[COUNTRY_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE Country SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[COUNTRY_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[COUNTRY_GET]
@Id INT
AS
BEGIN
	SELECT 
		[C].[Id]
	   ,[C].[Code]
	   ,[C].[Desc]
	   ,[C].DateCreated
	   ,[C].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM Country [C], [User] [U]
	WHERE  [C].Id = @Id
	AND [C].UserCreatedId = [U].Id
	AND [C].Deleted = 0
	ORDER BY [C].Code
END


GO
/****** Object:  StoredProcedure [dbo].[COUNTRY_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[COUNTRY_GETALL]
AS
BEGIN
	SELECT 
		[C].[Id]
	   ,[C].[Code]
	   ,[C].[Desc]
	   ,[C].DateCreated
	   ,[C].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM Country [C], [User] [U]
	WHERE  
		[C].UserCreatedId = [U].Id
	AND [C].Deleted = 0
	ORDER BY [C].Code
END


GO
/****** Object:  StoredProcedure [dbo].[COUNTRY_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[COUNTRY_INSERT]
		 @Code NVARCHAR(2)
		,@Desc NVARCHAR(150)
		,@UserId INT
AS
BEGIN
   INSERT INTO Country 
	   ([Code]
	   ,[Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Code
	   ,@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END



GO
/****** Object:  StoredProcedure [dbo].[COUNTRY_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[COUNTRY_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT  
		 [C].Id
		,[C].[Code]
		,[C].[Desc]
		,[C].DateCreated
		,[C].UserCreatedId
		,U.Id AS UserId ,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM Country [C], [User] U
		 WHERE 
      ([C].[Code] LIKE '%'+ @SearchText +'%'
	OR [C].[Desc] LIKE '%'+ @SearchText +'%'
	OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
      AND [C].UserCreatedId = U.Id
   AND [C].Deleted = 0
   ORDER BY [C].Code
END


GO
/****** Object:  StoredProcedure [dbo].[COUNTRY_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[COUNTRY_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Code NVARCHAR(2),
	@Desc NVARCHAR(150)
AS
BEGIN
   UPDATE Country SET 
   [Code] = @Code,
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[CURRENCY_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CURRENCY_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE Currency SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[CURRENCY_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CURRENCY_GET]
@Id INT
AS
BEGIN
	SELECT
			[C].Id
		   ,[C].[Code]
		   ,[C].[Desc]
		   ,[C].DateCreated
		   ,[C].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		   FROM Currency [C], [User] [U]
			WHERE [C].Id = @Id
			AND [C].UserCreatedId = [U].Id
			AND [C].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[CURRENCY_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CURRENCY_GETALL]
AS
BEGIN
	SELECT
			[C].Id
		   ,[C].[Code]
		   ,[C].[Desc]
		   ,[C].DateCreated
		   ,[C].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		   FROM Currency [C], [User] [U]
			WHERE 
				[C].UserCreatedId = [U].Id
			AND [C].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[CURRENCY_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CURRENCY_INSERT]
		 @Code NVARCHAR(2)
		,@Desc NVARCHAR(150)
		,@UserId INT
	AS
	BEGIN
	   INSERT INTO Currency 
		   ([Code]
		   ,[Desc]
		   ,DateCreated
		   ,UserCreatedId
		   ,Deleted)
		VALUES
		   (@Code
		   ,@Desc
		   ,GETDATE()
		   ,@UserId
		   ,0)
	END

GO
/****** Object:  StoredProcedure [dbo].[CURRENCY_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CURRENCY_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [C].Id
		,[C].[Code]
		,[C].[Desc]
		,[C].DateCreated
		,[C].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM Currency [C], [User] [U]
		 WHERE 
   ([C].[Code] LIKE '%'+ @SearchText +'%'
	OR [C].[Desc] LIKE '%'+ @SearchText +'%'
	OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
      AND [C].UserCreatedId = U.Id
	AND [C].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[CURRENCY_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CURRENCY_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Code NVARCHAR(3),
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE Currency SET 
   [Code] = @Code,
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[DIRECTOR_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DIRECTOR_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE Director SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[DIRECTOR_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DIRECTOR_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [D].Id	
		,[D].MerchantBoardingId, [MB].LegalName
		,[D].Name	
		,[D].[Address]
		,[D].DOB
		,[D].IDDOC	
		,[D].AVDOC	
		,[D].Shareholding	
		,[D].DateCreated	
		,[D].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Director [D], MerchantBoarding [MB], [User] [U]
	WHERE [D].Id = @Id
	AND [D].MerchantBoardingId = [MB].Id 
	AND [D].UserCreatedId = [U].Id
	AND [D].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[DIRECTOR_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DIRECTOR_GETALL]
AS
BEGIN
	SELECT 
		 [D].Id	
		,[D].MerchantBoardingId, [MB].LegalName
		,[D].Name	
		,[D].[Address]
		,[D].DOB
		,[D].IDDOC	
		,[D].AVDOC	
		,[D].Shareholding	
		,[D].DateCreated	
		,[D].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Director [D], MerchantBoarding [MB], [User] [U]
	WHERE
			[D].MerchantBoardingId = [MB].Id 
		AND [D].UserCreatedId = [U].Id
		AND [D].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[DIRECTOR_GETBYMERCHANTBOARDINGID]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DIRECTOR_GETBYMERCHANTBOARDINGID]
	-- Add the parameters for the stored procedure here
	@MerchantBoardingId INT
AS
BEGIN
SELECT
		 [D].Id	
		,[D].MerchantBoardingId, [MB].LegalName
		,[D].Name	
		,[D].[Address]
		,[D].DOB
		,[D].IDDOC	
		,[D].AVDOC	
		,[D].Shareholding	
		,[D].DateCreated	
		,[D].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Director [D], MerchantBoarding [MB], [User] [U]
    WHERE 
		[D].MerchantBoardingId = @MerchantBoardingId
    AND	[D].MerchantBoardingId = [MB].Id 
    AND [D].UserCreatedId = [U].Id
    AND [D].Deleted = 0
	ORDER BY [D].Id	
END


GO
/****** Object:  StoredProcedure [dbo].[DIRECTOR_GETDIRECTORIDBYMERCHANTBOARDINGID]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DIRECTOR_GETDIRECTORIDBYMERCHANTBOARDINGID]
	-- Add the parameters for the stored procedure here
	@MerchantBoardingId INT
AS
BEGIN
SELECT
		 [D].Id	 
		FROM Director [D], MerchantBoarding [MB], [User] [U]
    WHERE 
		[D].MerchantBoardingId = @MerchantBoardingId
    AND	[D].MerchantBoardingId = [MB].Id 
    AND [D].UserCreatedId = [U].Id
    AND [D].Deleted = 0
	ORDER BY [D].Id	
END


GO
/****** Object:  StoredProcedure [dbo].[DIRECTOR_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DIRECTOR_INSERT]
		@MerchantBoardingId INT
	   ,@Name NVARCHAR(50)
	   ,@Address NVARCHAR(250)
	   ,@DOB NVARCHAR(50)
	   ,@IDDOC NVARCHAR(50)
	   ,@AVDOC NVARCHAR(50)
	   ,@Shareholding INT
	   ,@UserCreatedId INT
AS
BEGIN
   INSERT INTO Director 
	   (MerchantBoardingId
	   ,Name
	   ,[Address]
	   ,DOB
	   ,IDDOC
	   ,AVDOC
	   ,Shareholding
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@MerchantBoardingId
	   ,@Name
	   ,@Address
	   ,@DOB
	   ,@IDDOC
	   ,@AVDOC
	   ,@Shareholding
	   ,GETDATE()
	   ,@UserCreatedId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[DIRECTOR_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DIRECTOR_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
SELECT
		 [D].Id	
		,[D].MerchantBoardingId, [MB].LegalName
		,[D].Name	
		,[D].[Address]
		,[D].DOB
		,[D].IDDOC	
		,[D].AVDOC	
		,[D].Shareholding	
		,[D].DateCreated	
		,[D].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Director [D], MerchantBoarding [MB], [User] [U]
    WHERE 
   ([D].[Name] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [D].MerchantBoardingId = [MB].Id 
   AND [D].UserCreatedId = [U].Id
   AND [D].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[DIRECTOR_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DIRECTOR_UPDATE]
		@Id INT
	   ,@MerchantBoardingId INT
	   ,@Name NVARCHAR(50)
	   ,@Address NVARCHAR(250)
	   ,@DOB NVARCHAR(50)
	   ,@IDDOC NVARCHAR(50)
	   ,@AVDOC NVARCHAR(50)
	   ,@Shareholding INT
AS
BEGIN
   UPDATE Director SET 
	    @MerchantBoardingId = @MerchantBoardingId
	   ,Name = @Name
	   ,[Address] = @Address
	   ,DOB = @DOB
	   ,IDDOC = @IDDOC
	   ,AVDOC = @AVDOC
	   ,Shareholding = @Shareholding
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[HEARSOURCE_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HEARSOURCE_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE HearSource SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[HEARSOURCE_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HEARSOURCE_GET]
@Id INT
AS
BEGIN
	SELECT
			[HC].Id
		   ,[HC].[Desc]
		   ,[HC].DateCreated
		   ,[HC].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		   FROM HearSource [HC], [User] [U]
			WHERE [HC].Id = @Id
			AND [HC].UserCreatedId = [U].Id
			AND [HC].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[HEARSOURCE_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HEARSOURCE_GETALL]
AS
BEGIN
	SELECT
			[HC].Id
		   ,[HC].[Desc]
		   ,[HC].DateCreated
		   ,[HC].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		   FROM HearSource [HC], [User] [U]
			WHERE 
				[HC].UserCreatedId = [U].Id
			AND [HC].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[HEARSOURCE_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HEARSOURCE_INSERT]
		@Desc NVARCHAR(150)
		,@UserId INT
	AS
	BEGIN
	   INSERT INTO HearSource 
		   ([Desc]
		   ,DateCreated
		   ,UserCreatedId
		   ,Deleted)
		VALUES
		  ( @Desc
		   ,GETDATE()
		   ,@UserId
		   ,0)
	END

GO
/****** Object:  StoredProcedure [dbo].[HEARSOURCE_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HEARSOURCE_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT  
		 [HC].Id
		,[HC].[Desc]
		,[HC].DateCreated
		,[HC].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM HearSource [HC], [User] [U]
		  WHERE 
       ([HC].[Desc] LIKE '%'+ @SearchText +'%'
	 OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
	AND [HC].UserCreatedId = [U].Id
	AND [HC].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[HEARSOURCE_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HEARSOURCE_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(150)
AS
BEGIN
   UPDATE HearSource SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[INDUSTRY_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INDUSTRY_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE Industry SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[INDUSTRY_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INDUSTRY_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [I].Id
		,[I].[Desc]
		,[I].DateCreated
		,[I].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Industry [I], [User] [U]
	WHERE [I].Id = @Id
	AND [I].UserCreatedId = [U].Id
	AND [I].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[INDUSTRY_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INDUSTRY_GETALL]
AS
BEGIN
	SELECT 
		 [I].Id
		,[I].[Desc]
		,[I].DateCreated
		,[I].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Industry [I], [User] [U]
	WHERE 
		[I].UserCreatedId = [U].Id
	AND [I].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[INDUSTRY_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INDUSTRY_INSERT]
	 @Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO Industry 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[INDUSTRY_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INDUSTRY_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
	SELECT
		[I].Id
		,[I].[Desc]
		,[I].DateCreated
		,[I].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM Industry [I], [User] [U]
		  WHERE 
    ([I].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [I].UserCreatedId = [U].Id
   AND [I].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[INDUSTRY_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INDUSTRY_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE Industry SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[INTEGRATIONMETHOD_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INTEGRATIONMETHOD_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE IntegrationMethod SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[INTEGRATIONMETHOD_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INTEGRATIONMETHOD_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [IM].Id
		,[IM].[Desc]
		,[IM].DateCreated
		,[IM].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM IntegrationMethod [IM], [User] [U]
	WHERE [IM].Id = @Id
	AND [IM].UserCreatedId = [U].Id
	AND [IM].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[INTEGRATIONMETHOD_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INTEGRATIONMETHOD_GETALL]
AS
BEGIN
	SELECT  
		 [IM].Id
		,[IM].[Desc]
		,[IM].DateCreated
		,[IM].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM IntegrationMethod [IM], [User] U
	WHERE 
		[IM].UserCreatedId = [U].Id
	AND [IM].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[INTEGRATIONMETHOD_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INTEGRATIONMETHOD_INSERT]
	 @Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO IntegrationMethod 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[INTEGRATIONMETHOD_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INTEGRATIONMETHOD_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [IM].Id
		,[IM].[Desc]
		,[IM].DateCreated
		,[IM].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM IntegrationMethod [IM], [User] [U]
    WHERE 
   ([IM].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [IM].UserCreatedId = [U].Id
   AND [IM].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[INTEGRATIONMETHOD_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INTEGRATIONMETHOD_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE IntegrationMethod SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[INTRODUCER_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INTRODUCER_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE Introducer SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[INTRODUCER_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INTRODUCER_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [I].Id
		,[I].NameSurname	
		,[I].EmailAddress
		,[I].DateCreated
		,[I].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Introducer [I], [User] [U]
	WHERE [I].Id = @Id
	AND [I].UserCreatedId = [U].Id
	AND [I].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[INTRODUCER_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INTRODUCER_GETALL]
AS
BEGIN
	SELECT 
		 [I].Id
		,[I].NameSurname	
		,[I].EmailAddress
		,[I].DateCreated
		,[I].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Introducer [I], [User] [U]
	WHERE 
	[I].UserCreatedId = [U].Id
	AND [I].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[INTRODUCER_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INTRODUCER_INSERT]
	 @NameSurname NVARCHAR(50)
	,@EmailAddress NVARCHAR(50)
	,@UserCreatedId INT
AS
BEGIN
   INSERT INTO Introducer 
	   (
		NameSurname
	   ,EmailAddress
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@NameSurname
		,@EmailAddress
	   ,GETDATE()
	   ,@UserCreatedId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[INTRODUCER_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INTRODUCER_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
	SELECT 
		 [I].Id
		,[I].NameSurname	
		,[I].EmailAddress
		,[I].DateCreated
		,[I].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Introducer [I], [User] [U]
	WHERE  ([I].[NameSurname] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
	AND [I].UserCreatedId = [U].Id
	AND [I].Deleted = 0

END


GO
/****** Object:  StoredProcedure [dbo].[INTRODUCER_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INTRODUCER_UPDATE]
	-- Add the parameters for the stored procedure here
	 @Id INT
	,@NameSurname NVARCHAR(50)
	,@EmailAddress NVARCHAR(50)
AS
BEGIN
   UPDATE Introducer SET 
	 NameSurname = @NameSurname
	,EmailAddress = @EmailAddress	
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[KYBSTATUS_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[KYBSTATUS_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE KYBStatus SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[KYBSTATUS_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[KYBSTATUS_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [KS].Id
		,[KS].[Desc]
		,[KS].DateCreated
		,[KS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM KYBStatus [KS], [User] [U]
	WHERE [KS].Id = @Id
	AND [KS].UserCreatedId = [U].Id
	AND [KS].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[KYBSTATUS_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[KYBSTATUS_GETALL]
AS
BEGIN
		SELECT 
		 [KS].Id
		,[KS].[Desc]
		,[KS].DateCreated
		,[KS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM KYBStatus [KS], [User] [U]
	WHERE 
		[KS].UserCreatedId = [U].Id
	AND [KS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[KYBSTATUS_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[KYBSTATUS_INSERT]
	 @Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO KYBStatus 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[KYBSTATUS_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[KYBSTATUS_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
	SELECT
		 [KS].Id
		,[KS].[Desc]
		,[KS].DateCreated
		,[KS].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM KYBStatus [KS], [User] [U]
		  WHERE 
   ([KS].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [KS].UserCreatedId = [U].Id
   AND [KS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[KYBSTATUS_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[KYBSTATUS_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE KYBStatus SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MATCHSTATUS_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MATCHSTATUS_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE MatchStatus SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MATCHSTATUS_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MATCHSTATUS_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [MS].Id
		,[MS].[Desc]
		,[MS].DateCreated
		,[MS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM MatchStatus [MS], [User] [U]
	WHERE [MS].Id = @Id
	AND [MS].UserCreatedId = [U].Id
	AND [MS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MATCHSTATUS_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MATCHSTATUS_GETALL]
AS
BEGIN
	SELECT  
		 [MS].Id
		,[MS].[Desc]
		,[MS].DateCreated
		,[MS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM MatchStatus [MS], [User] U
	WHERE 
		[MS].UserCreatedId = [U].Id
	AND [MS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MATCHSTATUS_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MATCHSTATUS_INSERT]
	 @Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO MatchStatus 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[MATCHSTATUS_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MATCHSTATUS_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [MS].Id
		,[MS].[Desc]
		,[MS].DateCreated
		,[MS].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM MatchStatus [MS], [User] [U]
    WHERE 
   ([MS].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [MS].UserCreatedId = [U].Id
   AND [MS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MATCHSTATUS_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MATCHSTATUS_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE MatchStatus SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MB_COMMERCIALS_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_COMMERCIALS_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [MBCOM].Id
		,[MBCOM].MBId, [MB].LegalName AS MB_LegalName
		,[MBCOM].IsTrafficAvailable
		,[MBCOM].WhenVolumesRampUp	
		,[MBCOM].TmvEUR
		,[MBCOM].AtvEUR
		,[MBCOM].MtvEUR
		,[MBCOM].TcrEUR
		,[MBCOM].GexEUR
		,[MBCOM].MDRRateEUR
		,[MBCOM].CreditEUR
		,[MBCOM].DebitEUR
		,[MBCOM].PerDeclineEUR
		,[MBCOM].PerRefundEUR
		,[MBCOM].ChargebackEUR
		,[MBCOM].WireTransferFeeEUR
		,[MBCOM].MinimumTransactionFeeEUR
		,[MBCOM].MinimumSettlementFeeEUR
		,[MBCOM].AnnualRenewalFeeEUR
		,[MBCOM].MinimumWeeklyFeeEUR
		,[MBCOM].RollingReserveEUR
		,[MBCOM].RollingReserveMonthsEUR
		,[MBCOM].FXRateEUR
		,[MBCOM].GatewayProcessingFeeEUR
		,[MBCOM].ProcessorFeeEUR
		,[MBCOM].SetupFeeEUR
		,[MBCOM].SchemeFeeEUR
		,[MBCOM].OCTMCSendEUR
		,[MBCOM].Band1EUR
		,[MBCOM].Band2EUR
		,[MBCOM].Band3EUR
		,[MBCOM].TmvEUR_I1
		,[MBCOM].AtvEUR_I1
		,[MBCOM].MtvEUR_I1
		,[MBCOM].TcrEUR_I1
		,[MBCOM].GexEUR_I1
		,[MBCOM].MDRRateEUR_I1
		,[MBCOM].CreditEUR_I1
		,[MBCOM].DebitEUR_I1
		,[MBCOM].PerDeclineEUR_I1
		,[MBCOM].PerRefundEUR_I1
		,[MBCOM].ChargebackEUR_I1
		,[MBCOM].WireTransferFeeEUR_I1
		,[MBCOM].MinimumTransactionFeeEUR_I1
		,[MBCOM].MinimumSettlementFeeEUR_I1
		,[MBCOM].AnnualRenewalFeeEUR_I1
		,[MBCOM].MinimumWeeklyFeeEUR_I1
		,[MBCOM].RollingReserveEUR_I1
		,[MBCOM].RollingReserveMonthsEUR_I1
		,[MBCOM].FXRateEUR_I1
		,[MBCOM].GatewayProcessingFeeEUR_I1
		,[MBCOM].ProcessorFeeEUR_I1
		,[MBCOM].SetupFeeEUR_I1
		,[MBCOM].SchemeFeeEUR_I1
		,[MBCOM].OCTMCSendEUR_I1
		,[MBCOM].Band1EUR_I1
		,[MBCOM].Band2EUR_I1
		,[MBCOM].Band3EUR_I1
		,[MBCOM].TmvEUR_I2
		,[MBCOM].AtvEUR_I2
		,[MBCOM].MtvEUR_I2
		,[MBCOM].TcrEUR_I2
		,[MBCOM].GexEUR_I2
		,[MBCOM].MDRRateEUR_I2
		,[MBCOM].CreditEUR_I2
		,[MBCOM].DebitEUR_I2
		,[MBCOM].PerDeclineEUR_I2
		,[MBCOM].PerRefundEUR_I2
		,[MBCOM].ChargebackEUR_I2
		,[MBCOM].WireTransferFeeEUR_I2
		,[MBCOM].MinimumTransactionFeeEUR_I2
		,[MBCOM].MinimumSettlementFeeEUR_I2
		,[MBCOM].AnnualRenewalFeeEUR_I2
		,[MBCOM].MinimumWeeklyFeeEUR_I2
		,[MBCOM].RollingReserveEUR_I2
		,[MBCOM].RollingReserveMonthsEUR_I2
		,[MBCOM].FXRateEUR_I2
		,[MBCOM].GatewayProcessingFeeEUR_I2
		,[MBCOM].ProcessorFeeEUR_I2
		,[MBCOM].SetupFeeEUR_I2
		,[MBCOM].SchemeFeeEUR_I2
		,[MBCOM].OCTMCSendEUR_I2
		,[MBCOM].Band1EUR_I2
		,[MBCOM].Band2EUR_I2
		,[MBCOM].Band3EUR_I2
		,[MBCOM].TmvGBP
		,[MBCOM].AtvGBP
		,[MBCOM].MtvGBP
		,[MBCOM].TcrGBP
		,[MBCOM].GexGBP
		,[MBCOM].MDRRateGBP
		,[MBCOM].CreditGBP
		,[MBCOM].DebitGBP
		,[MBCOM].PerDeclineGBP
		,[MBCOM].PerRefundGBP
		,[MBCOM].ChargebackGBP
		,[MBCOM].WireTransferFeeGBP
		,[MBCOM].MinimumTransactionFeeGBP
		,[MBCOM].MinimumSettlementFeeGBP
		,[MBCOM].AnnualRenewalFeeGBP
		,[MBCOM].MinimumWeeklyFeeGBP
		,[MBCOM].RollingReserveGBP
		,[MBCOM].RollingReserveMonthsGBP
		,[MBCOM].FXRateGBP
		,[MBCOM].GatewayProcessingFeeGBP
		,[MBCOM].ProcessorFeeGBP
		,[MBCOM].SetupFeeGBP
		,[MBCOM].SchemeFeeGBP
		,[MBCOM].OCTMCSendGBP
		,[MBCOM].Band1GBP
		,[MBCOM].Band2GBP
		,[MBCOM].Band3GBP
		,[MBCOM].TmvGBP_I1
		,[MBCOM].AtvGBP_I1
		,[MBCOM].MtvGBP_I1
		,[MBCOM].TcrGBP_I1
		,[MBCOM].GexGBP_I1
		,[MBCOM].MDRRateGBP_I1
		,[MBCOM].CreditGBP_I1
		,[MBCOM].DebitGBP_I1
		,[MBCOM].PerDeclineGBP_I1
		,[MBCOM].PerRefundGBP_I1
		,[MBCOM].ChargebackGBP_I1
		,[MBCOM].WireTransferFeeGBP_I1
		,[MBCOM].MinimumTransactionFeeGBP_I1
		,[MBCOM].MinimumSettlementFeeGBP_I1
		,[MBCOM].AnnualRenewalFeeGBP_I1
		,[MBCOM].MinimumWeeklyFeeGBP_I1
		,[MBCOM].RollingReserveGBP_I1
		,[MBCOM].RollingReserveMonthsGBP_I1
		,[MBCOM].FXRateGBP_I1
		,[MBCOM].GatewayProcessingFeeGBP_I1
		,[MBCOM].ProcessorFeeGBP_I1
		,[MBCOM].SetupFeeGBP_I1
		,[MBCOM].SchemeFeeGBP_I1
		,[MBCOM].OCTMCSendGBP_I1
		,[MBCOM].Band1GBP_I1
		,[MBCOM].Band2GBP_I1
		,[MBCOM].Band3GBP_I1
		,[MBCOM].TmvGBP_I2
		,[MBCOM].AtvGBP_I2
		,[MBCOM].MtvGBP_I2
		,[MBCOM].TcrGBP_I2
		,[MBCOM].GexGBP_I2
		,[MBCOM].MDRRateGBP_I2
		,[MBCOM].CreditGBP_I2
		,[MBCOM].DebitGBP_I2
		,[MBCOM].PerDeclineGBP_I2
		,[MBCOM].PerRefundGBP_I2
		,[MBCOM].ChargebackGBP_I2
		,[MBCOM].WireTransferFeeGBP_I2
		,[MBCOM].MinimumTransactionFeeGBP_I2
		,[MBCOM].MinimumSettlementFeeGBP_I2
		,[MBCOM].AnnualRenewalFeeGBP_I2
		,[MBCOM].MinimumWeeklyFeeGBP_I2
		,[MBCOM].RollingReserveGBP_I2
		,[MBCOM].RollingReserveMonthsGBP_I2
		,[MBCOM].FXRateGBP_I2
		,[MBCOM].GatewayProcessingFeeGBP_I2
		,[MBCOM].ProcessorFeeGBP_I2
		,[MBCOM].SetupFeeGBP_I2
		,[MBCOM].SchemeFeeGBP_I2
		,[MBCOM].OCTMCSendGBP_I2
		,[MBCOM].Band1GBP_I2
		,[MBCOM].Band2GBP_I2
		,[MBCOM].Band3GBP_I2
		,[MBCOM].TmvUSD
		,[MBCOM].AtvUSD
		,[MBCOM].MtvUSD
		,[MBCOM].TcrUSD
		,[MBCOM].GexUSD
		,[MBCOM].MDRRateUSD
		,[MBCOM].CreditUSD
		,[MBCOM].DebitUSD
		,[MBCOM].PerDeclineUSD
		,[MBCOM].PerRefundUSD
		,[MBCOM].ChargebackUSD
		,[MBCOM].WireTransferFeeUSD
		,[MBCOM].MinimumTransactionFeeUSD
		,[MBCOM].MinimumSettlementFeeUSD
		,[MBCOM].AnnualRenewalFeeUSD
		,[MBCOM].MinimumWeeklyFeeUSD
		,[MBCOM].RollingReserveUSD
		,[MBCOM].RollingReserveMonthsUSD
		,[MBCOM].FXRateUSD
		,[MBCOM].GatewayProcessingFeeUSD
		,[MBCOM].ProcessorFeeUSD
		,[MBCOM].SetupFeeUSD
		,[MBCOM].SchemeFeeUSD
		,[MBCOM].OCTMCSendUSD
		,[MBCOM].Band1USD
		,[MBCOM].Band2USD
		,[MBCOM].Band3USD
		,[MBCOM].TmvUSD_I1
		,[MBCOM].AtvUSD_I1
		,[MBCOM].MtvUSD_I1
		,[MBCOM].TcrUSD_I1
		,[MBCOM].GexUSD_I1
		,[MBCOM].MDRRateUSD_I1
		,[MBCOM].CreditUSD_I1
		,[MBCOM].DebitUSD_I1
		,[MBCOM].PerDeclineUSD_I1
		,[MBCOM].PerRefundUSD_I1
		,[MBCOM].ChargebackUSD_I1
		,[MBCOM].WireTransferFeeUSD_I1
		,[MBCOM].MinimumTransactionFeeUSD_I1
		,[MBCOM].MinimumSettlementFeeUSD_I1
		,[MBCOM].AnnualRenewalFeeUSD_I1
		,[MBCOM].MinimumWeeklyFeeUSD_I1
		,[MBCOM].RollingReserveUSD_I1
		,[MBCOM].RollingReserveMonthsUSD_I1
		,[MBCOM].FXRateUSD_I1
		,[MBCOM].GatewayProcessingFeeUSD_I1
		,[MBCOM].ProcessorFeeUSD_I1
		,[MBCOM].SetupFeeUSD_I1
		,[MBCOM].SchemeFeeUSD_I1
		,[MBCOM].OCTMCSendUSD_I1
		,[MBCOM].Band1USD_I1
		,[MBCOM].Band2USD_I1
		,[MBCOM].Band3USD_I1
		,[MBCOM].TmvUSD_I2
		,[MBCOM].AtvUSD_I2
		,[MBCOM].MtvUSD_I2
		,[MBCOM].TcrUSD_I2
		,[MBCOM].GexUSD_I2
		,[MBCOM].MDRRateUSD_I2
		,[MBCOM].CreditUSD_I2
		,[MBCOM].DebitUSD_I2
		,[MBCOM].PerDeclineUSD_I2
		,[MBCOM].PerRefundUSD_I2
		,[MBCOM].ChargebackUSD_I2
		,[MBCOM].WireTransferFeeUSD_I2
		,[MBCOM].MinimumTransactionFeeUSD_I2
		,[MBCOM].MinimumSettlementFeeUSD_I2
		,[MBCOM].AnnualRenewalFeeUSD_I2
		,[MBCOM].MinimumWeeklyFeeUSD_I2
		,[MBCOM].RollingReserveUSD_I2
		,[MBCOM].RollingReserveMonthsUSD_I2
		,[MBCOM].FXRateUSD_I2
		,[MBCOM].GatewayProcessingFeeUSD_I2
		,[MBCOM].ProcessorFeeUSD_I2
		,[MBCOM].SetupFeeUSD_I2
		,[MBCOM].SchemeFeeUSD_I2
		,[MBCOM].OCTMCSendUSD_I2
		,[MBCOM].Band1USD_I2
		,[MBCOM].Band2USD_I2
		,[MBCOM].Band3USD_I2
		,[MBCOM].TmvAUD
		,[MBCOM].AtvAUD
		,[MBCOM].MtvAUD
		,[MBCOM].TcrAUD
		,[MBCOM].GexAUD
		,[MBCOM].MDRRateAUD
		,[MBCOM].CreditAUD
		,[MBCOM].DebitAUD
		,[MBCOM].PerDeclineAUD
		,[MBCOM].PerRefundAUD
		,[MBCOM].ChargebackAUD
		,[MBCOM].WireTransferFeeAUD
		,[MBCOM].MinimumTransactionFeeAUD
		,[MBCOM].MinimumSettlementFeeAUD
		,[MBCOM].AnnualRenewalFeeAUD
		,[MBCOM].MinimumWeeklyFeeAUD
		,[MBCOM].RollingReserveAUD
		,[MBCOM].RollingReserveMonthsAUD
		,[MBCOM].FXRateAUD
		,[MBCOM].GatewayProcessingFeeAUD
		,[MBCOM].ProcessorFeeAUD
		,[MBCOM].SetupFeeAUD
		,[MBCOM].SchemeFeeAUD
		,[MBCOM].OCTMCSendAUD
		,[MBCOM].Band1AUD
		,[MBCOM].Band2AUD
		,[MBCOM].Band3AUD
		,[MBCOM].TmvAUD_I1
		,[MBCOM].AtvAUD_I1
		,[MBCOM].MtvAUD_I1
		,[MBCOM].TcrAUD_I1
		,[MBCOM].GexAUD_I1
		,[MBCOM].MDRRateAUD_I1
		,[MBCOM].CreditAUD_I1
		,[MBCOM].DebitAUD_I1
		,[MBCOM].PerDeclineAUD_I1
		,[MBCOM].PerRefundAUD_I1
		,[MBCOM].ChargebackAUD_I1
		,[MBCOM].WireTransferFeeAUD_I1
		,[MBCOM].MinimumTransactionFeeAUD_I1
		,[MBCOM].MinimumSettlementFeeAUD_I1
		,[MBCOM].AnnualRenewalFeeAUD_I1
		,[MBCOM].MinimumWeeklyFeeAUD_I1
		,[MBCOM].RollingReserveAUD_I1
		,[MBCOM].RollingReserveMonthsAUD_I1
		,[MBCOM].FXRateAUD_I1
		,[MBCOM].GatewayProcessingFeeAUD_I1
		,[MBCOM].ProcessorFeeAUD_I1
		,[MBCOM].SetupFeeAUD_I1
		,[MBCOM].SchemeFeeAUD_I1
		,[MBCOM].OCTMCSendAUD_I1
		,[MBCOM].Band1AUD_I1
		,[MBCOM].Band2AUD_I1
		,[MBCOM].Band3AUD_I1
		,[MBCOM].TmvAUD_I2
		,[MBCOM].AtvAUD_I2
		,[MBCOM].MtvAUD_I2
		,[MBCOM].TcrAUD_I2
		,[MBCOM].GexAUD_I2
		,[MBCOM].MDRRateAUD_I2
		,[MBCOM].CreditAUD_I2
		,[MBCOM].DebitAUD_I2
		,[MBCOM].PerDeclineAUD_I2
		,[MBCOM].PerRefundAUD_I2
		,[MBCOM].ChargebackAUD_I2
		,[MBCOM].WireTransferFeeAUD_I2
		,[MBCOM].MinimumTransactionFeeAUD_I2
		,[MBCOM].MinimumSettlementFeeAUD_I2
		,[MBCOM].AnnualRenewalFeeAUD_I2
		,[MBCOM].MinimumWeeklyFeeAUD_I2
		,[MBCOM].RollingReserveAUD_I2
		,[MBCOM].RollingReserveMonthsAUD_I2
		,[MBCOM].FXRateAUD_I2
		,[MBCOM].GatewayProcessingFeeAUD_I2
		,[MBCOM].ProcessorFeeAUD_I2
		,[MBCOM].SetupFeeAUD_I2
		,[MBCOM].SchemeFeeAUD_I2
		,[MBCOM].OCTMCSendAUD_I2
		,[MBCOM].Band1AUD_I2
		,[MBCOM].Band2AUD_I2
		,[MBCOM].Band3AUD_I2
		,[MBCOM].TmvNOK
		,[MBCOM].AtvNOK
		,[MBCOM].MtvNOK
		,[MBCOM].TcrNOK
		,[MBCOM].GexNOK
		,[MBCOM].MDRRateNOK
		,[MBCOM].CreditNOK
		,[MBCOM].DebitNOK
		,[MBCOM].PerDeclineNOK
		,[MBCOM].PerRefundNOK
		,[MBCOM].ChargebackNOK
		,[MBCOM].WireTransferFeeNOK
		,[MBCOM].MinimumTransactionFeeNOK
		,[MBCOM].MinimumSettlementFeeNOK
		,[MBCOM].AnnualRenewalFeeNOK
		,[MBCOM].MinimumWeeklyFeeNOK
		,[MBCOM].RollingReserveNOK
		,[MBCOM].RollingReserveMonthsNOK
		,[MBCOM].FXRateNOK
		,[MBCOM].GatewayProcessingFeeNOK
		,[MBCOM].ProcessorFeeNOK
		,[MBCOM].SetupFeeNOK
		,[MBCOM].SchemeFeeNOK
		,[MBCOM].OCTMCSendNOK
		,[MBCOM].Band1NOK
		,[MBCOM].Band2NOK
		,[MBCOM].Band3NOK
		,[MBCOM].TmvNOK_I1
		,[MBCOM].AtvNOK_I1
		,[MBCOM].MtvNOK_I1
		,[MBCOM].TcrNOK_I1
		,[MBCOM].GexNOK_I1
		,[MBCOM].MDRRateNOK_I1
		,[MBCOM].CreditNOK_I1
		,[MBCOM].DebitNOK_I1
		,[MBCOM].PerDeclineNOK_I1
		,[MBCOM].PerRefundNOK_I1
		,[MBCOM].ChargebackNOK_I1
		,[MBCOM].WireTransferFeeNOK_I1
		,[MBCOM].MinimumTransactionFeeNOK_I1
		,[MBCOM].MinimumSettlementFeeNOK_I1
		,[MBCOM].AnnualRenewalFeeNOK_I1
		,[MBCOM].MinimumWeeklyFeeNOK_I1
		,[MBCOM].RollingReserveNOK_I1
		,[MBCOM].RollingReserveMonthsNOK_I1
		,[MBCOM].FXRateNOK_I1
		,[MBCOM].GatewayProcessingFeeNOK_I1
		,[MBCOM].ProcessorFeeNOK_I1
		,[MBCOM].SetupFeeNOK_I1
		,[MBCOM].SchemeFeeNOK_I1
		,[MBCOM].OCTMCSendNOK_I1
		,[MBCOM].Band1NOK_I1
		,[MBCOM].Band2NOK_I1
		,[MBCOM].Band3NOK_I1
		,[MBCOM].TmvNOK_I2
		,[MBCOM].AtvNOK_I2
		,[MBCOM].MtvNOK_I2
		,[MBCOM].TcrNOK_I2
		,[MBCOM].GexNOK_I2
		,[MBCOM].MDRRateNOK_I2
		,[MBCOM].CreditNOK_I2
		,[MBCOM].DebitNOK_I2
		,[MBCOM].PerDeclineNOK_I2
		,[MBCOM].PerRefundNOK_I2
		,[MBCOM].ChargebackNOK_I2
		,[MBCOM].WireTransferFeeNOK_I2
		,[MBCOM].MinimumTransactionFeeNOK_I2
		,[MBCOM].MinimumSettlementFeeNOK_I2
		,[MBCOM].AnnualRenewalFeeNOK_I2
		,[MBCOM].MinimumWeeklyFeeNOK_I2
		,[MBCOM].RollingReserveNOK_I2
		,[MBCOM].RollingReserveMonthsNOK_I2
		,[MBCOM].FXRateNOK_I2
		,[MBCOM].GatewayProcessingFeeNOK_I2
		,[MBCOM].ProcessorFeeNOK_I2
		,[MBCOM].SetupFeeNOK_I2
		,[MBCOM].SchemeFeeNOK_I2
		,[MBCOM].OCTMCSendNOK_I2
		,[MBCOM].Band1NOK_I2
		,[MBCOM].Band2NOK_I2
		,[MBCOM].Band3NOK_I2
		,[MBCOM].Introducer1Id, [I1].NameSurname AS Introducer1NameSurname
		,[MBCOM].Introducer2Id, [I2].NameSurname AS Introducer2NameSurname
	    ,[MBCOM].DateCreated
	    ,[MBCOM].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_Commercials [MBCOM]
		LEFT JOIN MerchantBoarding [MB] ON [MB].Id = [MBCOM].MBId
		LEFT JOIN Introducer [I1] ON [I1].Id = [MBCOM].Introducer1Id
		LEFT JOIN Introducer [I2] ON [I2].Id = [MBCOM].Introducer2Id
		LEFT JOIN [User] [U] ON [U].Id = [MBCOM].MBId 
	WHERE  [MBCOM].Id = @Id
	AND [MBCOM].MBId = [MB].Id
	AND [MBCOM].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[MB_COMMERCIALS_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_COMMERCIALS_GETALL]
AS
BEGIN
		SELECT 
		 [MBCOM].Id
		,[MBCOM].MBId, [MB].LegalName AS MB_LegalName
		,[MBCOM].IsTrafficAvailable
		,[MBCOM].WhenVolumesRampUp	
		,[MBCOM].TmvEUR
		,[MBCOM].AtvEUR
		,[MBCOM].MtvEUR
		,[MBCOM].TcrEUR
		,[MBCOM].GexEUR
		,[MBCOM].MDRRateEUR
		,[MBCOM].CreditEUR
		,[MBCOM].DebitEUR
		,[MBCOM].PerDeclineEUR
		,[MBCOM].PerRefundEUR
		,[MBCOM].ChargebackEUR
		,[MBCOM].WireTransferFeeEUR
		,[MBCOM].MinimumTransactionFeeEUR
		,[MBCOM].MinimumSettlementFeeEUR
		,[MBCOM].AnnualRenewalFeeEUR
		,[MBCOM].MinimumWeeklyFeeEUR
		,[MBCOM].RollingReserveEUR
		,[MBCOM].RollingReserveMonthsEUR
		,[MBCOM].FXRateEUR
		,[MBCOM].GatewayProcessingFeeEUR
		,[MBCOM].ProcessorFeeEUR
		,[MBCOM].SetupFeeEUR
		,[MBCOM].SchemeFeeEUR
		,[MBCOM].OCTMCSendEUR
		,[MBCOM].Band1EUR
		,[MBCOM].Band2EUR
		,[MBCOM].Band3EUR
		,[MBCOM].TmvEUR_I1
		,[MBCOM].AtvEUR_I1
		,[MBCOM].MtvEUR_I1
		,[MBCOM].TcrEUR_I1
		,[MBCOM].GexEUR_I1
		,[MBCOM].MDRRateEUR_I1
		,[MBCOM].CreditEUR_I1
		,[MBCOM].DebitEUR_I1
		,[MBCOM].PerDeclineEUR_I1
		,[MBCOM].PerRefundEUR_I1
		,[MBCOM].ChargebackEUR_I1
		,[MBCOM].WireTransferFeeEUR_I1
		,[MBCOM].MinimumTransactionFeeEUR_I1
		,[MBCOM].MinimumSettlementFeeEUR_I1
		,[MBCOM].AnnualRenewalFeeEUR_I1
		,[MBCOM].MinimumWeeklyFeeEUR_I1
		,[MBCOM].RollingReserveEUR_I1
		,[MBCOM].RollingReserveMonthsEUR_I1
		,[MBCOM].FXRateEUR_I1
		,[MBCOM].GatewayProcessingFeeEUR_I1
		,[MBCOM].ProcessorFeeEUR_I1
		,[MBCOM].SetupFeeEUR_I1
		,[MBCOM].SchemeFeeEUR_I1
		,[MBCOM].OCTMCSendEUR_I1
		,[MBCOM].Band1EUR_I1
		,[MBCOM].Band2EUR_I1
		,[MBCOM].Band3EUR_I1
		,[MBCOM].TmvEUR_I2
		,[MBCOM].AtvEUR_I2
		,[MBCOM].MtvEUR_I2
		,[MBCOM].TcrEUR_I2
		,[MBCOM].GexEUR_I2
		,[MBCOM].MDRRateEUR_I2
		,[MBCOM].CreditEUR_I2
		,[MBCOM].DebitEUR_I2
		,[MBCOM].PerDeclineEUR_I2
		,[MBCOM].PerRefundEUR_I2
		,[MBCOM].ChargebackEUR_I2
		,[MBCOM].WireTransferFeeEUR_I2
		,[MBCOM].MinimumTransactionFeeEUR_I2
		,[MBCOM].MinimumSettlementFeeEUR_I2
		,[MBCOM].AnnualRenewalFeeEUR_I2
		,[MBCOM].MinimumWeeklyFeeEUR_I2
		,[MBCOM].RollingReserveEUR_I2
		,[MBCOM].RollingReserveMonthsEUR_I2
		,[MBCOM].FXRateEUR_I2
		,[MBCOM].GatewayProcessingFeeEUR_I2
		,[MBCOM].ProcessorFeeEUR_I2
		,[MBCOM].SetupFeeEUR_I2
		,[MBCOM].SchemeFeeEUR_I2
		,[MBCOM].OCTMCSendEUR_I2
		,[MBCOM].Band1EUR_I2
		,[MBCOM].Band2EUR_I2
		,[MBCOM].Band3EUR_I2
		,[MBCOM].TmvGBP
		,[MBCOM].AtvGBP
		,[MBCOM].MtvGBP
		,[MBCOM].TcrGBP
		,[MBCOM].GexGBP
		,[MBCOM].MDRRateGBP
		,[MBCOM].CreditGBP
		,[MBCOM].DebitGBP
		,[MBCOM].PerDeclineGBP
		,[MBCOM].PerRefundGBP
		,[MBCOM].ChargebackGBP
		,[MBCOM].WireTransferFeeGBP
		,[MBCOM].MinimumTransactionFeeGBP
		,[MBCOM].MinimumSettlementFeeGBP
		,[MBCOM].AnnualRenewalFeeGBP
		,[MBCOM].MinimumWeeklyFeeGBP
		,[MBCOM].RollingReserveGBP
		,[MBCOM].RollingReserveMonthsGBP
		,[MBCOM].FXRateGBP
		,[MBCOM].GatewayProcessingFeeGBP
		,[MBCOM].ProcessorFeeGBP
		,[MBCOM].SetupFeeGBP
		,[MBCOM].SchemeFeeGBP
		,[MBCOM].OCTMCSendGBP
		,[MBCOM].Band1GBP
		,[MBCOM].Band2GBP
		,[MBCOM].Band3GBP
		,[MBCOM].TmvGBP_I1
		,[MBCOM].AtvGBP_I1
		,[MBCOM].MtvGBP_I1
		,[MBCOM].TcrGBP_I1
		,[MBCOM].GexGBP_I1
		,[MBCOM].MDRRateGBP_I1
		,[MBCOM].CreditGBP_I1
		,[MBCOM].DebitGBP_I1
		,[MBCOM].PerDeclineGBP_I1
		,[MBCOM].PerRefundGBP_I1
		,[MBCOM].ChargebackGBP_I1
		,[MBCOM].WireTransferFeeGBP_I1
		,[MBCOM].MinimumTransactionFeeGBP_I1
		,[MBCOM].MinimumSettlementFeeGBP_I1
		,[MBCOM].AnnualRenewalFeeGBP_I1
		,[MBCOM].MinimumWeeklyFeeGBP_I1
		,[MBCOM].RollingReserveGBP_I1
		,[MBCOM].RollingReserveMonthsGBP_I1
		,[MBCOM].FXRateGBP_I1
		,[MBCOM].GatewayProcessingFeeGBP_I1
		,[MBCOM].ProcessorFeeGBP_I1
		,[MBCOM].SetupFeeGBP_I1
		,[MBCOM].SchemeFeeGBP_I1
		,[MBCOM].OCTMCSendGBP_I1
		,[MBCOM].Band1GBP_I1
		,[MBCOM].Band2GBP_I1
		,[MBCOM].Band3GBP_I1
		,[MBCOM].TmvGBP_I2
		,[MBCOM].AtvGBP_I2
		,[MBCOM].MtvGBP_I2
		,[MBCOM].TcrGBP_I2
		,[MBCOM].GexGBP_I2
		,[MBCOM].MDRRateGBP_I2
		,[MBCOM].CreditGBP_I2
		,[MBCOM].DebitGBP_I2
		,[MBCOM].PerDeclineGBP_I2
		,[MBCOM].PerRefundGBP_I2
		,[MBCOM].ChargebackGBP_I2
		,[MBCOM].WireTransferFeeGBP_I2
		,[MBCOM].MinimumTransactionFeeGBP_I2
		,[MBCOM].MinimumSettlementFeeGBP_I2
		,[MBCOM].AnnualRenewalFeeGBP_I2
		,[MBCOM].MinimumWeeklyFeeGBP_I2
		,[MBCOM].RollingReserveGBP_I2
		,[MBCOM].RollingReserveMonthsGBP_I2
		,[MBCOM].FXRateGBP_I2
		,[MBCOM].GatewayProcessingFeeGBP_I2
		,[MBCOM].ProcessorFeeGBP_I2
		,[MBCOM].SetupFeeGBP_I2
		,[MBCOM].SchemeFeeGBP_I2
		,[MBCOM].OCTMCSendGBP_I2
		,[MBCOM].Band1GBP_I2
		,[MBCOM].Band2GBP_I2
		,[MBCOM].Band3GBP_I2
		,[MBCOM].TmvUSD
		,[MBCOM].AtvUSD
		,[MBCOM].MtvUSD
		,[MBCOM].TcrUSD
		,[MBCOM].GexUSD
		,[MBCOM].MDRRateUSD
		,[MBCOM].CreditUSD
		,[MBCOM].DebitUSD
		,[MBCOM].PerDeclineUSD
		,[MBCOM].PerRefundUSD
		,[MBCOM].ChargebackUSD
		,[MBCOM].WireTransferFeeUSD
		,[MBCOM].MinimumTransactionFeeUSD
		,[MBCOM].MinimumSettlementFeeUSD
		,[MBCOM].AnnualRenewalFeeUSD
		,[MBCOM].MinimumWeeklyFeeUSD
		,[MBCOM].RollingReserveUSD
		,[MBCOM].RollingReserveMonthsUSD
		,[MBCOM].FXRateUSD
		,[MBCOM].GatewayProcessingFeeUSD
		,[MBCOM].ProcessorFeeUSD
		,[MBCOM].SetupFeeUSD
		,[MBCOM].SchemeFeeUSD
		,[MBCOM].OCTMCSendUSD
		,[MBCOM].Band1USD
		,[MBCOM].Band2USD
		,[MBCOM].Band3USD
		,[MBCOM].TmvUSD_I1
		,[MBCOM].AtvUSD_I1
		,[MBCOM].MtvUSD_I1
		,[MBCOM].TcrUSD_I1
		,[MBCOM].GexUSD_I1
		,[MBCOM].MDRRateUSD_I1
		,[MBCOM].CreditUSD_I1
		,[MBCOM].DebitUSD_I1
		,[MBCOM].PerDeclineUSD_I1
		,[MBCOM].PerRefundUSD_I1
		,[MBCOM].ChargebackUSD_I1
		,[MBCOM].WireTransferFeeUSD_I1
		,[MBCOM].MinimumTransactionFeeUSD_I1
		,[MBCOM].MinimumSettlementFeeUSD_I1
		,[MBCOM].AnnualRenewalFeeUSD_I1
		,[MBCOM].MinimumWeeklyFeeUSD_I1
		,[MBCOM].RollingReserveUSD_I1
		,[MBCOM].RollingReserveMonthsUSD_I1
		,[MBCOM].FXRateUSD_I1
		,[MBCOM].GatewayProcessingFeeUSD_I1
		,[MBCOM].ProcessorFeeUSD_I1
		,[MBCOM].SetupFeeUSD_I1
		,[MBCOM].SchemeFeeUSD_I1
		,[MBCOM].OCTMCSendUSD_I1
		,[MBCOM].Band1USD_I1
		,[MBCOM].Band2USD_I1
		,[MBCOM].Band3USD_I1
		,[MBCOM].TmvUSD_I2
		,[MBCOM].AtvUSD_I2
		,[MBCOM].MtvUSD_I2
		,[MBCOM].TcrUSD_I2
		,[MBCOM].GexUSD_I2
		,[MBCOM].MDRRateUSD_I2
		,[MBCOM].CreditUSD_I2
		,[MBCOM].DebitUSD_I2
		,[MBCOM].PerDeclineUSD_I2
		,[MBCOM].PerRefundUSD_I2
		,[MBCOM].ChargebackUSD_I2
		,[MBCOM].WireTransferFeeUSD_I2
		,[MBCOM].MinimumTransactionFeeUSD_I2
		,[MBCOM].MinimumSettlementFeeUSD_I2
		,[MBCOM].AnnualRenewalFeeUSD_I2
		,[MBCOM].MinimumWeeklyFeeUSD_I2
		,[MBCOM].RollingReserveUSD_I2
		,[MBCOM].RollingReserveMonthsUSD_I2
		,[MBCOM].FXRateUSD_I2
		,[MBCOM].GatewayProcessingFeeUSD_I2
		,[MBCOM].ProcessorFeeUSD_I2
		,[MBCOM].SetupFeeUSD_I2
		,[MBCOM].SchemeFeeUSD_I2
		,[MBCOM].OCTMCSendUSD_I2
		,[MBCOM].Band1USD_I2
		,[MBCOM].Band2USD_I2
		,[MBCOM].Band3USD_I2
		,[MBCOM].TmvAUD
		,[MBCOM].AtvAUD
		,[MBCOM].MtvAUD
		,[MBCOM].TcrAUD
		,[MBCOM].GexAUD
		,[MBCOM].MDRRateAUD
		,[MBCOM].CreditAUD
		,[MBCOM].DebitAUD
		,[MBCOM].PerDeclineAUD
		,[MBCOM].PerRefundAUD
		,[MBCOM].ChargebackAUD
		,[MBCOM].WireTransferFeeAUD
		,[MBCOM].MinimumTransactionFeeAUD
		,[MBCOM].MinimumSettlementFeeAUD
		,[MBCOM].AnnualRenewalFeeAUD
		,[MBCOM].MinimumWeeklyFeeAUD
		,[MBCOM].RollingReserveAUD
		,[MBCOM].RollingReserveMonthsAUD
		,[MBCOM].FXRateAUD
		,[MBCOM].GatewayProcessingFeeAUD
		,[MBCOM].ProcessorFeeAUD
		,[MBCOM].SetupFeeAUD
		,[MBCOM].SchemeFeeAUD
		,[MBCOM].OCTMCSendAUD
		,[MBCOM].Band1AUD
		,[MBCOM].Band2AUD
		,[MBCOM].Band3AUD
		,[MBCOM].TmvAUD_I1
		,[MBCOM].AtvAUD_I1
		,[MBCOM].MtvAUD_I1
		,[MBCOM].TcrAUD_I1
		,[MBCOM].GexAUD_I1
		,[MBCOM].MDRRateAUD_I1
		,[MBCOM].CreditAUD_I1
		,[MBCOM].DebitAUD_I1
		,[MBCOM].PerDeclineAUD_I1
		,[MBCOM].PerRefundAUD_I1
		,[MBCOM].ChargebackAUD_I1
		,[MBCOM].WireTransferFeeAUD_I1
		,[MBCOM].MinimumTransactionFeeAUD_I1
		,[MBCOM].MinimumSettlementFeeAUD_I1
		,[MBCOM].AnnualRenewalFeeAUD_I1
		,[MBCOM].MinimumWeeklyFeeAUD_I1
		,[MBCOM].RollingReserveAUD_I1
		,[MBCOM].RollingReserveMonthsAUD_I1
		,[MBCOM].FXRateAUD_I1
		,[MBCOM].GatewayProcessingFeeAUD_I1
		,[MBCOM].ProcessorFeeAUD_I1
		,[MBCOM].SetupFeeAUD_I1
		,[MBCOM].SchemeFeeAUD_I1
		,[MBCOM].OCTMCSendAUD_I1
		,[MBCOM].Band1AUD_I1
		,[MBCOM].Band2AUD_I1
		,[MBCOM].Band3AUD_I1
		,[MBCOM].TmvAUD_I2
		,[MBCOM].AtvAUD_I2
		,[MBCOM].MtvAUD_I2
		,[MBCOM].TcrAUD_I2
		,[MBCOM].GexAUD_I2
		,[MBCOM].MDRRateAUD_I2
		,[MBCOM].CreditAUD_I2
		,[MBCOM].DebitAUD_I2
		,[MBCOM].PerDeclineAUD_I2
		,[MBCOM].PerRefundAUD_I2
		,[MBCOM].ChargebackAUD_I2
		,[MBCOM].WireTransferFeeAUD_I2
		,[MBCOM].MinimumTransactionFeeAUD_I2
		,[MBCOM].MinimumSettlementFeeAUD_I2
		,[MBCOM].AnnualRenewalFeeAUD_I2
		,[MBCOM].MinimumWeeklyFeeAUD_I2
		,[MBCOM].RollingReserveAUD_I2
		,[MBCOM].RollingReserveMonthsAUD_I2
		,[MBCOM].FXRateAUD_I2
		,[MBCOM].GatewayProcessingFeeAUD_I2
		,[MBCOM].ProcessorFeeAUD_I2
		,[MBCOM].SetupFeeAUD_I2
		,[MBCOM].SchemeFeeAUD_I2
		,[MBCOM].OCTMCSendAUD_I2
		,[MBCOM].Band1AUD_I2
		,[MBCOM].Band2AUD_I2
		,[MBCOM].Band3AUD_I2
		,[MBCOM].TmvNOK
		,[MBCOM].AtvNOK
		,[MBCOM].MtvNOK
		,[MBCOM].TcrNOK
		,[MBCOM].GexNOK
		,[MBCOM].MDRRateNOK
		,[MBCOM].CreditNOK
		,[MBCOM].DebitNOK
		,[MBCOM].PerDeclineNOK
		,[MBCOM].PerRefundNOK
		,[MBCOM].ChargebackNOK
		,[MBCOM].WireTransferFeeNOK
		,[MBCOM].MinimumTransactionFeeNOK
		,[MBCOM].MinimumSettlementFeeNOK
		,[MBCOM].AnnualRenewalFeeNOK
		,[MBCOM].MinimumWeeklyFeeNOK
		,[MBCOM].RollingReserveNOK
		,[MBCOM].RollingReserveMonthsNOK
		,[MBCOM].FXRateNOK
		,[MBCOM].GatewayProcessingFeeNOK
		,[MBCOM].ProcessorFeeNOK
		,[MBCOM].SetupFeeNOK
		,[MBCOM].SchemeFeeNOK
		,[MBCOM].OCTMCSendNOK
		,[MBCOM].Band1NOK
		,[MBCOM].Band2NOK
		,[MBCOM].Band3NOK
		,[MBCOM].TmvNOK_I1
		,[MBCOM].AtvNOK_I1
		,[MBCOM].MtvNOK_I1
		,[MBCOM].TcrNOK_I1
		,[MBCOM].GexNOK_I1
		,[MBCOM].MDRRateNOK_I1
		,[MBCOM].CreditNOK_I1
		,[MBCOM].DebitNOK_I1
		,[MBCOM].PerDeclineNOK_I1
		,[MBCOM].PerRefundNOK_I1
		,[MBCOM].ChargebackNOK_I1
		,[MBCOM].WireTransferFeeNOK_I1
		,[MBCOM].MinimumTransactionFeeNOK_I1
		,[MBCOM].MinimumSettlementFeeNOK_I1
		,[MBCOM].AnnualRenewalFeeNOK_I1
		,[MBCOM].MinimumWeeklyFeeNOK_I1
		,[MBCOM].RollingReserveNOK_I1
		,[MBCOM].RollingReserveMonthsNOK_I1
		,[MBCOM].FXRateNOK_I1
		,[MBCOM].GatewayProcessingFeeNOK_I1
		,[MBCOM].ProcessorFeeNOK_I1
		,[MBCOM].SetupFeeNOK_I1
		,[MBCOM].SchemeFeeNOK_I1
		,[MBCOM].OCTMCSendNOK_I1
		,[MBCOM].Band1NOK_I1
		,[MBCOM].Band2NOK_I1
		,[MBCOM].Band3NOK_I1
		,[MBCOM].TmvNOK_I2
		,[MBCOM].AtvNOK_I2
		,[MBCOM].MtvNOK_I2
		,[MBCOM].TcrNOK_I2
		,[MBCOM].GexNOK_I2
		,[MBCOM].MDRRateNOK_I2
		,[MBCOM].CreditNOK_I2
		,[MBCOM].DebitNOK_I2
		,[MBCOM].PerDeclineNOK_I2
		,[MBCOM].PerRefundNOK_I2
		,[MBCOM].ChargebackNOK_I2
		,[MBCOM].WireTransferFeeNOK_I2
		,[MBCOM].MinimumTransactionFeeNOK_I2
		,[MBCOM].MinimumSettlementFeeNOK_I2
		,[MBCOM].AnnualRenewalFeeNOK_I2
		,[MBCOM].MinimumWeeklyFeeNOK_I2
		,[MBCOM].RollingReserveNOK_I2
		,[MBCOM].RollingReserveMonthsNOK_I2
		,[MBCOM].FXRateNOK_I2
		,[MBCOM].GatewayProcessingFeeNOK_I2
		,[MBCOM].ProcessorFeeNOK_I2
		,[MBCOM].SetupFeeNOK_I2
		,[MBCOM].SchemeFeeNOK_I2
		,[MBCOM].OCTMCSendNOK_I2
		,[MBCOM].Band1NOK_I2
		,[MBCOM].Band2NOK_I2
		,[MBCOM].Band3NOK_I2
		,[MBCOM].Introducer1Id, [I1].NameSurname AS Introducer1NameSurname
		,[MBCOM].Introducer2Id, [I2].NameSurname AS Introducer2NameSurname
	    ,[MBCOM].DateCreated
	    ,[MBCOM].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_Commercials [MBCOM]
		LEFT JOIN MerchantBoarding [MB] ON [MB].Id = [MBCOM].MBId
		LEFT JOIN Introducer [I1] ON [I1].Id = [MBCOM].Introducer1Id
		LEFT JOIN Introducer [I2] ON [I2].Id = [MBCOM].Introducer2Id
		LEFT JOIN [User] [U] ON [U].Id = [MBCOM].MBId 
	WHERE  
		[MBCOM].MBId = [MB].Id
	AND [MBCOM].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[MB_COMMERCIALS_GETBYMBID]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_COMMERCIALS_GETBYMBID]
@MBId INT
AS
BEGIN
	SELECT 
		 [MBCOM].Id
		,[MBCOM].MBId, [MB].LegalName AS MB_LegalName
		,[MBCOM].IsTrafficAvailable
		,[MBCOM].WhenVolumesRampUp	
		,[MBCOM].TmvEUR
		,[MBCOM].AtvEUR
		,[MBCOM].MtvEUR
		,[MBCOM].TcrEUR
		,[MBCOM].GexEUR
		,[MBCOM].MDRRateEUR
		,[MBCOM].CreditEUR
		,[MBCOM].DebitEUR
		,[MBCOM].PerDeclineEUR
		,[MBCOM].PerRefundEUR
		,[MBCOM].ChargebackEUR
		,[MBCOM].WireTransferFeeEUR
		,[MBCOM].MinimumTransactionFeeEUR
		,[MBCOM].MinimumSettlementFeeEUR
		,[MBCOM].AnnualRenewalFeeEUR
		,[MBCOM].MinimumWeeklyFeeEUR
		,[MBCOM].RollingReserveEUR
		,[MBCOM].RollingReserveMonthsEUR
		,[MBCOM].FXRateEUR
		,[MBCOM].GatewayProcessingFeeEUR
		,[MBCOM].ProcessorFeeEUR
		,[MBCOM].SetupFeeEUR
		,[MBCOM].SchemeFeeEUR
		,[MBCOM].OCTMCSendEUR
		,[MBCOM].Band1EUR
		,[MBCOM].Band2EUR
		,[MBCOM].Band3EUR
		,[MBCOM].TmvEUR_I1
		,[MBCOM].AtvEUR_I1
		,[MBCOM].MtvEUR_I1
		,[MBCOM].TcrEUR_I1
		,[MBCOM].GexEUR_I1
		,[MBCOM].MDRRateEUR_I1
		,[MBCOM].CreditEUR_I1
		,[MBCOM].DebitEUR_I1
		,[MBCOM].PerDeclineEUR_I1
		,[MBCOM].PerRefundEUR_I1
		,[MBCOM].ChargebackEUR_I1
		,[MBCOM].WireTransferFeeEUR_I1
		,[MBCOM].MinimumTransactionFeeEUR_I1
		,[MBCOM].MinimumSettlementFeeEUR_I1
		,[MBCOM].AnnualRenewalFeeEUR_I1
		,[MBCOM].MinimumWeeklyFeeEUR_I1
		,[MBCOM].RollingReserveEUR_I1
		,[MBCOM].RollingReserveMonthsEUR_I1
		,[MBCOM].FXRateEUR_I1
		,[MBCOM].GatewayProcessingFeeEUR_I1
		,[MBCOM].ProcessorFeeEUR_I1
		,[MBCOM].SetupFeeEUR_I1
		,[MBCOM].SchemeFeeEUR_I1
		,[MBCOM].OCTMCSendEUR_I1
		,[MBCOM].Band1EUR_I1
		,[MBCOM].Band2EUR_I1
		,[MBCOM].Band3EUR_I1
		,[MBCOM].TmvEUR_I2
		,[MBCOM].AtvEUR_I2
		,[MBCOM].MtvEUR_I2
		,[MBCOM].TcrEUR_I2
		,[MBCOM].GexEUR_I2
		,[MBCOM].MDRRateEUR_I2
		,[MBCOM].CreditEUR_I2
		,[MBCOM].DebitEUR_I2
		,[MBCOM].PerDeclineEUR_I2
		,[MBCOM].PerRefundEUR_I2
		,[MBCOM].ChargebackEUR_I2
		,[MBCOM].WireTransferFeeEUR_I2
		,[MBCOM].MinimumTransactionFeeEUR_I2
		,[MBCOM].MinimumSettlementFeeEUR_I2
		,[MBCOM].AnnualRenewalFeeEUR_I2
		,[MBCOM].MinimumWeeklyFeeEUR_I2
		,[MBCOM].RollingReserveEUR_I2
		,[MBCOM].RollingReserveMonthsEUR_I2
		,[MBCOM].FXRateEUR_I2
		,[MBCOM].GatewayProcessingFeeEUR_I2
		,[MBCOM].ProcessorFeeEUR_I2
		,[MBCOM].SetupFeeEUR_I2
		,[MBCOM].SchemeFeeEUR_I2
		,[MBCOM].OCTMCSendEUR_I2
		,[MBCOM].Band1EUR_I2
		,[MBCOM].Band2EUR_I2
		,[MBCOM].Band3EUR_I2
		,[MBCOM].TmvGBP
		,[MBCOM].AtvGBP
		,[MBCOM].MtvGBP
		,[MBCOM].TcrGBP
		,[MBCOM].GexGBP
		,[MBCOM].MDRRateGBP
		,[MBCOM].CreditGBP
		,[MBCOM].DebitGBP
		,[MBCOM].PerDeclineGBP
		,[MBCOM].PerRefundGBP
		,[MBCOM].ChargebackGBP
		,[MBCOM].WireTransferFeeGBP
		,[MBCOM].MinimumTransactionFeeGBP
		,[MBCOM].MinimumSettlementFeeGBP
		,[MBCOM].AnnualRenewalFeeGBP
		,[MBCOM].MinimumWeeklyFeeGBP
		,[MBCOM].RollingReserveGBP
		,[MBCOM].RollingReserveMonthsGBP
		,[MBCOM].FXRateGBP
		,[MBCOM].GatewayProcessingFeeGBP
		,[MBCOM].ProcessorFeeGBP
		,[MBCOM].SetupFeeGBP
		,[MBCOM].SchemeFeeGBP
		,[MBCOM].OCTMCSendGBP
		,[MBCOM].Band1GBP
		,[MBCOM].Band2GBP
		,[MBCOM].Band3GBP
		,[MBCOM].TmvGBP_I1
		,[MBCOM].AtvGBP_I1
		,[MBCOM].MtvGBP_I1
		,[MBCOM].TcrGBP_I1
		,[MBCOM].GexGBP_I1
		,[MBCOM].MDRRateGBP_I1
		,[MBCOM].CreditGBP_I1
		,[MBCOM].DebitGBP_I1
		,[MBCOM].PerDeclineGBP_I1
		,[MBCOM].PerRefundGBP_I1
		,[MBCOM].ChargebackGBP_I1
		,[MBCOM].WireTransferFeeGBP_I1
		,[MBCOM].MinimumTransactionFeeGBP_I1
		,[MBCOM].MinimumSettlementFeeGBP_I1
		,[MBCOM].AnnualRenewalFeeGBP_I1
		,[MBCOM].MinimumWeeklyFeeGBP_I1
		,[MBCOM].RollingReserveGBP_I1
		,[MBCOM].RollingReserveMonthsGBP_I1
		,[MBCOM].FXRateGBP_I1
		,[MBCOM].GatewayProcessingFeeGBP_I1
		,[MBCOM].ProcessorFeeGBP_I1
		,[MBCOM].SetupFeeGBP_I1
		,[MBCOM].SchemeFeeGBP_I1
		,[MBCOM].OCTMCSendGBP_I1
		,[MBCOM].Band1GBP_I1
		,[MBCOM].Band2GBP_I1
		,[MBCOM].Band3GBP_I1
		,[MBCOM].TmvGBP_I2
		,[MBCOM].AtvGBP_I2
		,[MBCOM].MtvGBP_I2
		,[MBCOM].TcrGBP_I2
		,[MBCOM].GexGBP_I2
		,[MBCOM].MDRRateGBP_I2
		,[MBCOM].CreditGBP_I2
		,[MBCOM].DebitGBP_I2
		,[MBCOM].PerDeclineGBP_I2
		,[MBCOM].PerRefundGBP_I2
		,[MBCOM].ChargebackGBP_I2
		,[MBCOM].WireTransferFeeGBP_I2
		,[MBCOM].MinimumTransactionFeeGBP_I2
		,[MBCOM].MinimumSettlementFeeGBP_I2
		,[MBCOM].AnnualRenewalFeeGBP_I2
		,[MBCOM].MinimumWeeklyFeeGBP_I2
		,[MBCOM].RollingReserveGBP_I2
		,[MBCOM].RollingReserveMonthsGBP_I2
		,[MBCOM].FXRateGBP_I2
		,[MBCOM].GatewayProcessingFeeGBP_I2
		,[MBCOM].ProcessorFeeGBP_I2
		,[MBCOM].SetupFeeGBP_I2
		,[MBCOM].SchemeFeeGBP_I2
		,[MBCOM].OCTMCSendGBP_I2
		,[MBCOM].Band1GBP_I2
		,[MBCOM].Band2GBP_I2
		,[MBCOM].Band3GBP_I2
		,[MBCOM].TmvUSD
		,[MBCOM].AtvUSD
		,[MBCOM].MtvUSD
		,[MBCOM].TcrUSD
		,[MBCOM].GexUSD
		,[MBCOM].MDRRateUSD
		,[MBCOM].CreditUSD
		,[MBCOM].DebitUSD
		,[MBCOM].PerDeclineUSD
		,[MBCOM].PerRefundUSD
		,[MBCOM].ChargebackUSD
		,[MBCOM].WireTransferFeeUSD
		,[MBCOM].MinimumTransactionFeeUSD
		,[MBCOM].MinimumSettlementFeeUSD
		,[MBCOM].AnnualRenewalFeeUSD
		,[MBCOM].MinimumWeeklyFeeUSD
		,[MBCOM].RollingReserveUSD
		,[MBCOM].RollingReserveMonthsUSD
		,[MBCOM].FXRateUSD
		,[MBCOM].GatewayProcessingFeeUSD
		,[MBCOM].ProcessorFeeUSD
		,[MBCOM].SetupFeeUSD
		,[MBCOM].SchemeFeeUSD
		,[MBCOM].OCTMCSendUSD
		,[MBCOM].Band1USD
		,[MBCOM].Band2USD
		,[MBCOM].Band3USD
		,[MBCOM].TmvUSD_I1
		,[MBCOM].AtvUSD_I1
		,[MBCOM].MtvUSD_I1
		,[MBCOM].TcrUSD_I1
		,[MBCOM].GexUSD_I1
		,[MBCOM].MDRRateUSD_I1
		,[MBCOM].CreditUSD_I1
		,[MBCOM].DebitUSD_I1
		,[MBCOM].PerDeclineUSD_I1
		,[MBCOM].PerRefundUSD_I1
		,[MBCOM].ChargebackUSD_I1
		,[MBCOM].WireTransferFeeUSD_I1
		,[MBCOM].MinimumTransactionFeeUSD_I1
		,[MBCOM].MinimumSettlementFeeUSD_I1
		,[MBCOM].AnnualRenewalFeeUSD_I1
		,[MBCOM].MinimumWeeklyFeeUSD_I1
		,[MBCOM].RollingReserveUSD_I1
		,[MBCOM].RollingReserveMonthsUSD_I1
		,[MBCOM].FXRateUSD_I1
		,[MBCOM].GatewayProcessingFeeUSD_I1
		,[MBCOM].ProcessorFeeUSD_I1
		,[MBCOM].SetupFeeUSD_I1
		,[MBCOM].SchemeFeeUSD_I1
		,[MBCOM].OCTMCSendUSD_I1
		,[MBCOM].Band1USD_I1
		,[MBCOM].Band2USD_I1
		,[MBCOM].Band3USD_I1
		,[MBCOM].TmvUSD_I2
		,[MBCOM].AtvUSD_I2
		,[MBCOM].MtvUSD_I2
		,[MBCOM].TcrUSD_I2
		,[MBCOM].GexUSD_I2
		,[MBCOM].MDRRateUSD_I2
		,[MBCOM].CreditUSD_I2
		,[MBCOM].DebitUSD_I2
		,[MBCOM].PerDeclineUSD_I2
		,[MBCOM].PerRefundUSD_I2
		,[MBCOM].ChargebackUSD_I2
		,[MBCOM].WireTransferFeeUSD_I2
		,[MBCOM].MinimumTransactionFeeUSD_I2
		,[MBCOM].MinimumSettlementFeeUSD_I2
		,[MBCOM].AnnualRenewalFeeUSD_I2
		,[MBCOM].MinimumWeeklyFeeUSD_I2
		,[MBCOM].RollingReserveUSD_I2
		,[MBCOM].RollingReserveMonthsUSD_I2
		,[MBCOM].FXRateUSD_I2
		,[MBCOM].GatewayProcessingFeeUSD_I2
		,[MBCOM].ProcessorFeeUSD_I2
		,[MBCOM].SetupFeeUSD_I2
		,[MBCOM].SchemeFeeUSD_I2
		,[MBCOM].OCTMCSendUSD_I2
		,[MBCOM].Band1USD_I2
		,[MBCOM].Band2USD_I2
		,[MBCOM].Band3USD_I2
		,[MBCOM].TmvAUD
		,[MBCOM].AtvAUD
		,[MBCOM].MtvAUD
		,[MBCOM].TcrAUD
		,[MBCOM].GexAUD
		,[MBCOM].MDRRateAUD
		,[MBCOM].CreditAUD
		,[MBCOM].DebitAUD
		,[MBCOM].PerDeclineAUD
		,[MBCOM].PerRefundAUD
		,[MBCOM].ChargebackAUD
		,[MBCOM].WireTransferFeeAUD
		,[MBCOM].MinimumTransactionFeeAUD
		,[MBCOM].MinimumSettlementFeeAUD
		,[MBCOM].AnnualRenewalFeeAUD
		,[MBCOM].MinimumWeeklyFeeAUD
		,[MBCOM].RollingReserveAUD
		,[MBCOM].RollingReserveMonthsAUD
		,[MBCOM].FXRateAUD
		,[MBCOM].GatewayProcessingFeeAUD
		,[MBCOM].ProcessorFeeAUD
		,[MBCOM].SetupFeeAUD
		,[MBCOM].SchemeFeeAUD
		,[MBCOM].OCTMCSendAUD
		,[MBCOM].Band1AUD
		,[MBCOM].Band2AUD
		,[MBCOM].Band3AUD
		,[MBCOM].TmvAUD_I1
		,[MBCOM].AtvAUD_I1
		,[MBCOM].MtvAUD_I1
		,[MBCOM].TcrAUD_I1
		,[MBCOM].GexAUD_I1
		,[MBCOM].MDRRateAUD_I1
		,[MBCOM].CreditAUD_I1
		,[MBCOM].DebitAUD_I1
		,[MBCOM].PerDeclineAUD_I1
		,[MBCOM].PerRefundAUD_I1
		,[MBCOM].ChargebackAUD_I1
		,[MBCOM].WireTransferFeeAUD_I1
		,[MBCOM].MinimumTransactionFeeAUD_I1
		,[MBCOM].MinimumSettlementFeeAUD_I1
		,[MBCOM].AnnualRenewalFeeAUD_I1
		,[MBCOM].MinimumWeeklyFeeAUD_I1
		,[MBCOM].RollingReserveAUD_I1
		,[MBCOM].RollingReserveMonthsAUD_I1
		,[MBCOM].FXRateAUD_I1
		,[MBCOM].GatewayProcessingFeeAUD_I1
		,[MBCOM].ProcessorFeeAUD_I1
		,[MBCOM].SetupFeeAUD_I1
		,[MBCOM].SchemeFeeAUD_I1
		,[MBCOM].OCTMCSendAUD_I1
		,[MBCOM].Band1AUD_I1
		,[MBCOM].Band2AUD_I1
		,[MBCOM].Band3AUD_I1
		,[MBCOM].TmvAUD_I2
		,[MBCOM].AtvAUD_I2
		,[MBCOM].MtvAUD_I2
		,[MBCOM].TcrAUD_I2
		,[MBCOM].GexAUD_I2
		,[MBCOM].MDRRateAUD_I2
		,[MBCOM].CreditAUD_I2
		,[MBCOM].DebitAUD_I2
		,[MBCOM].PerDeclineAUD_I2
		,[MBCOM].PerRefundAUD_I2
		,[MBCOM].ChargebackAUD_I2
		,[MBCOM].WireTransferFeeAUD_I2
		,[MBCOM].MinimumTransactionFeeAUD_I2
		,[MBCOM].MinimumSettlementFeeAUD_I2
		,[MBCOM].AnnualRenewalFeeAUD_I2
		,[MBCOM].MinimumWeeklyFeeAUD_I2
		,[MBCOM].RollingReserveAUD_I2
		,[MBCOM].RollingReserveMonthsAUD_I2
		,[MBCOM].FXRateAUD_I2
		,[MBCOM].GatewayProcessingFeeAUD_I2
		,[MBCOM].ProcessorFeeAUD_I2
		,[MBCOM].SetupFeeAUD_I2
		,[MBCOM].SchemeFeeAUD_I2
		,[MBCOM].OCTMCSendAUD_I2
		,[MBCOM].Band1AUD_I2
		,[MBCOM].Band2AUD_I2
		,[MBCOM].Band3AUD_I2
		,[MBCOM].TmvNOK
		,[MBCOM].AtvNOK
		,[MBCOM].MtvNOK
		,[MBCOM].TcrNOK
		,[MBCOM].GexNOK
		,[MBCOM].MDRRateNOK
		,[MBCOM].CreditNOK
		,[MBCOM].DebitNOK
		,[MBCOM].PerDeclineNOK
		,[MBCOM].PerRefundNOK
		,[MBCOM].ChargebackNOK
		,[MBCOM].WireTransferFeeNOK
		,[MBCOM].MinimumTransactionFeeNOK
		,[MBCOM].MinimumSettlementFeeNOK
		,[MBCOM].AnnualRenewalFeeNOK
		,[MBCOM].MinimumWeeklyFeeNOK
		,[MBCOM].RollingReserveNOK
		,[MBCOM].RollingReserveMonthsNOK
		,[MBCOM].FXRateNOK
		,[MBCOM].GatewayProcessingFeeNOK
		,[MBCOM].ProcessorFeeNOK
		,[MBCOM].SetupFeeNOK
		,[MBCOM].SchemeFeeNOK
		,[MBCOM].OCTMCSendNOK
		,[MBCOM].Band1NOK
		,[MBCOM].Band2NOK
		,[MBCOM].Band3NOK
		,[MBCOM].TmvNOK_I1
		,[MBCOM].AtvNOK_I1
		,[MBCOM].MtvNOK_I1
		,[MBCOM].TcrNOK_I1
		,[MBCOM].GexNOK_I1
		,[MBCOM].MDRRateNOK_I1
		,[MBCOM].CreditNOK_I1
		,[MBCOM].DebitNOK_I1
		,[MBCOM].PerDeclineNOK_I1
		,[MBCOM].PerRefundNOK_I1
		,[MBCOM].ChargebackNOK_I1
		,[MBCOM].WireTransferFeeNOK_I1
		,[MBCOM].MinimumTransactionFeeNOK_I1
		,[MBCOM].MinimumSettlementFeeNOK_I1
		,[MBCOM].AnnualRenewalFeeNOK_I1
		,[MBCOM].MinimumWeeklyFeeNOK_I1
		,[MBCOM].RollingReserveNOK_I1
		,[MBCOM].RollingReserveMonthsNOK_I1
		,[MBCOM].FXRateNOK_I1
		,[MBCOM].GatewayProcessingFeeNOK_I1
		,[MBCOM].ProcessorFeeNOK_I1
		,[MBCOM].SetupFeeNOK_I1
		,[MBCOM].SchemeFeeNOK_I1
		,[MBCOM].OCTMCSendNOK_I1
		,[MBCOM].Band1NOK_I1
		,[MBCOM].Band2NOK_I1
		,[MBCOM].Band3NOK_I1
		,[MBCOM].TmvNOK_I2
		,[MBCOM].AtvNOK_I2
		,[MBCOM].MtvNOK_I2
		,[MBCOM].TcrNOK_I2
		,[MBCOM].GexNOK_I2
		,[MBCOM].MDRRateNOK_I2
		,[MBCOM].CreditNOK_I2
		,[MBCOM].DebitNOK_I2
		,[MBCOM].PerDeclineNOK_I2
		,[MBCOM].PerRefundNOK_I2
		,[MBCOM].ChargebackNOK_I2
		,[MBCOM].WireTransferFeeNOK_I2
		,[MBCOM].MinimumTransactionFeeNOK_I2
		,[MBCOM].MinimumSettlementFeeNOK_I2
		,[MBCOM].AnnualRenewalFeeNOK_I2
		,[MBCOM].MinimumWeeklyFeeNOK_I2
		,[MBCOM].RollingReserveNOK_I2
		,[MBCOM].RollingReserveMonthsNOK_I2
		,[MBCOM].FXRateNOK_I2
		,[MBCOM].GatewayProcessingFeeNOK_I2
		,[MBCOM].ProcessorFeeNOK_I2
		,[MBCOM].SetupFeeNOK_I2
		,[MBCOM].SchemeFeeNOK_I2
		,[MBCOM].OCTMCSendNOK_I2
		,[MBCOM].Band1NOK_I2
		,[MBCOM].Band2NOK_I2
		,[MBCOM].Band3NOK_I2
		,[MBCOM].Introducer1Id, [I1].NameSurname AS Introducer1NameSurname
		,[MBCOM].Introducer2Id, [I2].NameSurname AS Introducer2NameSurname
	    ,[MBCOM].DateCreated
	    ,[MBCOM].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_Commercials [MBCOM]
		LEFT JOIN MerchantBoarding [MB] ON [MB].Id = [MBCOM].MBId
		LEFT JOIN Introducer [I1] ON [I1].Id = [MBCOM].Introducer1Id
		LEFT JOIN Introducer [I2] ON [I2].Id = [MBCOM].Introducer2Id
		LEFT JOIN [User] [U] ON [U].Id = [MBCOM].MBId 
	WHERE  
	[MBCOM].MBId = @MBId
	AND [MBCOM].Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[MB_COMMERCIALS_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_COMMERCIALS_INSERT]

 @MBId	int	
,@IsTrafficAvailable	int	
,@WhenVolumesRampUp	datetime	
,@TmvEUR	decimal(18, 2)	
,@AtvEUR	decimal(18, 2)	
,@MtvEUR	decimal(18, 2)	
,@TcrEUR	decimal(18, 2)	
,@GexEUR	decimal(18, 2)	
,@MDRRateEUR	decimal(18, 2)	
,@CreditEUR	decimal(18, 2)	
,@DebitEUR	decimal(18, 2)	
,@PerDeclineEUR	decimal(18, 2)	
,@PerRefundEUR	decimal(18, 2)	
,@ChargebackEUR	decimal(18, 2)	
,@WireTransferFeeEUR	decimal(18, 2)	
,@MinimumTransactionFeeEUR	decimal(18, 2)	
,@MinimumSettlementFeeEUR	decimal(18, 2)	
,@AnnualRenewalFeeEUR	decimal(18, 2)	
,@MinimumWeeklyFeeEUR	decimal(18, 2)	
,@RollingReserveEUR	decimal(18, 2)	
,@RollingReserveMonthsEUR	int	
,@FXRateEUR	decimal(18, 2)	
,@GatewayProcessingFeeEUR	decimal(18, 2)	
,@ProcessorFeeEUR	decimal(18, 2)	
,@SetupFeeEUR	decimal(18, 2)	
,@SchemeFeeEUR	decimal(18, 2)	
,@OCTMCSendEUR	decimal(18, 2)	
,@Band1EUR	decimal(18, 2)	
,@Band2EUR	decimal(18, 2)	
,@Band3EUR	decimal(18, 2)	
,@TmvEUR_I1	decimal(18, 2)	
,@AtvEUR_I1	decimal(18, 2)	
,@MtvEUR_I1	decimal(18, 2)	
,@TcrEUR_I1	decimal(18, 2)	
,@GexEUR_I1	decimal(18, 2)	
,@MDRRateEUR_I1	decimal(18, 2)	
,@CreditEUR_I1	decimal(18, 2)	
,@DebitEUR_I1	decimal(18, 2)	
,@PerDeclineEUR_I1	decimal(18, 2)	
,@PerRefundEUR_I1	decimal(18, 2)	
,@ChargebackEUR_I1	decimal(18, 2)	
,@WireTransferFeeEUR_I1	decimal(18, 2)	
,@MinimumTransactionFeeEUR_I1	decimal(18, 2)	
,@MinimumSettlementFeeEUR_I1	decimal(18, 2)	
,@AnnualRenewalFeeEUR_I1	decimal(18, 2)	
,@MinimumWeeklyFeeEUR_I1	decimal(18, 2)	
,@RollingReserveEUR_I1	decimal(18, 2)	
,@RollingReserveMonthsEUR_I1	int	
,@FXRateEUR_I1	decimal(18, 2)	
,@GatewayProcessingFeeEUR_I1	decimal(18, 2)	
,@ProcessorFeeEUR_I1	decimal(18, 2)	
,@SetupFeeEUR_I1	decimal(18, 2)	
,@SchemeFeeEUR_I1	decimal(18, 2)	
,@OCTMCSendEUR_I1	decimal(18, 2)	
,@Band1EUR_I1	decimal(18, 2)	
,@Band2EUR_I1	decimal(18, 2)	
,@Band3EUR_I1	decimal(18, 2)	
,@TmvEUR_I2	decimal(18, 2)	
,@AtvEUR_I2	decimal(18, 2)	
,@MtvEUR_I2	decimal(18, 2)	
,@TcrEUR_I2	decimal(18, 2)	
,@GexEUR_I2	decimal(18, 2)	
,@MDRRateEUR_I2	decimal(18, 2)	
,@CreditEUR_I2	decimal(18, 2)	
,@DebitEUR_I2	decimal(18, 2)	
,@PerDeclineEUR_I2	decimal(18, 2)	
,@PerRefundEUR_I2	decimal(18, 2)	
,@ChargebackEUR_I2	decimal(18, 2)	
,@WireTransferFeeEUR_I2	decimal(18, 2)	
,@MinimumTransactionFeeEUR_I2	decimal(18, 2)	
,@MinimumSettlementFeeEUR_I2	decimal(18, 2)	
,@AnnualRenewalFeeEUR_I2	decimal(18, 2)	
,@MinimumWeeklyFeeEUR_I2	decimal(18, 2)	
,@RollingReserveEUR_I2	decimal(18, 2)	
,@RollingReserveMonthsEUR_I2	int	
,@FXRateEUR_I2	decimal(18, 2)	
,@GatewayProcessingFeeEUR_I2	decimal(18, 2)	
,@ProcessorFeeEUR_I2	decimal(18, 2)	
,@SetupFeeEUR_I2	decimal(18, 2)	
,@SchemeFeeEUR_I2	decimal(18, 2)	
,@OCTMCSendEUR_I2	decimal(18, 2)	
,@Band1EUR_I2	decimal(18, 2)	
,@Band2EUR_I2	decimal(18, 2)	
,@Band3EUR_I2	decimal(18, 2)	

,@TmvGBP	decimal(18, 2)	
,@AtvGBP	decimal(18, 2)	
,@MtvGBP	decimal(18, 2)	
,@TcrGBP	decimal(18, 2)	
,@GexGBP	decimal(18, 2)	
,@MDRRateGBP	decimal(18, 2)	
,@CreditGBP	decimal(18, 2)	
,@DebitGBP	decimal(18, 2)	
,@PerDeclineGBP	decimal(18, 2)	
,@PerRefundGBP	decimal(18, 2)	
,@ChargebackGBP	decimal(18, 2)	
,@WireTransferFeeGBP	decimal(18, 2)	
,@MinimumTransactionFeeGBP	decimal(18, 2)	
,@MinimumSettlementFeeGBP	decimal(18, 2)	
,@AnnualRenewalFeeGBP	decimal(18, 2)	
,@MinimumWeeklyFeeGBP	decimal(18, 2)	
,@RollingReserveGBP	decimal(18, 2)	
,@RollingReserveMonthsGBP	int	
,@FXRateGBP	decimal(18, 2)	
,@GatewayProcessingFeeGBP	decimal(18, 2)	
,@ProcessorFeeGBP	decimal(18, 2)	
,@SetupFeeGBP	decimal(18, 2)	
,@SchemeFeeGBP	decimal(18, 2)	
,@OCTMCSendGBP	decimal(18, 2)	
,@Band1GBP	decimal(18, 2)	
,@Band2GBP	decimal(18, 2)	
,@Band3GBP	decimal(18, 2)	
,@TmvGBP_I1	decimal(18, 2)	
,@AtvGBP_I1	decimal(18, 2)	
,@MtvGBP_I1	decimal(18, 2)	
,@TcrGBP_I1	decimal(18, 2)	
,@GexGBP_I1	decimal(18, 2)	
,@MDRRateGBP_I1	decimal(18, 2)	
,@CreditGBP_I1	decimal(18, 2)	
,@DebitGBP_I1	decimal(18, 2)	
,@PerDeclineGBP_I1	decimal(18, 2)	
,@PerRefundGBP_I1	decimal(18, 2)	
,@ChargebackGBP_I1	decimal(18, 2)	
,@WireTransferFeeGBP_I1	decimal(18, 2)	
,@MinimumTransactionFeeGBP_I1	decimal(18, 2)	
,@MinimumSettlementFeeGBP_I1	decimal(18, 2)	
,@AnnualRenewalFeeGBP_I1	decimal(18, 2)	
,@MinimumWeeklyFeeGBP_I1	decimal(18, 2)	
,@RollingReserveGBP_I1	decimal(18, 2)	
,@RollingReserveMonthsGBP_I1	int	
,@FXRateGBP_I1	decimal(18, 2)	
,@GatewayProcessingFeeGBP_I1	decimal(18, 2)	
,@ProcessorFeeGBP_I1	decimal(18, 2)	
,@SetupFeeGBP_I1	decimal(18, 2)	
,@SchemeFeeGBP_I1	decimal(18, 2)	
,@OCTMCSendGBP_I1	decimal(18, 2)	
,@Band1GBP_I1	decimal(18, 2)	
,@Band2GBP_I1	decimal(18, 2)	
,@Band3GBP_I1	decimal(18, 2)	
,@TmvGBP_I2	decimal(18, 2)	
,@AtvGBP_I2	decimal(18, 2)	
,@MtvGBP_I2	decimal(18, 2)	
,@TcrGBP_I2	decimal(18, 2)	
,@GexGBP_I2	decimal(18, 2)	
,@MDRRateGBP_I2	decimal(18, 2)	
,@CreditGBP_I2	decimal(18, 2)	
,@DebitGBP_I2	decimal(18, 2)	
,@PerDeclineGBP_I2	decimal(18, 2)	
,@PerRefundGBP_I2	decimal(18, 2)	
,@ChargebackGBP_I2	decimal(18, 2)	
,@WireTransferFeeGBP_I2	decimal(18, 2)	
,@MinimumTransactionFeeGBP_I2	decimal(18, 2)	
,@MinimumSettlementFeeGBP_I2	decimal(18, 2)	
,@AnnualRenewalFeeGBP_I2	decimal(18, 2)	
,@MinimumWeeklyFeeGBP_I2	decimal(18, 2)	
,@RollingReserveGBP_I2	decimal(18, 2)	
,@RollingReserveMonthsGBP_I2	int	
,@FXRateGBP_I2	decimal(18, 2)	
,@GatewayProcessingFeeGBP_I2	decimal(18, 2)	
,@ProcessorFeeGBP_I2	decimal(18, 2)	
,@SetupFeeGBP_I2	decimal(18, 2)	
,@SchemeFeeGBP_I2	decimal(18, 2)	
,@OCTMCSendGBP_I2	decimal(18, 2)	
,@Band1GBP_I2	decimal(18, 2)	
,@Band2GBP_I2	decimal(18, 2)	
,@Band3GBP_I2	decimal(18, 2)	

,@TmvUSD	decimal(18, 2)	
,@AtvUSD	decimal(18, 2)	
,@MtvUSD	decimal(18, 2)	
,@TcrUSD	decimal(18, 2)	
,@GexUSD	decimal(18, 2)	
,@MDRRateUSD	decimal(18, 2)	
,@CreditUSD	decimal(18, 2)	
,@DebitUSD	decimal(18, 2)	
,@PerDeclineUSD	decimal(18, 2)	
,@PerRefundUSD	decimal(18, 2)	
,@ChargebackUSD	decimal(18, 2)	
,@WireTransferFeeUSD	decimal(18, 2)	
,@MinimumTransactionFeeUSD	decimal(18, 2)	
,@MinimumSettlementFeeUSD	decimal(18, 2)	
,@AnnualRenewalFeeUSD	decimal(18, 2)	
,@MinimumWeeklyFeeUSD	decimal(18, 2)	
,@RollingReserveUSD	decimal(18, 2)	
,@RollingReserveMonthsUSD	int	
,@FXRateUSD	decimal(18, 2)	
,@GatewayProcessingFeeUSD	decimal(18, 2)	
,@ProcessorFeeUSD	decimal(18, 2)	
,@SetupFeeUSD	decimal(18, 2)	
,@SchemeFeeUSD	decimal(18, 2)	
,@OCTMCSendUSD	decimal(18, 2)	
,@Band1USD	decimal(18, 2)	
,@Band2USD	decimal(18, 2)	
,@Band3USD	decimal(18, 2)	
,@TmvUSD_I1	decimal(18, 2)	
,@AtvUSD_I1	decimal(18, 2)	
,@MtvUSD_I1	decimal(18, 2)	
,@TcrUSD_I1	decimal(18, 2)	
,@GexUSD_I1	decimal(18, 2)	
,@MDRRateUSD_I1	decimal(18, 2)	
,@CreditUSD_I1	decimal(18, 2)	
,@DebitUSD_I1	decimal(18, 2)	
,@PerDeclineUSD_I1	decimal(18, 2)	
,@PerRefundUSD_I1	decimal(18, 2)	
,@ChargebackUSD_I1	decimal(18, 2)	
,@WireTransferFeeUSD_I1	decimal(18, 2)	
,@MinimumTransactionFeeUSD_I1	decimal(18, 2)	
,@MinimumSettlementFeeUSD_I1	decimal(18, 2)	
,@AnnualRenewalFeeUSD_I1	decimal(18, 2)	
,@MinimumWeeklyFeeUSD_I1	decimal(18, 2)	
,@RollingReserveUSD_I1	decimal(18, 2)	
,@RollingReserveMonthsUSD_I1	int	
,@FXRateUSD_I1	decimal(18, 2)	
,@GatewayProcessingFeeUSD_I1	decimal(18, 2)	
,@ProcessorFeeUSD_I1	decimal(18, 2)	
,@SetupFeeUSD_I1	decimal(18, 2)	
,@SchemeFeeUSD_I1	decimal(18, 2)	
,@OCTMCSendUSD_I1	decimal(18, 2)	
,@Band1USD_I1	decimal(18, 2)	
,@Band2USD_I1	decimal(18, 2)	
,@Band3USD_I1	decimal(18, 2)	
,@TmvUSD_I2	decimal(18, 2)	
,@AtvUSD_I2	decimal(18, 2)	
,@MtvUSD_I2	decimal(18, 2)	
,@TcrUSD_I2	decimal(18, 2)	
,@GexUSD_I2	decimal(18, 2)	
,@MDRRateUSD_I2	decimal(18, 2)	
,@CreditUSD_I2	decimal(18, 2)	
,@DebitUSD_I2	decimal(18, 2)	
,@PerDeclineUSD_I2	decimal(18, 2)	
,@PerRefundUSD_I2	decimal(18, 2)	
,@ChargebackUSD_I2	decimal(18, 2)	
,@WireTransferFeeUSD_I2	decimal(18, 2)	
,@MinimumTransactionFeeUSD_I2	decimal(18, 2)	
,@MinimumSettlementFeeUSD_I2	decimal(18, 2)	
,@AnnualRenewalFeeUSD_I2	decimal(18, 2)	
,@MinimumWeeklyFeeUSD_I2	decimal(18, 2)	
,@RollingReserveUSD_I2	decimal(18, 2)	
,@RollingReserveMonthsUSD_I2	int	
,@FXRateUSD_I2	decimal(18, 2)	
,@GatewayProcessingFeeUSD_I2	decimal(18, 2)	
,@ProcessorFeeUSD_I2	decimal(18, 2)	
,@SetupFeeUSD_I2	decimal(18, 2)	
,@SchemeFeeUSD_I2	decimal(18, 2)	
,@OCTMCSendUSD_I2	decimal(18, 2)	
,@Band1USD_I2	decimal(18, 2)	
,@Band2USD_I2	decimal(18, 2)	
,@Band3USD_I2	decimal(18, 2)	

,@TmvAUD	decimal(18, 2)	
,@AtvAUD	decimal(18, 2)	
,@MtvAUD	decimal(18, 2)	
,@TcrAUD	decimal(18, 2)	
,@GexAUD	decimal(18, 2)	
,@MDRRateAUD	decimal(18, 2)	
,@CreditAUD	decimal(18, 2)	
,@DebitAUD	decimal(18, 2)	
,@PerDeclineAUD	decimal(18, 2)	
,@PerRefundAUD	decimal(18, 2)	
,@ChargebackAUD	decimal(18, 2)	
,@WireTransferFeeAUD	decimal(18, 2)	
,@MinimumTransactionFeeAUD	decimal(18, 2)	
,@MinimumSettlementFeeAUD	decimal(18, 2)	
,@AnnualRenewalFeeAUD	decimal(18, 2)	
,@MinimumWeeklyFeeAUD	decimal(18, 2)	
,@RollingReserveAUD	decimal(18, 2)	
,@RollingReserveMonthsAUD	int	
,@FXRateAUD	decimal(18, 2)	
,@GatewayProcessingFeeAUD	decimal(18, 2)	
,@ProcessorFeeAUD	decimal(18, 2)	
,@SetupFeeAUD	decimal(18, 2)	
,@SchemeFeeAUD	decimal(18, 2)	
,@OCTMCSendAUD	decimal(18, 2)	
,@Band1AUD	decimal(18, 2)	
,@Band2AUD	decimal(18, 2)	
,@Band3AUD	decimal(18, 2)	
,@TmvAUD_I1	decimal(18, 2)	
,@AtvAUD_I1	decimal(18, 2)	
,@MtvAUD_I1	decimal(18, 2)	
,@TcrAUD_I1	decimal(18, 2)	
,@GexAUD_I1	decimal(18, 2)	
,@MDRRateAUD_I1	decimal(18, 2)	
,@CreditAUD_I1	decimal(18, 2)	
,@DebitAUD_I1	decimal(18, 2)	
,@PerDeclineAUD_I1	decimal(18, 2)	
,@PerRefundAUD_I1	decimal(18, 2)	
,@ChargebackAUD_I1	decimal(18, 2)	
,@WireTransferFeeAUD_I1	decimal(18, 2)	
,@MinimumTransactionFeeAUD_I1	decimal(18, 2)	
,@MinimumSettlementFeeAUD_I1	decimal(18, 2)	
,@AnnualRenewalFeeAUD_I1	decimal(18, 2)	
,@MinimumWeeklyFeeAUD_I1	decimal(18, 2)	
,@RollingReserveAUD_I1	decimal(18, 2)	
,@RollingReserveMonthsAUD_I1	int	
,@FXRateAUD_I1	decimal(18, 2)	
,@GatewayProcessingFeeAUD_I1	decimal(18, 2)	
,@ProcessorFeeAUD_I1	decimal(18, 2)	
,@SetupFeeAUD_I1	decimal(18, 2)	
,@SchemeFeeAUD_I1	decimal(18, 2)	
,@OCTMCSendAUD_I1	decimal(18, 2)	
,@Band1AUD_I1	decimal(18, 2)	
,@Band2AUD_I1	decimal(18, 2)	
,@Band3AUD_I1	decimal(18, 2)	
,@TmvAUD_I2	decimal(18, 2)	
,@AtvAUD_I2	decimal(18, 2)	
,@MtvAUD_I2	decimal(18, 2)	
,@TcrAUD_I2	decimal(18, 2)	
,@GexAUD_I2	decimal(18, 2)	
,@MDRRateAUD_I2	decimal(18, 2)	
,@CreditAUD_I2	decimal(18, 2)	
,@DebitAUD_I2	decimal(18, 2)	
,@PerDeclineAUD_I2	decimal(18, 2)	
,@PerRefundAUD_I2	decimal(18, 2)	
,@ChargebackAUD_I2	decimal(18, 2)	
,@WireTransferFeeAUD_I2	decimal(18, 2)	
,@MinimumTransactionFeeAUD_I2	decimal(18, 2)	
,@MinimumSettlementFeeAUD_I2	decimal(18, 2)	
,@AnnualRenewalFeeAUD_I2	decimal(18, 2)	
,@MinimumWeeklyFeeAUD_I2	decimal(18, 2)	
,@RollingReserveAUD_I2	decimal(18, 2)	
,@RollingReserveMonthsAUD_I2	int	
,@FXRateAUD_I2	decimal(18, 2)	
,@GatewayProcessingFeeAUD_I2	decimal(18, 2)	
,@ProcessorFeeAUD_I2	decimal(18, 2)	
,@SetupFeeAUD_I2	decimal(18, 2)	
,@SchemeFeeAUD_I2	decimal(18, 2)	
,@OCTMCSendAUD_I2	decimal(18, 2)	
,@Band1AUD_I2	decimal(18, 2)	
,@Band2AUD_I2	decimal(18, 2)	
,@Band3AUD_I2	decimal(18, 2)	

,@TmvNOK	decimal(18, 2)	
,@AtvNOK	decimal(18, 2)	
,@MtvNOK	decimal(18, 2)	
,@TcrNOK	decimal(18, 2)	
,@GexNOK	decimal(18, 2)	
,@MDRRateNOK	decimal(18, 2)	
,@CreditNOK	decimal(18, 2)	
,@DebitNOK	decimal(18, 2)	
,@PerDeclineNOK	decimal(18, 2)	
,@PerRefundNOK	decimal(18, 2)	
,@ChargebackNOK	decimal(18, 2)	
,@WireTransferFeeNOK	decimal(18, 2)	
,@MinimumTransactionFeeNOK	decimal(18, 2)	
,@MinimumSettlementFeeNOK	decimal(18, 2)	
,@AnnualRenewalFeeNOK	decimal(18, 2)	
,@MinimumWeeklyFeeNOK	decimal(18, 2)	
,@RollingReserveNOK	decimal(18, 2)	
,@RollingReserveMonthsNOK	int	
,@FXRateNOK	decimal(18, 2)	
,@GatewayProcessingFeeNOK	decimal(18, 2)	
,@ProcessorFeeNOK	decimal(18, 2)	
,@SetupFeeNOK	decimal(18, 2)	
,@SchemeFeeNOK	decimal(18, 2)	
,@OCTMCSendNOK	decimal(18, 2)	
,@Band1NOK	decimal(18, 2)	
,@Band2NOK	decimal(18, 2)	
,@Band3NOK	decimal(18, 2)	
,@TmvNOK_I1	decimal(18, 2)	
,@AtvNOK_I1	decimal(18, 2)	
,@MtvNOK_I1	decimal(18, 2)	
,@TcrNOK_I1	decimal(18, 2)	
,@GexNOK_I1	decimal(18, 2)	
,@MDRRateNOK_I1	decimal(18, 2)	
,@CreditNOK_I1	decimal(18, 2)	
,@DebitNOK_I1	decimal(18, 2)	
,@PerDeclineNOK_I1	decimal(18, 2)	
,@PerRefundNOK_I1	decimal(18, 2)	
,@ChargebackNOK_I1	decimal(18, 2)	
,@WireTransferFeeNOK_I1	decimal(18, 2)	
,@MinimumTransactionFeeNOK_I1	decimal(18, 2)	
,@MinimumSettlementFeeNOK_I1	decimal(18, 2)	
,@AnnualRenewalFeeNOK_I1	decimal(18, 2)	
,@MinimumWeeklyFeeNOK_I1	decimal(18, 2)	
,@RollingReserveNOK_I1	decimal(18, 2)	
,@RollingReserveMonthsNOK_I1	int	
,@FXRateNOK_I1	decimal(18, 2)	
,@GatewayProcessingFeeNOK_I1	decimal(18, 2)	
,@ProcessorFeeNOK_I1	decimal(18, 2)	
,@SetupFeeNOK_I1	decimal(18, 2)	
,@SchemeFeeNOK_I1	decimal(18, 2)	
,@OCTMCSendNOK_I1	decimal(18, 2)	
,@Band1NOK_I1	decimal(18, 2)	
,@Band2NOK_I1	decimal(18, 2)	
,@Band3NOK_I1	decimal(18, 2)	
,@TmvNOK_I2	decimal(18, 2)	
,@AtvNOK_I2	decimal(18, 2)	
,@MtvNOK_I2	decimal(18, 2)	
,@TcrNOK_I2	decimal(18, 2)	
,@GexNOK_I2	decimal(18, 2)	
,@MDRRateNOK_I2	decimal(18, 2)	
,@CreditNOK_I2	decimal(18, 2)	
,@DebitNOK_I2	decimal(18, 2)	
,@PerDeclineNOK_I2	decimal(18, 2)	
,@PerRefundNOK_I2	decimal(18, 2)	
,@ChargebackNOK_I2	decimal(18, 2)	
,@WireTransferFeeNOK_I2	decimal(18, 2)	
,@MinimumTransactionFeeNOK_I2	decimal(18, 2)	
,@MinimumSettlementFeeNOK_I2	decimal(18, 2)	
,@AnnualRenewalFeeNOK_I2	decimal(18, 2)	
,@MinimumWeeklyFeeNOK_I2	decimal(18, 2)	
,@RollingReserveNOK_I2	decimal(18, 2)	
,@RollingReserveMonthsNOK_I2	int	
,@FXRateNOK_I2	decimal(18, 2)	
,@GatewayProcessingFeeNOK_I2	decimal(18, 2)	
,@ProcessorFeeNOK_I2	decimal(18, 2)	
,@SetupFeeNOK_I2	decimal(18, 2)	
,@SchemeFeeNOK_I2	decimal(18, 2)	
,@OCTMCSendNOK_I2	decimal(18, 2)	
,@Band1NOK_I2	decimal(18, 2)	
,@Band2NOK_I2	decimal(18, 2)	
,@Band3NOK_I2	decimal(18, 2)
,@Introducer1Id	int
,@Introducer2Id	int
,@UserCreatedId	int	
	AS
	BEGIN
	   INSERT INTO [MB_Commercials] 
			(MBId		
			,IsTrafficAvailable		
			,WhenVolumesRampUp		
			,TmvEUR		
			,AtvEUR		
			,MtvEUR		
			,TcrEUR		
			,GexEUR		
			,MDRRateEUR		
			,CreditEUR		
			,DebitEUR		
			,PerDeclineEUR		
			,PerRefundEUR		
			,ChargebackEUR		
			,WireTransferFeeEUR		
			,MinimumTransactionFeeEUR		
			,MinimumSettlementFeeEUR		
			,AnnualRenewalFeeEUR		
			,MinimumWeeklyFeeEUR		
			,RollingReserveEUR		
			,RollingReserveMonthsEUR		
			,FXRateEUR		
			,GatewayProcessingFeeEUR		
			,ProcessorFeeEUR		
			,SetupFeeEUR		
			,SchemeFeeEUR		
			,OCTMCSendEUR		
			,Band1EUR		
			,Band2EUR		
			,Band3EUR		
			,TmvEUR_I1		
			,AtvEUR_I1		
			,MtvEUR_I1		
			,TcrEUR_I1		
			,GexEUR_I1		
			,MDRRateEUR_I1		
			,CreditEUR_I1		
			,DebitEUR_I1		
			,PerDeclineEUR_I1		
			,PerRefundEUR_I1		
			,ChargebackEUR_I1		
			,WireTransferFeeEUR_I1		
			,MinimumTransactionFeeEUR_I1		
			,MinimumSettlementFeeEUR_I1		
			,AnnualRenewalFeeEUR_I1		
			,MinimumWeeklyFeeEUR_I1		
			,RollingReserveEUR_I1		
			,RollingReserveMonthsEUR_I1		
			,FXRateEUR_I1		
			,GatewayProcessingFeeEUR_I1		
			,ProcessorFeeEUR_I1		
			,SetupFeeEUR_I1		
			,SchemeFeeEUR_I1		
			,OCTMCSendEUR_I1		
			,Band1EUR_I1		
			,Band2EUR_I1		
			,Band3EUR_I1		
			,TmvEUR_I2		
			,AtvEUR_I2		
			,MtvEUR_I2		
			,TcrEUR_I2		
			,GexEUR_I2		
			,MDRRateEUR_I2		
			,CreditEUR_I2		
			,DebitEUR_I2		
			,PerDeclineEUR_I2		
			,PerRefundEUR_I2		
			,ChargebackEUR_I2		
			,WireTransferFeeEUR_I2		
			,MinimumTransactionFeeEUR_I2		
			,MinimumSettlementFeeEUR_I2		
			,AnnualRenewalFeeEUR_I2		
			,MinimumWeeklyFeeEUR_I2		
			,RollingReserveEUR_I2		
			,RollingReserveMonthsEUR_I2		
			,FXRateEUR_I2		
			,GatewayProcessingFeeEUR_I2		
			,ProcessorFeeEUR_I2		
			,SetupFeeEUR_I2		
			,SchemeFeeEUR_I2		
			,OCTMCSendEUR_I2		
			,Band1EUR_I2		
			,Band2EUR_I2		
			,Band3EUR_I2		

			,TmvGBP		
			,AtvGBP		
			,MtvGBP		
			,TcrGBP		
			,GexGBP		
			,MDRRateGBP		
			,CreditGBP		
			,DebitGBP		
			,PerDeclineGBP		
			,PerRefundGBP		
			,ChargebackGBP		
			,WireTransferFeeGBP		
			,MinimumTransactionFeeGBP		
			,MinimumSettlementFeeGBP		
			,AnnualRenewalFeeGBP		
			,MinimumWeeklyFeeGBP		
			,RollingReserveGBP		
			,RollingReserveMonthsGBP		
			,FXRateGBP		
			,GatewayProcessingFeeGBP		
			,ProcessorFeeGBP		
			,SetupFeeGBP		
			,SchemeFeeGBP		
			,OCTMCSendGBP		
			,Band1GBP		
			,Band2GBP		
			,Band3GBP		
			,TmvGBP_I1		
			,AtvGBP_I1		
			,MtvGBP_I1		
			,TcrGBP_I1		
			,GexGBP_I1		
			,MDRRateGBP_I1		
			,CreditGBP_I1		
			,DebitGBP_I1		
			,PerDeclineGBP_I1		
			,PerRefundGBP_I1		
			,ChargebackGBP_I1		
			,WireTransferFeeGBP_I1		
			,MinimumTransactionFeeGBP_I1		
			,MinimumSettlementFeeGBP_I1		
			,AnnualRenewalFeeGBP_I1		
			,MinimumWeeklyFeeGBP_I1		
			,RollingReserveGBP_I1		
			,RollingReserveMonthsGBP_I1		
			,FXRateGBP_I1		
			,GatewayProcessingFeeGBP_I1		
			,ProcessorFeeGBP_I1		
			,SetupFeeGBP_I1		
			,SchemeFeeGBP_I1		
			,OCTMCSendGBP_I1		
			,Band1GBP_I1		
			,Band2GBP_I1		
			,Band3GBP_I1		
			,TmvGBP_I2		
			,AtvGBP_I2		
			,MtvGBP_I2		
			,TcrGBP_I2		
			,GexGBP_I2		
			,MDRRateGBP_I2		
			,CreditGBP_I2		
			,DebitGBP_I2		
			,PerDeclineGBP_I2		
			,PerRefundGBP_I2		
			,ChargebackGBP_I2		
			,WireTransferFeeGBP_I2		
			,MinimumTransactionFeeGBP_I2		
			,MinimumSettlementFeeGBP_I2		
			,AnnualRenewalFeeGBP_I2		
			,MinimumWeeklyFeeGBP_I2		
			,RollingReserveGBP_I2		
			,RollingReserveMonthsGBP_I2		
			,FXRateGBP_I2		
			,GatewayProcessingFeeGBP_I2		
			,ProcessorFeeGBP_I2		
			,SetupFeeGBP_I2		
			,SchemeFeeGBP_I2		
			,OCTMCSendGBP_I2		
			,Band1GBP_I2		
			,Band2GBP_I2		
			,Band3GBP_I2		

			,TmvUSD		
			,AtvUSD		
			,MtvUSD		
			,TcrUSD		
			,GexUSD		
			,MDRRateUSD		
			,CreditUSD		
			,DebitUSD		
			,PerDeclineUSD		
			,PerRefundUSD		
			,ChargebackUSD		
			,WireTransferFeeUSD		
			,MinimumTransactionFeeUSD		
			,MinimumSettlementFeeUSD		
			,AnnualRenewalFeeUSD		
			,MinimumWeeklyFeeUSD		
			,RollingReserveUSD		
			,RollingReserveMonthsUSD		
			,FXRateUSD		
			,GatewayProcessingFeeUSD		
			,ProcessorFeeUSD		
			,SetupFeeUSD		
			,SchemeFeeUSD		
			,OCTMCSendUSD		
			,Band1USD		
			,Band2USD		
			,Band3USD		
			,TmvUSD_I1		
			,AtvUSD_I1		
			,MtvUSD_I1		
			,TcrUSD_I1		
			,GexUSD_I1		
			,MDRRateUSD_I1		
			,CreditUSD_I1		
			,DebitUSD_I1		
			,PerDeclineUSD_I1		
			,PerRefundUSD_I1		
			,ChargebackUSD_I1		
			,WireTransferFeeUSD_I1		
			,MinimumTransactionFeeUSD_I1		
			,MinimumSettlementFeeUSD_I1		
			,AnnualRenewalFeeUSD_I1		
			,MinimumWeeklyFeeUSD_I1		
			,RollingReserveUSD_I1		
			,RollingReserveMonthsUSD_I1		
			,FXRateUSD_I1		
			,GatewayProcessingFeeUSD_I1		
			,ProcessorFeeUSD_I1		
			,SetupFeeUSD_I1		
			,SchemeFeeUSD_I1		
			,OCTMCSendUSD_I1		
			,Band1USD_I1		
			,Band2USD_I1		
			,Band3USD_I1		
			,TmvUSD_I2		
			,AtvUSD_I2		
			,MtvUSD_I2		
			,TcrUSD_I2		
			,GexUSD_I2		
			,MDRRateUSD_I2		
			,CreditUSD_I2		
			,DebitUSD_I2		
			,PerDeclineUSD_I2		
			,PerRefundUSD_I2		
			,ChargebackUSD_I2		
			,WireTransferFeeUSD_I2		
			,MinimumTransactionFeeUSD_I2		
			,MinimumSettlementFeeUSD_I2		
			,AnnualRenewalFeeUSD_I2		
			,MinimumWeeklyFeeUSD_I2		
			,RollingReserveUSD_I2		
			,RollingReserveMonthsUSD_I2		
			,FXRateUSD_I2		
			,GatewayProcessingFeeUSD_I2		
			,ProcessorFeeUSD_I2		
			,SetupFeeUSD_I2		
			,SchemeFeeUSD_I2		
			,OCTMCSendUSD_I2		
			,Band1USD_I2		
			,Band2USD_I2		
			,Band3USD_I2		

			,TmvAUD		
			,AtvAUD		
			,MtvAUD		
			,TcrAUD		
			,GexAUD		
			,MDRRateAUD		
			,CreditAUD		
			,DebitAUD		
			,PerDeclineAUD		
			,PerRefundAUD		
			,ChargebackAUD		
			,WireTransferFeeAUD		
			,MinimumTransactionFeeAUD		
			,MinimumSettlementFeeAUD		
			,AnnualRenewalFeeAUD		
			,MinimumWeeklyFeeAUD		
			,RollingReserveAUD		
			,RollingReserveMonthsAUD		
			,FXRateAUD		
			,GatewayProcessingFeeAUD		
			,ProcessorFeeAUD		
			,SetupFeeAUD		
			,SchemeFeeAUD		
			,OCTMCSendAUD		
			,Band1AUD		
			,Band2AUD		
			,Band3AUD		
			,TmvAUD_I1		
			,AtvAUD_I1		
			,MtvAUD_I1		
			,TcrAUD_I1		
			,GexAUD_I1		
			,MDRRateAUD_I1		
			,CreditAUD_I1		
			,DebitAUD_I1		
			,PerDeclineAUD_I1		
			,PerRefundAUD_I1		
			,ChargebackAUD_I1		
			,WireTransferFeeAUD_I1		
			,MinimumTransactionFeeAUD_I1		
			,MinimumSettlementFeeAUD_I1		
			,AnnualRenewalFeeAUD_I1		
			,MinimumWeeklyFeeAUD_I1		
			,RollingReserveAUD_I1		
			,RollingReserveMonthsAUD_I1		
			,FXRateAUD_I1		
			,GatewayProcessingFeeAUD_I1		
			,ProcessorFeeAUD_I1		
			,SetupFeeAUD_I1		
			,SchemeFeeAUD_I1		
			,OCTMCSendAUD_I1		
			,Band1AUD_I1		
			,Band2AUD_I1		
			,Band3AUD_I1		
			,TmvAUD_I2		
			,AtvAUD_I2		
			,MtvAUD_I2		
			,TcrAUD_I2		
			,GexAUD_I2		
			,MDRRateAUD_I2		
			,CreditAUD_I2		
			,DebitAUD_I2		
			,PerDeclineAUD_I2		
			,PerRefundAUD_I2		
			,ChargebackAUD_I2		
			,WireTransferFeeAUD_I2		
			,MinimumTransactionFeeAUD_I2		
			,MinimumSettlementFeeAUD_I2		
			,AnnualRenewalFeeAUD_I2		
			,MinimumWeeklyFeeAUD_I2		
			,RollingReserveAUD_I2		
			,RollingReserveMonthsAUD_I2		
			,FXRateAUD_I2		
			,GatewayProcessingFeeAUD_I2		
			,ProcessorFeeAUD_I2		
			,SetupFeeAUD_I2		
			,SchemeFeeAUD_I2		
			,OCTMCSendAUD_I2		
			,Band1AUD_I2		
			,Band2AUD_I2		
			,Band3AUD_I2		

			,TmvNOK		
			,AtvNOK		
			,MtvNOK		
			,TcrNOK		
			,GexNOK		
			,MDRRateNOK		
			,CreditNOK		
			,DebitNOK		
			,PerDeclineNOK		
			,PerRefundNOK		
			,ChargebackNOK		
			,WireTransferFeeNOK		
			,MinimumTransactionFeeNOK		
			,MinimumSettlementFeeNOK		
			,AnnualRenewalFeeNOK		
			,MinimumWeeklyFeeNOK		
			,RollingReserveNOK		
			,RollingReserveMonthsNOK		
			,FXRateNOK		
			,GatewayProcessingFeeNOK		
			,ProcessorFeeNOK		
			,SetupFeeNOK		
			,SchemeFeeNOK		
			,OCTMCSendNOK		
			,Band1NOK		
			,Band2NOK		
			,Band3NOK		
			,TmvNOK_I1		
			,AtvNOK_I1		
			,MtvNOK_I1		
			,TcrNOK_I1		
			,GexNOK_I1		
			,MDRRateNOK_I1		
			,CreditNOK_I1		
			,DebitNOK_I1		
			,PerDeclineNOK_I1		
			,PerRefundNOK_I1		
			,ChargebackNOK_I1		
			,WireTransferFeeNOK_I1		
			,MinimumTransactionFeeNOK_I1		
			,MinimumSettlementFeeNOK_I1		
			,AnnualRenewalFeeNOK_I1		
			,MinimumWeeklyFeeNOK_I1		
			,RollingReserveNOK_I1		
			,RollingReserveMonthsNOK_I1		
			,FXRateNOK_I1		
			,GatewayProcessingFeeNOK_I1		
			,ProcessorFeeNOK_I1		
			,SetupFeeNOK_I1		
			,SchemeFeeNOK_I1		
			,OCTMCSendNOK_I1		
			,Band1NOK_I1		
			,Band2NOK_I1		
			,Band3NOK_I1		
			,TmvNOK_I2		
			,AtvNOK_I2		
			,MtvNOK_I2		
			,TcrNOK_I2		
			,GexNOK_I2		
			,MDRRateNOK_I2		
			,CreditNOK_I2		
			,DebitNOK_I2		
			,PerDeclineNOK_I2		
			,PerRefundNOK_I2		
			,ChargebackNOK_I2		
			,WireTransferFeeNOK_I2		
			,MinimumTransactionFeeNOK_I2		
			,MinimumSettlementFeeNOK_I2		
			,AnnualRenewalFeeNOK_I2		
			,MinimumWeeklyFeeNOK_I2		
			,RollingReserveNOK_I2		
			,RollingReserveMonthsNOK_I2		
			,FXRateNOK_I2		
			,GatewayProcessingFeeNOK_I2		
			,ProcessorFeeNOK_I2		
			,SetupFeeNOK_I2		
			,SchemeFeeNOK_I2		
			,OCTMCSendNOK_I2		
			,Band1NOK_I2		
			,Band2NOK_I2		
			,Band3NOK_I2	
			,Introducer1Id	
			,Introducer2Id	
			,DateCreated	
			,UserCreatedId	
			,Deleted)
				VALUES
			 (@MBId		
			,@IsTrafficAvailable		
			,@WhenVolumesRampUp		
			,@TmvEUR		
			,@AtvEUR		
			,@MtvEUR		
			,@TcrEUR		
			,@GexEUR		
			,@MDRRateEUR		
			,@CreditEUR		
			,@DebitEUR		
			,@PerDeclineEUR		
			,@PerRefundEUR		
			,@ChargebackEUR		
			,@WireTransferFeeEUR		
			,@MinimumTransactionFeeEUR		
			,@MinimumSettlementFeeEUR		
			,@AnnualRenewalFeeEUR		
			,@MinimumWeeklyFeeEUR		
			,@RollingReserveEUR		
			,@RollingReserveMonthsEUR		
			,@FXRateEUR		
			,@GatewayProcessingFeeEUR		
			,@ProcessorFeeEUR		
			,@SetupFeeEUR		
			,@SchemeFeeEUR		
			,@OCTMCSendEUR		
			,@Band1EUR		
			,@Band2EUR		
			,@Band3EUR		
			,@TmvEUR_I1		
			,@AtvEUR_I1		
			,@MtvEUR_I1		
			,@TcrEUR_I1		
			,@GexEUR_I1		
			,@MDRRateEUR_I1		
			,@CreditEUR_I1		
			,@DebitEUR_I1		
			,@PerDeclineEUR_I1		
			,@PerRefundEUR_I1		
			,@ChargebackEUR_I1		
			,@WireTransferFeeEUR_I1		
			,@MinimumTransactionFeeEUR_I1		
			,@MinimumSettlementFeeEUR_I1		
			,@AnnualRenewalFeeEUR_I1		
			,@MinimumWeeklyFeeEUR_I1		
			,@RollingReserveEUR_I1		
			,@RollingReserveMonthsEUR_I1		
			,@FXRateEUR_I1		
			,@GatewayProcessingFeeEUR_I1		
			,@ProcessorFeeEUR_I1		
			,@SetupFeeEUR_I1		
			,@SchemeFeeEUR_I1		
			,@OCTMCSendEUR_I1		
			,@Band1EUR_I1		
			,@Band2EUR_I1		
			,@Band3EUR_I1		
			,@TmvEUR_I2		
			,@AtvEUR_I2		
			,@MtvEUR_I2		
			,@TcrEUR_I2		
			,@GexEUR_I2		
			,@MDRRateEUR_I2		
			,@CreditEUR_I2		
			,@DebitEUR_I2		
			,@PerDeclineEUR_I2		
			,@PerRefundEUR_I2		
			,@ChargebackEUR_I2		
			,@WireTransferFeeEUR_I2		
			,@MinimumTransactionFeeEUR_I2		
			,@MinimumSettlementFeeEUR_I2		
			,@AnnualRenewalFeeEUR_I2		
			,@MinimumWeeklyFeeEUR_I2		
			,@RollingReserveEUR_I2		
			,@RollingReserveMonthsEUR_I2		
			,@FXRateEUR_I2		
			,@GatewayProcessingFeeEUR_I2		
			,@ProcessorFeeEUR_I2		
			,@SetupFeeEUR_I2		
			,@SchemeFeeEUR_I2		
			,@OCTMCSendEUR_I2		
			,@Band1EUR_I2		
			,@Band2EUR_I2		
			,@Band3EUR_I2		

			,@TmvGBP		
			,@AtvGBP		
			,@MtvGBP		
			,@TcrGBP		
			,@GexGBP		
			,@MDRRateGBP		
			,@CreditGBP		
			,@DebitGBP		
			,@PerDeclineGBP		
			,@PerRefundGBP		
			,@ChargebackGBP		
			,@WireTransferFeeGBP		
			,@MinimumTransactionFeeGBP		
			,@MinimumSettlementFeeGBP		
			,@AnnualRenewalFeeGBP		
			,@MinimumWeeklyFeeGBP		
			,@RollingReserveGBP		
			,@RollingReserveMonthsGBP		
			,@FXRateGBP		
			,@GatewayProcessingFeeGBP		
			,@ProcessorFeeGBP		
			,@SetupFeeGBP		
			,@SchemeFeeGBP		
			,@OCTMCSendGBP		
			,@Band1GBP		
			,@Band2GBP		
			,@Band3GBP		
			,@TmvGBP_I1		
			,@AtvGBP_I1		
			,@MtvGBP_I1		
			,@TcrGBP_I1		
			,@GexGBP_I1		
			,@MDRRateGBP_I1		
			,@CreditGBP_I1		
			,@DebitGBP_I1		
			,@PerDeclineGBP_I1		
			,@PerRefundGBP_I1		
			,@ChargebackGBP_I1		
			,@WireTransferFeeGBP_I1		
			,@MinimumTransactionFeeGBP_I1		
			,@MinimumSettlementFeeGBP_I1		
			,@AnnualRenewalFeeGBP_I1		
			,@MinimumWeeklyFeeGBP_I1		
			,@RollingReserveGBP_I1		
			,@RollingReserveMonthsGBP_I1		
			,@FXRateGBP_I1		
			,@GatewayProcessingFeeGBP_I1		
			,@ProcessorFeeGBP_I1		
			,@SetupFeeGBP_I1		
			,@SchemeFeeGBP_I1		
			,@OCTMCSendGBP_I1		
			,@Band1GBP_I1		
			,@Band2GBP_I1		
			,@Band3GBP_I1		
			,@TmvGBP_I2		
			,@AtvGBP_I2		
			,@MtvGBP_I2		
			,@TcrGBP_I2		
			,@GexGBP_I2		
			,@MDRRateGBP_I2		
			,@CreditGBP_I2		
			,@DebitGBP_I2		
			,@PerDeclineGBP_I2		
			,@PerRefundGBP_I2		
			,@ChargebackGBP_I2		
			,@WireTransferFeeGBP_I2		
			,@MinimumTransactionFeeGBP_I2		
			,@MinimumSettlementFeeGBP_I2		
			,@AnnualRenewalFeeGBP_I2		
			,@MinimumWeeklyFeeGBP_I2		
			,@RollingReserveGBP_I2		
			,@RollingReserveMonthsGBP_I2		
			,@FXRateGBP_I2		
			,@GatewayProcessingFeeGBP_I2		
			,@ProcessorFeeGBP_I2		
			,@SetupFeeGBP_I2		
			,@SchemeFeeGBP_I2		
			,@OCTMCSendGBP_I2		
			,@Band1GBP_I2		
			,@Band2GBP_I2		
			,@Band3GBP_I2		

			,@TmvUSD		
			,@AtvUSD		
			,@MtvUSD		
			,@TcrUSD		
			,@GexUSD		
			,@MDRRateUSD		
			,@CreditUSD		
			,@DebitUSD		
			,@PerDeclineUSD		
			,@PerRefundUSD		
			,@ChargebackUSD		
			,@WireTransferFeeUSD		
			,@MinimumTransactionFeeUSD		
			,@MinimumSettlementFeeUSD		
			,@AnnualRenewalFeeUSD		
			,@MinimumWeeklyFeeUSD		
			,@RollingReserveUSD		
			,@RollingReserveMonthsUSD		
			,@FXRateUSD		
			,@GatewayProcessingFeeUSD		
			,@ProcessorFeeUSD		
			,@SetupFeeUSD		
			,@SchemeFeeUSD		
			,@OCTMCSendUSD		
			,@Band1USD		
			,@Band2USD		
			,@Band3USD		
			,@TmvUSD_I1		
			,@AtvUSD_I1		
			,@MtvUSD_I1		
			,@TcrUSD_I1		
			,@GexUSD_I1		
			,@MDRRateUSD_I1		
			,@CreditUSD_I1		
			,@DebitUSD_I1		
			,@PerDeclineUSD_I1		
			,@PerRefundUSD_I1		
			,@ChargebackUSD_I1		
			,@WireTransferFeeUSD_I1		
			,@MinimumTransactionFeeUSD_I1		
			,@MinimumSettlementFeeUSD_I1		
			,@AnnualRenewalFeeUSD_I1		
			,@MinimumWeeklyFeeUSD_I1		
			,@RollingReserveUSD_I1		
			,@RollingReserveMonthsUSD_I1		
			,@FXRateUSD_I1		
			,@GatewayProcessingFeeUSD_I1		
			,@ProcessorFeeUSD_I1		
			,@SetupFeeUSD_I1		
			,@SchemeFeeUSD_I1		
			,@OCTMCSendUSD_I1		
			,@Band1USD_I1		
			,@Band2USD_I1		
			,@Band3USD_I1		
			,@TmvUSD_I2		
			,@AtvUSD_I2		
			,@MtvUSD_I2		
			,@TcrUSD_I2		
			,@GexUSD_I2		
			,@MDRRateUSD_I2		
			,@CreditUSD_I2		
			,@DebitUSD_I2		
			,@PerDeclineUSD_I2		
			,@PerRefundUSD_I2		
			,@ChargebackUSD_I2		
			,@WireTransferFeeUSD_I2		
			,@MinimumTransactionFeeUSD_I2		
			,@MinimumSettlementFeeUSD_I2		
			,@AnnualRenewalFeeUSD_I2		
			,@MinimumWeeklyFeeUSD_I2		
			,@RollingReserveUSD_I2		
			,@RollingReserveMonthsUSD_I2		
			,@FXRateUSD_I2		
			,@GatewayProcessingFeeUSD_I2		
			,@ProcessorFeeUSD_I2		
			,@SetupFeeUSD_I2		
			,@SchemeFeeUSD_I2		
			,@OCTMCSendUSD_I2		
			,@Band1USD_I2		
			,@Band2USD_I2		
			,@Band3USD_I2		

			,@TmvAUD		
			,@AtvAUD		
			,@MtvAUD		
			,@TcrAUD		
			,@GexAUD		
			,@MDRRateAUD		
			,@CreditAUD		
			,@DebitAUD		
			,@PerDeclineAUD		
			,@PerRefundAUD		
			,@ChargebackAUD		
			,@WireTransferFeeAUD		
			,@MinimumTransactionFeeAUD		
			,@MinimumSettlementFeeAUD		
			,@AnnualRenewalFeeAUD		
			,@MinimumWeeklyFeeAUD		
			,@RollingReserveAUD		
			,@RollingReserveMonthsAUD		
			,@FXRateAUD		
			,@GatewayProcessingFeeAUD		
			,@ProcessorFeeAUD		
			,@SetupFeeAUD		
			,@SchemeFeeAUD		
			,@OCTMCSendAUD		
			,@Band1AUD		
			,@Band2AUD		
			,@Band3AUD		
			,@TmvAUD_I1		
			,@AtvAUD_I1		
			,@MtvAUD_I1		
			,@TcrAUD_I1		
			,@GexAUD_I1		
			,@MDRRateAUD_I1		
			,@CreditAUD_I1		
			,@DebitAUD_I1		
			,@PerDeclineAUD_I1		
			,@PerRefundAUD_I1		
			,@ChargebackAUD_I1		
			,@WireTransferFeeAUD_I1		
			,@MinimumTransactionFeeAUD_I1		
			,@MinimumSettlementFeeAUD_I1		
			,@AnnualRenewalFeeAUD_I1		
			,@MinimumWeeklyFeeAUD_I1		
			,@RollingReserveAUD_I1		
			,@RollingReserveMonthsAUD_I1		
			,@FXRateAUD_I1		
			,@GatewayProcessingFeeAUD_I1		
			,@ProcessorFeeAUD_I1		
			,@SetupFeeAUD_I1		
			,@SchemeFeeAUD_I1		
			,@OCTMCSendAUD_I1		
			,@Band1AUD_I1		
			,@Band2AUD_I1		
			,@Band3AUD_I1		
			,@TmvAUD_I2		
			,@AtvAUD_I2		
			,@MtvAUD_I2		
			,@TcrAUD_I2		
			,@GexAUD_I2		
			,@MDRRateAUD_I2		
			,@CreditAUD_I2		
			,@DebitAUD_I2		
			,@PerDeclineAUD_I2		
			,@PerRefundAUD_I2		
			,@ChargebackAUD_I2		
			,@WireTransferFeeAUD_I2		
			,@MinimumTransactionFeeAUD_I2		
			,@MinimumSettlementFeeAUD_I2		
			,@AnnualRenewalFeeAUD_I2		
			,@MinimumWeeklyFeeAUD_I2		
			,@RollingReserveAUD_I2		
			,@RollingReserveMonthsAUD_I2		
			,@FXRateAUD_I2		
			,@GatewayProcessingFeeAUD_I2		
			,@ProcessorFeeAUD_I2		
			,@SetupFeeAUD_I2		
			,@SchemeFeeAUD_I2		
			,@OCTMCSendAUD_I2		
			,@Band1AUD_I2		
			,@Band2AUD_I2		
			,@Band3AUD_I2		

			,@TmvNOK		
			,@AtvNOK		
			,@MtvNOK		
			,@TcrNOK		
			,@GexNOK		
			,@MDRRateNOK		
			,@CreditNOK		
			,@DebitNOK		
			,@PerDeclineNOK		
			,@PerRefundNOK		
			,@ChargebackNOK		
			,@WireTransferFeeNOK		
			,@MinimumTransactionFeeNOK		
			,@MinimumSettlementFeeNOK		
			,@AnnualRenewalFeeNOK		
			,@MinimumWeeklyFeeNOK		
			,@RollingReserveNOK		
			,@RollingReserveMonthsNOK		
			,@FXRateNOK		
			,@GatewayProcessingFeeNOK		
			,@ProcessorFeeNOK		
			,@SetupFeeNOK		
			,@SchemeFeeNOK		
			,@OCTMCSendNOK		
			,@Band1NOK		
			,@Band2NOK		
			,@Band3NOK		
			,@TmvNOK_I1		
			,@AtvNOK_I1		
			,@MtvNOK_I1		
			,@TcrNOK_I1		
			,@GexNOK_I1		
			,@MDRRateNOK_I1		
			,@CreditNOK_I1		
			,@DebitNOK_I1		
			,@PerDeclineNOK_I1		
			,@PerRefundNOK_I1		
			,@ChargebackNOK_I1		
			,@WireTransferFeeNOK_I1		
			,@MinimumTransactionFeeNOK_I1		
			,@MinimumSettlementFeeNOK_I1		
			,@AnnualRenewalFeeNOK_I1		
			,@MinimumWeeklyFeeNOK_I1		
			,@RollingReserveNOK_I1		
			,@RollingReserveMonthsNOK_I1		
			,@FXRateNOK_I1		
			,@GatewayProcessingFeeNOK_I1		
			,@ProcessorFeeNOK_I1		
			,@SetupFeeNOK_I1		
			,@SchemeFeeNOK_I1		
			,@OCTMCSendNOK_I1		
			,@Band1NOK_I1		
			,@Band2NOK_I1		
			,@Band3NOK_I1		
			,@TmvNOK_I2		
			,@AtvNOK_I2		
			,@MtvNOK_I2		
			,@TcrNOK_I2		
			,@GexNOK_I2		
			,@MDRRateNOK_I2		
			,@CreditNOK_I2		
			,@DebitNOK_I2		
			,@PerDeclineNOK_I2		
			,@PerRefundNOK_I2		
			,@ChargebackNOK_I2		
			,@WireTransferFeeNOK_I2		
			,@MinimumTransactionFeeNOK_I2		
			,@MinimumSettlementFeeNOK_I2		
			,@AnnualRenewalFeeNOK_I2		
			,@MinimumWeeklyFeeNOK_I2		
			,@RollingReserveNOK_I2		
			,@RollingReserveMonthsNOK_I2		
			,@FXRateNOK_I2		
			,@GatewayProcessingFeeNOK_I2		
			,@ProcessorFeeNOK_I2		
			,@SetupFeeNOK_I2		
			,@SchemeFeeNOK_I2		
			,@OCTMCSendNOK_I2		
			,@Band1NOK_I2		
			,@Band2NOK_I2		
			,@Band3NOK_I2	
			,@Introducer1Id	
			,@Introducer2Id	
			   ,GETDATE()
			   ,@UserCreatedId
			   ,0)
	END


SELECT CONVERT(INT, SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[MB_COMMERCIALS_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_COMMERCIALS_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
SELECT 
		 [MBCOM].Id
		,[MBCOM].MBId, [MB].LegalName AS MB_LegalName
				,[MBCOM].IsTrafficAvailable
		,[MBCOM].WhenVolumesRampUp	
		,[MBCOM].TmvEUR
		,[MBCOM].AtvEUR
		,[MBCOM].MtvEUR
		,[MBCOM].TcrEUR
		,[MBCOM].GexEUR
		,[MBCOM].MDRRateEUR
		,[MBCOM].CreditEUR
		,[MBCOM].DebitEUR
		,[MBCOM].PerDeclineEUR
		,[MBCOM].PerRefundEUR
		,[MBCOM].ChargebackEUR
		,[MBCOM].WireTransferFeeEUR
		,[MBCOM].MinimumTransactionFeeEUR
		,[MBCOM].MinimumSettlementFeeEUR
		,[MBCOM].AnnualRenewalFeeEUR
		,[MBCOM].MinimumWeeklyFeeEUR
		,[MBCOM].RollingReserveEUR
		,[MBCOM].RollingReserveMonthsEUR
		,[MBCOM].FXRateEUR
		,[MBCOM].GatewayProcessingFeeEUR
		,[MBCOM].ProcessorFeeEUR
		,[MBCOM].SetupFeeEUR
		,[MBCOM].SchemeFeeEUR
		,[MBCOM].OCTMCSendEUR
		,[MBCOM].Band1EUR
		,[MBCOM].Band2EUR
		,[MBCOM].Band3EUR
		,[MBCOM].TmvEUR_I1
		,[MBCOM].AtvEUR_I1
		,[MBCOM].MtvEUR_I1
		,[MBCOM].TcrEUR_I1
		,[MBCOM].GexEUR_I1
		,[MBCOM].MDRRateEUR_I1
		,[MBCOM].CreditEUR_I1
		,[MBCOM].DebitEUR_I1
		,[MBCOM].PerDeclineEUR_I1
		,[MBCOM].PerRefundEUR_I1
		,[MBCOM].ChargebackEUR_I1
		,[MBCOM].WireTransferFeeEUR_I1
		,[MBCOM].MinimumTransactionFeeEUR_I1
		,[MBCOM].MinimumSettlementFeeEUR_I1
		,[MBCOM].AnnualRenewalFeeEUR_I1
		,[MBCOM].MinimumWeeklyFeeEUR_I1
		,[MBCOM].RollingReserveEUR_I1
		,[MBCOM].RollingReserveMonthsEUR_I1
		,[MBCOM].FXRateEUR_I1
		,[MBCOM].GatewayProcessingFeeEUR_I1
		,[MBCOM].ProcessorFeeEUR_I1
		,[MBCOM].SetupFeeEUR_I1
		,[MBCOM].SchemeFeeEUR_I1
		,[MBCOM].OCTMCSendEUR_I1
		,[MBCOM].Band1EUR_I1
		,[MBCOM].Band2EUR_I1
		,[MBCOM].Band3EUR_I1
		,[MBCOM].TmvEUR_I2
		,[MBCOM].AtvEUR_I2
		,[MBCOM].MtvEUR_I2
		,[MBCOM].TcrEUR_I2
		,[MBCOM].GexEUR_I2
		,[MBCOM].MDRRateEUR_I2
		,[MBCOM].CreditEUR_I2
		,[MBCOM].DebitEUR_I2
		,[MBCOM].PerDeclineEUR_I2
		,[MBCOM].PerRefundEUR_I2
		,[MBCOM].ChargebackEUR_I2
		,[MBCOM].WireTransferFeeEUR_I2
		,[MBCOM].MinimumTransactionFeeEUR_I2
		,[MBCOM].MinimumSettlementFeeEUR_I2
		,[MBCOM].AnnualRenewalFeeEUR_I2
		,[MBCOM].MinimumWeeklyFeeEUR_I2
		,[MBCOM].RollingReserveEUR_I2
		,[MBCOM].RollingReserveMonthsEUR_I2
		,[MBCOM].FXRateEUR_I2
		,[MBCOM].GatewayProcessingFeeEUR_I2
		,[MBCOM].ProcessorFeeEUR_I2
		,[MBCOM].SetupFeeEUR_I2
		,[MBCOM].SchemeFeeEUR_I2
		,[MBCOM].OCTMCSendEUR_I2
		,[MBCOM].Band1EUR_I2
		,[MBCOM].Band2EUR_I2
		,[MBCOM].Band3EUR_I2
		,[MBCOM].TmvGBP
		,[MBCOM].AtvGBP
		,[MBCOM].MtvGBP
		,[MBCOM].TcrGBP
		,[MBCOM].GexGBP
		,[MBCOM].MDRRateGBP
		,[MBCOM].CreditGBP
		,[MBCOM].DebitGBP
		,[MBCOM].PerDeclineGBP
		,[MBCOM].PerRefundGBP
		,[MBCOM].ChargebackGBP
		,[MBCOM].WireTransferFeeGBP
		,[MBCOM].MinimumTransactionFeeGBP
		,[MBCOM].MinimumSettlementFeeGBP
		,[MBCOM].AnnualRenewalFeeGBP
		,[MBCOM].MinimumWeeklyFeeGBP
		,[MBCOM].RollingReserveGBP
		,[MBCOM].RollingReserveMonthsGBP
		,[MBCOM].FXRateGBP
		,[MBCOM].GatewayProcessingFeeGBP
		,[MBCOM].ProcessorFeeGBP
		,[MBCOM].SetupFeeGBP
		,[MBCOM].SchemeFeeGBP
		,[MBCOM].OCTMCSendGBP
		,[MBCOM].Band1GBP
		,[MBCOM].Band2GBP
		,[MBCOM].Band3GBP
		,[MBCOM].TmvGBP_I1
		,[MBCOM].AtvGBP_I1
		,[MBCOM].MtvGBP_I1
		,[MBCOM].TcrGBP_I1
		,[MBCOM].GexGBP_I1
		,[MBCOM].MDRRateGBP_I1
		,[MBCOM].CreditGBP_I1
		,[MBCOM].DebitGBP_I1
		,[MBCOM].PerDeclineGBP_I1
		,[MBCOM].PerRefundGBP_I1
		,[MBCOM].ChargebackGBP_I1
		,[MBCOM].WireTransferFeeGBP_I1
		,[MBCOM].MinimumTransactionFeeGBP_I1
		,[MBCOM].MinimumSettlementFeeGBP_I1
		,[MBCOM].AnnualRenewalFeeGBP_I1
		,[MBCOM].MinimumWeeklyFeeGBP_I1
		,[MBCOM].RollingReserveGBP_I1
		,[MBCOM].RollingReserveMonthsGBP_I1
		,[MBCOM].FXRateGBP_I1
		,[MBCOM].GatewayProcessingFeeGBP_I1
		,[MBCOM].ProcessorFeeGBP_I1
		,[MBCOM].SetupFeeGBP_I1
		,[MBCOM].SchemeFeeGBP_I1
		,[MBCOM].OCTMCSendGBP_I1
		,[MBCOM].Band1GBP_I1
		,[MBCOM].Band2GBP_I1
		,[MBCOM].Band3GBP_I1
		,[MBCOM].TmvGBP_I2
		,[MBCOM].AtvGBP_I2
		,[MBCOM].MtvGBP_I2
		,[MBCOM].TcrGBP_I2
		,[MBCOM].GexGBP_I2
		,[MBCOM].MDRRateGBP_I2
		,[MBCOM].CreditGBP_I2
		,[MBCOM].DebitGBP_I2
		,[MBCOM].PerDeclineGBP_I2
		,[MBCOM].PerRefundGBP_I2
		,[MBCOM].ChargebackGBP_I2
		,[MBCOM].WireTransferFeeGBP_I2
		,[MBCOM].MinimumTransactionFeeGBP_I2
		,[MBCOM].MinimumSettlementFeeGBP_I2
		,[MBCOM].AnnualRenewalFeeGBP_I2
		,[MBCOM].MinimumWeeklyFeeGBP_I2
		,[MBCOM].RollingReserveGBP_I2
		,[MBCOM].RollingReserveMonthsGBP_I2
		,[MBCOM].FXRateGBP_I2
		,[MBCOM].GatewayProcessingFeeGBP_I2
		,[MBCOM].ProcessorFeeGBP_I2
		,[MBCOM].SetupFeeGBP_I2
		,[MBCOM].SchemeFeeGBP_I2
		,[MBCOM].OCTMCSendGBP_I2
		,[MBCOM].Band1GBP_I2
		,[MBCOM].Band2GBP_I2
		,[MBCOM].Band3GBP_I2
		,[MBCOM].TmvUSD
		,[MBCOM].AtvUSD
		,[MBCOM].MtvUSD
		,[MBCOM].TcrUSD
		,[MBCOM].GexUSD
		,[MBCOM].MDRRateUSD
		,[MBCOM].CreditUSD
		,[MBCOM].DebitUSD
		,[MBCOM].PerDeclineUSD
		,[MBCOM].PerRefundUSD
		,[MBCOM].ChargebackUSD
		,[MBCOM].WireTransferFeeUSD
		,[MBCOM].MinimumTransactionFeeUSD
		,[MBCOM].MinimumSettlementFeeUSD
		,[MBCOM].AnnualRenewalFeeUSD
		,[MBCOM].MinimumWeeklyFeeUSD
		,[MBCOM].RollingReserveUSD
		,[MBCOM].RollingReserveMonthsUSD
		,[MBCOM].FXRateUSD
		,[MBCOM].GatewayProcessingFeeUSD
		,[MBCOM].ProcessorFeeUSD
		,[MBCOM].SetupFeeUSD
		,[MBCOM].SchemeFeeUSD
		,[MBCOM].OCTMCSendUSD
		,[MBCOM].Band1USD
		,[MBCOM].Band2USD
		,[MBCOM].Band3USD
		,[MBCOM].TmvUSD_I1
		,[MBCOM].AtvUSD_I1
		,[MBCOM].MtvUSD_I1
		,[MBCOM].TcrUSD_I1
		,[MBCOM].GexUSD_I1
		,[MBCOM].MDRRateUSD_I1
		,[MBCOM].CreditUSD_I1
		,[MBCOM].DebitUSD_I1
		,[MBCOM].PerDeclineUSD_I1
		,[MBCOM].PerRefundUSD_I1
		,[MBCOM].ChargebackUSD_I1
		,[MBCOM].WireTransferFeeUSD_I1
		,[MBCOM].MinimumTransactionFeeUSD_I1
		,[MBCOM].MinimumSettlementFeeUSD_I1
		,[MBCOM].AnnualRenewalFeeUSD_I1
		,[MBCOM].MinimumWeeklyFeeUSD_I1
		,[MBCOM].RollingReserveUSD_I1
		,[MBCOM].RollingReserveMonthsUSD_I1
		,[MBCOM].FXRateUSD_I1
		,[MBCOM].GatewayProcessingFeeUSD_I1
		,[MBCOM].ProcessorFeeUSD_I1
		,[MBCOM].SetupFeeUSD_I1
		,[MBCOM].SchemeFeeUSD_I1
		,[MBCOM].OCTMCSendUSD_I1
		,[MBCOM].Band1USD_I1
		,[MBCOM].Band2USD_I1
		,[MBCOM].Band3USD_I1
		,[MBCOM].TmvUSD_I2
		,[MBCOM].AtvUSD_I2
		,[MBCOM].MtvUSD_I2
		,[MBCOM].TcrUSD_I2
		,[MBCOM].GexUSD_I2
		,[MBCOM].MDRRateUSD_I2
		,[MBCOM].CreditUSD_I2
		,[MBCOM].DebitUSD_I2
		,[MBCOM].PerDeclineUSD_I2
		,[MBCOM].PerRefundUSD_I2
		,[MBCOM].ChargebackUSD_I2
		,[MBCOM].WireTransferFeeUSD_I2
		,[MBCOM].MinimumTransactionFeeUSD_I2
		,[MBCOM].MinimumSettlementFeeUSD_I2
		,[MBCOM].AnnualRenewalFeeUSD_I2
		,[MBCOM].MinimumWeeklyFeeUSD_I2
		,[MBCOM].RollingReserveUSD_I2
		,[MBCOM].RollingReserveMonthsUSD_I2
		,[MBCOM].FXRateUSD_I2
		,[MBCOM].GatewayProcessingFeeUSD_I2
		,[MBCOM].ProcessorFeeUSD_I2
		,[MBCOM].SetupFeeUSD_I2
		,[MBCOM].SchemeFeeUSD_I2
		,[MBCOM].OCTMCSendUSD_I2
		,[MBCOM].Band1USD_I2
		,[MBCOM].Band2USD_I2
		,[MBCOM].Band3USD_I2
		,[MBCOM].TmvAUD
		,[MBCOM].AtvAUD
		,[MBCOM].MtvAUD
		,[MBCOM].TcrAUD
		,[MBCOM].GexAUD
		,[MBCOM].MDRRateAUD
		,[MBCOM].CreditAUD
		,[MBCOM].DebitAUD
		,[MBCOM].PerDeclineAUD
		,[MBCOM].PerRefundAUD
		,[MBCOM].ChargebackAUD
		,[MBCOM].WireTransferFeeAUD
		,[MBCOM].MinimumTransactionFeeAUD
		,[MBCOM].MinimumSettlementFeeAUD
		,[MBCOM].AnnualRenewalFeeAUD
		,[MBCOM].MinimumWeeklyFeeAUD
		,[MBCOM].RollingReserveAUD
		,[MBCOM].RollingReserveMonthsAUD
		,[MBCOM].FXRateAUD
		,[MBCOM].GatewayProcessingFeeAUD
		,[MBCOM].ProcessorFeeAUD
		,[MBCOM].SetupFeeAUD
		,[MBCOM].SchemeFeeAUD
		,[MBCOM].OCTMCSendAUD
		,[MBCOM].Band1AUD
		,[MBCOM].Band2AUD
		,[MBCOM].Band3AUD
		,[MBCOM].TmvAUD_I1
		,[MBCOM].AtvAUD_I1
		,[MBCOM].MtvAUD_I1
		,[MBCOM].TcrAUD_I1
		,[MBCOM].GexAUD_I1
		,[MBCOM].MDRRateAUD_I1
		,[MBCOM].CreditAUD_I1
		,[MBCOM].DebitAUD_I1
		,[MBCOM].PerDeclineAUD_I1
		,[MBCOM].PerRefundAUD_I1
		,[MBCOM].ChargebackAUD_I1
		,[MBCOM].WireTransferFeeAUD_I1
		,[MBCOM].MinimumTransactionFeeAUD_I1
		,[MBCOM].MinimumSettlementFeeAUD_I1
		,[MBCOM].AnnualRenewalFeeAUD_I1
		,[MBCOM].MinimumWeeklyFeeAUD_I1
		,[MBCOM].RollingReserveAUD_I1
		,[MBCOM].RollingReserveMonthsAUD_I1
		,[MBCOM].FXRateAUD_I1
		,[MBCOM].GatewayProcessingFeeAUD_I1
		,[MBCOM].ProcessorFeeAUD_I1
		,[MBCOM].SetupFeeAUD_I1
		,[MBCOM].SchemeFeeAUD_I1
		,[MBCOM].OCTMCSendAUD_I1
		,[MBCOM].Band1AUD_I1
		,[MBCOM].Band2AUD_I1
		,[MBCOM].Band3AUD_I1
		,[MBCOM].TmvAUD_I2
		,[MBCOM].AtvAUD_I2
		,[MBCOM].MtvAUD_I2
		,[MBCOM].TcrAUD_I2
		,[MBCOM].GexAUD_I2
		,[MBCOM].MDRRateAUD_I2
		,[MBCOM].CreditAUD_I2
		,[MBCOM].DebitAUD_I2
		,[MBCOM].PerDeclineAUD_I2
		,[MBCOM].PerRefundAUD_I2
		,[MBCOM].ChargebackAUD_I2
		,[MBCOM].WireTransferFeeAUD_I2
		,[MBCOM].MinimumTransactionFeeAUD_I2
		,[MBCOM].MinimumSettlementFeeAUD_I2
		,[MBCOM].AnnualRenewalFeeAUD_I2
		,[MBCOM].MinimumWeeklyFeeAUD_I2
		,[MBCOM].RollingReserveAUD_I2
		,[MBCOM].RollingReserveMonthsAUD_I2
		,[MBCOM].FXRateAUD_I2
		,[MBCOM].GatewayProcessingFeeAUD_I2
		,[MBCOM].ProcessorFeeAUD_I2
		,[MBCOM].SetupFeeAUD_I2
		,[MBCOM].SchemeFeeAUD_I2
		,[MBCOM].OCTMCSendAUD_I2
		,[MBCOM].Band1AUD_I2
		,[MBCOM].Band2AUD_I2
		,[MBCOM].Band3AUD_I2
		,[MBCOM].TmvNOK
		,[MBCOM].AtvNOK
		,[MBCOM].MtvNOK
		,[MBCOM].TcrNOK
		,[MBCOM].GexNOK
		,[MBCOM].MDRRateNOK
		,[MBCOM].CreditNOK
		,[MBCOM].DebitNOK
		,[MBCOM].PerDeclineNOK
		,[MBCOM].PerRefundNOK
		,[MBCOM].ChargebackNOK
		,[MBCOM].WireTransferFeeNOK
		,[MBCOM].MinimumTransactionFeeNOK
		,[MBCOM].MinimumSettlementFeeNOK
		,[MBCOM].AnnualRenewalFeeNOK
		,[MBCOM].MinimumWeeklyFeeNOK
		,[MBCOM].RollingReserveNOK
		,[MBCOM].RollingReserveMonthsNOK
		,[MBCOM].FXRateNOK
		,[MBCOM].GatewayProcessingFeeNOK
		,[MBCOM].ProcessorFeeNOK
		,[MBCOM].SetupFeeNOK
		,[MBCOM].SchemeFeeNOK
		,[MBCOM].OCTMCSendNOK
		,[MBCOM].Band1NOK
		,[MBCOM].Band2NOK
		,[MBCOM].Band3NOK
		,[MBCOM].TmvNOK_I1
		,[MBCOM].AtvNOK_I1
		,[MBCOM].MtvNOK_I1
		,[MBCOM].TcrNOK_I1
		,[MBCOM].GexNOK_I1
		,[MBCOM].MDRRateNOK_I1
		,[MBCOM].CreditNOK_I1
		,[MBCOM].DebitNOK_I1
		,[MBCOM].PerDeclineNOK_I1
		,[MBCOM].PerRefundNOK_I1
		,[MBCOM].ChargebackNOK_I1
		,[MBCOM].WireTransferFeeNOK_I1
		,[MBCOM].MinimumTransactionFeeNOK_I1
		,[MBCOM].MinimumSettlementFeeNOK_I1
		,[MBCOM].AnnualRenewalFeeNOK_I1
		,[MBCOM].MinimumWeeklyFeeNOK_I1
		,[MBCOM].RollingReserveNOK_I1
		,[MBCOM].RollingReserveMonthsNOK_I1
		,[MBCOM].FXRateNOK_I1
		,[MBCOM].GatewayProcessingFeeNOK_I1
		,[MBCOM].ProcessorFeeNOK_I1
		,[MBCOM].SetupFeeNOK_I1
		,[MBCOM].SchemeFeeNOK_I1
		,[MBCOM].OCTMCSendNOK_I1
		,[MBCOM].Band1NOK_I1
		,[MBCOM].Band2NOK_I1
		,[MBCOM].Band3NOK_I1
		,[MBCOM].TmvNOK_I2
		,[MBCOM].AtvNOK_I2
		,[MBCOM].MtvNOK_I2
		,[MBCOM].TcrNOK_I2
		,[MBCOM].GexNOK_I2
		,[MBCOM].MDRRateNOK_I2
		,[MBCOM].CreditNOK_I2
		,[MBCOM].DebitNOK_I2
		,[MBCOM].PerDeclineNOK_I2
		,[MBCOM].PerRefundNOK_I2
		,[MBCOM].ChargebackNOK_I2
		,[MBCOM].WireTransferFeeNOK_I2
		,[MBCOM].MinimumTransactionFeeNOK_I2
		,[MBCOM].MinimumSettlementFeeNOK_I2
		,[MBCOM].AnnualRenewalFeeNOK_I2
		,[MBCOM].MinimumWeeklyFeeNOK_I2
		,[MBCOM].RollingReserveNOK_I2
		,[MBCOM].RollingReserveMonthsNOK_I2
		,[MBCOM].FXRateNOK_I2
		,[MBCOM].GatewayProcessingFeeNOK_I2
		,[MBCOM].ProcessorFeeNOK_I2
		,[MBCOM].SetupFeeNOK_I2
		,[MBCOM].SchemeFeeNOK_I2
		,[MBCOM].OCTMCSendNOK_I2
		,[MBCOM].Band1NOK_I2
		,[MBCOM].Band2NOK_I2
		,[MBCOM].Band3NOK_I2
		,[MBCOM].Introducer1Id, [I1].NameSurname AS Introducer1NameSurname
		,[MBCOM].Introducer2Id, [I2].NameSurname AS Introducer2NameSurname
	    ,[MBCOM].DateCreated
	    ,[MBCOM].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_Commercials [MBCOM]
		LEFT JOIN MerchantBoarding [MB] ON [MB].Id = [MBCOM].MBId
		LEFT JOIN Introducer [I1] ON [I1].Id = [MBCOM].Introducer1Id
		LEFT JOIN Introducer [I2] ON [I2].Id = [MBCOM].Introducer2Id
		LEFT JOIN [User] [U] ON [U].Id = [MBCOM].MBId 
	WHERE  
	 ([MB].LegalName LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
	AND [MBCOM].MBId = [MB].Id
	AND [MBCOM].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MB_COMMERCIALS_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_COMMERCIALS_UPDATE]
 @MBId	INT	
,@IsTrafficAvailable	int	
,@WhenVolumesRampUp	datetime	
,@TmvEUR	decimal(18, 2)	
,@AtvEUR	decimal(18, 2)	
,@MtvEUR	decimal(18, 2)	
,@TcrEUR	decimal(18, 2)	
,@GexEUR	decimal(18, 2)	
,@MDRRateEUR	decimal(18, 2)	
,@CreditEUR	decimal(18, 2)	
,@DebitEUR	decimal(18, 2)	
,@PerDeclineEUR	decimal(18, 2)	
,@PerRefundEUR	decimal(18, 2)	
,@ChargebackEUR	decimal(18, 2)	
,@WireTransferFeeEUR	decimal(18, 2)	
,@MinimumTransactionFeeEUR	decimal(18, 2)	
,@MinimumSettlementFeeEUR	decimal(18, 2)	
,@AnnualRenewalFeeEUR	decimal(18, 2)	
,@MinimumWeeklyFeeEUR	decimal(18, 2)	
,@RollingReserveEUR	decimal(18, 2)	
,@RollingReserveMonthsEUR	int	
,@FXRateEUR	decimal(18, 2)	
,@GatewayProcessingFeeEUR	decimal(18, 2)	
,@ProcessorFeeEUR	decimal(18, 2)	
,@SetupFeeEUR	decimal(18, 2)	
,@SchemeFeeEUR	decimal(18, 2)	
,@OCTMCSendEUR	decimal(18, 2)	
,@Band1EUR	decimal(18, 2)	
,@Band2EUR	decimal(18, 2)	
,@Band3EUR	decimal(18, 2)	
,@TmvEUR_I1	decimal(18, 2)	
,@AtvEUR_I1	decimal(18, 2)	
,@MtvEUR_I1	decimal(18, 2)	
,@TcrEUR_I1	decimal(18, 2)	
,@GexEUR_I1	decimal(18, 2)	
,@MDRRateEUR_I1	decimal(18, 2)	
,@CreditEUR_I1	decimal(18, 2)	
,@DebitEUR_I1	decimal(18, 2)	
,@PerDeclineEUR_I1	decimal(18, 2)	
,@PerRefundEUR_I1	decimal(18, 2)	
,@ChargebackEUR_I1	decimal(18, 2)	
,@WireTransferFeeEUR_I1	decimal(18, 2)	
,@MinimumTransactionFeeEUR_I1	decimal(18, 2)	
,@MinimumSettlementFeeEUR_I1	decimal(18, 2)	
,@AnnualRenewalFeeEUR_I1	decimal(18, 2)	
,@MinimumWeeklyFeeEUR_I1	decimal(18, 2)	
,@RollingReserveEUR_I1	decimal(18, 2)	
,@RollingReserveMonthsEUR_I1	int	
,@FXRateEUR_I1	decimal(18, 2)	
,@GatewayProcessingFeeEUR_I1	decimal(18, 2)	
,@ProcessorFeeEUR_I1	decimal(18, 2)	
,@SetupFeeEUR_I1	decimal(18, 2)	
,@SchemeFeeEUR_I1	decimal(18, 2)	
,@OCTMCSendEUR_I1	decimal(18, 2)	
,@Band1EUR_I1	decimal(18, 2)	
,@Band2EUR_I1	decimal(18, 2)	
,@Band3EUR_I1	decimal(18, 2)	
,@TmvEUR_I2	decimal(18, 2)	
,@AtvEUR_I2	decimal(18, 2)	
,@MtvEUR_I2	decimal(18, 2)	
,@TcrEUR_I2	decimal(18, 2)	
,@GexEUR_I2	decimal(18, 2)	
,@MDRRateEUR_I2	decimal(18, 2)	
,@CreditEUR_I2	decimal(18, 2)	
,@DebitEUR_I2	decimal(18, 2)	
,@PerDeclineEUR_I2	decimal(18, 2)	
,@PerRefundEUR_I2	decimal(18, 2)	
,@ChargebackEUR_I2	decimal(18, 2)	
,@WireTransferFeeEUR_I2	decimal(18, 2)	
,@MinimumTransactionFeeEUR_I2	decimal(18, 2)	
,@MinimumSettlementFeeEUR_I2	decimal(18, 2)	
,@AnnualRenewalFeeEUR_I2	decimal(18, 2)	
,@MinimumWeeklyFeeEUR_I2	decimal(18, 2)	
,@RollingReserveEUR_I2	decimal(18, 2)	
,@RollingReserveMonthsEUR_I2	int	
,@FXRateEUR_I2	decimal(18, 2)	
,@GatewayProcessingFeeEUR_I2	decimal(18, 2)	
,@ProcessorFeeEUR_I2	decimal(18, 2)	
,@SetupFeeEUR_I2	decimal(18, 2)	
,@SchemeFeeEUR_I2	decimal(18, 2)	
,@OCTMCSendEUR_I2	decimal(18, 2)	
,@Band1EUR_I2	decimal(18, 2)	
,@Band2EUR_I2	decimal(18, 2)	
,@Band3EUR_I2	decimal(18, 2)	

,@TmvGBP	decimal(18, 2)	
,@AtvGBP	decimal(18, 2)	
,@MtvGBP	decimal(18, 2)	
,@TcrGBP	decimal(18, 2)	
,@GexGBP	decimal(18, 2)	
,@MDRRateGBP	decimal(18, 2)	
,@CreditGBP	decimal(18, 2)	
,@DebitGBP	decimal(18, 2)	
,@PerDeclineGBP	decimal(18, 2)	
,@PerRefundGBP	decimal(18, 2)	
,@ChargebackGBP	decimal(18, 2)	
,@WireTransferFeeGBP	decimal(18, 2)	
,@MinimumTransactionFeeGBP	decimal(18, 2)	
,@MinimumSettlementFeeGBP	decimal(18, 2)	
,@AnnualRenewalFeeGBP	decimal(18, 2)	
,@MinimumWeeklyFeeGBP	decimal(18, 2)	
,@RollingReserveGBP	decimal(18, 2)	
,@RollingReserveMonthsGBP	int	
,@FXRateGBP	decimal(18, 2)	
,@GatewayProcessingFeeGBP	decimal(18, 2)	
,@ProcessorFeeGBP	decimal(18, 2)	
,@SetupFeeGBP	decimal(18, 2)	
,@SchemeFeeGBP	decimal(18, 2)	
,@OCTMCSendGBP	decimal(18, 2)	
,@Band1GBP	decimal(18, 2)	
,@Band2GBP	decimal(18, 2)	
,@Band3GBP	decimal(18, 2)	
,@TmvGBP_I1	decimal(18, 2)	
,@AtvGBP_I1	decimal(18, 2)	
,@MtvGBP_I1	decimal(18, 2)	
,@TcrGBP_I1	decimal(18, 2)	
,@GexGBP_I1	decimal(18, 2)	
,@MDRRateGBP_I1	decimal(18, 2)	
,@CreditGBP_I1	decimal(18, 2)	
,@DebitGBP_I1	decimal(18, 2)	
,@PerDeclineGBP_I1	decimal(18, 2)	
,@PerRefundGBP_I1	decimal(18, 2)	
,@ChargebackGBP_I1	decimal(18, 2)	
,@WireTransferFeeGBP_I1	decimal(18, 2)	
,@MinimumTransactionFeeGBP_I1	decimal(18, 2)	
,@MinimumSettlementFeeGBP_I1	decimal(18, 2)	
,@AnnualRenewalFeeGBP_I1	decimal(18, 2)	
,@MinimumWeeklyFeeGBP_I1	decimal(18, 2)	
,@RollingReserveGBP_I1	decimal(18, 2)	
,@RollingReserveMonthsGBP_I1	int	
,@FXRateGBP_I1	decimal(18, 2)	
,@GatewayProcessingFeeGBP_I1	decimal(18, 2)	
,@ProcessorFeeGBP_I1	decimal(18, 2)	
,@SetupFeeGBP_I1	decimal(18, 2)	
,@SchemeFeeGBP_I1	decimal(18, 2)	
,@OCTMCSendGBP_I1	decimal(18, 2)	
,@Band1GBP_I1	decimal(18, 2)	
,@Band2GBP_I1	decimal(18, 2)	
,@Band3GBP_I1	decimal(18, 2)	
,@TmvGBP_I2	decimal(18, 2)	
,@AtvGBP_I2	decimal(18, 2)	
,@MtvGBP_I2	decimal(18, 2)	
,@TcrGBP_I2	decimal(18, 2)	
,@GexGBP_I2	decimal(18, 2)	
,@MDRRateGBP_I2	decimal(18, 2)	
,@CreditGBP_I2	decimal(18, 2)	
,@DebitGBP_I2	decimal(18, 2)	
,@PerDeclineGBP_I2	decimal(18, 2)	
,@PerRefundGBP_I2	decimal(18, 2)	
,@ChargebackGBP_I2	decimal(18, 2)	
,@WireTransferFeeGBP_I2	decimal(18, 2)	
,@MinimumTransactionFeeGBP_I2	decimal(18, 2)	
,@MinimumSettlementFeeGBP_I2	decimal(18, 2)	
,@AnnualRenewalFeeGBP_I2	decimal(18, 2)	
,@MinimumWeeklyFeeGBP_I2	decimal(18, 2)	
,@RollingReserveGBP_I2	decimal(18, 2)	
,@RollingReserveMonthsGBP_I2	int	
,@FXRateGBP_I2	decimal(18, 2)	
,@GatewayProcessingFeeGBP_I2	decimal(18, 2)	
,@ProcessorFeeGBP_I2	decimal(18, 2)	
,@SetupFeeGBP_I2	decimal(18, 2)	
,@SchemeFeeGBP_I2	decimal(18, 2)	
,@OCTMCSendGBP_I2	decimal(18, 2)	
,@Band1GBP_I2	decimal(18, 2)	
,@Band2GBP_I2	decimal(18, 2)	
,@Band3GBP_I2	decimal(18, 2)	

,@TmvUSD	decimal(18, 2)	
,@AtvUSD	decimal(18, 2)	
,@MtvUSD	decimal(18, 2)	
,@TcrUSD	decimal(18, 2)	
,@GexUSD	decimal(18, 2)	
,@MDRRateUSD	decimal(18, 2)	
,@CreditUSD	decimal(18, 2)	
,@DebitUSD	decimal(18, 2)	
,@PerDeclineUSD	decimal(18, 2)	
,@PerRefundUSD	decimal(18, 2)	
,@ChargebackUSD	decimal(18, 2)	
,@WireTransferFeeUSD	decimal(18, 2)	
,@MinimumTransactionFeeUSD	decimal(18, 2)	
,@MinimumSettlementFeeUSD	decimal(18, 2)	
,@AnnualRenewalFeeUSD	decimal(18, 2)	
,@MinimumWeeklyFeeUSD	decimal(18, 2)	
,@RollingReserveUSD	decimal(18, 2)	
,@RollingReserveMonthsUSD	int	
,@FXRateUSD	decimal(18, 2)	
,@GatewayProcessingFeeUSD	decimal(18, 2)	
,@ProcessorFeeUSD	decimal(18, 2)	
,@SetupFeeUSD	decimal(18, 2)	
,@SchemeFeeUSD	decimal(18, 2)	
,@OCTMCSendUSD	decimal(18, 2)	
,@Band1USD	decimal(18, 2)	
,@Band2USD	decimal(18, 2)	
,@Band3USD	decimal(18, 2)	
,@TmvUSD_I1	decimal(18, 2)	
,@AtvUSD_I1	decimal(18, 2)	
,@MtvUSD_I1	decimal(18, 2)	
,@TcrUSD_I1	decimal(18, 2)	
,@GexUSD_I1	decimal(18, 2)	
,@MDRRateUSD_I1	decimal(18, 2)	
,@CreditUSD_I1	decimal(18, 2)	
,@DebitUSD_I1	decimal(18, 2)	
,@PerDeclineUSD_I1	decimal(18, 2)	
,@PerRefundUSD_I1	decimal(18, 2)	
,@ChargebackUSD_I1	decimal(18, 2)	
,@WireTransferFeeUSD_I1	decimal(18, 2)	
,@MinimumTransactionFeeUSD_I1	decimal(18, 2)	
,@MinimumSettlementFeeUSD_I1	decimal(18, 2)	
,@AnnualRenewalFeeUSD_I1	decimal(18, 2)	
,@MinimumWeeklyFeeUSD_I1	decimal(18, 2)	
,@RollingReserveUSD_I1	decimal(18, 2)	
,@RollingReserveMonthsUSD_I1	int	
,@FXRateUSD_I1	decimal(18, 2)	
,@GatewayProcessingFeeUSD_I1	decimal(18, 2)	
,@ProcessorFeeUSD_I1	decimal(18, 2)	
,@SetupFeeUSD_I1	decimal(18, 2)	
,@SchemeFeeUSD_I1	decimal(18, 2)	
,@OCTMCSendUSD_I1	decimal(18, 2)	
,@Band1USD_I1	decimal(18, 2)	
,@Band2USD_I1	decimal(18, 2)	
,@Band3USD_I1	decimal(18, 2)	
,@TmvUSD_I2	decimal(18, 2)	
,@AtvUSD_I2	decimal(18, 2)	
,@MtvUSD_I2	decimal(18, 2)	
,@TcrUSD_I2	decimal(18, 2)	
,@GexUSD_I2	decimal(18, 2)	
,@MDRRateUSD_I2	decimal(18, 2)	
,@CreditUSD_I2	decimal(18, 2)	
,@DebitUSD_I2	decimal(18, 2)	
,@PerDeclineUSD_I2	decimal(18, 2)	
,@PerRefundUSD_I2	decimal(18, 2)	
,@ChargebackUSD_I2	decimal(18, 2)	
,@WireTransferFeeUSD_I2	decimal(18, 2)	
,@MinimumTransactionFeeUSD_I2	decimal(18, 2)	
,@MinimumSettlementFeeUSD_I2	decimal(18, 2)	
,@AnnualRenewalFeeUSD_I2	decimal(18, 2)	
,@MinimumWeeklyFeeUSD_I2	decimal(18, 2)	
,@RollingReserveUSD_I2	decimal(18, 2)	
,@RollingReserveMonthsUSD_I2	int	
,@FXRateUSD_I2	decimal(18, 2)	
,@GatewayProcessingFeeUSD_I2	decimal(18, 2)	
,@ProcessorFeeUSD_I2	decimal(18, 2)	
,@SetupFeeUSD_I2	decimal(18, 2)	
,@SchemeFeeUSD_I2	decimal(18, 2)	
,@OCTMCSendUSD_I2	decimal(18, 2)	
,@Band1USD_I2	decimal(18, 2)	
,@Band2USD_I2	decimal(18, 2)	
,@Band3USD_I2	decimal(18, 2)	

,@TmvAUD	decimal(18, 2)	
,@AtvAUD	decimal(18, 2)	
,@MtvAUD	decimal(18, 2)	
,@TcrAUD	decimal(18, 2)	
,@GexAUD	decimal(18, 2)	
,@MDRRateAUD	decimal(18, 2)	
,@CreditAUD	decimal(18, 2)	
,@DebitAUD	decimal(18, 2)	
,@PerDeclineAUD	decimal(18, 2)	
,@PerRefundAUD	decimal(18, 2)	
,@ChargebackAUD	decimal(18, 2)	
,@WireTransferFeeAUD	decimal(18, 2)	
,@MinimumTransactionFeeAUD	decimal(18, 2)	
,@MinimumSettlementFeeAUD	decimal(18, 2)	
,@AnnualRenewalFeeAUD	decimal(18, 2)	
,@MinimumWeeklyFeeAUD	decimal(18, 2)	
,@RollingReserveAUD	decimal(18, 2)	
,@RollingReserveMonthsAUD	int	
,@FXRateAUD	decimal(18, 2)	
,@GatewayProcessingFeeAUD	decimal(18, 2)	
,@ProcessorFeeAUD	decimal(18, 2)	
,@SetupFeeAUD	decimal(18, 2)	
,@SchemeFeeAUD	decimal(18, 2)	
,@OCTMCSendAUD	decimal(18, 2)	
,@Band1AUD	decimal(18, 2)	
,@Band2AUD	decimal(18, 2)	
,@Band3AUD	decimal(18, 2)	
,@TmvAUD_I1	decimal(18, 2)	
,@AtvAUD_I1	decimal(18, 2)	
,@MtvAUD_I1	decimal(18, 2)	
,@TcrAUD_I1	decimal(18, 2)	
,@GexAUD_I1	decimal(18, 2)	
,@MDRRateAUD_I1	decimal(18, 2)	
,@CreditAUD_I1	decimal(18, 2)	
,@DebitAUD_I1	decimal(18, 2)	
,@PerDeclineAUD_I1	decimal(18, 2)	
,@PerRefundAUD_I1	decimal(18, 2)	
,@ChargebackAUD_I1	decimal(18, 2)	
,@WireTransferFeeAUD_I1	decimal(18, 2)	
,@MinimumTransactionFeeAUD_I1	decimal(18, 2)	
,@MinimumSettlementFeeAUD_I1	decimal(18, 2)	
,@AnnualRenewalFeeAUD_I1	decimal(18, 2)	
,@MinimumWeeklyFeeAUD_I1	decimal(18, 2)	
,@RollingReserveAUD_I1	decimal(18, 2)	
,@RollingReserveMonthsAUD_I1	int	
,@FXRateAUD_I1	decimal(18, 2)	
,@GatewayProcessingFeeAUD_I1	decimal(18, 2)	
,@ProcessorFeeAUD_I1	decimal(18, 2)	
,@SetupFeeAUD_I1	decimal(18, 2)	
,@SchemeFeeAUD_I1	decimal(18, 2)	
,@OCTMCSendAUD_I1	decimal(18, 2)	
,@Band1AUD_I1	decimal(18, 2)	
,@Band2AUD_I1	decimal(18, 2)	
,@Band3AUD_I1	decimal(18, 2)	
,@TmvAUD_I2	decimal(18, 2)	
,@AtvAUD_I2	decimal(18, 2)	
,@MtvAUD_I2	decimal(18, 2)	
,@TcrAUD_I2	decimal(18, 2)	
,@GexAUD_I2	decimal(18, 2)	
,@MDRRateAUD_I2	decimal(18, 2)	
,@CreditAUD_I2	decimal(18, 2)	
,@DebitAUD_I2	decimal(18, 2)	
,@PerDeclineAUD_I2	decimal(18, 2)	
,@PerRefundAUD_I2	decimal(18, 2)	
,@ChargebackAUD_I2	decimal(18, 2)	
,@WireTransferFeeAUD_I2	decimal(18, 2)	
,@MinimumTransactionFeeAUD_I2	decimal(18, 2)	
,@MinimumSettlementFeeAUD_I2	decimal(18, 2)	
,@AnnualRenewalFeeAUD_I2	decimal(18, 2)	
,@MinimumWeeklyFeeAUD_I2	decimal(18, 2)	
,@RollingReserveAUD_I2	decimal(18, 2)	
,@RollingReserveMonthsAUD_I2	int	
,@FXRateAUD_I2	decimal(18, 2)	
,@GatewayProcessingFeeAUD_I2	decimal(18, 2)	
,@ProcessorFeeAUD_I2	decimal(18, 2)	
,@SetupFeeAUD_I2	decimal(18, 2)	
,@SchemeFeeAUD_I2	decimal(18, 2)	
,@OCTMCSendAUD_I2	decimal(18, 2)	
,@Band1AUD_I2	decimal(18, 2)	
,@Band2AUD_I2	decimal(18, 2)	
,@Band3AUD_I2	decimal(18, 2)	

,@TmvNOK	decimal(18, 2)	
,@AtvNOK	decimal(18, 2)	
,@MtvNOK	decimal(18, 2)	
,@TcrNOK	decimal(18, 2)	
,@GexNOK	decimal(18, 2)	
,@MDRRateNOK	decimal(18, 2)	
,@CreditNOK	decimal(18, 2)	
,@DebitNOK	decimal(18, 2)	
,@PerDeclineNOK	decimal(18, 2)	
,@PerRefundNOK	decimal(18, 2)	
,@ChargebackNOK	decimal(18, 2)	
,@WireTransferFeeNOK	decimal(18, 2)	
,@MinimumTransactionFeeNOK	decimal(18, 2)	
,@MinimumSettlementFeeNOK	decimal(18, 2)	
,@AnnualRenewalFeeNOK	decimal(18, 2)	
,@MinimumWeeklyFeeNOK	decimal(18, 2)	
,@RollingReserveNOK	decimal(18, 2)	
,@RollingReserveMonthsNOK	int	
,@FXRateNOK	decimal(18, 2)	
,@GatewayProcessingFeeNOK	decimal(18, 2)	
,@ProcessorFeeNOK	decimal(18, 2)	
,@SetupFeeNOK	decimal(18, 2)	
,@SchemeFeeNOK	decimal(18, 2)	
,@OCTMCSendNOK	decimal(18, 2)	
,@Band1NOK	decimal(18, 2)	
,@Band2NOK	decimal(18, 2)	
,@Band3NOK	decimal(18, 2)	
,@TmvNOK_I1	decimal(18, 2)	
,@AtvNOK_I1	decimal(18, 2)	
,@MtvNOK_I1	decimal(18, 2)	
,@TcrNOK_I1	decimal(18, 2)	
,@GexNOK_I1	decimal(18, 2)	
,@MDRRateNOK_I1	decimal(18, 2)	
,@CreditNOK_I1	decimal(18, 2)	
,@DebitNOK_I1	decimal(18, 2)	
,@PerDeclineNOK_I1	decimal(18, 2)	
,@PerRefundNOK_I1	decimal(18, 2)	
,@ChargebackNOK_I1	decimal(18, 2)	
,@WireTransferFeeNOK_I1	decimal(18, 2)	
,@MinimumTransactionFeeNOK_I1	decimal(18, 2)	
,@MinimumSettlementFeeNOK_I1	decimal(18, 2)	
,@AnnualRenewalFeeNOK_I1	decimal(18, 2)	
,@MinimumWeeklyFeeNOK_I1	decimal(18, 2)	
,@RollingReserveNOK_I1	decimal(18, 2)	
,@RollingReserveMonthsNOK_I1	int	
,@FXRateNOK_I1	decimal(18, 2)	
,@GatewayProcessingFeeNOK_I1	decimal(18, 2)	
,@ProcessorFeeNOK_I1	decimal(18, 2)	
,@SetupFeeNOK_I1	decimal(18, 2)	
,@SchemeFeeNOK_I1	decimal(18, 2)	
,@OCTMCSendNOK_I1	decimal(18, 2)	
,@Band1NOK_I1	decimal(18, 2)	
,@Band2NOK_I1	decimal(18, 2)	
,@Band3NOK_I1	decimal(18, 2)	
,@TmvNOK_I2	decimal(18, 2)	
,@AtvNOK_I2	decimal(18, 2)	
,@MtvNOK_I2	decimal(18, 2)	
,@TcrNOK_I2	decimal(18, 2)	
,@GexNOK_I2	decimal(18, 2)	
,@MDRRateNOK_I2	decimal(18, 2)	
,@CreditNOK_I2	decimal(18, 2)	
,@DebitNOK_I2	decimal(18, 2)	
,@PerDeclineNOK_I2	decimal(18, 2)	
,@PerRefundNOK_I2	decimal(18, 2)	
,@ChargebackNOK_I2	decimal(18, 2)	
,@WireTransferFeeNOK_I2	decimal(18, 2)	
,@MinimumTransactionFeeNOK_I2	decimal(18, 2)	
,@MinimumSettlementFeeNOK_I2	decimal(18, 2)	
,@AnnualRenewalFeeNOK_I2	decimal(18, 2)	
,@MinimumWeeklyFeeNOK_I2	decimal(18, 2)	
,@RollingReserveNOK_I2	decimal(18, 2)	
,@RollingReserveMonthsNOK_I2	int	
,@FXRateNOK_I2	decimal(18, 2)	
,@GatewayProcessingFeeNOK_I2	decimal(18, 2)	
,@ProcessorFeeNOK_I2	decimal(18, 2)	
,@SetupFeeNOK_I2	decimal(18, 2)	
,@SchemeFeeNOK_I2	decimal(18, 2)	
,@OCTMCSendNOK_I2	decimal(18, 2)	
,@Band1NOK_I2	decimal(18, 2)	
,@Band2NOK_I2	decimal(18, 2)	
,@Band3NOK_I2	decimal(18, 2)
,@Introducer1Id	int
,@Introducer2Id	int
AS
BEGIN
   UPDATE MB_Commercials SET 	
		 IsTrafficAvailable = @IsTrafficAvailable		
		,WhenVolumesRampUp = @WhenVolumesRampUp	
			
		,TmvEUR = @TmvEUR		
		,AtvEUR = @AtvEUR		
		,MtvEUR = @MtvEUR		
		,TcrEUR = @TcrEUR		
		,GexEUR = @GexEUR		
		,MDRRateEUR = @MDRRateEUR		
		,CreditEUR = @CreditEUR		
		,DebitEUR = @DebitEUR		
		,PerDeclineEUR = @PerDeclineEUR		
		,PerRefundEUR = @PerRefundEUR		
		,ChargebackEUR = @ChargebackEUR		
		,WireTransferFeeEUR = @WireTransferFeeEUR		
		,MinimumTransactionFeeEUR = @MinimumTransactionFeeEUR		
		,MinimumSettlementFeeEUR = @MinimumSettlementFeeEUR		
		,AnnualRenewalFeeEUR = @AnnualRenewalFeeEUR		
		,MinimumWeeklyFeeEUR = @MinimumWeeklyFeeEUR		
		,RollingReserveEUR = @RollingReserveEUR		
		,RollingReserveMonthsEUR = @RollingReserveMonthsEUR		
		,FXRateEUR = @FXRateEUR		
		,GatewayProcessingFeeEUR = @GatewayProcessingFeeEUR		
		,ProcessorFeeEUR = @ProcessorFeeEUR		
		,SetupFeeEUR = @SetupFeeEUR		
		,SchemeFeeEUR = @SchemeFeeEUR		
		,OCTMCSendEUR = @OCTMCSendEUR		
		,Band1EUR = @Band1EUR		
		,Band2EUR = @Band2EUR		
		,Band3EUR =  @Band3EUR		
		,TmvEUR_I1 = @TmvEUR_I1		
		,AtvEUR_I1 = @AtvEUR_I1		
		,MtvEUR_I1 = @MtvEUR_I1		
		,TcrEUR_I1 = @TcrEUR_I1		
		,GexEUR_I1 = @GexEUR_I1		
		,MDRRateEUR_I1 = @MDRRateEUR_I1		
		,CreditEUR_I1 = @CreditEUR_I1		
		,DebitEUR_I1 = @DebitEUR_I1		
		,PerDeclineEUR_I1 = @PerDeclineEUR_I1		
		,PerRefundEUR_I1 = @PerRefundEUR_I1		
		,ChargebackEUR_I1 = @ChargebackEUR_I1		
		,WireTransferFeeEUR_I1 = @WireTransferFeeEUR_I1		
		,MinimumTransactionFeeEUR_I1 = @MinimumTransactionFeeEUR_I1		
		,MinimumSettlementFeeEUR_I1	= @MinimumSettlementFeeEUR_I1		
		,AnnualRenewalFeeEUR_I1	= @AnnualRenewalFeeEUR_I1		
		,MinimumWeeklyFeeEUR_I1 = @MinimumWeeklyFeeEUR_I1		
		,RollingReserveEUR_I1 = @RollingReserveEUR_I1		
		,RollingReserveMonthsEUR_I1= @RollingReserveMonthsEUR_I1		
		,FXRateEUR_I1 = @FXRateEUR_I1		
		,GatewayProcessingFeeEUR_I1	= @GatewayProcessingFeeEUR_I1		
		,ProcessorFeeEUR_I1	= @ProcessorFeeEUR_I1		
		,SetupFeeEUR_I1 = @SetupFeeEUR_I1		
		,SchemeFeeEUR_I1 = @SchemeFeeEUR_I1		
		,OCTMCSendEUR_I1 = @OCTMCSendEUR_I1		
		,Band1EUR_I1 = @Band1EUR_I1		
		,Band2EUR_I1 = @Band2EUR_I1		
		,Band3EUR_I1 = @Band3EUR_I1		
		,TmvEUR_I2 = @TmvEUR_I2		
		,AtvEUR_I2 = @AtvEUR_I2		
		,MtvEUR_I2 = @MtvEUR_I2		
		,TcrEUR_I2 = @TcrEUR_I2		
		,GexEUR_I2 = @GexEUR_I2		
		,MDRRateEUR_I2 = @MDRRateEUR_I2		
		,CreditEUR_I2 = @CreditEUR_I2		
		,DebitEUR_I2 = @DebitEUR_I2		
		,PerDeclineEUR_I2 = @PerDeclineEUR_I2		
		,PerRefundEUR_I2 = @PerRefundEUR_I2		
		,ChargebackEUR_I2 = @ChargebackEUR_I2		
		,WireTransferFeeEUR_I2 = @WireTransferFeeEUR_I2		
		,MinimumTransactionFeeEUR_I2 = @MinimumTransactionFeeEUR_I2		
		,MinimumSettlementFeeEUR_I2	= @MinimumSettlementFeeEUR_I2		
		,AnnualRenewalFeeEUR_I2	= @AnnualRenewalFeeEUR_I2		
		,MinimumWeeklyFeeEUR_I2	= @MinimumWeeklyFeeEUR_I2		
		,RollingReserveEUR_I2 = @RollingReserveEUR_I2		
		,RollingReserveMonthsEUR_I2 = @RollingReserveMonthsEUR_I2		
		,FXRateEUR_I2 = @FXRateEUR_I2		
		,GatewayProcessingFeeEUR_I2	= @GatewayProcessingFeeEUR_I2		
		,ProcessorFeeEUR_I2	= @ProcessorFeeEUR_I2		
		,SetupFeeEUR_I2	= @SetupFeeEUR_I2		
		,SchemeFeeEUR_I2 = @SchemeFeeEUR_I2		
		,OCTMCSendEUR_I2 = @OCTMCSendEUR_I2		
		,Band1EUR_I2 = @Band1EUR_I2		
		,Band2EUR_I2 = @Band2EUR_I2		
		,Band3EUR_I2 = @Band3EUR_I2		

		,TmvGBP = @TmvGBP		
		,AtvGBP = @AtvGBP		
		,MtvGBP = @MtvGBP		
		,TcrGBP = @TcrGBP		
		,GexGBP = @GexGBP		
		,MDRRateGBP = @MDRRateGBP		
		,CreditGBP = @CreditGBP		
		,DebitGBP = @DebitGBP		
		,PerDeclineGBP = @PerDeclineGBP		
		,PerRefundGBP = @PerRefundGBP		
		,ChargebackGBP = @ChargebackGBP		
		,WireTransferFeeGBP = @WireTransferFeeGBP		
		,MinimumTransactionFeeGBP = @MinimumTransactionFeeGBP		
		,MinimumSettlementFeeGBP = @MinimumSettlementFeeGBP		
		,AnnualRenewalFeeGBP = @AnnualRenewalFeeGBP		
		,MinimumWeeklyFeeGBP = @MinimumWeeklyFeeGBP		
		,RollingReserveGBP = @RollingReserveGBP		
		,RollingReserveMonthsGBP = @RollingReserveMonthsGBP		
		,FXRateGBP = @FXRateGBP		
		,GatewayProcessingFeeGBP = @GatewayProcessingFeeGBP		
		,ProcessorFeeGBP = @ProcessorFeeGBP		
		,SetupFeeGBP = @SetupFeeGBP		
		,SchemeFeeGBP = @SchemeFeeGBP		
		,OCTMCSendGBP = @OCTMCSendGBP		
		,Band1GBP = @Band1GBP		
		,Band2GBP = @Band2GBP		
		,Band3GBP =  @Band3GBP		
		,TmvGBP_I1 = @TmvGBP_I1		
		,AtvGBP_I1 = @AtvGBP_I1		
		,MtvGBP_I1 = @MtvGBP_I1		
		,TcrGBP_I1 = @TcrGBP_I1		
		,GexGBP_I1 = @GexGBP_I1		
		,MDRRateGBP_I1 = @MDRRateGBP_I1		
		,CreditGBP_I1 = @CreditGBP_I1		
		,DebitGBP_I1 = @DebitGBP_I1		
		,PerDeclineGBP_I1 = @PerDeclineGBP_I1		
		,PerRefundGBP_I1 = @PerRefundGBP_I1		
		,ChargebackGBP_I1 = @ChargebackGBP_I1		
		,WireTransferFeeGBP_I1 = @WireTransferFeeGBP_I1		
		,MinimumTransactionFeeGBP_I1 = @MinimumTransactionFeeGBP_I1		
		,MinimumSettlementFeeGBP_I1	= @MinimumSettlementFeeGBP_I1		
		,AnnualRenewalFeeGBP_I1	= @AnnualRenewalFeeGBP_I1		
		,MinimumWeeklyFeeGBP_I1 = @MinimumWeeklyFeeGBP_I1		
		,RollingReserveGBP_I1 = @RollingReserveGBP_I1		
		,RollingReserveMonthsGBP_I1= @RollingReserveMonthsGBP_I1		
		,FXRateGBP_I1 = @FXRateGBP_I1		
		,GatewayProcessingFeeGBP_I1	= @GatewayProcessingFeeGBP_I1		
		,ProcessorFeeGBP_I1	= @ProcessorFeeGBP_I1		
		,SetupFeeGBP_I1 = @SetupFeeGBP_I1		
		,SchemeFeeGBP_I1 = @SchemeFeeGBP_I1		
		,OCTMCSendGBP_I1 = @OCTMCSendGBP_I1		
		,Band1GBP_I1 = @Band1GBP_I1		
		,Band2GBP_I1 = @Band2GBP_I1		
		,Band3GBP_I1 = @Band3GBP_I1		
		,TmvGBP_I2 = @TmvGBP_I2		
		,AtvGBP_I2 = @AtvGBP_I2		
		,MtvGBP_I2 = @MtvGBP_I2		
		,TcrGBP_I2 = @TcrGBP_I2		
		,GexGBP_I2 = @GexGBP_I2		
		,MDRRateGBP_I2 = @MDRRateGBP_I2		
		,CreditGBP_I2 = @CreditGBP_I2		
		,DebitGBP_I2 = @DebitGBP_I2		
		,PerDeclineGBP_I2 = @PerDeclineGBP_I2		
		,PerRefundGBP_I2 = @PerRefundGBP_I2		
		,ChargebackGBP_I2 = @ChargebackGBP_I2		
		,WireTransferFeeGBP_I2 = @WireTransferFeeGBP_I2		
		,MinimumTransactionFeeGBP_I2 = @MinimumTransactionFeeGBP_I2		
		,MinimumSettlementFeeGBP_I2	= @MinimumSettlementFeeGBP_I2		
		,AnnualRenewalFeeGBP_I2	= @AnnualRenewalFeeGBP_I2		
		,MinimumWeeklyFeeGBP_I2	= @MinimumWeeklyFeeGBP_I2		
		,RollingReserveGBP_I2 = @RollingReserveGBP_I2		
		,RollingReserveMonthsGBP_I2 = @RollingReserveMonthsGBP_I2		
		,FXRateGBP_I2 = @FXRateGBP_I2		
		,GatewayProcessingFeeGBP_I2	= @GatewayProcessingFeeGBP_I2		
		,ProcessorFeeGBP_I2	= @ProcessorFeeGBP_I2		
		,SetupFeeGBP_I2	= @SetupFeeGBP_I2		
		,SchemeFeeGBP_I2 = @SchemeFeeGBP_I2		
		,OCTMCSendGBP_I2 = @OCTMCSendGBP_I2		
		,Band1GBP_I2 = @Band1GBP_I2		
		,Band2GBP_I2 = @Band2GBP_I2		
		,Band3GBP_I2 = @Band3GBP_I2		

		,TmvUSD = @TmvUSD		
		,AtvUSD = @AtvUSD		
		,MtvUSD = @MtvUSD		
		,TcrUSD = @TcrUSD		
		,GexUSD = @GexUSD		
		,MDRRateUSD = @MDRRateUSD		
		,CreditUSD = @CreditUSD		
		,DebitUSD = @DebitUSD		
		,PerDeclineUSD = @PerDeclineUSD		
		,PerRefundUSD = @PerRefundUSD		
		,ChargebackUSD = @ChargebackUSD		
		,WireTransferFeeUSD = @WireTransferFeeUSD		
		,MinimumTransactionFeeUSD = @MinimumTransactionFeeUSD		
		,MinimumSettlementFeeUSD = @MinimumSettlementFeeUSD		
		,AnnualRenewalFeeUSD = @AnnualRenewalFeeUSD		
		,MinimumWeeklyFeeUSD = @MinimumWeeklyFeeUSD		
		,RollingReserveUSD = @RollingReserveUSD		
		,RollingReserveMonthsUSD = @RollingReserveMonthsUSD		
		,FXRateUSD = @FXRateUSD		
		,GatewayProcessingFeeUSD = @GatewayProcessingFeeUSD		
		,ProcessorFeeUSD = @ProcessorFeeUSD		
		,SetupFeeUSD = @SetupFeeUSD		
		,SchemeFeeUSD = @SchemeFeeUSD		
		,OCTMCSendUSD = @OCTMCSendUSD		
		,Band1USD = @Band1USD		
		,Band2USD = @Band2USD		
		,Band3USD =  @Band3USD		
		,TmvUSD_I1 = @TmvUSD_I1		
		,AtvUSD_I1 = @AtvUSD_I1		
		,MtvUSD_I1 = @MtvUSD_I1		
		,TcrUSD_I1 = @TcrUSD_I1		
		,GexUSD_I1 = @GexUSD_I1		
		,MDRRateUSD_I1 = @MDRRateUSD_I1		
		,CreditUSD_I1 = @CreditUSD_I1		
		,DebitUSD_I1 = @DebitUSD_I1		
		,PerDeclineUSD_I1 = @PerDeclineUSD_I1		
		,PerRefundUSD_I1 = @PerRefundUSD_I1		
		,ChargebackUSD_I1 = @ChargebackUSD_I1		
		,WireTransferFeeUSD_I1 = @WireTransferFeeUSD_I1		
		,MinimumTransactionFeeUSD_I1 = @MinimumTransactionFeeUSD_I1		
		,MinimumSettlementFeeUSD_I1	= @MinimumSettlementFeeUSD_I1		
		,AnnualRenewalFeeUSD_I1	= @AnnualRenewalFeeUSD_I1		
		,MinimumWeeklyFeeUSD_I1 = @MinimumWeeklyFeeUSD_I1		
		,RollingReserveUSD_I1 = @RollingReserveUSD_I1		
		,RollingReserveMonthsUSD_I1= @RollingReserveMonthsUSD_I1		
		,FXRateUSD_I1 = @FXRateUSD_I1		
		,GatewayProcessingFeeUSD_I1	= @GatewayProcessingFeeUSD_I1		
		,ProcessorFeeUSD_I1	= @ProcessorFeeUSD_I1		
		,SetupFeeUSD_I1 = @SetupFeeUSD_I1		
		,SchemeFeeUSD_I1 = @SchemeFeeUSD_I1		
		,OCTMCSendUSD_I1 = @OCTMCSendUSD_I1		
		,Band1USD_I1 = @Band1USD_I1		
		,Band2USD_I1 = @Band2USD_I1		
		,Band3USD_I1 = @Band3USD_I1		
		,TmvUSD_I2 = @TmvUSD_I2		
		,AtvUSD_I2 = @AtvUSD_I2		
		,MtvUSD_I2 = @MtvUSD_I2		
		,TcrUSD_I2 = @TcrUSD_I2		
		,GexUSD_I2 = @GexUSD_I2		
		,MDRRateUSD_I2 = @MDRRateUSD_I2		
		,CreditUSD_I2 = @CreditUSD_I2		
		,DebitUSD_I2 = @DebitUSD_I2		
		,PerDeclineUSD_I2 = @PerDeclineUSD_I2		
		,PerRefundUSD_I2 = @PerRefundUSD_I2		
		,ChargebackUSD_I2 = @ChargebackUSD_I2		
		,WireTransferFeeUSD_I2 = @WireTransferFeeUSD_I2		
		,MinimumTransactionFeeUSD_I2 = @MinimumTransactionFeeUSD_I2		
		,MinimumSettlementFeeUSD_I2	= @MinimumSettlementFeeUSD_I2		
		,AnnualRenewalFeeUSD_I2	= @AnnualRenewalFeeUSD_I2		
		,MinimumWeeklyFeeUSD_I2	= @MinimumWeeklyFeeUSD_I2		
		,RollingReserveUSD_I2 = @RollingReserveUSD_I2		
		,RollingReserveMonthsUSD_I2 = @RollingReserveMonthsUSD_I2		
		,FXRateUSD_I2 = @FXRateUSD_I2		
		,GatewayProcessingFeeUSD_I2	= @GatewayProcessingFeeUSD_I2		
		,ProcessorFeeUSD_I2	= @ProcessorFeeUSD_I2		
		,SetupFeeUSD_I2	= @SetupFeeUSD_I2		
		,SchemeFeeUSD_I2 = @SchemeFeeUSD_I2		
		,OCTMCSendUSD_I2 = @OCTMCSendUSD_I2		
		,Band1USD_I2 = @Band1USD_I2		
		,Band2USD_I2 = @Band2USD_I2		
		,Band3USD_I2 = @Band3USD_I2		

		,TmvAUD = @TmvAUD		
		,AtvAUD = @AtvAUD		
		,MtvAUD = @MtvAUD		
		,TcrAUD = @TcrAUD		
		,GexAUD = @GexAUD		
		,MDRRateAUD = @MDRRateAUD		
		,CreditAUD = @CreditAUD		
		,DebitAUD = @DebitAUD		
		,PerDeclineAUD = @PerDeclineAUD		
		,PerRefundAUD = @PerRefundAUD		
		,ChargebackAUD = @ChargebackAUD		
		,WireTransferFeeAUD = @WireTransferFeeAUD		
		,MinimumTransactionFeeAUD = @MinimumTransactionFeeAUD		
		,MinimumSettlementFeeAUD = @MinimumSettlementFeeAUD		
		,AnnualRenewalFeeAUD = @AnnualRenewalFeeAUD		
		,MinimumWeeklyFeeAUD = @MinimumWeeklyFeeAUD		
		,RollingReserveAUD = @RollingReserveAUD		
		,RollingReserveMonthsAUD = @RollingReserveMonthsAUD		
		,FXRateAUD = @FXRateAUD		
		,GatewayProcessingFeeAUD = @GatewayProcessingFeeAUD		
		,ProcessorFeeAUD = @ProcessorFeeAUD		
		,SetupFeeAUD = @SetupFeeAUD		
		,SchemeFeeAUD = @SchemeFeeAUD		
		,OCTMCSendAUD = @OCTMCSendAUD		
		,Band1AUD = @Band1AUD		
		,Band2AUD = @Band2AUD		
		,Band3AUD =  @Band3AUD		
		,TmvAUD_I1 = @TmvAUD_I1		
		,AtvAUD_I1 = @AtvAUD_I1		
		,MtvAUD_I1 = @MtvAUD_I1		
		,TcrAUD_I1 = @TcrAUD_I1		
		,GexAUD_I1 = @GexAUD_I1		
		,MDRRateAUD_I1 = @MDRRateAUD_I1		
		,CreditAUD_I1 = @CreditAUD_I1		
		,DebitAUD_I1 = @DebitAUD_I1		
		,PerDeclineAUD_I1 = @PerDeclineAUD_I1		
		,PerRefundAUD_I1 = @PerRefundAUD_I1		
		,ChargebackAUD_I1 = @ChargebackAUD_I1		
		,WireTransferFeeAUD_I1 = @WireTransferFeeAUD_I1		
		,MinimumTransactionFeeAUD_I1 = @MinimumTransactionFeeAUD_I1		
		,MinimumSettlementFeeAUD_I1	= @MinimumSettlementFeeAUD_I1		
		,AnnualRenewalFeeAUD_I1	= @AnnualRenewalFeeAUD_I1		
		,MinimumWeeklyFeeAUD_I1 = @MinimumWeeklyFeeAUD_I1		
		,RollingReserveAUD_I1 = @RollingReserveAUD_I1		
		,RollingReserveMonthsAUD_I1= @RollingReserveMonthsAUD_I1		
		,FXRateAUD_I1 = @FXRateAUD_I1		
		,GatewayProcessingFeeAUD_I1	= @GatewayProcessingFeeAUD_I1		
		,ProcessorFeeAUD_I1	= @ProcessorFeeAUD_I1		
		,SetupFeeAUD_I1 = @SetupFeeAUD_I1		
		,SchemeFeeAUD_I1 = @SchemeFeeAUD_I1		
		,OCTMCSendAUD_I1 = @OCTMCSendAUD_I1		
		,Band1AUD_I1 = @Band1AUD_I1		
		,Band2AUD_I1 = @Band2AUD_I1		
		,Band3AUD_I1 = @Band3AUD_I1		
		,TmvAUD_I2 = @TmvAUD_I2		
		,AtvAUD_I2 = @AtvAUD_I2		
		,MtvAUD_I2 = @MtvAUD_I2		
		,TcrAUD_I2 = @TcrAUD_I2		
		,GexAUD_I2 = @GexAUD_I2		
		,MDRRateAUD_I2 = @MDRRateAUD_I2		
		,CreditAUD_I2 = @CreditAUD_I2		
		,DebitAUD_I2 = @DebitAUD_I2		
		,PerDeclineAUD_I2 = @PerDeclineAUD_I2		
		,PerRefundAUD_I2 = @PerRefundAUD_I2		
		,ChargebackAUD_I2 = @ChargebackAUD_I2		
		,WireTransferFeeAUD_I2 = @WireTransferFeeAUD_I2		
		,MinimumTransactionFeeAUD_I2 = @MinimumTransactionFeeAUD_I2		
		,MinimumSettlementFeeAUD_I2	= @MinimumSettlementFeeAUD_I2		
		,AnnualRenewalFeeAUD_I2	= @AnnualRenewalFeeAUD_I2		
		,MinimumWeeklyFeeAUD_I2	= @MinimumWeeklyFeeAUD_I2		
		,RollingReserveAUD_I2 = @RollingReserveAUD_I2		
		,RollingReserveMonthsAUD_I2 = @RollingReserveMonthsAUD_I2		
		,FXRateAUD_I2 = @FXRateAUD_I2		
		,GatewayProcessingFeeAUD_I2	= @GatewayProcessingFeeAUD_I2		
		,ProcessorFeeAUD_I2	= @ProcessorFeeAUD_I2		
		,SetupFeeAUD_I2	= @SetupFeeAUD_I2		
		,SchemeFeeAUD_I2 = @SchemeFeeAUD_I2		
		,OCTMCSendAUD_I2 = @OCTMCSendAUD_I2		
		,Band1AUD_I2 = @Band1AUD_I2		
		,Band2AUD_I2 = @Band2AUD_I2		
		,Band3AUD_I2 = @Band3AUD_I2		

		,TmvNOK = @TmvNOK		
		,AtvNOK = @AtvNOK		
		,MtvNOK = @MtvNOK		
		,TcrNOK = @TcrNOK		
		,GexNOK = @GexNOK		
		,MDRRateNOK = @MDRRateNOK		
		,CreditNOK = @CreditNOK		
		,DebitNOK = @DebitNOK		
		,PerDeclineNOK = @PerDeclineNOK		
		,PerRefundNOK = @PerRefundNOK		
		,ChargebackNOK = @ChargebackNOK		
		,WireTransferFeeNOK = @WireTransferFeeNOK		
		,MinimumTransactionFeeNOK = @MinimumTransactionFeeNOK		
		,MinimumSettlementFeeNOK = @MinimumSettlementFeeNOK		
		,AnnualRenewalFeeNOK = @AnnualRenewalFeeNOK		
		,MinimumWeeklyFeeNOK = @MinimumWeeklyFeeNOK		
		,RollingReserveNOK = @RollingReserveNOK		
		,RollingReserveMonthsNOK = @RollingReserveMonthsNOK		
		,FXRateNOK = @FXRateNOK		
		,GatewayProcessingFeeNOK = @GatewayProcessingFeeNOK		
		,ProcessorFeeNOK = @ProcessorFeeNOK		
		,SetupFeeNOK = @SetupFeeNOK		
		,SchemeFeeNOK = @SchemeFeeNOK		
		,OCTMCSendNOK = @OCTMCSendNOK		
		,Band1NOK = @Band1NOK		
		,Band2NOK = @Band2NOK		
		,Band3NOK =  @Band3NOK		
		,TmvNOK_I1 = @TmvNOK_I1		
		,AtvNOK_I1 = @AtvNOK_I1		
		,MtvNOK_I1 = @MtvNOK_I1		
		,TcrNOK_I1 = @TcrNOK_I1		
		,GexNOK_I1 = @GexNOK_I1		
		,MDRRateNOK_I1 = @MDRRateNOK_I1		
		,CreditNOK_I1 = @CreditNOK_I1		
		,DebitNOK_I1 = @DebitNOK_I1		
		,PerDeclineNOK_I1 = @PerDeclineNOK_I1		
		,PerRefundNOK_I1 = @PerRefundNOK_I1		
		,ChargebackNOK_I1 = @ChargebackNOK_I1		
		,WireTransferFeeNOK_I1 = @WireTransferFeeNOK_I1		
		,MinimumTransactionFeeNOK_I1 = @MinimumTransactionFeeNOK_I1		
		,MinimumSettlementFeeNOK_I1	= @MinimumSettlementFeeNOK_I1		
		,AnnualRenewalFeeNOK_I1	= @AnnualRenewalFeeNOK_I1		
		,MinimumWeeklyFeeNOK_I1 = @MinimumWeeklyFeeNOK_I1		
		,RollingReserveNOK_I1 = @RollingReserveNOK_I1		
		,RollingReserveMonthsNOK_I1= @RollingReserveMonthsNOK_I1		
		,FXRateNOK_I1 = @FXRateNOK_I1		
		,GatewayProcessingFeeNOK_I1	= @GatewayProcessingFeeNOK_I1		
		,ProcessorFeeNOK_I1	= @ProcessorFeeNOK_I1		
		,SetupFeeNOK_I1 = @SetupFeeNOK_I1		
		,SchemeFeeNOK_I1 = @SchemeFeeNOK_I1		
		,OCTMCSendNOK_I1 = @OCTMCSendNOK_I1		
		,Band1NOK_I1 = @Band1NOK_I1		
		,Band2NOK_I1 = @Band2NOK_I1		
		,Band3NOK_I1 = @Band3NOK_I1		
		,TmvNOK_I2 = @TmvNOK_I2		
		,AtvNOK_I2 = @AtvNOK_I2		
		,MtvNOK_I2 = @MtvNOK_I2		
		,TcrNOK_I2 = @TcrNOK_I2		
		,GexNOK_I2 = @GexNOK_I2		
		,MDRRateNOK_I2 = @MDRRateNOK_I2		
		,CreditNOK_I2 = @CreditNOK_I2		
		,DebitNOK_I2 = @DebitNOK_I2		
		,PerDeclineNOK_I2 = @PerDeclineNOK_I2		
		,PerRefundNOK_I2 = @PerRefundNOK_I2		
		,ChargebackNOK_I2 = @ChargebackNOK_I2		
		,WireTransferFeeNOK_I2 = @WireTransferFeeNOK_I2		
		,MinimumTransactionFeeNOK_I2 = @MinimumTransactionFeeNOK_I2		
		,MinimumSettlementFeeNOK_I2	= @MinimumSettlementFeeNOK_I2		
		,AnnualRenewalFeeNOK_I2	= @AnnualRenewalFeeNOK_I2		
		,MinimumWeeklyFeeNOK_I2	= @MinimumWeeklyFeeNOK_I2		
		,RollingReserveNOK_I2 = @RollingReserveNOK_I2		
		,RollingReserveMonthsNOK_I2 = @RollingReserveMonthsNOK_I2		
		,FXRateNOK_I2 = @FXRateNOK_I2		
		,GatewayProcessingFeeNOK_I2	= @GatewayProcessingFeeNOK_I2		
		,ProcessorFeeNOK_I2	= @ProcessorFeeNOK_I2		
		,SetupFeeNOK_I2	= @SetupFeeNOK_I2		
		,SchemeFeeNOK_I2 = @SchemeFeeNOK_I2		
		,OCTMCSendNOK_I2 = @OCTMCSendNOK_I2		
		,Band1NOK_I2 = @Band1NOK_I2		
		,Band2NOK_I2 = @Band2NOK_I2		
		,Band3NOK_I2 = @Band3NOK_I2		

		,Introducer1Id	= @Introducer1Id	
		,Introducer2Id	= @Introducer2Id
			
		WHERE MBId = @MBId
END


GO
/****** Object:  StoredProcedure [dbo].[MB_CONTRACT_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_CONTRACT_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE MB_Contract SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MB_CONTRACT_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_CONTRACT_GET]
@Id INT
AS
BEGIN
	SELECT 

			 [MBC].Id	
			,[MBC].MBId	
			,[MBC].IsContractIssued
			,[MBC].ContractIssuedDate	
			,[MBC].ClientSignatureName	
			,[MBC].ClientSignatureDate	
			,[MBC].EcommSignatureName	
			,[MBC].EcommSignatureSignedDate	
			,[MBC].IsReviewedBySales
			,[MBC].ReviewDate	
			,[MBC].Term	
			,[MBC].RenewalDate	
			,[MBC].RenewalPeriod	
			,[MBC].NotificationPeriod	
			,[MBC].TerminationNoticeFromEMS
			,[MBC].TerminationNoticeFromClient	
			,[MBC].IsClosed
			,[MBC].CloseDate
			,[MBC].DateCreated
			,[MBC].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_Contract [MBC], MerchantBoarding [MB], [User] [U]
	WHERE [MBC].Id = @Id
	AND [MBC].MBId = [MB].Id
	AND [MBC].UserCreatedId = [U].Id
	AND [MBC].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[MB_CONTRACT_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_CONTRACT_GETALL]
AS
BEGIN
	SELECT 
			 [MBC].Id	
			,[MBC].MBId	
			,[MBC].IsContractIssued
			,[MBC].ContractIssuedDate	
			,[MBC].ClientSignatureName	
			,[MBC].ClientSignatureDate	
			,[MBC].EcommSignatureName	
			,[MBC].EcommSignatureSignedDate	
			,[MBC].IsReviewedBySales
			,[MBC].ReviewDate	
			,[MBC].Term	
			,[MBC].RenewalDate	
			,[MBC].RenewalPeriod	
			,[MBC].NotificationPeriod	
			,[MBC].TerminationNoticeFromEMS
			,[MBC].TerminationNoticeFromClient	
			,[MBC].IsClosed
			,[MBC].CloseDate
			,[MBC].DateCreated
			,[MBC].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_Contract [MBC], MerchantBoarding [MB], [User] [U]
	WHERE
	 [MBC].MBId = [MB].Id
	AND [MBC].UserCreatedId = [U].Id
	AND [MBC].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MB_CONTRACT_GETBYMBID]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_CONTRACT_GETBYMBID]
@MBId INT
AS
BEGIN
	SELECT 
			 [MBC].Id	
			,[MBC].MBId	
			,[MBC].IsContractIssued
			,[MBC].ContractIssuedDate	
			,[MBC].ClientSignatureName	
			,[MBC].ClientSignatureDate	
			,[MBC].EcommSignatureName	
			,[MBC].EcommSignatureSignedDate	
			,[MBC].IsReviewedBySales
			,[MBC].ReviewDate	
			,[MBC].Term	
			,[MBC].RenewalDate	
			,[MBC].RenewalPeriod	
			,[MBC].NotificationPeriod	
			,[MBC].TerminationNoticeFromEMS
			,[MBC].TerminationNoticeFromClient	
			,[MBC].IsClosed
			,[MBC].CloseDate
			,[MBC].DateCreated
			,[MBC].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_Contract [MBC], [User] [U]
		WHERE [MBC].MBId = @MBId
	AND [MBC].UserCreatedId = [U].Id
	AND [MBC].Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[MB_CONTRACT_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_CONTRACT_INSERT]
				 @MBId	int	
				,@IsContractIssued BIT
				,@ContractIssuedDate	datetime	
				,@ClientSignatureName	nvarchar(50)	
				,@ClientSignatureDate	datetime	
				,@EcommSignatureName	nvarchar(50)	
				,@EcommSignatureSignedDate	datetime	
				,@IsReviewedBySales	bit	
				,@ReviewDate	datetime	
				,@Term	int	
				,@RenewalDate	datetime	
				,@RenewalPeriod	int	
				,@NotificationPeriod	int	
				,@TerminationNoticeFromEMS	nvarchar(50)	
				,@TerminationNoticeFromClient	nvarchar(50)	
				,@IsClosed	int	
				,@CloseDate	datetime	
				,@UserCreatedId	int	

	AS
	BEGIN
	   INSERT INTO [MB_Contract] 
			(MBId	
			,IsContractIssued	
			,ContractIssuedDate		
			,ClientSignatureName	
			,ClientSignatureDate		
			,EcommSignatureName	
			,EcommSignatureSignedDate		
			,IsReviewedBySales		
			,ReviewDate		
			,Term		
			,RenewalDate		
			,RenewalPeriod		
			,NotificationPeriod		
			,TerminationNoticeFromEMS	
			,TerminationNoticeFromClient
			,IsClosed		
			,CloseDate	
		   ,DateCreated
		   ,UserCreatedId
		   ,Deleted)
		VALUES
		(	 @MBId	
			,@IsContractIssued	
			,@ContractIssuedDate		
			,@ClientSignatureName	
			,@ClientSignatureDate		
			,@EcommSignatureName	
			,@EcommSignatureSignedDate		
			,@IsReviewedBySales		
			,@ReviewDate		
			,@Term		
			,@RenewalDate		
			,@RenewalPeriod		
			,@NotificationPeriod		
			,@TerminationNoticeFromEMS	
			,@TerminationNoticeFromClient
			,@IsClosed		
			,@CloseDate			

		   ,GETDATE()
		   ,@UserCreatedId
		   ,0)
	END


	SELECT CONVERT(INT, SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[MB_CONTRACT_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_CONTRACT_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT  
			 [MBC].Id	
			,[MBC].MBId	
			,[MBC].IsContractIssued	
			,[MBC].ContractIssuedDate	
			,[MBC].ClientSignatureName	
			,[MBC].ClientSignatureDate	
			,[MBC].EcommSignatureName	
			,[MBC].EcommSignatureSignedDate	
			,[MBC].IsReviewedBySales
			,[MBC].ReviewDate	
			,[MBC].Term	
			,[MBC].RenewalDate	
			,[MBC].RenewalPeriod	
			,[MBC].NotificationPeriod	
			,[MBC].TerminationNoticeFromEMS
			,[MBC].TerminationNoticeFromClient	
			,[MBC].IsClosed
			,[MBC].CloseDate
			,[MBC].DateCreated
			,[MBC].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_Contract [MBC], MerchantBoarding [MB], [User] [U]
		 WHERE 
      ([MBC].ClientSignatureName LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   		AND	[MBC].MBId = [MB].Id
		AND [MBC].UserCreatedId = [U].Id
		AND [MBC].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MB_CONTRACT_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_CONTRACT_UPDATE]
				@MBId	int	
				,@IsContractIssued BIT
				,@ContractIssuedDate	datetime	
				,@ClientSignatureName	nvarchar(50)	
				,@ClientSignatureDate	datetime	
				,@EcommSignatureName	nvarchar(50)	
				,@EcommSignatureSignedDate	datetime	
				,@IsReviewedBySales	bit	
				,@ReviewDate	datetime	
				,@Term	int	
				,@RenewalDate	datetime	
				,@RenewalPeriod	int	
				,@NotificationPeriod	int	
				,@TerminationNoticeFromEMS	nvarchar(50)	
				,@TerminationNoticeFromClient	nvarchar(50)	
				,@IsClosed	int	
				,@CloseDate	datetime	
AS
BEGIN
   UPDATE [MB_Contract] SET 
			IsContractIssued = @IsContractIssued 
			,ContractIssuedDate	= @ContractIssuedDate		
			,ClientSignatureName = @ClientSignatureName	
			,ClientSignatureDate = @ClientSignatureDate		
			,EcommSignatureName	= @EcommSignatureName		
			,EcommSignatureSignedDate = @EcommSignatureSignedDate		
			,IsReviewedBySales = @IsReviewedBySales		
			,ReviewDate	= @ReviewDate		
			,Term = @Term		
			,RenewalDate = @RenewalDate		
			,RenewalPeriod = @RenewalPeriod		
			,NotificationPeriod = @NotificationPeriod	
			,TerminationNoticeFromEMS = @TerminationNoticeFromEMS		
			,TerminationNoticeFromClient = @TerminationNoticeFromClient	
			,IsClosed = @IsClosed		
			,CloseDate = @CloseDate		
		WHERE MBId = @MBId
END


GO
/****** Object:  StoredProcedure [dbo].[MB_IPADDRESS_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_IPADDRESS_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE MB_IpAddress SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MB_IPADDRESS_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_IPADDRESS_GET]
@Id INT
AS
BEGIN
	SELECT 
		[MBIPA].[Id]
	   ,[MBIPA].MBId AS MBID, [MB].LegalName AS MB_LegalName
	   ,[MBIPA].IpTypeId AS IpTypeId
	   ,[MBIPA].[Desc]
	   ,[MBIPA].DateCreated
	   ,[MBIPA].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_IPAddress [MBIPA], MerchantBoarding [MB], [User] [U]
	WHERE  [MBIPA].Id = @Id
	AND [MBIPA].MBId = [MB].Id
	AND [MBIPA].UserCreatedId = [U].Id
	AND [MBIPA].Deleted = 0
	ORDER BY [MBIPA].[Desc]
END

GO
/****** Object:  StoredProcedure [dbo].[MB_IPADDRESS_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_IPADDRESS_GETALL]
AS
BEGIN
	SELECT 
		[MBIPA].[Id]
	   ,[MBIPA].MBId AS MBID, [MB].LegalName AS MB_LegalName
	   ,[MBIPA].IpTypeId AS IpTypeId
	   ,[MBIPA].[Desc]
	   ,[MBIPA].DateCreated
	   ,[MBIPA].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_IPAddress [MBIPA], MerchantBoarding [MB], [User] [U]
	WHERE  
		[MBIPA].MBId = [MB].Id
	AND [MBIPA].UserCreatedId = [U].Id
	AND [MBIPA].Deleted = 0
	ORDER BY [MBIPA].[Desc]
END


GO
/****** Object:  StoredProcedure [dbo].[MB_IPADDRESS_GETBYMBID]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_IPADDRESS_GETBYMBID]
@MBID INT
AS
BEGIN
	SELECT 
		[MBIPA].[Id]
	   ,[MBIPA].MBId AS MBID, [MB].LegalName AS MB_LegalName
	   ,[MBIPA].IpTypeId AS IpTypeId
	   ,[MBIPA].[Desc]
	   ,[MBIPA].DateCreated
	   ,[MBIPA].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_IPAddress [MBIPA], MerchantBoarding [MB], [User] [U]
	WHERE  
	[MBIPA].MBId = @MBID
	AND	[MBIPA].MBId = [MB].Id
	AND [MBIPA].UserCreatedId = [U].Id
	AND [MBIPA].Deleted = 0
	ORDER BY [MBIPA].[Desc]
END


GO
/****** Object:  StoredProcedure [dbo].[MB_IPADDRESS_GETBYMBIDIPTYPE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_IPADDRESS_GETBYMBIDIPTYPE]
	 @MBID INT
	,@IpTypeId INT
AS
BEGIN
	SELECT 
		[MBIPA].[Id]
	   ,[MBIPA].MBId AS MBID, [MB].LegalName AS MB_LegalName
	   ,[MBIPA].IpTypeId AS IpTypeId
	   ,[MBIPA].[Desc]
	   ,[MBIPA].DateCreated
	   ,[MBIPA].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_IPAddress [MBIPA], MerchantBoarding [MB], [User] [U]
	WHERE  
	[MBIPA].MBId = @MBID
	AND [MBIPA].IpTypeId = @IpTypeId
	AND	[MBIPA].MBId = [MB].Id
	AND [MBIPA].UserCreatedId = [U].Id
	AND [MBIPA].Deleted = 0
	ORDER BY [MBIPA].[Desc]
END


GO
/****** Object:  StoredProcedure [dbo].[MB_IPADDRESS_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_IPADDRESS_INSERT]
		 @MBId INT
		,@IpTypeId INT
		,@Desc NVARCHAR(150)
		,@UserCreatedId INT
AS
BEGIN
   INSERT INTO MB_IPAddress 
	   (MBId
	   ,IpTypeId 
	   ,[Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@MBId
	   ,@IpTypeId 
	   ,@Desc
	   ,GETDATE()
	   ,@UserCreatedId
	   ,0)
END

SELECT CONVERT(INT, SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[MB_IPADDRESS_ISALREADYEXITS]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_IPADDRESS_ISALREADYEXITS]
	 @MBId INT
	,@Desc NVARCHAR(50)
	,@IpTypeId INT
AS
BEGIN
	SELECT 
		[MBIPA].[Id]
	   ,[MBIPA].MBId AS MBID, [MB].LegalName AS MB_LegalName
	   ,[MBIPA].IpTypeId AS IpTypeId
	   ,[MBIPA].[Desc]
	   ,[MBIPA].DateCreated
	   ,[MBIPA].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_IPAddress [MBIPA]
		LEFT JOIN MerchantBoarding [MB] ON [MB].Id = [MBIPA].MBId
		LEFT JOIN  [User] [U] ON [U].Id = [MBIPA].UserCreatedId
	WHERE  
		[MBIPA].MBId = @MBId
	AND [MBIPA].[Desc] = @Desc
	AND [MBIPA].IpTypeId = @IpTypeId
	AND [MBIPA].Deleted = 0
	ORDER BY [MBIPA].[Desc]
END

GO
/****** Object:  StoredProcedure [dbo].[MB_IPADDRESS_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_IPADDRESS_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT  
		[MBIPA].[Id]
	   ,[MBIPA].MBId AS MBID, [MB].LegalName AS MB_LegalName
	   ,[MBIPA].IpTypeId AS IpTypeId
	   ,[MBIPA].[Desc]
	   ,[MBIPA].DateCreated
	   ,[MBIPA].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_IPAddress [MBIPA], MerchantBoarding [MB], [User] [U]
		 WHERE 
      ([MBIPA].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
    AND [MBIPA].MBId = [MB].Id
	AND [MBIPA].UserCreatedId = [U].Id
	AND [MBIPA].Deleted = 0
	ORDER BY [MBIPA].[Desc]
END


GO
/****** Object:  StoredProcedure [dbo].[MB_IPADDRESS_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_IPADDRESS_UPDATE]
	-- Add the parameters for the stored procedure here
		@Id INT
	   ,@MBId INT
	   ,@IpTypeId INT
	   ,@Desc NVARCHAR(150)
AS
BEGIN
   UPDATE MB_IpAddress SET 
	 MBId = @MBId 
	,IpTypeId = @IpTypeId 
	,[Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MB_ONBOARDING_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_ONBOARDING_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE MB_Onboarding SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MB_ONBOARDING_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_ONBOARDING_GET]
@Id INT
AS
BEGIN
	SELECT 
			 [MBON].Id
			,[MBON].MBId, [MB].LegalName AS MB_LegalName
			,[MBON].MerchantTypeId AS MerchantTypeId, [MT].[Desc] AS MerchantTypeDesc
			,[MBON].IsApiIntegrationComplete		
			,[MBON].ApiIntegrationCompleteDate		
			,[MBON].IsClientConfiguredOnACP		
			,[MBON].ClientConfiguredOnACPDate		
			,[MBON].IsClientTrainedOnACP		
			,[MBON].ClientTrainedOnACPDate	
			,[MBON].MID		
			,[MBON].IBANEUR	
			,[MBON].IBANGBP	
			,[MBON].IBANUSD	
			,[MBON].MCCCode1	
			,[MBON].MCCCode2	
			,[MBON].MCCCode3	
			,[MBON].MCCCode4	
			,[MBON].URL1
			,[MBON].URL2		
			,[MBON].URL3		
			,[MBON].URL4	
			,[MBON].IsComplete		
			,[MBON].CompleteDate	
		    ,[MBON].DateCreated
			,[MBON].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
			FROM MB_Onboarding [MBON]
		  LEFT JOIN  MerchantBoarding [MB] ON [MB].Id = [MBON].MBId
		  LEFT JOIN  MerchantType [MT] ON [MT].Id = [MBON].MerchantTypeId
		  LEFT JOIN [User] [U] ON [U].Id = [MBON].UserCreatedId
	
	      WHERE [MBON].Id = @Id
		 AND [MBON].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[MB_ONBOARDING_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_ONBOARDING_GETALL]
AS
BEGIN
	SELECT 
			 [MBON].Id
			,[MBON].MBId, [MB].LegalName AS MB_LegalName
			,[MBON].MerchantTypeId AS MerchantTypeId, [MT].[Desc] AS MerchantTypeDesc
			,[MBON].IsApiIntegrationComplete		
			,[MBON].ApiIntegrationCompleteDate		
			,[MBON].IsClientConfiguredOnACP		
			,[MBON].ClientConfiguredOnACPDate		
			,[MBON].IsClientTrainedOnACP		
			,[MBON].ClientTrainedOnACPDate	
			,[MBON].MID		
			,[MBON].IBANEUR	
			,[MBON].IBANGBP	
			,[MBON].IBANUSD	
			,[MBON].MCCCode1	
			,[MBON].MCCCode2	
			,[MBON].MCCCode3	
			,[MBON].MCCCode4	
			,[MBON].URL1
			,[MBON].URL2		
			,[MBON].URL3		
			,[MBON].URL4	
			,[MBON].IsComplete		
			,[MBON].CompleteDate	
		    ,[MBON].DateCreated
			,[MBON].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	      FROM MB_Onboarding [MBON]
		  LEFT JOIN  MerchantBoarding [MB] ON [MB].Id = [MBON].MBId
		  LEFT JOIN  MerchantType [MT] ON [MT].Id = [MBON].MerchantTypeId
		  LEFT JOIN [User] [U] ON [U].Id = [MBON].UserCreatedId
	
	      WHERE [MBON].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MB_ONBOARDING_GETBYMBID]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_ONBOARDING_GETBYMBID]
@MBId INT
AS
BEGIN
	SELECT 
			 [MBON].Id
			,[MBON].MBId, [MB].LegalName AS MB_LegalName
			,[MBON].MerchantTypeId AS MerchantTypeId, [MT].[Desc] AS MerchantTypeDesc
			,[MBON].IsApiIntegrationComplete		
			,[MBON].ApiIntegrationCompleteDate		
			,[MBON].IsClientConfiguredOnACP		
			,[MBON].ClientConfiguredOnACPDate		
			,[MBON].IsClientTrainedOnACP		
			,[MBON].ClientTrainedOnACPDate	
			,[MBON].MID		
			,[MBON].IBANEUR	
			,[MBON].IBANGBP	
			,[MBON].IBANUSD		
			,[MBON].MCCCode1	
			,[MBON].MCCCode2	
			,[MBON].MCCCode3	
			,[MBON].MCCCode4	
			,[MBON].URL1
			,[MBON].URL2		
			,[MBON].URL3		
			,[MBON].URL4	
			,[MBON].IsComplete		
			,[MBON].CompleteDate	
		    ,[MBON].DateCreated
			,[MBON].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		  FROM MB_Onboarding [MBON]
		  LEFT JOIN  MerchantBoarding [MB] ON [MB].Id = [MBON].MBId
		  LEFT JOIN  MerchantType [MT] ON [MT].Id = [MBON].MerchantTypeId
		  LEFT JOIN [User] [U] ON [U].Id = [MBON].UserCreatedId
	
	      WHERE  [MBON].MBId = @MBId
		  AND [MBON].Deleted = 0 
END
GO
/****** Object:  StoredProcedure [dbo].[MB_ONBOARDING_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_ONBOARDING_INSERT]

			 @MBId	INT	
			,@MerchantTypeId INT
			,@IsApiIntegrationComplete	BIT	
			,@ApiIntegrationCompleteDate	DATETIME	
			,@IsClientConfiguredOnACP	BIT	
			,@ClientConfiguredOnACPDate	DATETIME	
			,@IsClientTrainedOnACP	BIT	
			,@ClientTrainedOnACPDate	DATETIME	
			,@MID	NVARCHAR(50)	
			,@IBANEUR	NVARCHAR(50)	
			,@IBANGBP	NVARCHAR(50)	
			,@IBANUSD	NVARCHAR(50)	
			,@MCCCode1	NVARCHAR(50)	
			,@MCCCode2	NVARCHAR(50)	
			,@MCCCode3	NVARCHAR(50)	
			,@MCCCode4	NVARCHAR(50)	
			,@URL1	NVARCHAR(50)	
			,@URL2	NVARCHAR(50)	
			,@URL3	NVARCHAR(50)	
			,@URL4	NVARCHAR(50)	
			,@IsComplete	INT	
			,@CompleteDate	DATETIME	
			,@UserCreatedId	INT 
	AS
	BEGIN
	   INSERT INTO [MB_Onboarding] 
			 (MBId		
			,MerchantTypeId 
			,IsApiIntegrationComplete		
			,ApiIntegrationCompleteDate		
			,IsClientConfiguredOnACP		
			,ClientConfiguredOnACPDate		
			,IsClientTrainedOnACP		
			,ClientTrainedOnACPDate	
			,MID		
			,IBANEUR		
			,IBANGBP
			,IBANUSD	
			,MCCCode1	
			,MCCCode2	
			,MCCCode3	
			,MCCCode4	
			,URL1
			,URL2		
			,URL3		
			,URL4	
			,IsComplete		
			,CompleteDate	
		    ,DateCreated
		    ,UserCreatedId
		    ,Deleted)
		VALUES
		   ( @MBId		
		    ,@MerchantTypeId 
			,@IsApiIntegrationComplete		
			,@ApiIntegrationCompleteDate		
			,@IsClientConfiguredOnACP		
			,@ClientConfiguredOnACPDate		
			,@IsClientTrainedOnACP		
			,@ClientTrainedOnACPDate	
			,@MID		
			,@IBANEUR
			,@IBANGBP
			,@IBANUSD	
			,@MCCCode1	
			,@MCCCode2	
			,@MCCCode3	
			,@MCCCode4	
			,@URL1
			,@URL2		
			,@URL3		
			,@URL4	
			,@IsComplete		
			,@CompleteDate		
		    ,GETDATE()
		    ,@UserCreatedId
		    ,0)
	END

	SELECT CONVERT(INT, SCOPE_IDENTITY())


GO
/****** Object:  StoredProcedure [dbo].[MB_ONBOARDING_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_ONBOARDING_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT  
			 [MBON].Id
			,[MBON].MBId, [MB].LegalName AS MB_LegalName
			,[MBON].MerchantTypeId AS MerchantTypeId, [MT].[Desc] AS MerchantTypeDesc
			,[MBON].IsApiIntegrationComplete		
			,[MBON].ApiIntegrationCompleteDate		
			,[MBON].IsClientConfiguredOnACP		
			,[MBON].ClientConfiguredOnACPDate		
			,[MBON].IsClientTrainedOnACP		
			,[MBON].ClientTrainedOnACPDate	
			,[MBON].MID		
			,[MBON].IBANEUR	
			,[MBON].IBANGBP	
			,[MBON].IBANUSD	
			,[MBON].MCCCode1	
			,[MBON].MCCCode2	
			,[MBON].MCCCode3	
			,[MBON].MCCCode4	
			,[MBON].URL1
			,[MBON].URL2		
			,[MBON].URL3		
			,[MBON].URL4	
			,[MBON].IsComplete		
			,[MBON].CompleteDate	
		    ,[MBON].DateCreated
			,[MBON].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
			 FROM MB_Onboarding [MBON]
		  LEFT JOIN  MerchantBoarding [MB] ON [MB].Id = [MBON].MBId
		  LEFT JOIN  MerchantType [MT] ON [MT].Id = [MBON].MerchantTypeId
		  LEFT JOIN [User] [U] ON [U].Id = [MBON].UserCreatedId
	
	      WHERE 
		   ([MBON].IBANEUR LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
		   AND [MBON].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MB_ONBOARDING_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_ONBOARDING_UPDATE]
			 @MBId	INT	
			,@MerchantTypeId INT
			,@IsApiIntegrationComplete	BIT	
			,@ApiIntegrationCompleteDate	DATETIME	
			,@IsClientConfiguredOnACP	BIT	
			,@ClientConfiguredOnACPDate	DATETIME	
			,@IsClientTrainedOnACP	BIT	
			,@ClientTrainedOnACPDate	DATETIME	
			,@MID	NVARCHAR(50)	
			,@IBANEUR	NVARCHAR(50)	
			,@IBANGBP	NVARCHAR(50)	
			,@IBANUSD	NVARCHAR(50)		
			,@MCCCode1	NVARCHAR(50)	
			,@MCCCode2	NVARCHAR(50)	
			,@MCCCode3	NVARCHAR(50)	
			,@MCCCode4	NVARCHAR(50)	
			,@URL1	NVARCHAR(50)	
			,@URL2	NVARCHAR(50)	
			,@URL3	NVARCHAR(50)	
			,@URL4	NVARCHAR(50)	
			,@IsComplete	INT	
			,@CompleteDate	DATETIME	
AS
BEGIN
   UPDATE MB_Onboarding SET 
		 MerchantTypeId = @MerchantTypeId 
		,IsApiIntegrationComplete = @IsApiIntegrationComplete		
		,ApiIntegrationCompleteDate	= @ApiIntegrationCompleteDate		
		,IsClientConfiguredOnACP = @IsClientConfiguredOnACP		
		,ClientConfiguredOnACPDate = @ClientConfiguredOnACPDate		
		,IsClientTrainedOnACP = @IsClientTrainedOnACP		
		,ClientTrainedOnACPDate = @ClientTrainedOnACPDate		
		,MID = @MID	
		,IBANEUR = @IBANEUR
		,IBANGBP = @IBANGBP
		,IBANUSD = @IBANUSD
		,MCCCode1 = @MCCCode1	
		,MCCCode2 = @MCCCode2
		,MCCCode3 = @MCCCode3
		,MCCCode4 = @MCCCode4
		,URL1 = @URL1	
		,URL2 = @URL2	
		,URL3 = @URL3
		,URL4 = @URL4		
		,IsComplete = @IsComplete
		,CompleteDate = @CompleteDate
		WHERE MBId = @MBId
END


GO
/****** Object:  StoredProcedure [dbo].[MB_OPPORTUNITY_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_OPPORTUNITY_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE MB_Opportunity SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MB_OPPORTUNITY_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_OPPORTUNITY_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [MBO].Id
		,[MBO].MBId, [MB].LegalName AS MB_LegalName
		,[MBO].IFrame
		,[MBO].HostedPayment
		,[MBO].DirectIntegration
		,[MBO].MOTO
		,[MBO].AVS
		,[MBO].CVV
		,[MBO].MCCMerchantWantsId
		,[MBO].Tokenisation
		,[MBO].ExtraDataFields
		,[MBO].StagingIp
		,[MBO].LiveIp	
		,[MBO].RecurringBilling
		,[MBO].APIDocumentsSent
		,[MBO].APIDocumentsSentDate
		,[MBO].ReqAcquiring
		,[MBO].ReqIssuing
		,[MBO].ReqOCT
		,[MBO].ReqProcessing
	    ,[MBO].DateCreated
	    ,[MBO].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_Opportunity [MBO], MerchantBoarding [MB], [User] [U]
	WHERE  [MBO].Id = @Id
	AND [MBO].MBId = [MB].Id
	AND [MBO].MBId = [MB].Id
	AND [MBO].UserCreatedId = [U].Id
	AND [MBO].Deleted = 0

END
GO
/****** Object:  StoredProcedure [dbo].[MB_OPPORTUNITY_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_OPPORTUNITY_GETALL]
AS
BEGIN
	SELECT 
		 [MBO].Id
		,[MBO].MBId, [MB].LegalName AS MB_LegalName
		,[MBO].IFrame
		,[MBO].HostedPayment
		,[MBO].DirectIntegration
		,[MBO].MOTO
		,[MBO].AVS
		,[MBO].CVV
		,[MBO].MCCMerchantWantsId
		,[MBO].Tokenisation
		,[MBO].ExtraDataFields
		,[MBO].StagingIp
		,[MBO].LiveIp
		,[MBO].RecurringBilling
		,[MBO].APIDocumentsSent
		,[MBO].APIDocumentsSentDate
		,[MBO].ReqAcquiring
		,[MBO].ReqIssuing
		,[MBO].ReqOCT
		,[MBO].ReqProcessing
	    ,[MBO].DateCreated
	    ,[MBO].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_Opportunity [MBO], MerchantBoarding [MB], [User] [U]
	WHERE
		[MBO].MBId = [MB].Id
	AND [MBO].MBId = [MB].Id
	AND [MBO].UserCreatedId = [U].Id
	AND [MBO].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MB_OPPORTUNITY_GETBYMBID]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_OPPORTUNITY_GETBYMBID]
@MBId INT
AS
BEGIN
	SELECT 
		 [MBO].Id
		,[MBO].MBId, [MB].LegalName AS MB_LegalName
		,[MBO].IFrame
		,[MBO].HostedPayment
		,[MBO].DirectIntegration
		,[MBO].MOTO
		,[MBO].AVS
		,[MBO].CVV
		,[MBO].MCCMerchantWantsId
		,[MBO].Tokenisation
		,[MBO].ExtraDataFields
		,[MBO].StagingIp
		,[MBO].LiveIp
		,[MBO].RecurringBilling
		,[MBO].APIDocumentsSent
		,[MBO].APIDocumentsSentDate
		,[MBO].ReqAcquiring
		,[MBO].ReqIssuing
		,[MBO].ReqOCT
		,[MBO].ReqProcessing
	    ,[MBO].DateCreated
	    ,[MBO].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_Opportunity [MBO], MerchantBoarding [MB], [User] [U]
	WHERE  [MBO].MBId = @MBId
	AND [MBO].MBId = [MB].Id
	AND [MBO].UserCreatedId = [U].Id
	AND [MBO].Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[MB_OPPORTUNITY_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_OPPORTUNITY_INSERT]
		 @MBId INT	--int	Checked
		,@IFrame NVARCHAR(50)	--bit	Checked
		,@HostedPayment NVARCHAR(50)	--bit	Checked
		,@DirectIntegration NVARCHAR(50)	--bit	Checked
		,@MOTO NVARCHAR(50)	--bit	Checked
		,@AVS NVARCHAR(50)	--bit	Checked
		,@CVV NVARCHAR(50)	--bit	Checked
		,@MCCMerchantWantsId INT	--bit	Checked
		,@Tokenisation NVARCHAR(50)	--bit	Checked
		,@ExtraDataFields NVARCHAR(50)	--bit	Checked
		,@StagingIp NVARCHAR(50)
		,@LiveIp NVARCHAR(50)
		,@RecurringBilling NVARCHAR(50)	--bit	Checked
		,@APIDocumentsSent BIT	--bit	Checked
		,@APIDocumentsSentDate DATETIME	--datetime	Checked
		,@ReqAcquiring BIT	--bit	Checked
		,@ReqIssuing BIT	--bit	Checked
		,@ReqOCT BIT	--bit	Checked
		,@ReqProcessing BIT	--bit	Checked
		,@UserCreatedId	INT 

	AS
	BEGIN
	   INSERT INTO [MB_Opportunity] 
			(MBId 	--int	Checked
			,IFrame 	--bit	Checked
			,HostedPayment 	--bit	Checked
			,DirectIntegration 	--bit	Checked
			,MOTO 	--bit	Checked
			,AVS 	--bit	Checked
			,CVV 	--bit	Checked
			,MCCMerchantWantsId 	--bit	Checked
			,Tokenisation 	--bit	Checked
			,ExtraDataFields 	--bit	Checked
			,StagingIp 
			,LiveIp
			,RecurringBilling 	--bit	Checked
			,APIDocumentsSent 	--bit	Checked
			,APIDocumentsSentDate 	--datetime	Checked
			,ReqAcquiring 	--bit	Checked
			,ReqIssuing 	--bit	Checked
			,ReqOCT 	--bit	Checked
			,ReqProcessing 	--bit	Checked
		   ,DateCreated
		   ,UserCreatedId
		   ,Deleted)
		VALUES
		   (@MBId 	--int	Checked
			,@IFrame 	--bit	Checked
			,@HostedPayment 	--bit	Checked
			,@DirectIntegration 	--bit	Checked
			,@MOTO 	--bit	Checked
			,@AVS 	--bit	Checked
			,@CVV 	--bit	Checked
			,@MCCMerchantWantsId	--bit	Checked
			,@Tokenisation 	--bit	Checked
			,@ExtraDataFields 	--bit	Checked
			,@StagingIp
			,@LiveIp
			,@RecurringBilling 	--bit	Checked
			,@APIDocumentsSent 	--bit	Checked
			,@APIDocumentsSentDate 	--datetime	Checked
			,@ReqAcquiring 	--bit	Checked
			,@ReqIssuing 	--bit	Checked
			,@ReqOCT 	--bit	Checked
			,@ReqProcessing 	--bit	Checked

		   ,GETDATE()
		   ,@UserCreatedId
		   ,0)
	END


	SELECT CONVERT(INT, SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[MB_OPPORTUNITY_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_OPPORTUNITY_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT  
		 [MBO].Id
		,[MBO].MBId, [MB].LegalName AS MB_LegalName
		,[MBO].IFrame
		,[MBO].HostedPayment
		,[MBO].DirectIntegration
		,[MBO].MOTO
		,[MBO].AVS
		,[MBO].CVV
		,[MBO].MCCMerchantWantsId
		,[MBO].Tokenisation
		,[MBO].ExtraDataFields
		,[MBO].StagingIp
		,[MBO].LiveIp
		,[MBO].RecurringBilling
		,[MBO].APIDocumentsSent
		,[MBO].APIDocumentsSentDate
		,[MBO].ReqAcquiring
		,[MBO].ReqIssuing
		,[MBO].ReqOCT
		,[MBO].ReqProcessing
	    ,[MBO].DateCreated
	    ,[MBO].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	    FROM MB_Opportunity [MBO], MerchantBoarding [MB], [User] [U]
		 WHERE 
      ([MBO].ExtraDataFields LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   		AND	[MBO].MBId = [MB].Id
		AND [MBO].MBId = [MB].Id
		AND [MBO].UserCreatedId = [U].Id
		AND [MBO].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MB_OPPORTUNITY_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MB_OPPORTUNITY_UPDATE]
		 @MBId INT	--int	Checked
		,@IFrame NVARCHAR(50)	--bit	Checked
		,@HostedPayment NVARCHAR(50)	--bit	Checked
		,@DirectIntegration NVARCHAR(50)	--bit	Checked
		,@MOTO NVARCHAR(50)	--bit	Checked
		,@AVS NVARCHAR(50)	--bit	Checked
		,@CVV NVARCHAR(50)	--bit	Checked
		,@MCCMerchantWantsId	NVARCHAR(50)	--bit	Checked
		,@Tokenisation NVARCHAR(50)	--bit	Checked
		,@ExtraDataFields NVARCHAR(50)	--bit	Checked
		,@StagingIp NVARCHAR(50)
		,@LiveIp NVARCHAR(50)
		,@RecurringBilling NVARCHAR(50)	--bit	Checked
		,@APIDocumentsSent BIT	--bit	Checked
		,@APIDocumentsSentDate DATETIME	--datetime	Checked
		,@ReqAcquiring BIT	--bit	Checked
		,@ReqIssuing BIT	--bit	Checked
		,@ReqOCT BIT	--bit	Checked
		,@ReqProcessing BIT	--bit	Checked
AS
BEGIN
   UPDATE MB_Opportunity SET 
		 IFrame = @IFrame 
		,HostedPayment = @HostedPayment 
		,DirectIntegration = @DirectIntegration
		,MOTO = @MOTO 
		,AVS = @AVS 
		,CVV = @CVV 
		,MCCMerchantWantsId = @MCCMerchantWantsId
		,Tokenisation = @Tokenisation 
		,ExtraDataFields = @ExtraDataFields
		,StagingIp = @StagingIp
		,LiveIp = @LiveIp
		,RecurringBilling = @RecurringBilling 
		,APIDocumentsSent = @APIDocumentsSent 
		,APIDocumentsSentDate = @APIDocumentsSentDate 
		,ReqAcquiring = @ReqAcquiring
		,ReqIssuing = @ReqIssuing
		,ReqOCT = @ReqOCT
		,ReqProcessing = @ReqProcessing 
		WHERE MBId = @MBId
END


GO
/****** Object:  StoredProcedure [dbo].[MCC_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MCC_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE MCC SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MCC_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MCC_GET]
@Id INT
AS
BEGIN
	SELECT
			[M].Id
		   ,[M].[Code]
		   ,[M].[Desc]
		   ,[M].DateCreated
		   ,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		   FROM MCC [M], [User] [U]
			WHERE [M].Id = @Id
			AND [M].UserCreatedId = [U].Id
			AND [M].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[MCC_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MCC_GETALL]
AS
BEGIN
	SELECT
			[M].Id
		   ,[M].[Code]
		   ,[M].[Desc]
		   ,[M].DateCreated
		   ,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		   FROM MCC [M], [User] [U]
			WHERE 
				[M].UserCreatedId = [U].Id
			AND [M].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MCC_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MCC_INSERT]
		 @Code NVARCHAR(2)
		,@Desc NVARCHAR(150)
		,@UserId INT
	AS
	BEGIN
	   INSERT INTO MCC 
		   ([Code]
		   ,[Desc]
		   ,DateCreated
		   ,UserCreatedId
		   ,Deleted)
		VALUES
		   (@Code
		   ,@Desc
		   ,GETDATE()
		   ,@UserId
		   ,0)
	END

GO
/****** Object:  StoredProcedure [dbo].[MCC_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MCC_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT  
		 [MCC].Id
		,[MCC].[Code]
		,[MCC].[Desc]
		,[MCC].DateCreated
		,[MCC].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM MCC [MCC], [User] [U]
		  WHERE 
       ([MCC].[Code] LIKE '%'+ @SearchText +'%'
	 OR [MCC].[Desc] LIKE '%'+ @SearchText +'%'
	 OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
	AND [MCC].UserCreatedId = [U].Id
	AND [MCC].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MCC_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MCC_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Code NVARCHAR(5),
	@Desc NVARCHAR(150)
AS
BEGIN
   UPDATE MCC SET 
   [Code] = @Code,
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANT_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANT_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE Merchant SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANT_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANT_GET]
@Id INT
AS
BEGIN
		SELECT
			 [M].Id
			,[M].Name
			,[M].CompanyWebsite
			,[M].CompanyTypeId, [CT].[Desc] AS CompanyTypeDesc
			,[M].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc
			,[M].ContactPerson
			,[M].ContactEmailAddress
			,[M].ApplicationFormStatusId, [AFS].[Desc] AS ApplicationFormStatusDesc
			,[M].OutageNotificationEmail
			,[M].KYBStatusId, [KS].[Desc] AS KYBStatusDesc
			,[M].EUCorp
			,[M].ContractStatusId, [CS].[Desc] AS ContractStatusDesc
			,[M].LiveInACP
			,[M].Processing
			,[M].UpdatesNotes
			,[M].CountryId, [C].[Desc] AS CountryDesc
			,[M].MCCId, [MC].[Desc] AS MCCDesc
			,[M].RegisteredAddress
			,[M].SepaEntityAddress
			,[M].StageId, [S].[Desc] AS StageDesc
			,[M].SalesChannelId, [SC].[Desc] AS SalesChannelDesc
			,[M].IndustryId, [I].[Desc] AS IndustryDesc
			,[M].IntroducedBy
			,[M].OwnershipId, [O].Firstname AS OwnershipFirstname, [O].Lastname AS OwnershipLastname
			,[M].DocumentsOutstanding
			,[M].AddressOnContractId, [AOD].[Desc] AS AddressOnContractDesc
			,[M].AddressOnPRSId, [AOP].[Desc] AS AddressOnPRSDesc
			,[M].AddressOnCOIId, [AOC].[Desc] AS AddressOnCOIDesc
			,[M].ThirdParty
			,[M].ThirdPartyContractId, [TPC].[Desc] AS ThirdPartyContractDesc
			,[M].PCICertId, [PC].[Desc] AS PCICertDesc
			,[M].IntegrationMethodId, [IM].[Desc] AS IntegrationMethodDesc
			,[M].DateCreated
			,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
			FROM Merchant [M]
			LEFT JOIN CompanyType [CT] ON [M].CompanyTypeId = [CT].Id
			LEFT JOIN MerchantStatus [MS] ON [M].CompanyTypeId = [MS].Id
			LEFT JOIN ApplicationFormStatus [AFS] ON [M].ApplicationFormStatusId = [AFS].Id
			LEFT JOIN KYBStatus [KS] ON [M].KYBStatusId = [KS].Id
			LEFT JOIN ContractStatus CS ON [M].ContractStatusId = CS.Id
			LEFT JOIN Country [C] ON [M].CountryId = C.Id
			LEFT JOIN MCC [MC] ON [M].MCCId = MC.Id
			LEFT JOIN Stage [S] ON[M].StageId = S.Id
			LEFT JOIN SalesChannel [SC] ON [M].SalesChannelId = SC.Id
			LEFT JOIN Industry [I] ON [M].IndustryId = I.Id
			LEFT JOIN [User] [O] ON [M].OwnershipId = O.Id
			LEFT JOIN Country [AOD] ON [M].AddressOnContractId = AOD.Id
			LEFT JOIN Country [AOP] ON [M].AddressOnPRSId = AOP.Id
			LEFT JOIN Country [AOC] ON [M].AddressOnCOIId = AOC.Id
			LEFT JOIN ThirdPartyContract [TPC] ON	 [M].ThirdPartyContractId = TPC.Id
			LEFT JOIN PCICert [PC] ON [M].PCICertId = PC.Id
			LEFT JOIN IntegrationMethod [IM] ON	 [M].IntegrationMethodId = IM.Id
			LEFT JOIN [User] [U] ON M.UserCreatedId = [U].Id

			WHERE [M].Id = @Id
			AND [M].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[MERCHANT_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANT_GETALL]
AS
BEGIN
		SELECT
			 [M].Id
			,[M].Name
			,[M].CompanyWebsite
			,[M].CompanyTypeId, [CT].[Desc] AS CompanyTypeDesc
			,[M].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc
			,[M].ContactPerson
			,[M].ContactEmailAddress
			,[M].ApplicationFormStatusId, [AFS].[Desc] AS ApplicationFormStatusDesc
			,[M].OutageNotificationEmail
			,[M].KYBStatusId, [KS].[Desc] AS KYBStatusDesc
			,[M].EUCorp
			,[M].ContractStatusId, [CS].[Desc] AS ContractStatusDesc
			,[M].LiveInACP
			,[M].Processing
			,[M].UpdatesNotes
			,[M].CountryId, [C].[Desc] AS CountryDesc
			,[M].MCCId, [MC].[Desc] AS MCCDesc
			,[M].RegisteredAddress
			,[M].SepaEntityAddress
			,[M].StageId, [S].[Desc] AS StageDesc
			,[M].SalesChannelId, [SC].[Desc] AS SalesChannelDesc
			,[M].IndustryId, [I].[Desc] AS IndustryDesc
			,[M].IntroducedBy
			,[M].OwnershipId, [O].Firstname AS OwnershipFirstname, [O].Lastname AS OwnershipLastname
			,[M].DocumentsOutstanding
			,[M].AddressOnContractId, [AOD].[Desc] AS AddressOnContractDesc
			,[M].AddressOnPRSId, [AOP].[Desc] AS AddressOnPRSDesc
			,[M].AddressOnCOIId, [AOC].[Desc] AS AddressOnCOIDesc
			,[M].ThirdParty
			,[M].ThirdPartyContractId, [TPC].[Desc] AS ThirdPartyContractDesc
			,[M].PCICertId, [PC].[Desc] AS PCICertDesc
			,[M].IntegrationMethodId, [IM].[Desc] AS IntegrationMethodDesc
			,[M].DateCreated
			,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
			FROM Merchant [M]
			LEFT JOIN CompanyType [CT] ON [M].CompanyTypeId = [CT].Id
			LEFT JOIN MerchantStatus [MS] ON [M].CompanyTypeId = [MS].Id
			LEFT JOIN ApplicationFormStatus [AFS] ON [M].ApplicationFormStatusId = [AFS].Id
			LEFT JOIN KYBStatus [KS] ON [M].KYBStatusId = [KS].Id
			LEFT JOIN ContractStatus CS ON [M].ContractStatusId = CS.Id
			LEFT JOIN Country [C] ON [M].CountryId = C.Id
			LEFT JOIN MCC [MC] ON [M].MCCId = MC.Id
			LEFT JOIN Stage [S] ON[M].StageId = S.Id
			LEFT JOIN SalesChannel [SC] ON [M].SalesChannelId = SC.Id
			LEFT JOIN Industry [I] ON [M].IndustryId = I.Id
			LEFT JOIN [User] [O] ON [M].OwnershipId = O.Id
			LEFT JOIN Country [AOD] ON [M].AddressOnContractId = AOD.Id
			LEFT JOIN Country [AOP] ON [M].AddressOnPRSId = AOP.Id
			LEFT JOIN Country [AOC] ON [M].AddressOnCOIId = AOC.Id
			LEFT JOIN ThirdPartyContract [TPC] ON	 [M].ThirdPartyContractId = TPC.Id
			LEFT JOIN PCICert [PC] ON [M].PCICertId = PC.Id
			LEFT JOIN IntegrationMethod [IM] ON	 [M].IntegrationMethodId = IM.Id
			LEFT JOIN [User] [U] ON M.UserCreatedId = [U].Id

			WHERE 
			[M].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANT_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANT_INSERT]
	 @Name NVARCHAR(150)	
	,@CompanyWebsite NVARCHAR(150)	
	,@CompanyTypeId INT
	,@MerchantStatusId INT
	,@ContactPerson  NVARCHAR(150)
	,@ContactEmailAddress NVARCHAR(150)
	,@ApplicationFormStatusId INT
	,@OutageNotificationEmail NVARCHAR(150)
	,@KYBStatusId INT
	,@EUCorp BIT
	,@ContractStatusId INT
	,@LiveInACP BIT
	,@Processing BIT
	,@UpdatesNotes  NVARCHAR(MAX)
	,@CountryId INT
	,@MCCId INT
	,@RegisteredAddress NVARCHAR(150)
	,@SepaEntityAddress NVARCHAR(150)
	,@StageId INT
	,@SalesChannelId INT
	,@IndustryId INT
	,@IntroducedBy NVARCHAR(150)
	,@OwnershipId INT
	,@DocumentsOutstanding NVARCHAR(150)
	,@AddressOnContractId INT
	,@AddressOnPRSId INT
	,@AddressOnCOIId INT
	,@ThirdParty NVARCHAR(150)
	,@ThirdPartyContractId INT
	,@PCICertId INT
	,@IntegrationMethodId INT
	,@UserCreatedId INT
AS
BEGIN
   INSERT INTO Merchant 
	    (
		 Name 
		,CompanyWebsite	
		,CompanyTypeId 
		,MerchantStatusId 
		,ContactPerson  
		,ContactEmailAddress 
		,ApplicationFormStatusId 
		,OutageNotificationEmail 
		,KYBStatusId 
		,EUCorp 
		,ContractStatusId 
		,LiveInACP 
		,Processing 
		,UpdatesNotes  
		,CountryId 
		,MCCId 
		,RegisteredAddress 
		,SepaEntityAddress 
		,StageId 
		,SalesChannelId 
		,IndustryId 
		,IntroducedBy 
		,OwnershipId 
		,DocumentsOutstanding 
		,AddressOnContractId 
		,AddressOnPRSId 
		,AddressOnCOIId 
		,ThirdParty 
		,ThirdPartyContractId 
		,PCICertId 
		,IntegrationMethodId 
		,DateCreated
		,UserCreatedId
		,Deleted 
		)
		VALUES
		(
		 @Name
		,@CompanyWebsite 	
		,@CompanyTypeId 
		,@MerchantStatusId 
		,@ContactPerson  
		,@ContactEmailAddress 
		,@ApplicationFormStatusId 
		,@OutageNotificationEmail 
		,@KYBStatusId 
		,@EUCorp 
		,@ContractStatusId 
		,@LiveInACP 
		,@Processing 
		,@UpdatesNotes  
		,@CountryId 
		,@MCCId 
		,@RegisteredAddress 
		,@SepaEntityAddress 
		,@StageId 
		,@SalesChannelId 
		,@IndustryId 
		,@IntroducedBy 
		,@OwnershipId 
		,@DocumentsOutstanding 
		,@AddressOnContractId 
		,@AddressOnPRSId 
		,@AddressOnCOIId 
		,@ThirdParty 
		,@ThirdPartyContractId 
		,@PCICertId 
		,@IntegrationMethodId 
		,GETDATE()
		,@UserCreatedId 
		,0
		)

		SELECT CONVERT(INT, SCOPE_IDENTITY())
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANT_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANT_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
	SELECT
		 [M].Id
		,[M].Name
		,[M].CompanyWebsite
		,[M].CompanyTypeId, [CT].[Desc] AS CompanyTypeDesc
		,[M].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc
		,[M].ContactPerson
		,[M].ContactEmailAddress
		,[M].ApplicationFormStatusId, [AFS].[Desc] AS ApplicationFormStatusDesc
		,[M].OutageNotificationEmail
		,[M].KYBStatusId, [KS].[Desc] AS KYBStatusDesc
		,[M].EUCorp
		,[M].ContractStatusId, [CS].[Desc] AS ContractStatusDesc
		,[M].LiveInACP
		,[M].Processing
		,[M].UpdatesNotes
		,[M].CountryId, [C].[Desc] AS CountryDesc
		,[M].MCCId, [MC].[Desc] AS MCCDesc
		,[M].RegisteredAddress
		,[M].SepaEntityAddress
		,[M].StageId, [S].[Desc] AS StageDesc
		,[M].SalesChannelId, [SC].[Desc] AS SalesChannelDesc
		,[M].IndustryId, [I].[Desc] AS IndustryDesc
		,[M].IntroducedBy
		,[M].OwnershipId, [O].Firstname AS OwnershipFirstname, [O].Lastname AS OwnershipLastname
		,[M].DocumentsOutstanding
		,[M].AddressOnContractId, [AOD].[Desc] AS AddressOnContractDesc
		,[M].AddressOnPRSId, [AOP].[Desc] AS AddressOnPRSDesc
		,[M].AddressOnCOIId, [AOC].[Desc] AS AddressOnCOIDesc
		,[M].ThirdParty
		,[M].ThirdPartyContractId, [TPC].[Desc] AS ThirdPartyContractDesc
		,[M].PCICertId, [PC].[Desc] AS PCICertDesc
		,[M].IntegrationMethodId, [IM].[Desc] AS IntegrationMethodDesc
		,[M].DateCreated
		,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
		FROM Merchant [M]
		LEFT JOIN CompanyType [CT] ON [M].CompanyTypeId = [CT].Id
		LEFT JOIN MerchantStatus [MS] ON [M].CompanyTypeId = [MS].Id
		LEFT JOIN ApplicationFormStatus [AFS] ON [M].ApplicationFormStatusId = [AFS].Id
		LEFT JOIN KYBStatus [KS] ON [M].KYBStatusId = [KS].Id
		LEFT JOIN ContractStatus CS ON [M].ContractStatusId = CS.Id
		LEFT JOIN Country [C] ON [M].CountryId = C.Id
		LEFT JOIN MCC [MC] ON [M].MCCId = MC.Id
		LEFT JOIN Stage [S] ON[M].StageId = S.Id
		LEFT JOIN SalesChannel [SC] ON [M].SalesChannelId = SC.Id
		LEFT JOIN Industry [I] ON [M].IndustryId = I.Id
		LEFT JOIN [User] [O] ON [M].OwnershipId = O.Id
		LEFT JOIN Country [AOD] ON [M].AddressOnContractId = AOD.Id
		LEFT JOIN Country [AOP] ON [M].AddressOnPRSId = AOP.Id
		LEFT JOIN Country [AOC] ON [M].AddressOnCOIId = AOC.Id
		LEFT JOIN ThirdPartyContract [TPC] ON	 [M].ThirdPartyContractId = TPC.Id
		LEFT JOIN PCICert [PC] ON [M].PCICertId = PC.Id
		LEFT JOIN IntegrationMethod [IM] ON	 [M].IntegrationMethodId = IM.Id
		LEFT JOIN [User] [U] ON M.UserCreatedId = [U].Id

		WHERE 
		(M.Name	LIKE '%'+ @SearchText +'%'
		OR M.CompanyWebsite	LIKE '%'+ @SearchText +'%'
		OR M.OutageNotificationEmail	LIKE '%'+ @SearchText +'%'
		OR M.UpdatesNotes	LIKE '%'+ @SearchText +'%'
		OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
		AND [M].Deleted = 0
	END

GO
/****** Object:  StoredProcedure [dbo].[MERCHANT_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANT_UPDATE]
	-- Add the parameters for the stored procedure here
	 @Id INT
	,@Name NVARCHAR(150)	
	,@CompanyWebsite NVARCHAR(150)	
	,@CompanyTypeId INT
	,@MerchantStatusId INT
	,@ContactPerson  NVARCHAR(150)
	,@ContactEmailAddress NVARCHAR(150)
	,@ApplicationFormStatusId INT
	,@OutageNotificationEmail NVARCHAR(150)
	,@KYBStatusId INT
	,@EUCorp BIT
	,@ContractStatusId INT
	,@LiveInACP BIT
	,@Processing BIT
	,@UpdatesNotes  NVARCHAR(MAX)
	,@CountryId INT
	,@MCCId INT
	,@RegisteredAddress NVARCHAR(150)
	,@SepaEntityAddress NVARCHAR(150)
	,@StageId INT
	,@SalesChannelId INT
	,@IndustryId INT
	,@IntroducedBy NVARCHAR(150)
	,@OwnershipId INT
	,@DocumentsOutstanding NVARCHAR(150)
	,@AddressOnContractId INT
	,@AddressOnPRSId INT
	,@AddressOnCOIId INT
	,@ThirdParty NVARCHAR(150)
	,@ThirdPartyContractId INT
	,@PCICertId INT
	,@IntegrationMethodId INT
	--,@DateCreated DATETIME
	--,@UserCreatedId INT
	--,@Deleted
AS
BEGIN
   UPDATE Merchant SET 
	 Name = @Name 
	,CompanyWebsite = @CompanyWebsite 
	,CompanyTypeId = @CompanyTypeId 
	,MerchantStatusId = @MerchantStatusId 
	,ContactPerson = @ContactPerson 
	,ContactEmailAddress = @ContactEmailAddress 
	,ApplicationFormStatusId = @ApplicationFormStatusId 
	,OutageNotificationEmail = @OutageNotificationEmail 
	,KYBStatusId = @KYBStatusId 
	,EUCorp = @EUCorp 
	,ContractStatusId = @ContractStatusId 
	,LiveInACP = @LiveInACP 
	,Processing = @Processing 
	,UpdatesNotes = @UpdatesNotes  
	,CountryId = @CountryId 
	,MCCId = @MCCId 
	,RegisteredAddress = @RegisteredAddress 
	,SepaEntityAddress = @SepaEntityAddress 
	,StageId = @StageId 
	,SalesChannelId = @SalesChannelId 
	,IndustryId = @IndustryId 
	,IntroducedBy = @IntroducedBy 
	,OwnershipId = @OwnershipId
	,DocumentsOutstanding = @DocumentsOutstanding 
	,AddressOnContractId = @AddressOnContractId 
	,AddressOnPRSId = @AddressOnPRSId 
	,AddressOnCOIId = @AddressOnCOIId 
	,ThirdParty = @ThirdParty 
	,ThirdPartyContractId = @ThirdPartyContractId 
	,PCICertId = @PCICertId 
	,IntegrationMethodId = @IntegrationMethodId 
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTBOARDING_ADVANCEDSEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTBOARDING_ADVANCEDSEARCH]
AS
BEGIN
	SELECT 
			--Return Columns
			 [MB].Id AS MbId
			,[A].Id AS AccountId
			,[A].LegalName AS AccountLegalName --	Legal name
			,[MB].BoardingStatusId --	boarding status
			,[A].MainContactPerson AS AccountMainContactPerson --	Main contact person
			,[A].ContactPhone AS AccountContactPhone --	Main contact person’s phone number.
			,[A].Id AS AccountNumber --	A/c number
			,[MBOB].MID AS MB_OnboardingMID	
			--	VID
			--	TID
			,[A].ContactEmail AS AccountContactEmail--	E-mail address
			,[A].URL1 AS AccountURL1 --	URL


			-- Search Criteria
			,'' AS MerchantName
			,[A].TradingAsName AS AccountTradingAsName	--	Trading As name
			,'' AS ClientName
			--,[MB].BoardingStatusId --	boarding status
			--,[A].MainContactPerson--	Main contact person
			,'' AS VID
			,'' AS TID--	TID
			,[A].ContactEmail AS AccountContactEmail--	E-mail address
			,[MBOP].MCCMerchantWantsId AS MB_OpportunityMCCMerchantWantsId, [MCC].[Desc] AS MB_OpportunityMCCMerchantWantsDesc -- [A].MCC 
			,[A].URL1 AS AccountURL1 --	URL
			,'' AS Skype -- [A].Skype
			,[A].TradingAddress1 AS AccountTradingAddress1
			,[A].TradingAddress2 AS AccountTradingAddress2 	
			,[A].TradingAddress3 AS AccountTradingAddress3
			,[MBOB].IBANEUR AS MB_OnboardingIBANEUR
			,[MBOB].IBANGBP AS MB_OnboardingIBANGBP
			,[MBOB].IBANUSD AS MB_OnboardingIBANUSD	
			,[A].MerchantStatusId AS AccountMerchantStatusId, [MS].[Desc] AS AccountMerchantStatusDesc	--int	Checked
			,[A].CountryId AS AccountCountryId, [C].[Desc] AS AccountCountryDesc	--int	Checked

		FROM [MerchantBoarding] [MB]
		LEFT JOIN Account [A] ON [A].Id = [MB].AccountId
		LEFT JOIN [MerchantStatus] [MS] ON [MS].Id = [A].MerchantStatusId
		LEFT JOIN [MB_Opportunity] [MBOP] ON [MBOP].MbId = [MB].Id
		LEFT JOIN [MCC] [MCC] ON [MCC].Id = [MBOP].MCCMerchantWantsId
		LEFT JOIN [Country] [C] ON [C].Id = [A].CountryId
		LEFT JOIN [MB_Onboarding] [MBOB] ON [MBOB].MbId = [MB].Id
		
	WHERE 
		[A].Deleted = 0
	AND [MB].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTBOARDING_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTBOARDING_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE MerchantBoarding SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTBOARDING_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTBOARDING_GET] 
@Id INT
AS
BEGIN
	SELECT
			 [MB].Id	
			,[MB].AccountId AS AccountId, [A].LegalName As AccountLegalName
			,[MB].DateRiskAppReceived	
			,[MB].DateFullAppreceived	
			,[MB].BoardingStatusId, [BS].[Desc] AS BoardingStatusDesc
			,[A].LegalName --,[MB].LegalName	
			,[A].URL1	-- ,[MB].Url1	
			,[MB].Url2	
			,[MB].Url3	
			,[MB].Url4	
			,[MB].Url5	
			,[MB].PrincipalContact
			,[A].ContactEmail AS Email --,[MB].Email
			,[A].ContactPhone AS Phone	-- ,[MB].Phone	
			,[MB].BusinessIncorpDate	
			,[MB].CompanyRegNumber	
			,[A].Address1 AS AddressLine1	--,[MB].AddressLine1	
			,[A].Address2 AS AddressLine2	--,[MB].AddressLine2	
			,[A].Address3 AS AddressLine3	--,[MB].AddressLine3	
			,[MB].AddressLine4
			,[A].PostCode	--	,[MB].PostCode
			,[A].CountryId AS CountryId, [C].[Desc] AS CountryDesc	--,[MB].CountryId AS CountryId, [C].[Desc] AS CountryDesc	
			,[MB].AgentReferral
			,[A].MainContactPerson AS Contact --,[MB].Contact	
			,[MB].Mids	
			,[MB].ProcessingType	
			,[MB].MCC	
			,[MB].Currencies	
			,[A].BusinessDesc AS BusinessDescription	--	,[MB].BusinessDescription	
			,[MB].ChargebacksContact	
			,[MB].TechContact	
			,[MB].TechEmail	
			,[MB].TechPhoneNumber	
			,[MB].AverageTicket
			,[MB].MinTicket	
			,[MB].MaxTicket	
			,[MB].ProjectedMonthlyVol	
			,[MB].Descriptor	
			,[MB].TestLoginEmail	
			,[MB].TestLoginPassword	
			,[MB].AffiliateProgramme	
			,[MB].FreeTrailProduct	
			,[MB].RecurringBilling	
			,[MB].InstallmentBilling	
			,[MB].DeliveryMethod	
			,[A].IsRegulatedBusiness AS RegulatedByAuthority	--	,[MB].RegulatedByAuthority	
			,[MB].DeliveryTime	
			,[MB].BicSwift	
			,[MB].IBAN	
			,[MB].SortCode	
			,[MB].AccountHolderName	
			,[MB].BankNameAddress	
			,[MB].AdditionalInfo	
			,[MB].CurrentPrevAcquirer
			,[MB].PrevAcquirerLocation
			,[MB].HasEverTerminated	
			,[MB].HasEverTerminatedReason	
			,[MB].CurrentTerminateReason	
			,[MB].CompleteApplication	
			,[MB].CertOfIncorpRegistration	
			,[MB].ConfirmationOfCompanyDirectors
			,[MB].ConfirmationOfShareholding
			,[MB].IDForAllDirectorShareholders
			,[MB].AVForAllDirectorShareholders
			,[MB].ThreeMonthsProcessingHistory
			,[MB].LicenceToOperateIfRequired
			,[MB].TaxIDOrVATNumber
			,[MB].ConfirmationOfCompanyBankDetails	
			,[MB].SupplierBills
			,[MB].SampleCustomerInvoices
			,[MB].WrittenBusinessDescriptionPlan
			,[MB].SalesComments
			,[MB].OutStanding
			,[A].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc --,[MB].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc

			,[MB].LegalOpinion 

			,[MB].TaxVatChecker  
			,[MB].IbanChecker  
			,[MB].ReqLicence   
			,[MB].LegalOpinionProvided  
			,[MB].WOTCheck  
			,[MB].SSLChecker    
			,[MB].WhoIsCheck    
			,[MB].InputOnC6  
			,[MB].MediaSearchCompany  
			,[MB].MediaSearchDirectorsSH     
			,[MB].GoogleMapsCheck    
			,[MB].OfacSearch    
			,[MB].Match  
			,[MB].VMAS  
			,[MB].CompanyUrlsOntoWebshield  
			,[MB].CheckPhoneNumbers 
			,[MB].ObtainAffiliate   

			,[MB].IsPCICompliant    
			,[MB].SecurityAccessorName 
			,[MB].MidDataCompromise 
			,[MB].DataCompromiseDetails 



			,[MB].SSLEncrypted  
			,[MB].PrivacyPolicy  
			,[MB].RefundReturnPolicy  
			,[MB].TermsAndConditions   
			,[MB].ClearlyDisplayed 
			,[MB].ClearlyDescribed   
			,[MB].ClearPricing   
			,[MB].DeliveryShippingPolicy  
			,[MB].TickBoxOnCheckout  
			,[MB].NameMatchActivity   
			,[MB].VMLogoDisplayed  
			,[MB].AllSubstancesLegal  
			,[MB].AffiliatesListed  
			,[MB].LegalEntityMentioned    
			,[MB].CompanyAddressListed  
			,[MB].CustomerServiceOnSite  

			,[MB].AvgSalesPerMonthVisa 
			,[MB].AvgSalesPerMonthMC 
			,[MB].AvgFraudToSalesPerMonthVisa 
			,[MB].AvgFraudToSalesPerMonthMC 
			,[MB].AvgNumberOfCheckbacksPerMonthVisa 
			,[MB].AvgNumberOfCheckbacksPerMonthMC 
			,[MB].AvgMonthlyCheckbackRatioVisa 
			,[MB].AvgMonthlyCheckbackRatioMC 
			,[MB].TC403MonthsDataProvidedVisa 
			,[MB].TC403MonthsDataProvidedMC  
			,[MB].Safe3MonthsDataProvidedVisa  
			,[MB].Safe3MonthsDataProvidedMC 
			,[MB].EverBreachedSchemeVisa    
			,[MB].EverBreachedSchemeMC   
			,[MB].BreachedSchemeProgrammeDetails 

			,[MB].Confirm3DsWillBeEnabled 
			,[MB].ConfirmMerchantAsksCustomers 
			,[MB].ConfirmMerchantCanProduceInvoices 
			,[MB].ConfirmInvoicesContainInfo 
			,[A].TradingAsName AS FullCustomerName -- ,[MB].FullCustomerName 
			,[MB].FullCustomerAddress 
			,[MB].FullProductDescription 
			,[MB].QuantityOfGoodsSold 
			,[MB].PriceOfTransactionDisplayed 
			,[MB].DateOfTransaction 
			,[MB].CapturesKYCDocs 
			,[MB].KYCMeasuresConsistOf 
			,[MB].ConfirmGenuineCHName 
			,[MB].Confirm3DForAllInitialTransaction 
			,[MB].IntroduceSignOnDelivery 
			,[MB].EmailNotificationToTrialExpiring 
		    ,[MB].EmailNotificationToSpecifyTheAmount 

			,[MB].Skype	
			,[MB].IsLicensed	
			,[MB].LicensedCountryId AS LicensedCountryId, [LC].[Desc] AS LicensedCountryDesc
			,[MB].LicenseNumber
			,[MB].RegulatedCountryId AS RegulatedCountryId, [RC].[Desc] AS RegulatedCountryDesc
			,[MB].HearSourceId AS HearSourceId, [HS].[Desc] AS HearSourceDesc
			,[MB].TransactionModel	
			,[MB].CardholderGeographies	
			,[MB].MixOfIntEEATransactions	
			,[MB].NDAInPlace	
			,[MB].NDASignedDate	
			,[MB].ReqAcquiring	
			,[MB].ReqIssuing	
			,[MB].ReqOCT	
			,[MB].ReqProcessing	
			,[MB].ReqPOS	
			,[MB].StageId AS StageId, [S].[Desc] AS StageDesc
			,[MB].Probability	
			,[MB].RiskProfileId	

			,[MB].DateCreated	
			,[MB].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM MerchantBoarding [MB]
		LEFT JOIN Account [A] ON [A].Id = [MB].AccountId
		LEFT JOIN Country [C] ON [C].Id = [A].CountryId
		LEFT JOIN MerchantStatus [MS] ON [MS].Id = [A].MerchantStatusId 
		LEFT JOIN BoardingStatus [BS] ON  [BS].Id = [MB].BoardingStatusId
		LEFT JOIN HearSource [HS] ON [HS].Id = [MB].HearSourceId 
		LEFT JOIN Stage [S] ON [S].Id = [MB].StageId
		LEFT JOIN Country [LC] ON [LC].Id = [MB].LicensedCountryId
		LEFT JOIN Country [RC] ON [RC].Id = [MB].RegulatedCountryId
		LEFT JOIN [User] [U] ON [U].Id = [MB].UserCreatedId
	WHERE 
	  [MB].Id = @Id
	  AND [MB].Deleted = 0

		EXEC	[dbo].[MB_COMMERCIALS_GETBYMBID] @Id
		EXEC	[dbo].[MB_CONTRACT_GETBYMBID] @Id
		EXEC	[dbo].[MB_ONBOARDING_GETBYMBID] @Id
		EXEC	[dbo].[MB_OPPORTUNITY_GETBYMBID] @Id
		EXEC	[dbo].[MB_IPADDRESS_GETBYMBIDIPTYPE] @Id, 1
		EXEC	[dbo].[MB_IPADDRESS_GETBYMBIDIPTYPE] @Id, 2
 END

GO
/****** Object:  StoredProcedure [dbo].[MERCHANTBOARDING_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTBOARDING_GETALL]
AS
BEGIN
	SELECT  
			 [MB].Id	
			,[MB].AccountId AS AccountId, [A].LegalName As AccountLegalName
			,[MB].DateRiskAppReceived	
			,[MB].DateFullAppreceived	
			,[MB].BoardingStatusId, [BS].[Desc] AS BoardingStatusDesc
			,[A].LegalName --,[MB].LegalName	
			,[A].URL1	-- ,[MB].Url1	
			,[MB].Url2	
			,[MB].Url3	
			,[MB].Url4	
			,[MB].Url5	
			,[MB].PrincipalContact
			,[A].ContactEmail AS Email --,[MB].Email
			,[A].ContactPhone AS Phone	-- ,[MB].Phone	
			,[MB].BusinessIncorpDate	
			,[MB].CompanyRegNumber	
			,[A].Address1 AS AddressLine1	--,[MB].AddressLine1	
			,[A].Address2 AS AddressLine2	--,[MB].AddressLine2	
			,[A].Address3 AS AddressLine3	--,[MB].AddressLine3	
			,[MB].AddressLine4
			,[A].PostCode	--	,[MB].PostCode
			,[A].CountryId AS CountryId, [C].[Desc] AS CountryDesc	--,[MB].CountryId AS CountryId, [C].[Desc] AS CountryDesc	
			,[MB].AgentReferral
			,[A].MainContactPerson AS Contact --,[MB].Contact	
			,[MB].Mids	
			,[MB].ProcessingType	
			,[MB].MCC	
			,[MB].Currencies	
			,[A].BusinessDesc AS BusinessDescription	--	,[MB].BusinessDescription	
			,[MB].ChargebacksContact	
			,[MB].TechContact	
			,[MB].TechEmail	
			,[MB].TechPhoneNumber	
			,[MB].AverageTicket
			,[MB].MinTicket	
			,[MB].MaxTicket	
			,[MB].ProjectedMonthlyVol	
			,[MB].Descriptor	
			,[MB].TestLoginEmail	
			,[MB].TestLoginPassword	
			,[MB].AffiliateProgramme	
			,[MB].FreeTrailProduct	
			,[MB].RecurringBilling	
			,[MB].InstallmentBilling	
			,[MB].DeliveryMethod	
			,[A].IsRegulatedBusiness AS RegulatedByAuthority	--	,[MB].RegulatedByAuthority	
			,[MB].DeliveryTime	
			,[MB].BicSwift	
			,[MB].IBAN	
			,[MB].SortCode	
			,[MB].AccountHolderName	
			,[MB].BankNameAddress	
			,[MB].AdditionalInfo	
			,[MB].CurrentPrevAcquirer
			,[MB].PrevAcquirerLocation
			,[MB].HasEverTerminated	
			,[MB].HasEverTerminatedReason	
			,[MB].CurrentTerminateReason	
			,[MB].CompleteApplication	
			,[MB].CertOfIncorpRegistration	
			,[MB].ConfirmationOfCompanyDirectors
			,[MB].ConfirmationOfShareholding
			,[MB].IDForAllDirectorShareholders
			,[MB].AVForAllDirectorShareholders
			,[MB].ThreeMonthsProcessingHistory
			,[MB].LicenceToOperateIfRequired
			,[MB].TaxIDOrVATNumber
			,[MB].ConfirmationOfCompanyBankDetails	
			,[MB].SupplierBills
			,[MB].SampleCustomerInvoices
			,[MB].WrittenBusinessDescriptionPlan
			,[MB].SalesComments
			,[MB].OutStanding
			,[A].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc --,[MB].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc

			,[MB].LegalOpinion 

			,[MB].TaxVatChecker  
			,[MB].IbanChecker  
			,[MB].ReqLicence   
			,[MB].LegalOpinionProvided  
			,[MB].WOTCheck  
			,[MB].SSLChecker    
			,[MB].WhoIsCheck    
			,[MB].InputOnC6  
			,[MB].MediaSearchCompany  
			,[MB].MediaSearchDirectorsSH     
			,[MB].GoogleMapsCheck    
			,[MB].OfacSearch    
			,[MB].Match  
			,[MB].VMAS  
			,[MB].CompanyUrlsOntoWebshield  
			,[MB].CheckPhoneNumbers 
			,[MB].ObtainAffiliate   

			,[MB].IsPCICompliant    
			,[MB].SecurityAccessorName 
			,[MB].MidDataCompromise 
			,[MB].DataCompromiseDetails 



			,[MB].SSLEncrypted  
			,[MB].PrivacyPolicy  
			,[MB].RefundReturnPolicy  
			,[MB].TermsAndConditions   
			,[MB].ClearlyDisplayed 
			,[MB].ClearlyDescribed   
			,[MB].ClearPricing   
			,[MB].DeliveryShippingPolicy  
			,[MB].TickBoxOnCheckout  
			,[MB].NameMatchActivity   
			,[MB].VMLogoDisplayed  
			,[MB].AllSubstancesLegal  
			,[MB].AffiliatesListed  
			,[MB].LegalEntityMentioned    
			,[MB].CompanyAddressListed  
			,[MB].CustomerServiceOnSite  

			,[MB].AvgSalesPerMonthVisa 
			,[MB].AvgSalesPerMonthMC 
			,[MB].AvgFraudToSalesPerMonthVisa 
			,[MB].AvgFraudToSalesPerMonthMC 
			,[MB].AvgNumberOfCheckbacksPerMonthVisa 
			,[MB].AvgNumberOfCheckbacksPerMonthMC 
			,[MB].AvgMonthlyCheckbackRatioVisa 
			,[MB].AvgMonthlyCheckbackRatioMC 
			,[MB].TC403MonthsDataProvidedVisa 
			,[MB].TC403MonthsDataProvidedMC  
			,[MB].Safe3MonthsDataProvidedVisa  
			,[MB].Safe3MonthsDataProvidedMC 
			,[MB].EverBreachedSchemeVisa    
			,[MB].EverBreachedSchemeMC   
			,[MB].BreachedSchemeProgrammeDetails 

			,[MB].Confirm3DsWillBeEnabled 
			,[MB].ConfirmMerchantAsksCustomers 
			,[MB].ConfirmMerchantCanProduceInvoices 
			,[MB].ConfirmInvoicesContainInfo 
			,[A].TradingAsName AS FullCustomerName -- ,[MB].FullCustomerName 
			,[MB].FullCustomerAddress 
			,[MB].FullProductDescription 
			,[MB].QuantityOfGoodsSold 
			,[MB].PriceOfTransactionDisplayed 
			,[MB].DateOfTransaction 
			,[MB].CapturesKYCDocs 
			,[MB].KYCMeasuresConsistOf 
			,[MB].ConfirmGenuineCHName 
			,[MB].Confirm3DForAllInitialTransaction 
			,[MB].IntroduceSignOnDelivery 
			,[MB].EmailNotificationToTrialExpiring 
		    ,[MB].EmailNotificationToSpecifyTheAmount 

			,[MB].Skype	
			,[MB].IsLicensed	
			,[MB].LicensedCountryId AS LicensedCountryId, [LC].[Desc] AS LicensedCountryDesc
			,[MB].LicenseNumber
			,[MB].RegulatedCountryId AS RegulatedCountryId, [RC].[Desc] AS RegulatedCountryDesc
			,[MB].HearSourceId AS HearSourceId, [HS].[Desc] AS HearSourceDesc
			,[MB].TransactionModel	
			,[MB].CardholderGeographies	
			,[MB].MixOfIntEEATransactions	
			,[MB].NDAInPlace	
			,[MB].NDASignedDate	
			,[MB].ReqAcquiring	
			,[MB].ReqIssuing	
			,[MB].ReqOCT	
			,[MB].ReqProcessing	
			,[MB].ReqPOS	
			,[MB].StageId AS StageId, [S].[Desc] AS StageDesc
			,[MB].Probability	
			,[MB].RiskProfileId	

			,[MB].DateCreated	
			,[MB].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM MerchantBoarding [MB]
		LEFT JOIN Account [A] ON [A].Id = [MB].AccountId
		LEFT JOIN Country [C] ON [C].Id = [A].CountryId
		LEFT JOIN MerchantStatus [MS] ON [MS].Id = [A].MerchantStatusId 
		LEFT JOIN BoardingStatus [BS] ON  [BS].Id = [MB].BoardingStatusId
		LEFT JOIN HearSource [HS] ON [HS].Id = [MB].HearSourceId 
		LEFT JOIN Stage [S] ON [S].Id = [MB].StageId
		LEFT JOIN Country [LC] ON [LC].Id = [MB].LicensedCountryId
		LEFT JOIN Country [RC] ON [RC].Id = [MB].RegulatedCountryId
		LEFT JOIN [User] [U] ON [U].Id = [MB].UserCreatedId
	WHERE 
	 [MB].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTBOARDING_GETALLBYBOARDINGSTATUS]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTBOARDING_GETALLBYBOARDINGSTATUS]
@BoardingStatusId INT
AS
BEGIN
		SELECT
			 [MB].Id	
			,[MB].AccountId AS AccountId, [A].LegalName As AccountLegalName
			,[MB].DateRiskAppReceived	
			,[MB].DateFullAppreceived	
			,[MB].BoardingStatusId, [BS].[Desc] AS BoardingStatusDesc
			,[A].LegalName --,[MB].LegalName	
			,[A].URL1	-- ,[MB].Url1	
			,[MB].Url2	
			,[MB].Url3	
			,[MB].Url4	
			,[MB].Url5	
			,[MB].PrincipalContact
			,[A].ContactEmail AS Email --,[MB].Email
			,[A].ContactPhone AS Phone	-- ,[MB].Phone	
			,[MB].BusinessIncorpDate	
			,[MB].CompanyRegNumber	
			,[A].Address1 AS AddressLine1	--,[MB].AddressLine1	
			,[A].Address2 AS AddressLine2	--,[MB].AddressLine2	
			,[A].Address3 AS AddressLine3	--,[MB].AddressLine3	
			,[MB].AddressLine4
			,[A].PostCode	--	,[MB].PostCode
			,[A].CountryId AS CountryId, [C].[Desc] AS CountryDesc	--,[MB].CountryId AS CountryId, [C].[Desc] AS CountryDesc	
			,[MB].AgentReferral
			,[A].MainContactPerson AS Contact --,[MB].Contact	
			,[MB].Mids	
			,[MB].ProcessingType	
			,[MB].MCC	
			,[MB].Currencies	
			,[A].BusinessDesc AS BusinessDescription	--	,[MB].BusinessDescription	
			,[MB].ChargebacksContact	
			,[MB].TechContact	
			,[MB].TechEmail	
			,[MB].TechPhoneNumber	
			,[MB].AverageTicket
			,[MB].MinTicket	
			,[MB].MaxTicket	
			,[MB].ProjectedMonthlyVol	
			,[MB].Descriptor	
			,[MB].TestLoginEmail	
			,[MB].TestLoginPassword	
			,[MB].AffiliateProgramme	
			,[MB].FreeTrailProduct	
			,[MB].RecurringBilling	
			,[MB].InstallmentBilling	
			,[MB].DeliveryMethod	
			,[A].IsRegulatedBusiness AS RegulatedByAuthority	--	,[MB].RegulatedByAuthority	
			,[MB].DeliveryTime	
			,[MB].BicSwift	
			,[MB].IBAN	
			,[MB].SortCode	
			,[MB].AccountHolderName	
			,[MB].BankNameAddress	
			,[MB].AdditionalInfo	
			,[MB].CurrentPrevAcquirer
			,[MB].PrevAcquirerLocation
			,[MB].HasEverTerminated	
			,[MB].HasEverTerminatedReason	
			,[MB].CurrentTerminateReason	
			,[MB].CompleteApplication	
			,[MB].CertOfIncorpRegistration	
			,[MB].ConfirmationOfCompanyDirectors
			,[MB].ConfirmationOfShareholding
			,[MB].IDForAllDirectorShareholders
			,[MB].AVForAllDirectorShareholders
			,[MB].ThreeMonthsProcessingHistory
			,[MB].LicenceToOperateIfRequired
			,[MB].TaxIDOrVATNumber
			,[MB].ConfirmationOfCompanyBankDetails	
			,[MB].SupplierBills
			,[MB].SampleCustomerInvoices
			,[MB].WrittenBusinessDescriptionPlan
			,[MB].SalesComments
			,[MB].OutStanding
			,[A].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc --,[MB].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc

			,[MB].LegalOpinion 

			,[MB].TaxVatChecker  
			,[MB].IbanChecker  
			,[MB].ReqLicence   
			,[MB].LegalOpinionProvided  
			,[MB].WOTCheck  
			,[MB].SSLChecker    
			,[MB].WhoIsCheck    
			,[MB].InputOnC6  
			,[MB].MediaSearchCompany  
			,[MB].MediaSearchDirectorsSH     
			,[MB].GoogleMapsCheck    
			,[MB].OfacSearch    
			,[MB].Match  
			,[MB].VMAS  
			,[MB].CompanyUrlsOntoWebshield  
			,[MB].CheckPhoneNumbers 
			,[MB].ObtainAffiliate   

			,[MB].IsPCICompliant    
			,[MB].SecurityAccessorName 
			,[MB].MidDataCompromise 
			,[MB].DataCompromiseDetails 



			,[MB].SSLEncrypted  
			,[MB].PrivacyPolicy  
			,[MB].RefundReturnPolicy  
			,[MB].TermsAndConditions   
			,[MB].ClearlyDisplayed 
			,[MB].ClearlyDescribed   
			,[MB].ClearPricing   
			,[MB].DeliveryShippingPolicy  
			,[MB].TickBoxOnCheckout  
			,[MB].NameMatchActivity   
			,[MB].VMLogoDisplayed  
			,[MB].AllSubstancesLegal  
			,[MB].AffiliatesListed  
			,[MB].LegalEntityMentioned    
			,[MB].CompanyAddressListed  
			,[MB].CustomerServiceOnSite  

			,[MB].AvgSalesPerMonthVisa 
			,[MB].AvgSalesPerMonthMC 
			,[MB].AvgFraudToSalesPerMonthVisa 
			,[MB].AvgFraudToSalesPerMonthMC 
			,[MB].AvgNumberOfCheckbacksPerMonthVisa 
			,[MB].AvgNumberOfCheckbacksPerMonthMC 
			,[MB].AvgMonthlyCheckbackRatioVisa 
			,[MB].AvgMonthlyCheckbackRatioMC 
			,[MB].TC403MonthsDataProvidedVisa 
			,[MB].TC403MonthsDataProvidedMC  
			,[MB].Safe3MonthsDataProvidedVisa  
			,[MB].Safe3MonthsDataProvidedMC 
			,[MB].EverBreachedSchemeVisa    
			,[MB].EverBreachedSchemeMC   
			,[MB].BreachedSchemeProgrammeDetails 

			,[MB].Confirm3DsWillBeEnabled 
			,[MB].ConfirmMerchantAsksCustomers 
			,[MB].ConfirmMerchantCanProduceInvoices 
			,[MB].ConfirmInvoicesContainInfo 
			,[A].TradingAsName AS FullCustomerName -- ,[MB].FullCustomerName 
			,[MB].FullCustomerAddress 
			,[MB].FullProductDescription 
			,[MB].QuantityOfGoodsSold 
			,[MB].PriceOfTransactionDisplayed 
			,[MB].DateOfTransaction 
			,[MB].CapturesKYCDocs 
			,[MB].KYCMeasuresConsistOf 
			,[MB].ConfirmGenuineCHName 
			,[MB].Confirm3DForAllInitialTransaction 
			,[MB].IntroduceSignOnDelivery 
			,[MB].EmailNotificationToTrialExpiring 
		    ,[MB].EmailNotificationToSpecifyTheAmount 

			,[MB].Skype	
			,[MB].IsLicensed	
			,[MB].LicensedCountryId AS LicensedCountryId, [LC].[Desc] AS LicensedCountryDesc
			,[MB].LicenseNumber
			,[MB].RegulatedCountryId AS RegulatedCountryId, [RC].[Desc] AS RegulatedCountryDesc
			,[MB].HearSourceId AS HearSourceId, [HS].[Desc] AS HearSourceDesc
			,[MB].TransactionModel	
			,[MB].CardholderGeographies	
			,[MB].MixOfIntEEATransactions	
			,[MB].NDAInPlace	
			,[MB].NDASignedDate	
			,[MB].ReqAcquiring	
			,[MB].ReqIssuing	
			,[MB].ReqOCT	
			,[MB].ReqProcessing	
			,[MB].ReqPOS	
			,[MB].StageId AS StageId, [S].[Desc] AS StageDesc
			,[MB].Probability	
			,[MB].RiskProfileId	

			,[MB].DateCreated	
			,[MB].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM MerchantBoarding [MB]
		LEFT JOIN Account [A] ON [A].Id = [MB].AccountId
		LEFT JOIN Country [C] ON [C].Id = [A].CountryId
		LEFT JOIN MerchantStatus [MS] ON [MS].Id = [A].MerchantStatusId 
		LEFT JOIN BoardingStatus [BS] ON  [BS].Id = [MB].BoardingStatusId
		LEFT JOIN HearSource [HS] ON [HS].Id = [MB].HearSourceId 
		LEFT JOIN Stage [S] ON [S].Id = [MB].StageId
		LEFT JOIN Country [LC] ON [LC].Id = [MB].LicensedCountryId
		LEFT JOIN Country [RC] ON [RC].Id = [MB].RegulatedCountryId
		LEFT JOIN [User] [U] ON [U].Id = [MB].UserCreatedId
	WHERE 
	  [MB].BoardingStatusId = @BoardingStatusId
	  AND [MB].Deleted = 0
 END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTBOARDING_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTBOARDING_INSERT]
		
			 @AccountId INT
			,@DateRiskAppReceived	DATETIME
			,@DateFullAppreceived	DATETIME
			,@BoardingStatusId INT
			,@LegalName		NVARCHAR(100)
			,@Url1			NVARCHAR(100)
			,@Url2			NVARCHAR(100)
			,@Url3			NVARCHAR(100)
			,@Url4			NVARCHAR(100)
			,@Url5			NVARCHAR(100)
			,@PrincipalContact		NVARCHAR(100)
			,@Email			NVARCHAR(100)
			,@Phone			NVARCHAR(100)
			,@BusinessIncorpDate			DATETIME
			,@CompanyRegNumber			NVARCHAR(100)
			,@AddressLine1			NVARCHAR(100)
			,@AddressLine2			NVARCHAR(100)
			,@AddressLine3			NVARCHAR(100)
			,@AddressLine4			NVARCHAR(100)
			,@PostCode			NVARCHAR(100)
			,@CountryId INT
			,@AgentReferral		NVARCHAR(100)
			,@Contact			NVARCHAR(100)
			,@Mids			NVARCHAR(100)
			,@ProcessingType			NVARCHAR(100)
			,@MCC			NVARCHAR(100)
			,@Currencies			NVARCHAR(100)
			,@BusinessDescription			NVARCHAR(100)
			,@ChargebacksContact			NVARCHAR(100)
			,@TechContact			NVARCHAR(100)
			,@TechEmail			NVARCHAR(100)
			,@TechPhoneNumber			NVARCHAR(100)
			,@AverageTicket		NVARCHAR(100)
			,@MinTicket			NVARCHAR(100)
			,@MaxTicket			NVARCHAR(100)
			,@ProjectedMonthlyVol			DECIMAL(8,2)
			,@Descriptor			NVARCHAR(100)
			,@TestLoginEmail			NVARCHAR(100)
			,@TestLoginPassword			NVARCHAR(100)
			,@AffiliateProgramme			BIT
			,@FreeTrailProduct			BIT
			,@RecurringBilling			BIT
			,@InstallmentBilling			BIT
			,@DeliveryMethod			NVARCHAR(100)
			,@RegulatedByAuthority			BIT
			,@DeliveryTime			NVARCHAR(100)
			,@BicSwift			NVARCHAR(100)
			,@IBAN			NVARCHAR(100)
			,@SortCode			NVARCHAR(100)
			,@AccountHolderName			NVARCHAR(100)
			,@BankNameAddress			NVARCHAR(100)
			,@AdditionalInfo		NVARCHAR(100)
			,@CurrentPrevAcquirer	NVARCHAR(100)
			,@PrevAcquirerLocation		NVARCHAR(100)
			,@HasEverTerminated		BIT
			,@HasEverTerminatedReason	NVARCHAR(100)
			,@CurrentTerminateReason	NVARCHAR(100)
			,@CompleteApplication	BIT
			,@CertOfIncorpRegistration	BIT
			,@ConfirmationOfCompanyDirectors BIT
			,@ConfirmationOfShareholding	BIT
			,@IDForAllDirectorShareholders	BIT
			,@AVForAllDirectorShareholders	BIT
			,@ThreeMonthsProcessingHistory	BIT
			,@LicenceToOperateIfRequired	BIT
			,@TaxIDOrVATNumber	BIT
			,@ConfirmationOfCompanyBankDetails		BIT
			,@SupplierBills	BIT
			,@SampleCustomerInvoices	BIT
			,@WrittenBusinessDescriptionPlan	BIT
			,@SalesComments NTEXT
			,@OutStanding TEXT
			,@MerchantStatusId INT

	   ,@LegalOpinion BIT

        ,@TaxVatChecker BIT
        ,@IbanChecker BIT
        ,@ReqLicence BIT
        ,@LegalOpinionProvided BIT
        ,@WOTCheck BIT
        ,@SSLChecker BIT
        ,@WhoIsCheck BIT
        ,@InputOnC6 BIT
        ,@MediaSearchCompany BIT
        ,@MediaSearchDirectorsSH BIT
        ,@GoogleMapsCheck BIT
        ,@OfacSearch BIT
        ,@Match BIT
        ,@VMAS BIT
        ,@CompanyUrlsOntoWebshield BIT
        ,@CheckPhoneNumbers BIT
        ,@ObtainAffiliate BIT

        ,@IsPCICompliant BIT
        ,@SecurityAccessorName BIT
        ,@MidDataCompromise BIT
        ,@DataCompromiseDetails NVARCHAR(100)



        ,@SSLEncrypted BIT
        ,@PrivacyPolicy BIT
        ,@RefundReturnPolicy BIT
        ,@TermsAndConditions BIT
        ,@ClearlyDisplayed BIT
        ,@ClearlyDescribed BIT
        ,@ClearPricing BIT
        ,@DeliveryShippingPolicy INT
        ,@TickBoxOnCheckout INT
        ,@NameMatchActivity INT
        ,@VMLogoDisplayed BIT
        ,@AllSubstancesLegal INT
        ,@AffiliatesListed BIT
        ,@LegalEntityMentioned INT
        ,@CompanyAddressListed BIT
        ,@CustomerServiceOnSite BIT

        ,@AvgSalesPerMonthVisa DECIMAL(18,4)
        ,@AvgSalesPerMonthMC DECIMAL(18,4)
        ,@AvgFraudToSalesPerMonthVisa INT
        ,@AvgFraudToSalesPerMonthMC INT
        ,@AvgNumberOfCheckbacksPerMonthVisa DECIMAL(18,4)
        ,@AvgNumberOfCheckbacksPerMonthMC DECIMAL(18,4)
        ,@AvgMonthlyCheckbackRatioVisa INT
        ,@AvgMonthlyCheckbackRatioMC INT
        ,@TC403MonthsDataProvidedVisa BIT
        ,@TC403MonthsDataProvidedMC BIT
        ,@Safe3MonthsDataProvidedVisa BIT
        ,@Safe3MonthsDataProvidedMC BIT
        ,@EverBreachedSchemeVisa BIT
        ,@EverBreachedSchemeMC BIT
        ,@BreachedSchemeProgrammeDetails NVARCHAR(100)

        ,@Confirm3DsWillBeEnabled BIT
        ,@ConfirmMerchantAsksCustomers BIT
        ,@ConfirmMerchantCanProduceInvoices BIT
        ,@ConfirmInvoicesContainInfo BIT
        ,@FullCustomerName 	NVARCHAR(100)
        ,@FullCustomerAddress 	NVARCHAR(100)
        ,@FullProductDescription	NVARCHAR(100)
        ,@QuantityOfGoodsSold 	NVARCHAR(100)
        ,@PriceOfTransactionDisplayed 	NVARCHAR(100)
        ,@DateOfTransaction 	NVARCHAR(100)
        ,@CapturesKYCDocs BIT
        ,@KYCMeasuresConsistOf BIT
        ,@ConfirmGenuineCHName BIT
        ,@Confirm3DForAllInitialTransaction BIT
        ,@IntroduceSignOnDelivery BIT
        ,@EmailNotificationToTrialExpiring BIT
        ,@EmailNotificationToSpecifyTheAmount BIT

		,@Skype	NVARCHAR(50)
		,@IsLicensed BIT
		,@LicensedCountryId INT
		,@LicenseNumber NVARCHAR(50)
		,@RegulatedCountryId INT
		,@HearSourceId INT
		,@TransactionModel	 NVARCHAR(50)
		,@CardholderGeographies	 NVARCHAR(500)
		,@MixOfIntEEATransactions	 NVARCHAR(50)
		,@NDAInPlace	 BIT
		,@NDASignedDate	DATETIME
		,@ReqAcquiring	 BIT
		,@ReqIssuing	 BIT
		,@ReqOCT	 BIT
		,@ReqProcessing	 BIT
		,@ReqPOS	 BIT
		,@StageId  INT
		,@Probability	 INT
		,@RiskProfileId	 INT

		,@UserCreatedId INT
AS
BEGIN
   INSERT INTO MerchantBoarding 
			(AccountId
			,DateRiskAppReceived	
			,DateFullAppreceived	
			,BoardingStatusId
			,LegalName		
			,Url1			
			,Url2			
			,Url3			
			,Url4			
			,Url5			
			,PrincipalContact		
			,Email			
			,Phone			
			,BusinessIncorpDate			
			,CompanyRegNumber			
			,AddressLine1			
			,AddressLine2			
			,AddressLine3			
			,AddressLine4			
			,PostCode			
			,CountryId	
			,AgentReferral		
			,Contact			
			,Mids			
			,ProcessingType			
			,MCC			
			,Currencies			
			,BusinessDescription			
			,ChargebacksContact			
			,TechContact			
			,TechEmail			
			,TechPhoneNumber			
			,AverageTicket		
			,MinTicket			
			,MaxTicket			
			,ProjectedMonthlyVol			
			,Descriptor			
			,TestLoginEmail			
			,TestLoginPassword			
			,AffiliateProgramme			
			,FreeTrailProduct			
			,RecurringBilling			
			,InstallmentBilling			
			,DeliveryMethod			
			,RegulatedByAuthority			
			,DeliveryTime			
			,BicSwift			
			,IBAN			
			,SortCode			
			,AccountHolderName			
			,BankNameAddress			
			,AdditionalInfo		
			,CurrentPrevAcquirer	
			,PrevAcquirerLocation		
			,HasEverTerminated		
			,HasEverTerminatedReason	
			,CurrentTerminateReason	
			,CompleteApplication	
			,CertOfIncorpRegistration	
			,ConfirmationOfCompanyDirectors 
			,ConfirmationOfShareholding	
			,IDForAllDirectorShareholders	
			,AVForAllDirectorShareholders	
			,ThreeMonthsProcessingHistory	
			,LicenceToOperateIfRequired	
			,TaxIDOrVATNumber	
			,ConfirmationOfCompanyBankDetails		
			,SupplierBills	
			,SampleCustomerInvoices	
			,WrittenBusinessDescriptionPlan	
			,SalesComments
			,OutStanding
			,MerchantStatusId

			,LegalOpinion 

			,TaxVatChecker 
			,IbanChecker 
			,ReqLicence 
			,LegalOpinionProvided 
			,WOTCheck 
			,SSLChecker 
			,WhoIsCheck 
			,InputOnC6 
			,MediaSearchCompany 
			,MediaSearchDirectorsSH 
			,GoogleMapsCheck 
			,OfacSearch 
			,Match 
			,VMAS 
			,CompanyUrlsOntoWebshield 
			,CheckPhoneNumbers 
			,ObtainAffiliate 

			,IsPCICompliant 
			,SecurityAccessorName 
			,MidDataCompromise 
			,DataCompromiseDetails 

			,SSLEncrypted 
			,PrivacyPolicy 
			,RefundReturnPolicy 
			,TermsAndConditions 
			,ClearlyDisplayed 
			,ClearlyDescribed 
			,ClearPricing 
			,DeliveryShippingPolicy 
			,TickBoxOnCheckout 
			,NameMatchActivity 
			,VMLogoDisplayed 
			,AllSubstancesLegal 
			,AffiliatesListed 
			,LegalEntityMentioned 
			,CompanyAddressListed 
			,CustomerServiceOnSite 

			,AvgSalesPerMonthVisa 
			,AvgSalesPerMonthMC 
			,AvgFraudToSalesPerMonthVisa 
			,AvgFraudToSalesPerMonthMC 
			,AvgNumberOfCheckbacksPerMonthVisa 
			,AvgNumberOfCheckbacksPerMonthMC 
			,AvgMonthlyCheckbackRatioVisa 
			,AvgMonthlyCheckbackRatioMC 
			,TC403MonthsDataProvidedVisa 
			,TC403MonthsDataProvidedMC 
			,Safe3MonthsDataProvidedVisa 
			,Safe3MonthsDataProvidedMC 
			,EverBreachedSchemeVisa 
			,EverBreachedSchemeMC 
			,BreachedSchemeProgrammeDetails 

			,Confirm3DsWillBeEnabled 
			,ConfirmMerchantAsksCustomers 
			,ConfirmMerchantCanProduceInvoices 
			,ConfirmInvoicesContainInfo 
			,FullCustomerName 	
			,FullCustomerAddress 	
			,FullProductDescription	
			,QuantityOfGoodsSold 
			,PriceOfTransactionDisplayed 	
			,DateOfTransaction 	
			,CapturesKYCDocs 
			,KYCMeasuresConsistOf 
			,ConfirmGenuineCHName 
			,Confirm3DForAllInitialTransaction 
			,IntroduceSignOnDelivery 
			,EmailNotificationToTrialExpiring 
			,EmailNotificationToSpecifyTheAmount

			,Skype	
			,IsLicensed 
			,LicensedCountryId
			,LicenseNumber 
			,RegulatedCountryId
			,HearSourceId 
			,TransactionModel	
			,CardholderGeographies	
			,MixOfIntEEATransactions	
			,NDAInPlace	 
			,NDASignedDate	
			,ReqAcquiring	 
			,ReqIssuing	 
			,ReqOCT	 
			,ReqProcessing	 
			,ReqPOS	 
			,StageId  
			,Probability	 
			,RiskProfileId	 

			,DateCreated
			,UserCreatedId
			,Deleted)
		VALUES
	    (	 
			 @AccountId
			,@DateRiskAppReceived	
			,@DateFullAppreceived
			,@BoardingStatusId	
			,@LegalName		
			,@Url1			
			,@Url2			
			,@Url3			
			,@Url4			
			,@Url5			
			,@PrincipalContact		
			,@Email			
			,@Phone			
			,@BusinessIncorpDate			
			,@CompanyRegNumber			
			,@AddressLine1			
			,@AddressLine2			
			,@AddressLine3			
			,@AddressLine4			
			,@PostCode			
			,@CountryId			
			,@AgentReferral		
			,@Contact			
			,@Mids			
			,@ProcessingType			
			,@MCC			
			,@Currencies			
			,@BusinessDescription			
			,@ChargebacksContact		
			,@TechContact			
			,@TechEmail			
			,@TechPhoneNumber			
			,@AverageTicket		
			,@MinTicket			
			,@MaxTicket			
			,@ProjectedMonthlyVol			
			,@Descriptor			
			,@TestLoginEmail			
			,@TestLoginPassword			
			,@AffiliateProgramme			
			,@FreeTrailProduct			
			,@RecurringBilling			
			,@InstallmentBilling			
			,@DeliveryMethod			
			,@RegulatedByAuthority			
			,@DeliveryTime			
			,@BicSwift			
			,@IBAN			
			,@SortCode			
			,@AccountHolderName			
			,@BankNameAddress			
			,@AdditionalInfo		
			,@CurrentPrevAcquirer	
			,@PrevAcquirerLocation		
			,@HasEverTerminated		
			,@HasEverTerminatedReason	
			,@CurrentTerminateReason	
			,@CompleteApplication	
			,@CertOfIncorpRegistration	
			,@ConfirmationOfCompanyDirectors 
			,@ConfirmationOfShareholding	
			,@IDForAllDirectorShareholders	
			,@AVForAllDirectorShareholders	
			,@ThreeMonthsProcessingHistory	
			,@LicenceToOperateIfRequired	
			,@TaxIDOrVATNumber	
			,@ConfirmationOfCompanyBankDetails		
			,@SupplierBills	
			,@SampleCustomerInvoices	
			,@WrittenBusinessDescriptionPlan	
			,@SalesComments
			,@OutStanding
			,@MerchantStatusId
			,@LegalOpinion 

			,@TaxVatChecker 
			,@IbanChecker 
			,@ReqLicence 
			,@LegalOpinionProvided 
			,@WOTCheck 
			,@SSLChecker 
			,@WhoIsCheck 
			,@InputOnC6 
			,@MediaSearchCompany 
			,@MediaSearchDirectorsSH 
			,@GoogleMapsCheck 
			,@OfacSearch 
			,@Match 
			,@VMAS 
			,@CompanyUrlsOntoWebshield 
			,@CheckPhoneNumbers 
			,@ObtainAffiliate 

			,@IsPCICompliant 
			,@SecurityAccessorName 
			,@MidDataCompromise 
			,@DataCompromiseDetails 

			,@SSLEncrypted 
			,@PrivacyPolicy 
			,@RefundReturnPolicy 
			,@TermsAndConditions 
			,@ClearlyDisplayed 
			,@ClearlyDescribed 
			,@ClearPricing 
			,@DeliveryShippingPolicy 
			,@TickBoxOnCheckout 
			,@NameMatchActivity 
			,@VMLogoDisplayed 
			,@AllSubstancesLegal 
			,@AffiliatesListed 
			,@LegalEntityMentioned 
			,@CompanyAddressListed 
			,@CustomerServiceOnSite 

			,@AvgSalesPerMonthVisa 
			,@AvgSalesPerMonthMC 
			,@AvgFraudToSalesPerMonthVisa 
			,@AvgFraudToSalesPerMonthMC 
			,@AvgNumberOfCheckbacksPerMonthVisa 
			,@AvgNumberOfCheckbacksPerMonthMC 
			,@AvgMonthlyCheckbackRatioVisa 
			,@AvgMonthlyCheckbackRatioMC 
			,@TC403MonthsDataProvidedVisa 
			,@TC403MonthsDataProvidedMC 
			,@Safe3MonthsDataProvidedVisa 
			,@Safe3MonthsDataProvidedMC 
			,@EverBreachedSchemeVisa 
			,@EverBreachedSchemeMC 
			,@BreachedSchemeProgrammeDetails 

			,@Confirm3DsWillBeEnabled 
			,@ConfirmMerchantAsksCustomers 
			,@ConfirmMerchantCanProduceInvoices 
			,@ConfirmInvoicesContainInfo 
			,@FullCustomerName 	
			,@FullCustomerAddress 	
			,@FullProductDescription	
			,@QuantityOfGoodsSold 
			,@PriceOfTransactionDisplayed 	
			,@DateOfTransaction 	
			,@CapturesKYCDocs 
			,@KYCMeasuresConsistOf 
			,@ConfirmGenuineCHName 
			,@Confirm3DForAllInitialTransaction 
			,@IntroduceSignOnDelivery 
			,@EmailNotificationToTrialExpiring 
			,@EmailNotificationToSpecifyTheAmount

			,@Skype	
			,@IsLicensed 
			,@LicensedCountryId
			,@LicenseNumber 
			,@RegulatedCountryId	
			,@HearSourceId 
			,@TransactionModel	
			,@CardholderGeographies	
			,@MixOfIntEEATransactions	
			,@NDAInPlace	 
			,@NDASignedDate	
			,@ReqAcquiring	 
			,@ReqIssuing	 
			,@ReqOCT	 
			,@ReqProcessing	 
			,@ReqPOS	 
			,@StageId  
			,@Probability	 
			,@RiskProfileId
				
			,GETDATE()
			,@UserCreatedId
			,0)
END

SELECT CONVERT(INT, SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[MERCHANTBOARDING_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTBOARDING_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
		SELECT
			 [MB].Id	
			,[MB].AccountId AS AccountId, [A].LegalName As AccountLegalName
			,[MB].DateRiskAppReceived	
			,[MB].DateFullAppreceived	
			,[MB].BoardingStatusId, [BS].[Desc] AS BoardingStatusDesc
			,[A].LegalName --,[MB].LegalName	
			,[A].URL1	-- ,[MB].Url1	
			,[MB].Url2	
			,[MB].Url3	
			,[MB].Url4	
			,[MB].Url5	
			,[MB].PrincipalContact
			,[A].ContactEmail AS Email --,[MB].Email
			,[A].ContactPhone AS Phone	-- ,[MB].Phone	
			,[MB].BusinessIncorpDate	
			,[MB].CompanyRegNumber	
			,[A].Address1 AS AddressLine1	--,[MB].AddressLine1	
			,[A].Address2 AS AddressLine2	--,[MB].AddressLine2	
			,[A].Address3 AS AddressLine3	--,[MB].AddressLine3	
			,[MB].AddressLine4
			,[A].PostCode	--	,[MB].PostCode
			,[A].CountryId AS CountryId, [C].[Desc] AS CountryDesc	--,[MB].CountryId AS CountryId, [C].[Desc] AS CountryDesc	
			,[MB].AgentReferral
			,[A].MainContactPerson AS Contact --,[MB].Contact	
			,[MB].Mids	
			,[MB].ProcessingType	
			,[MB].MCC	
			,[MB].Currencies	
			,[A].BusinessDesc AS BusinessDescription	--	,[MB].BusinessDescription	
			,[MB].ChargebacksContact	
			,[MB].TechContact	
			,[MB].TechEmail	
			,[MB].TechPhoneNumber	
			,[MB].AverageTicket
			,[MB].MinTicket	
			,[MB].MaxTicket	
			,[MB].ProjectedMonthlyVol	
			,[MB].Descriptor	
			,[MB].TestLoginEmail	
			,[MB].TestLoginPassword	
			,[MB].AffiliateProgramme	
			,[MB].FreeTrailProduct	
			,[MB].RecurringBilling	
			,[MB].InstallmentBilling	
			,[MB].DeliveryMethod	
			,[A].IsRegulatedBusiness AS RegulatedByAuthority	--	,[MB].RegulatedByAuthority	
			,[MB].DeliveryTime	
			,[MB].BicSwift	
			,[MB].IBAN	
			,[MB].SortCode	
			,[MB].AccountHolderName	
			,[MB].BankNameAddress	
			,[MB].AdditionalInfo	
			,[MB].CurrentPrevAcquirer
			,[MB].PrevAcquirerLocation
			,[MB].HasEverTerminated	
			,[MB].HasEverTerminatedReason	
			,[MB].CurrentTerminateReason	
			,[MB].CompleteApplication	
			,[MB].CertOfIncorpRegistration	
			,[MB].ConfirmationOfCompanyDirectors
			,[MB].ConfirmationOfShareholding
			,[MB].IDForAllDirectorShareholders
			,[MB].AVForAllDirectorShareholders
			,[MB].ThreeMonthsProcessingHistory
			,[MB].LicenceToOperateIfRequired
			,[MB].TaxIDOrVATNumber
			,[MB].ConfirmationOfCompanyBankDetails	
			,[MB].SupplierBills
			,[MB].SampleCustomerInvoices
			,[MB].WrittenBusinessDescriptionPlan
			,[MB].SalesComments
			,[MB].OutStanding
			,[A].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc --,[MB].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc

			,[MB].LegalOpinion 

			,[MB].TaxVatChecker  
			,[MB].IbanChecker  
			,[MB].ReqLicence   
			,[MB].LegalOpinionProvided  
			,[MB].WOTCheck  
			,[MB].SSLChecker    
			,[MB].WhoIsCheck    
			,[MB].InputOnC6  
			,[MB].MediaSearchCompany  
			,[MB].MediaSearchDirectorsSH     
			,[MB].GoogleMapsCheck    
			,[MB].OfacSearch    
			,[MB].Match  
			,[MB].VMAS  
			,[MB].CompanyUrlsOntoWebshield  
			,[MB].CheckPhoneNumbers 
			,[MB].ObtainAffiliate   

			,[MB].IsPCICompliant    
			,[MB].SecurityAccessorName 
			,[MB].MidDataCompromise 
			,[MB].DataCompromiseDetails 



			,[MB].SSLEncrypted  
			,[MB].PrivacyPolicy  
			,[MB].RefundReturnPolicy  
			,[MB].TermsAndConditions   
			,[MB].ClearlyDisplayed 
			,[MB].ClearlyDescribed   
			,[MB].ClearPricing   
			,[MB].DeliveryShippingPolicy  
			,[MB].TickBoxOnCheckout  
			,[MB].NameMatchActivity   
			,[MB].VMLogoDisplayed  
			,[MB].AllSubstancesLegal  
			,[MB].AffiliatesListed  
			,[MB].LegalEntityMentioned    
			,[MB].CompanyAddressListed  
			,[MB].CustomerServiceOnSite  

			,[MB].AvgSalesPerMonthVisa 
			,[MB].AvgSalesPerMonthMC 
			,[MB].AvgFraudToSalesPerMonthVisa 
			,[MB].AvgFraudToSalesPerMonthMC 
			,[MB].AvgNumberOfCheckbacksPerMonthVisa 
			,[MB].AvgNumberOfCheckbacksPerMonthMC 
			,[MB].AvgMonthlyCheckbackRatioVisa 
			,[MB].AvgMonthlyCheckbackRatioMC 
			,[MB].TC403MonthsDataProvidedVisa 
			,[MB].TC403MonthsDataProvidedMC  
			,[MB].Safe3MonthsDataProvidedVisa  
			,[MB].Safe3MonthsDataProvidedMC 
			,[MB].EverBreachedSchemeVisa    
			,[MB].EverBreachedSchemeMC   
			,[MB].BreachedSchemeProgrammeDetails 

			,[MB].Confirm3DsWillBeEnabled 
			,[MB].ConfirmMerchantAsksCustomers 
			,[MB].ConfirmMerchantCanProduceInvoices 
			,[MB].ConfirmInvoicesContainInfo 
			,[A].TradingAsName AS FullCustomerName -- ,[MB].FullCustomerName 
			,[MB].FullCustomerAddress 
			,[MB].FullProductDescription 
			,[MB].QuantityOfGoodsSold 
			,[MB].PriceOfTransactionDisplayed 
			,[MB].DateOfTransaction 
			,[MB].CapturesKYCDocs 
			,[MB].KYCMeasuresConsistOf 
			,[MB].ConfirmGenuineCHName 
			,[MB].Confirm3DForAllInitialTransaction 
			,[MB].IntroduceSignOnDelivery 
			,[MB].EmailNotificationToTrialExpiring 
		    ,[MB].EmailNotificationToSpecifyTheAmount 

			,[MB].Skype	
			,[MB].IsLicensed	
			,[MB].LicensedCountryId AS LicensedCountryId, [LC].[Desc] AS LicensedCountryDesc
			,[MB].LicenseNumber
			,[MB].RegulatedCountryId AS RegulatedCountryId, [RC].[Desc] AS RegulatedCountryDesc
			,[MB].HearSourceId AS HearSourceId, [HS].[Desc] AS HearSourceDesc
			,[MB].TransactionModel	
			,[MB].CardholderGeographies	
			,[MB].MixOfIntEEATransactions	
			,[MB].NDAInPlace	
			,[MB].NDASignedDate	
			,[MB].ReqAcquiring	
			,[MB].ReqIssuing	
			,[MB].ReqOCT	
			,[MB].ReqProcessing	
			,[MB].ReqPOS	
			,[MB].StageId AS StageId, [S].[Desc] AS StageDesc
			,[MB].Probability	
			,[MB].RiskProfileId	

			,[MB].DateCreated	
			,[MB].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM MerchantBoarding [MB]
		LEFT JOIN Account [A] ON [A].Id = [MB].AccountId
		LEFT JOIN Country [C] ON [C].Id = [A].CountryId
		LEFT JOIN MerchantStatus [MS] ON [MS].Id = [A].MerchantStatusId 
		LEFT JOIN BoardingStatus [BS] ON  [BS].Id = [MB].BoardingStatusId
		LEFT JOIN HearSource [HS] ON [HS].Id = [MB].HearSourceId 
		LEFT JOIN Stage [S] ON [S].Id = [MB].StageId
		LEFT JOIN Country [LC] ON [LC].Id = [MB].LicensedCountryId
		LEFT JOIN Country [RC] ON [RC].Id = [MB].RegulatedCountryId
		LEFT JOIN [User] [U] ON [U].Id = [MB].UserCreatedId
	WHERE 
	  ([MB].LegalName LIKE '%' + @SearchText + '%' OR [U].Firstname LIKE '%' + @SearchText +'%' OR [U].Lastname LIKE '%' + @SearchText +'%')
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTBOARDING_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTBOARDING_UPDATE]
			 @Id INT
			,@AccountId INT
			,@DateRiskAppReceived	DATETIME
			,@DateFullAppreceived	DATETIME
			,@BoardingStatusId INT
			,@LegalName		NVARCHAR(100)
			,@Url1			NVARCHAR(100)
			,@Url2			NVARCHAR(100)
			,@Url3			NVARCHAR(100)
			,@Url4			NVARCHAR(100)
			,@Url5			NVARCHAR(100)
			,@PrincipalContact		NVARCHAR(100)
			,@Email			NVARCHAR(100)
			,@Phone			NVARCHAR(100)
			,@BusinessIncorpDate			DATETIME
			,@CompanyRegNumber			NVARCHAR(100)
			,@AddressLine1			NVARCHAR(100)
			,@AddressLine2			NVARCHAR(100)
			,@AddressLine3			NVARCHAR(100)
			,@AddressLine4			NVARCHAR(100)
			,@PostCode			NVARCHAR(100)
			,@CountryId			INT
			,@AgentReferral		NVARCHAR(100)
			,@Contact			NVARCHAR(100)
			,@Mids			NVARCHAR(100)
			,@ProcessingType			NVARCHAR(100)
			,@MCC			NVARCHAR(100)
			,@Currencies			NVARCHAR(100)
			,@BusinessDescription			NVARCHAR(100)
			,@ChargebacksContact			NVARCHAR(100)
			,@TechContact			NVARCHAR(100)
			,@TechEmail			NVARCHAR(100)
			,@TechPhoneNumber			NVARCHAR(100)
			,@AverageTicket		NVARCHAR(100)
			,@MinTicket			NVARCHAR(100)
			,@MaxTicket			NVARCHAR(100)
			,@ProjectedMonthlyVol			DECIMAL(8,2)
			,@Descriptor			NVARCHAR(100)
			,@TestLoginEmail			NVARCHAR(100)
			,@TestLoginPassword			NVARCHAR(100)
			,@AffiliateProgramme			BIT
			,@FreeTrailProduct			BIT
			,@RecurringBilling			BIT
			,@InstallmentBilling			BIT
			,@DeliveryMethod			NVARCHAR(100)
			,@RegulatedByAuthority			BIT
			,@DeliveryTime			NVARCHAR(100)
			,@BicSwift			NVARCHAR(100)
			,@IBAN			NVARCHAR(100)
			,@SortCode			NVARCHAR(100)
			,@AccountHolderName			NVARCHAR(100)
			,@BankNameAddress			NVARCHAR(100)
			,@AdditionalInfo		NVARCHAR(100)
			,@CurrentPrevAcquirer	NVARCHAR(100)
			,@PrevAcquirerLocation		NVARCHAR(100)
			,@HasEverTerminated		BIT
			,@HasEverTerminatedReason	NVARCHAR(100)
			,@CurrentTerminateReason	NVARCHAR(100)
			,@CompleteApplication	BIT
			,@CertOfIncorpRegistration	BIT
			,@ConfirmationOfCompanyDirectors BIT
			,@ConfirmationOfShareholding	BIT
			,@IDForAllDirectorShareholders	BIT
			,@AVForAllDirectorShareholders	BIT
			,@ThreeMonthsProcessingHistory	BIT
			,@LicenceToOperateIfRequired	BIT
			,@TaxIDOrVATNumber	BIT
			,@ConfirmationOfCompanyBankDetails		BIT
			,@SupplierBills	BIT
			,@SampleCustomerInvoices	BIT
			,@WrittenBusinessDescriptionPlan	BIT
			,@SalesComments NTEXT
			,@OutStanding TEXT
			,@MerchantStatusId INT
			  ,@LegalOpinion BIT

        ,@TaxVatChecker BIT
        ,@IbanChecker BIT
        ,@ReqLicence BIT
        ,@LegalOpinionProvided BIT
        ,@WOTCheck BIT
        ,@SSLChecker BIT
        ,@WhoIsCheck BIT
        ,@InputOnC6 BIT
        ,@MediaSearchCompany BIT
        ,@MediaSearchDirectorsSH BIT
        ,@GoogleMapsCheck BIT
        ,@OfacSearch BIT
        ,@Match BIT
        ,@VMAS BIT
        ,@CompanyUrlsOntoWebshield BIT
        ,@CheckPhoneNumbers BIT
        ,@ObtainAffiliate BIT

        ,@IsPCICompliant BIT
        ,@SecurityAccessorName NVARCHAR(150)
        ,@MidDataCompromise BIT
        ,@DataCompromiseDetails NVARCHAR(100)



        ,@SSLEncrypted BIT
        ,@PrivacyPolicy BIT
        ,@RefundReturnPolicy BIT
        ,@TermsAndConditions BIT
        ,@ClearlyDisplayed BIT
        ,@ClearlyDescribed BIT
        ,@ClearPricing BIT
        ,@DeliveryShippingPolicy INT
        ,@TickBoxOnCheckout INT
        ,@NameMatchActivity INT
        ,@VMLogoDisplayed BIT
        ,@AllSubstancesLegal INT
        ,@AffiliatesListed BIT
        ,@LegalEntityMentioned INT
        ,@CompanyAddressListed BIT
        ,@CustomerServiceOnSite BIT

        ,@AvgSalesPerMonthVisa DECIMAL(18,4)
        ,@AvgSalesPerMonthMC DECIMAL(18,4)
        ,@AvgFraudToSalesPerMonthVisa INT
        ,@AvgFraudToSalesPerMonthMC INT
        ,@AvgNumberOfCheckbacksPerMonthVisa DECIMAL(18,4)
        ,@AvgNumberOfCheckbacksPerMonthMC DECIMAL(18,4)
        ,@AvgMonthlyCheckbackRatioVisa INT
        ,@AvgMonthlyCheckbackRatioMC INT
        ,@TC403MonthsDataProvidedVisa BIT
        ,@TC403MonthsDataProvidedMC BIT
        ,@Safe3MonthsDataProvidedVisa BIT
        ,@Safe3MonthsDataProvidedMC BIT
        ,@EverBreachedSchemeVisa BIT
        ,@EverBreachedSchemeMC BIT
        ,@BreachedSchemeProgrammeDetails NVARCHAR(100)

        ,@Confirm3DsWillBeEnabled BIT
        ,@ConfirmMerchantAsksCustomers BIT
        ,@ConfirmMerchantCanProduceInvoices BIT
        ,@ConfirmInvoicesContainInfo BIT
        ,@FullCustomerName 	NVARCHAR(100)
        ,@FullCustomerAddress 	NVARCHAR(100)
        ,@FullProductDescription	NVARCHAR(100)
        ,@QuantityOfGoodsSold 	NVARCHAR(100)
        ,@PriceOfTransactionDisplayed 	NVARCHAR(100)
        ,@DateOfTransaction 	NVARCHAR(100)
        ,@CapturesKYCDocs BIT
        ,@KYCMeasuresConsistOf BIT
        ,@ConfirmGenuineCHName BIT
        ,@Confirm3DForAllInitialTransaction BIT
        ,@IntroduceSignOnDelivery BIT
        ,@EmailNotificationToTrialExpiring BIT
        ,@EmailNotificationToSpecifyTheAmount BIT

		,@Skype	NVARCHAR(50)
		,@IsLicensed BIT
		,@LicensedCountryId INT
		,@LicenseNumber NVARCHAR(50)
		,@RegulatedCountryId INT
		,@HearSourceId INT
		,@TransactionModel	 NVARCHAR(50)
		,@CardholderGeographies	 NVARCHAR(500)
		,@MixOfIntEEATransactions	 NVARCHAR(50)
		,@NDAInPlace	 BIT
		,@NDASignedDate	DATETIME
		,@ReqAcquiring	 BIT
		,@ReqIssuing	 BIT
		,@ReqOCT	 BIT
		,@ReqProcessing	 BIT
		,@ReqPOS	 BIT
		,@StageId  INT
		,@Probability	 INT
		,@RiskProfileId	 INT
AS
BEGIN
		UPDATE MerchantBoarding SET 
			 AccountId = @AccountId 
   			,DateRiskAppReceived=@DateRiskAppReceived	
			,DateFullAppreceived=@DateFullAppreceived	
			,BoardingStatusId=@BoardingStatusId
			,LegalName=@LegalName		
			,Url1=@Url1			
			,Url2=@Url2			
			,Url3=@Url3			
			,Url4=@Url4			
			,Url5=@Url5			
			,PrincipalContact=@PrincipalContact		
			,Email=@Email			
			,Phone=@Phone			
			,BusinessIncorpDate=@BusinessIncorpDate			
			,CompanyRegNumber=@CompanyRegNumber			
			,AddressLine1=@AddressLine1			
			,AddressLine2=@AddressLine2			
			,AddressLine3=@AddressLine3			
			,AddressLine4=@AddressLine4			
			,PostCode=@PostCode			
			,CountryId=@CountryId
			,AgentReferral=@AgentReferral		
			,Contact=@Contact			
			,Mids=@Mids			
			,ProcessingType=@ProcessingType			
			,MCC=@MCC			
			,Currencies=@Currencies			
			,BusinessDescription=@BusinessDescription			
			,ChargebacksContact=@ChargebacksContact			
			,TechContact=@TechContact			
			,TechEmail=@TechEmail			
			,TechPhoneNumber=@TechPhoneNumber			
			,AverageTicket=@AverageTicket		
			,MinTicket=@MinTicket			
			,MaxTicket=@MaxTicket			
			,ProjectedMonthlyVol=@ProjectedMonthlyVol			
			,Descriptor=@Descriptor			
			,TestLoginEmail=@TestLoginEmail			
			,TestLoginPassword=@TestLoginPassword			
			,AffiliateProgramme=@AffiliateProgramme			
			,FreeTrailProduct=@FreeTrailProduct			
			,RecurringBilling=@RecurringBilling			
			,InstallmentBilling	=@InstallmentBilling			
			,DeliveryMethod	=@DeliveryMethod			
			,RegulatedByAuthority=@RegulatedByAuthority			
			,DeliveryTime=@DeliveryTime			
			,BicSwift=@BicSwift			
			,IBAN=@IBAN			
			,SortCode=@SortCode			
			,AccountHolderName=@AccountHolderName			
			,BankNameAddress=@BankNameAddress			
			,AdditionalInfo=@AdditionalInfo		
			,CurrentPrevAcquirer=@CurrentPrevAcquirer	
			,PrevAcquirerLocation=@PrevAcquirerLocation		
			,HasEverTerminated=@HasEverTerminated		
			,HasEverTerminatedReason=@HasEverTerminatedReason	
			,CurrentTerminateReason=@CurrentTerminateReason	
			,CompleteApplication=@CompleteApplication	
			,CertOfIncorpRegistration=@CertOfIncorpRegistration	
			,ConfirmationOfCompanyDirectors=@ConfirmationOfCompanyDirectors 
			,ConfirmationOfShareholding=@ConfirmationOfShareholding	
			,IDForAllDirectorShareholders=@IDForAllDirectorShareholders	
			,AVForAllDirectorShareholders=@AVForAllDirectorShareholders	
			,ThreeMonthsProcessingHistory=@ThreeMonthsProcessingHistory	
			,LicenceToOperateIfRequired=@LicenceToOperateIfRequired	
			,TaxIDOrVATNumber=@TaxIDOrVATNumber	
			,ConfirmationOfCompanyBankDetails=@ConfirmationOfCompanyBankDetails		
			,SupplierBills=@SupplierBills	
			,SampleCustomerInvoices=@SampleCustomerInvoices	
			,WrittenBusinessDescriptionPlan=@WrittenBusinessDescriptionPlan	
			,SalesComments = @SalesComments
			,OutStanding=@OutStanding
			,MerchantStatusId = @MerchantStatusId

			,LegalOpinion = @LegalOpinion 

			,TaxVatChecker = @TaxVatChecker 
			,IbanChecker = @IbanChecker 
			,ReqLicence = @ReqLicence 
			,LegalOpinionProvided = @LegalOpinionProvided 
			,WOTCheck = @WOTCheck 
			,SSLChecker = @SSLChecker 
			,WhoIsCheck = @WhoIsCheck 
			,InputOnC6 = @InputOnC6 
			,MediaSearchCompany = @MediaSearchCompany 
			,MediaSearchDirectorsSH = @MediaSearchDirectorsSH 
			,GoogleMapsCheck = @GoogleMapsCheck 
			,OfacSearch = @OfacSearch 
			,Match = @Match 
			,VMAS = @VMAS 
			,CompanyUrlsOntoWebshield = @CompanyUrlsOntoWebshield 
			,CheckPhoneNumbers = @CheckPhoneNumbers 
			,ObtainAffiliate = @ObtainAffiliate 

			,IsPCICompliant = @IsPCICompliant 
			,SecurityAccessorName = @SecurityAccessorName 
			,MidDataCompromise = @MidDataCompromise 
			,DataCompromiseDetails = @DataCompromiseDetails 



			,SSLEncrypted = @SSLEncrypted 
			,PrivacyPolicy = @PrivacyPolicy 
			,RefundReturnPolicy = @RefundReturnPolicy 
			,TermsAndConditions = @TermsAndConditions 
			,ClearlyDisplayed = @ClearlyDisplayed 
			,ClearlyDescribed = @ClearlyDescribed 
			,ClearPricing = @ClearPricing 
			,DeliveryShippingPolicy = @DeliveryShippingPolicy 
			,TickBoxOnCheckout = @TickBoxOnCheckout 
			,NameMatchActivity = @NameMatchActivity 
			,VMLogoDisplayed = @VMLogoDisplayed 
			,AllSubstancesLegal = @AllSubstancesLegal 
			,AffiliatesListed = @AffiliatesListed 
			,LegalEntityMentioned = @LegalEntityMentioned 
			,CompanyAddressListed = @CompanyAddressListed 
			,CustomerServiceOnSite = @CustomerServiceOnSite 

			,AvgSalesPerMonthVisa = @AvgSalesPerMonthVisa 
			,AvgSalesPerMonthMC = @AvgSalesPerMonthMC 
			,AvgFraudToSalesPerMonthVisa = @AvgFraudToSalesPerMonthVisa 
			,AvgFraudToSalesPerMonthMC = @AvgFraudToSalesPerMonthMC 
			,AvgNumberOfCheckbacksPerMonthVisa = @AvgNumberOfCheckbacksPerMonthVisa 
			,AvgNumberOfCheckbacksPerMonthMC = @AvgNumberOfCheckbacksPerMonthMC 
			,AvgMonthlyCheckbackRatioVisa = @AvgMonthlyCheckbackRatioVisa 
			,AvgMonthlyCheckbackRatioMC = @AvgMonthlyCheckbackRatioMC 
			,TC403MonthsDataProvidedVisa = @TC403MonthsDataProvidedVisa 
			,TC403MonthsDataProvidedMC = @TC403MonthsDataProvidedMC 
			,Safe3MonthsDataProvidedVisa = @Safe3MonthsDataProvidedVisa 
			,Safe3MonthsDataProvidedMC = @Safe3MonthsDataProvidedMC 
			,EverBreachedSchemeVisa = @EverBreachedSchemeVisa 
			,EverBreachedSchemeMC = @EverBreachedSchemeMC 
			,BreachedSchemeProgrammeDetails = @BreachedSchemeProgrammeDetails 

			,Confirm3DsWillBeEnabled = @Confirm3DsWillBeEnabled 
			,ConfirmMerchantAsksCustomers = @ConfirmMerchantAsksCustomers 
			,ConfirmMerchantCanProduceInvoices = @ConfirmMerchantCanProduceInvoices 
			,ConfirmInvoicesContainInfo = @ConfirmInvoicesContainInfo 
			,FullCustomerName = @FullCustomerName 	
			,FullCustomerAddress = @FullCustomerAddress 	
			,FullProductDescription = @FullProductDescription	
			,QuantityOfGoodsSold = @QuantityOfGoodsSold 	
			,PriceOfTransactionDisplayed = @PriceOfTransactionDisplayed 	
			,DateOfTransaction = @DateOfTransaction 	
			,CapturesKYCDocs = @CapturesKYCDocs 
			,KYCMeasuresConsistOf = @KYCMeasuresConsistOf 
			,ConfirmGenuineCHName = @ConfirmGenuineCHName 
			,Confirm3DForAllInitialTransaction = @Confirm3DForAllInitialTransaction 
			,IntroduceSignOnDelivery = @IntroduceSignOnDelivery
			,EmailNotificationToTrialExpiring = @EmailNotificationToTrialExpiring 
			,EmailNotificationToSpecifyTheAmount = @EmailNotificationToSpecifyTheAmount 

			,Skype= @Skype
			,IsLicensed= @IsLicensed 
			,LicensedCountryId= @LicensedCountryId
			,LicenseNumber	= @LicenseNumber
			,RegulatedCountryId	= @RegulatedCountryId
			,HearSourceId	= @HearSourceId 
			,TransactionModel	= @TransactionModel	
			,CardholderGeographies	= @CardholderGeographies	 
			,MixOfIntEEATransactions = @MixOfIntEEATransactions	
			,NDAInPlace	= @NDAInPlace	 
			,NDASignedDate	= @NDASignedDate	
			,ReqAcquiring	= @ReqAcquiring	 
			,ReqIssuing	= @ReqIssuing	 
			,ReqOCT	= @ReqOCT	 
			,ReqProcessing	= @ReqProcessing	 
			,ReqPOS	= @ReqPOS	 
			,StageId	= @StageId  
			,Probability	= @Probability	 
			,RiskProfileId	= @RiskProfileId	 
			WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTMID_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTMID_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE MerchantMid SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTMID_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTMID_GET]
@Id INT
AS
BEGIN
	SELECT  
		 [MM].Id
		,[MM].MerchantId, [M].Name AS MerchantName
		,[MM].CurrencyId, [C].Code AS CurrencyCode, [C].[Desc] AS CurrencyDesc
		,[MM].Mid
		,[MM].DateCreated
		,[MM].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
			FROM MerchantMid [MM]
			LEFT JOIN Merchant [M] ON  [M].Id = [MM].MerchantId
			LEFT JOIN Currency [C] ON  [C].Id = [MM].CurrencyId
			LEFT JOIN [User] [U] ON  [U].Id = [MM].UserCreatedId
			
			WHERE [MM].Id = @Id
				AND [MM].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTMID_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTMID_GETALL]
AS
BEGIN
	SELECT  
		 [MM].Id
		,[MM].MerchantId, [M].Name AS MerchantName
		,[MM].CurrencyId, [C].Code AS CurrencyCode, [C].[Desc] AS CurrencyDesc
		,[MM].Mid
		,[MM].DateCreated
		,[MM].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
			FROM MerchantMid [MM]
			LEFT JOIN Merchant [M] ON  [M].Id = [MM].MerchantId
			LEFT JOIN Currency [C] ON  [C].Id = [MM].CurrencyId
			LEFT JOIN [User] [U] ON  [U].Id = [MM].UserCreatedId
			
			WHERE [MM].Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[MERCHANTMID_GETBYMERCHANT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTMID_GETBYMERCHANT]
@MerchantId INT
AS
BEGIN
	SELECT  
		 [MM].Id
		,[MM].MerchantId, [M].Name AS MerchantName
		,[MM].CurrencyId, [C].Code AS CurrencyCode, [C].[Desc] AS CurrencyDesc
		,[MM].Mid
		,[MM].DateCreated
		,[MM].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
			FROM MerchantMid [MM]
			LEFT JOIN Merchant [M] ON  [M].Id = [MM].MerchantId
			LEFT JOIN Currency [C] ON  [C].Id = [MM].CurrencyId
			LEFT JOIN [User] [U] ON  [U].Id = [MM].UserCreatedId
			
			WHERE [MM].MerchantId = @MerchantId
				AND [MM].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTMID_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTMID_INSERT]
	 @MerchantId INT
	,@CurrencyId INT
	,@Mid INT
	,@UserId INT
AS
BEGIN
   INSERT INTO MerchantMid 
	   (MerchantId
	   ,CurrencyId
	   ,Mid
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@MerchantId
	   ,@CurrencyId
	   ,@Mid
	   ,GETDATE()
	   ,@UserId
	   ,0)
END
GO
/****** Object:  StoredProcedure [dbo].[MERCHANTMID_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTMID_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
SELECT  
		 [MM].Id
		,[MM].MerchantId, [M].Name AS MerchantName
		,[MM].CurrencyId, [C].Code AS CurrencyCode, [C].[Desc] AS CurrencyDesc
		,[MM].Mid
		,[MM].DateCreated
		,[MM].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
			FROM MerchantMid [MM]
			LEFT JOIN Merchant [M] ON  [M].Id = [MM].MerchantId
			LEFT JOIN Currency [C] ON  [C].Id = [MM].CurrencyId
			LEFT JOIN [User] [U] ON  [U].Id = [MM].UserCreatedId
			WHERE  
			 ([MM].MerchantId LIKE '%'+ @SearchText +'%' OR [MM].CurrencyId LIKE '%'+ @SearchText +'%' OR [MM].Mid LIKE '%'+ @SearchText +'%'
			OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
				AND [MM].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTMID_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTMID_UPDATE]
	-- Add the parameters for the stored procedure here
	 @Id INT
	,@MerchantId INT
	,@CurrencyId INT
	,@Mid INT
AS
BEGIN
   UPDATE MerchantMid SET 
    MerchantId = @MerchantId
   ,CurrencyId = @CurrencyId
   ,Mid = @Mid
   WHERE Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[MERCHANTSTATUS_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTSTATUS_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE MerchantStatus SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTSTATUS_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTSTATUS_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [MS].Id
		,[MS].[Desc]
		,[MS].UserRoleResponsibleId AS UserRoleResponsibleId, [UR].[Desc] AS UserRoleResponsibleDesc
		,[MS].DateCreated
		,[MS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM MerchantStatus [MS], UserRole [UR], [User] [U]
	WHERE [MS].Id = @Id
	AND [MS].UserCreatedId = [U].Id
	AND [MS].UserRoleResponsibleId = [UR].Id
	AND [MS].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[MERCHANTSTATUS_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTSTATUS_GETALL]
AS
BEGIN
	SELECT 
		 [MS].Id
		,[MS].[Desc]
		,[MS].UserRoleResponsibleId AS UserRoleResponsibleId, [UR].[Desc] AS UserRoleResponsibleDesc
		,[MS].DateCreated
		,[MS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM MerchantStatus [MS], UserRole [UR], [User] [U]
	WHERE 
		[MS].UserCreatedId = [U].Id
		AND [MS].UserRoleResponsibleId = [UR].Id
		AND [MS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTSTATUS_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTSTATUS_INSERT]
	 @Desc NVARCHAR(50)
	,@UserRoleResponsibleId INT
	,@UserId INT
AS
BEGIN
   INSERT INTO MerchantStatus 
	   ([Desc]
	   ,UserRoleResponsibleId
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,@UserRoleResponsibleId
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[MERCHANTSTATUS_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTSTATUS_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT  
		 [MS].Id
		,[MS].[Desc]
		,[MS].UserRoleResponsibleId AS UserRoleResponsibleId, [UR].[Desc] AS UserRoleResponsibleDesc
		,[MS].DateCreated
		,[MS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM MerchantStatus [MS], UserRole [UR], [User] [U]
		   WHERE 
   ([MS].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
    AND [MS].UserCreatedId = [U].Id
	AND [MS].UserRoleResponsibleId = [UR].Id
	AND [MS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTSTATUS_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTSTATUS_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50),
	@UserRoleResponsibleId INT
AS
BEGIN
   UPDATE MerchantStatus SET 
    [Desc] = @Desc
   ,[UserRoleResponsibleId] = @UserRoleResponsibleId
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTTYPE_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTTYPE_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE MerchantType SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTTYPE_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTTYPE_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [MT].Id
		,[MT].[Desc]
		,[MT].DateCreated
		,[MT].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM MerchantType [MT], [User] [U]
	WHERE [MT].Id = @Id
	AND [MT].UserCreatedId = [U].Id
	AND [MT].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTTYPE_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTTYPE_GETALL]
AS
BEGIN
	SELECT  
		 [MT].Id
		,[MT].[Desc]
		,[MT].DateCreated
		,[MT].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM MerchantType [MT], [User] U
	WHERE 
		[MT].UserCreatedId = [U].Id
	AND [MT].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTTYPE_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTTYPE_INSERT]
	 @Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO MerchantType 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[MERCHANTTYPE_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTTYPE_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [MT].Id
		,[MT].[Desc]
		,[MT].DateCreated
		,[MT].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM MerchantType [MT], [User] [U]
    WHERE 
   ([MT].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [MT].UserCreatedId = [U].Id
   AND [MT].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[MERCHANTTYPE_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MERCHANTTYPE_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE MerchantType SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[PCICERT_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PCICERT_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE PCICert SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[PCICERT_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PCICERT_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [PC].Id
		,[PC].[Desc]
		,[PC].DateCreated
		,[PC].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM PCICert [PC], [User] [U]
	WHERE [PC].Id = @Id
	AND [PC].UserCreatedId = [U].Id
	AND [PC].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[PCICERT_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PCICERT_GETALL]
AS
BEGIN
	SELECT  
		 [PC].Id
		,[PC].[Desc]
		,[PC].DateCreated
		,[PC].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM PCICert [PC], [User] U
	WHERE 
		[PC].UserCreatedId = [U].Id
	AND [PC].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[PCICERT_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PCICERT_INSERT]
	 @Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO PCICert 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[PCICERT_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PCICERT_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [PC].Id
		,[PC].[Desc]
		,[PC].DateCreated
		,[PC].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM PCICert [PC], [User] [U]
    WHERE 
   ([PC].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [PC].UserCreatedId = [U].Id
   AND [PC].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[PCICERT_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PCICERT_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE PCICert SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[PERSONTITLE_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PERSONTITLE_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE PersonTitle SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[PERSONTITLE_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PERSONTITLE_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [PT].Id
		,[PT].[Desc]
		,[PT].DateCreated
		,[PT].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM PersonTitle [PT], [User] [U]
	WHERE [PT].Id = @Id
	AND [PT].UserCreatedId = [U].Id
	AND [PT].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[PERSONTITLE_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PERSONTITLE_GETALL]
AS
BEGIN
	SELECT 
		 [PT].Id
		,[PT].[Desc]
		,[PT].DateCreated
		,[PT].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM PersonTitle [PT], [User] [U]
	WHERE 
		[PT].UserCreatedId = [U].Id
	AND [PT].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[PERSONTITLE_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PERSONTITLE_INSERT]
	 @Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO PersonTitle 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[PERSONTITLE_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PERSONTITLE_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT  
		 [PT].Id
		,[PT].[Desc]
		,[PT].DateCreated
		,[PT].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM PersonTitle [PT], [User] [U]
		   WHERE 
   ([PT].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [PT].UserCreatedId = [U].Id
   AND [PT].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[PERSONTITLE_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PERSONTITLE_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE PersonTitle SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[QUERYSTATUS_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QUERYSTATUS_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE QueryStatus SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[QUERYSTATUS_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QUERYSTATUS_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [QS].Id
		,[QS].[Desc]
		,[QS].DateCreated
		,[QS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM QueryStatus [QS], [User] [U]
	WHERE [QS].Id = @Id
	AND [QS].UserCreatedId = [U].Id
	AND [QS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[QUERYSTATUS_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QUERYSTATUS_GETALL]
AS
BEGIN
	SELECT 
		 [QS].Id
		,[QS].[Desc]
		,[QS].DateCreated
		,[QS].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM QueryStatus [QS], [User] [U]
	WHERE 
		[QS].UserCreatedId = [U].Id
	AND [QS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[QUERYSTATUS_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QUERYSTATUS_INSERT]
	 @Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO QueryStatus 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[QUERYSTATUS_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QUERYSTATUS_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT  
		 [QS].Id
		,[QS].[Desc]
		,[QS].DateCreated
		,[QS].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM QueryStatus [QS], [User] [U]
		  WHERE 
		  ([QS].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
	   AND [QS].UserCreatedId = [U].Id
	   AND [QS].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[QUERYSTATUS_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[QUERYSTATUS_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE QueryStatus SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[REL_GETASSIGNEDTASKS]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REL_GETASSIGNEDTASKS]
@UserRoleId INT
AS
BEGIN
	SELECT 
			 'MerchantBoarding - <b>' + [MB].LegalName + '</b> awaits your input. To go to Merchant Boarding, click ' AS ScreenName
			,'MainUI' AS RedirectUrl
			,[MB].Id AS AssignedTaskId
			FROM MerchantBoarding [MB], MerchantStatus [MS]
			WHERE [MS].UserRoleResponsibleId =  @UserRoleId
			AND [MB].MerchantStatusId = [MS].Id
			AND [MB].Deleted = 0
			AND [MS].Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[REL_MERCHANTCURRENCY_DELETEBYMERCHANT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REL_MERCHANTCURRENCY_DELETEBYMERCHANT]
@MerchantId INT
AS
BEGIN
	UPDATE rel_MerchantCurrency 
	SET [Deleted] = 1
	WHERE MerchantId = @MerchantId
END


GO
/****** Object:  StoredProcedure [dbo].[REL_MERCHANTCURRENCY_GETBYMERCHANT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REL_MERCHANTCURRENCY_GETBYMERCHANT]
@MerchantId INT
AS
BEGIN
	SELECT 
	 [C].Id AS Id
	,[C].Code AS Code
	,[C].[Desc] AS [Desc]
	,[C].DateCreated 
	,[C].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
	FROM rel_MerchantCurrency [MC]
	LEFT JOIN Merchant [M] ON [MC].MerchantId = [M].Id
	LEFT JOIN Currency [C] ON [MC].CurrencyId = [C].Id
	LEFT JOIN [User] [U] ON [MC].UserCreatedId = [U].Id

	WHERE [M].Id = @MerchantId

	AND [MC].Deleted = 0
	AND [M].Deleted = 0
	AND [C].Deleted = 0
	AND [U].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[REL_MERCHANTCURRENCY_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REL_MERCHANTCURRENCY_INSERT]
		 @MerchantId INT
		,@CurrencyId INT
		,@UserCreatedId INT
AS
BEGIN
	INSERT INTO rel_MerchantCurrency
		(MerchantId	
		,CurrencyId
		,DateCreated
		,UserCreatedId	
		,Deleted)
		VALUES
		(@MerchantId	
		,@CurrencyId	
		,GETDATE()
		,@UserCreatedId
		,0)
END


GO
/****** Object:  StoredProcedure [dbo].[REL_USERSCREEN_DELETEBYUSERID]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REL_USERSCREEN_DELETEBYUSERID]
@UserId INT
AS
BEGIN
	UPDATE rel_UserScreen
	SET [Deleted] = 1
	WHERE UserId = @UserId
END


GO
/****** Object:  StoredProcedure [dbo].[REL_USERSCREEN_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REL_USERSCREEN_INSERT]
		 @UserId INT
		,@ScreenId INT
		,@UserCreatedId INT
AS
BEGIN
	INSERT INTO rel_UserScreen
		(UserId	
		,ScreenId
		,DateCreated
		,UserCreatedId	
		,Deleted)
		VALUES
		(@UserId	
		,@ScreenId	
		,GETDATE()
		,@UserCreatedId
		,0)
END


GO
/****** Object:  StoredProcedure [dbo].[SALESCHANNEL_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SALESCHANNEL_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE SalesChannel SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[SALESCHANNEL_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SALESCHANNEL_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [SC].Id
		,[SC].[Desc]
		,[SC].DateCreated
		,[SC].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM SalesChannel [SC], [User] [U]
	WHERE [SC].Id = @Id
	AND [SC].UserCreatedId = [U].Id
	AND [SC].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[SALESCHANNEL_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SALESCHANNEL_GETALL]
AS
BEGIN
	SELECT 
		 [SC].Id
		,[SC].[Desc]
		,[SC].DateCreated
		,[SC].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM SalesChannel [SC], [User] [U]
	WHERE 
		[SC].UserCreatedId = [U].Id
	AND [SC].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SALESCHANNEL_INSERT]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SALESCHANNEL_INSERT]
	 @Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO SalesChannel 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[SALESCHANNEL_SEARCH]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SALESCHANNEL_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [SC].Id
		,[SC].[Desc]
		,[SC].DateCreated
		,[SC].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM SalesChannel [SC], [User] [U]
		  WHERE 
	  ([SC].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
	   AND [SC].UserCreatedId = [U].Id
	   AND [SC].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SALESCHANNEL_UPDATE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SALESCHANNEL_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE SalesChannel SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[SCREEN_DELETE]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SCREEN_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE Screen SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[SCREEN_GET]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SCREEN_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [S].Id
		,[S].[Desc]
		,[S].[Path]
		,[S].DateCreated
		,[S].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Screen [S], [User] [U]
	WHERE [S].Id = @Id
	AND [S].UserCreatedId = [U].Id
	AND [S].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SCREEN_GETALL]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SCREEN_GETALL]
AS
BEGIN
	SELECT  
		 [S].Id
		,[S].[Desc]
		,[S].[Path]
		,[S].DateCreated
		,[S].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM Screen [S], [User] U
	WHERE 
		[S].UserCreatedId = [U].Id
	AND [S].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SCREEN_GETBYUSER]    Script Date: 30/12/2016 13:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SCREEN_GETBYUSER] 
@Id INT
AS
BEGIN
	SELECT 
		 [S].Id
		,[S].[Desc]
		,[S].[Path]
		,[S].DateCreated
		,[S].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Screen [S], [User] [U]
	WHERE [S].Id IN (SELECT [rUS].ScreenId FROM rel_UserScreen [rUS] WHERE [rUS].UserId = @Id AND [rUS].Deleted  = 0)
	AND [S].UserCreatedId = [U].Id
	AND [S].Deleted = 0
	
	ORDER BY [S].Id
END


GO
/****** Object:  StoredProcedure [dbo].[SCREEN_INSERT]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SCREEN_INSERT]
	 @Desc NVARCHAR(50)
	,@Path NVARCHAR(500)
	,@UserId INT
AS
BEGIN
   INSERT INTO Screen 
	   ([Desc]
	   ,[Path]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,@Path
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[SCREEN_SEARCH]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SCREEN_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [S].Id
		,[S].[Desc]
		,[S].[Path]
		,[S].DateCreated
		,[S].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM Screen [S], [User] [U]
    WHERE 
   ([S].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [S].UserCreatedId = [U].Id
   AND [S].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SCREEN_UPDATE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SCREEN_UPDATE]
	-- Add the parameters for the stored procedure here
	 @Id INT
	,@Desc NVARCHAR(50)
	,@Path NVARCHAR(500)
AS
BEGIN
   UPDATE Screen SET 
    [Desc] = @Desc
   ,[Path] = @Path
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[SHAREHOLDER_DELETE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SHAREHOLDER_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE ShareHolder SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[SHAREHOLDER_GET]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SHAREHOLDER_GET]
@Id INT
AS
BEGIN
	SELECT 
	     [SH].Id
		,[SH].MerchantBoardingId, [MB].LegalName
		,[SH].Name	
		,[SH].Owned	
		,[SH].DOB	
		,[SH].PersonalAdd
		,[SH].IDDOC	
		,[SH].AVDOC
		,[SH].AddInfo
		,[SH].DateCreated
		,[SH].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM ShareHolder [SH], MerchantBoarding [MB], [User] [U]
	WHERE [SH].Id = @Id
	AND [SH].MerchantBoardingId = [MB].Id 
	AND [SH].UserCreatedId = [U].Id
	AND [SH].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SHAREHOLDER_GETALL]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SHAREHOLDER_GETALL]
AS
BEGIN
	SELECT  
		 [SH].Id
		,[SH].MerchantBoardingId, [MB].LegalName
		,[SH].Name	
		,[SH].Owned	
		,[SH].DOB	
		,[SH].PersonalAdd
		,[SH].IDDOC	
		,[SH].AVDOC
		,[SH].AddInfo
		,[SH].DateCreated
		,[SH].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM ShareHolder [SH], MerchantBoarding [MB], [User] [U]
	WHERE 
		[SH].UserCreatedId = [U].Id
	AND [SH].MerchantBoardingId = [MB].Id 
	AND [SH].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SHAREHOLDER_GETBYMERCHANTBOARDINGID]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SHAREHOLDER_GETBYMERCHANTBOARDINGID]
	-- Add the parameters for the stored procedure here
	@MerchantBoardingId INT
AS
BEGIN
   SELECT 
		 [SH].Id
		,[SH].MerchantBoardingId, [MB].LegalName
		,[SH].Name	
		,[SH].Owned	
		,[SH].DOB	
		,[SH].PersonalAdd
		,[SH].IDDOC	
		,[SH].AVDOC
		,[SH].AddInfo
		,[SH].DateCreated
		,[SH].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM ShareHolder [SH], MerchantBoarding [MB], [User] [U] 
    WHERE 
   [SH].MerchantBoardingId = @MerchantBoardingId
   AND [SH].MerchantBoardingId = [MB].Id 
   AND [SH].UserCreatedId = [U].Id
   AND [SH].Deleted = 0
   ORDER BY [SH].Id	
END


GO
/****** Object:  StoredProcedure [dbo].[SHAREHOLDER_GETSHAREHOLDERIDBYMERCHANTBOARDINGID]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SHAREHOLDER_GETSHAREHOLDERIDBYMERCHANTBOARDINGID]
	-- Add the parameters for the stored procedure here
	@MerchantBoardingId INT
AS
BEGIN
   SELECT 
		 [SH].Id
		FROM ShareHolder [SH], MerchantBoarding [MB], [User] [U] 
    WHERE 
   [SH].MerchantBoardingId = @MerchantBoardingId
   AND [SH].MerchantBoardingId = [MB].Id 
   AND [SH].UserCreatedId = [U].Id
   AND [SH].Deleted = 0
   ORDER BY [SH].Id	
END


GO
/****** Object:  StoredProcedure [dbo].[SHAREHOLDER_INSERT]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SHAREHOLDER_INSERT]
		 @Name	NVARCHAR(50)
		,@MerchantBoardingId INT
		,@Owned	INT	
		,@DOB	INT	
		,@PersonalAdd	INT	
		,@IDDOC	NVARCHAR(50)	
		,@AVDOC	NVARCHAR(50)	
		,@AddInfo	NVARCHAR(250)	
		,@UserCreatedId	INT	
AS
BEGIN
   INSERT INTO ShareHolder 
		(Name
		,MerchantBoardingId
		,Owned	
		,DOB	
		,PersonalAdd	
		,IDDOC	
		,AVDOC	
		,AddInfo
		,DateCreated
		,UserCreatedId
		,Deleted)
		VALUES
	    (@Name
		,@MerchantBoardingId
		,@Owned	
		,@DOB	
		,@PersonalAdd	
		,@IDDOC	
		,@AVDOC	
		,@AddInfo
	    ,GETDATE()
	    ,@UserCreatedId
	    ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[SHAREHOLDER_SEARCH]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SHAREHOLDER_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [SH].Id
		,[SH].MerchantBoardingId, [MB].LegalName
		,[SH].Name	
		,[SH].Owned	
		,[SH].DOB	
		,[SH].PersonalAdd
		,[SH].IDDOC	
		,[SH].AVDOC
		,[SH].AddInfo
		,[SH].DateCreated
		,[SH].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM ShareHolder [SH], MerchantBoarding [MB], [User] [U]
    WHERE 
   ([SH].[Name] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [SH].UserCreatedId = [U].Id
   AND [SH].MerchantBoardingId = [MB].Id 
   AND [SH].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SHAREHOLDER_UPDATE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SHAREHOLDER_UPDATE]
	-- Add the parameters for the stored procedure here
		 @Id INT
		,@Name	NVARCHAR(50)
		,@MerchantBoardingId INT
		,@Owned	INT	
		,@DOB	INT	
		,@PersonalAdd	INT	
		,@IDDOC	NVARCHAR(50)	
		,@AVDOC	NVARCHAR(50)	
		,@AddInfo	NVARCHAR(250)	
AS
BEGIN
   UPDATE ShareHolder SET 
   		 @Name	= @Name
		,@MerchantBoardingId =@MerchantBoardingId
		,@Owned	=@Owned	
		,@DOB	=@DOB	
		,@PersonalAdd	=@PersonalAdd	
		,@IDDOC	=@IDDOC
		,@AVDOC	=@AVDOC
		,@AddInfo=@AddInfo
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[STAGE_DELETE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[STAGE_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE Stage SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[STAGE_GET]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[STAGE_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [S].Id
		,[S].[Desc]
		,[S].DateCreated
		,[S].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Stage [S]
		LEFT JOIN [User] [U] ON [U].Id = [S].UserCreatedId
		
		WHERE [S].Id = @Id
		AND [S].Deleted = 0
		AND [U].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[STAGE_GETALL]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[STAGE_GETALL]
AS
BEGIN
	SELECT  
		 [S].Id
		,[S].[Desc]
		,[S].DateCreated
		,[S].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Stage [S]
		LEFT JOIN [User] [U] ON [U].Id = [S].UserCreatedId
		
		WHERE [S].Deleted = 0
END



GO
/****** Object:  StoredProcedure [dbo].[STAGE_INSERT]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[STAGE_INSERT]
	 @Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO Stage 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[STAGE_SEARCH]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[STAGE_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [S].Id
		,[S].[Desc]
		,[S].DateCreated
		,[S].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM Stage [S], [User] [U]
    WHERE 
   ([S].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [S].UserCreatedId = [U].Id
   AND [S].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[STAGE_UPDATE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[STAGE_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE Stage SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[SUB_CLIENT_GET]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_CLIENT_GET]
@Id INT
AS
BEGIN
SELECT
	 [M].Id
	 ,[M].Name
	--,[M].CompanyWebsite
	--,[M].CompanyTypeId, CT.[Desc] AS CompanyTypeDesc
	--,[M].MerchantStatusId, MS.[Desc] AS MerchantStatusDesc
	--,[M].ContactPerson
	--,[M].ContactEmailAddress
	--,[M].ApplicationFormStatusId, AFS.[Desc] AS ApplicationFormStatusDesc
	,[M].OutageNotificationEmail
	,[M].KYBStatusId,  KS.[Desc] AS KYBStatusDesc
	,[M].EUCorp
	,[M].ContractStatusId, CS.[Desc] AS ContractStatusDesc
	,[M].LiveInACP
	,[M].Processing
	,[M].UpdatesNotes
	--,[M].CountryId, C.[Desc] AS CountryDesc
	--,[M].MCCId,  MC.[Desc] AS MCCDesc
	--,[M].RegisteredAddress
	--,[M].SepaEntityAddress
	--,[M].StageId, S.[Desc] AS StageDesc
	--,[M].SalesChannelId, SC.[Desc] AS SalesChannelDesc
	--,[M].IndustryId, I.[Desc] AS IndustryDesc
	--,[M].IntroducedBy
	--,[M].OwnershipId, [O].Firstname AS OwnershipFirstname, [O].Lastname AS OwnershipLastname
	--,[M].DocumentsOutstanding
	--,[M].AddressOnContractId, AOD.[Desc] AS AddressOnContractDesc
	--,[M].AddressOnPRSId, AOP.[Desc] AS AddressOnPRSDesc
	--,[M].AddressOnCOIId, AOC.[Desc] AS AddressOnCOIDesc
	--,[M].ThirdParty
	--,[M].ThirdPartyContractId, TPC.[Desc] AS ThirdPartyContractDesc
	--,[M].PCICertId, PC.[Desc] AS PCICertDesc
	--,[M].IntegrationMethodId, IM.[Desc] AS IntegrationMethodDesc
	,[M].DateCreated
	,[M].UserCreatedId AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
	FROM Merchant M, 
	--CompanyType CT,
	--MerchantStatus MS, 
	--ApplicationFormStatus AFS, 
	KYBStatus KS,
	ContractStatus CS, 
	--Country C, 
	--MCC MC, 
	--Stage S,
	--SalesChannel SC,
	--Industry I,
	[User] O,
	--Country AOD,
	--Country AOP,
	--Country AOC,
	--ThirdPartyContract TPC,
	--PCICert PC,
	--IntegrationMethod IM,
	[User] [U]
	WHERE 
	 [M].Id = @Id

	--AND M.CompanyTypeId = CT.Id
	--AND M.MerchantStatusId = MS.Id
	--AND M.ApplicationFormStatusId = AFS.Id
	AND M.KYBStatusId = KS.Id
	AND M.ContractStatusId = CS.Id
	--AND M.CountryId = C.Id
	--AND M.MCCId = MC.Id
	--AND M.StageId = S.Id
	--AND M.SalesChannelId = SC.Id
	--AND M.IndustryId = I.Id
	AND M.OwnershipId = O.Id
	--AND M.AddressOnContractId = AOD.Id
	--AND M.AddressOnPRSId = AOP.Id
	--AND M.AddressOnCOIId = AOC.Id
	--AND M.ThirdPartyContractId = TPC.Id
	--AND M.PCICertId = PC.Id
	--AND M.IntegrationMethodId = IM.Id
	AND M.UserCreatedId = [U].Id

	AND M.Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[SUB_CLIENT_GETALL]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_CLIENT_GETALL]
AS
BEGIN
	SELECT
	  [M].Id
	 ,[M].Name
	--,[M].CompanyWebsite
	--,[M].CompanyTypeId, CT.[Desc] AS CompanyTypeDesc
	--,[M].MerchantStatusId, MS.[Desc] AS MerchantStatusDesc
	--,[M].ContactPerson
	--,[M].ContactEmailAddress
	--,[M].ApplicationFormStatusId, AFS.[Desc] AS ApplicationFormStatusDesc
	,[M].OutageNotificationEmail
	,[M].KYBStatusId,  KS.[Desc] AS KYBStatusDesc
	,[M].EUCorp
	,[M].ContractStatusId, CS.[Desc] AS ContractStatusDesc
	,[M].LiveInACP
	,[M].Processing
	,[M].UpdatesNotes
	--,[M].CountryId, C.[Desc] AS CountryDesc
	--,[M].MCCId,  MC.[Desc] AS MCCDesc
	--,[M].RegisteredAddress
	--,[M].SepaEntityAddress
	--,[M].StageId, S.[Desc] AS StageDesc
	--,[M].SalesChannelId, SC.[Desc] AS SalesChannelDesc
	--,[M].IndustryId, I.[Desc] AS IndustryDesc
	--,[M].IntroducedBy
	--,[M].OwnershipId, [O].Firstname AS OwnershipFirstname, [O].Lastname AS OwnershipLastname
	--,[M].DocumentsOutstanding
	--,[M].AddressOnContractId, AOD.[Desc] AS AddressOnContractDesc
	--,[M].AddressOnPRSId, AOP.[Desc] AS AddressOnPRSDesc
	--,[M].AddressOnCOIId, AOC.[Desc] AS AddressOnCOIDesc
	--,[M].ThirdParty
	--,[M].ThirdPartyContractId, TPC.[Desc] AS ThirdPartyContractDesc
	--,[M].PCICertId, PC.[Desc] AS PCICertDesc
	--,[M].IntegrationMethodId, IM.[Desc] AS IntegrationMethodDesc
	,[M].DateCreated
	,[M].UserCreatedId AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
	FROM Merchant M, 
	--CompanyType CT,
	--MerchantStatus MS, 
	--ApplicationFormStatus AFS, 
	KYBStatus KS,
	ContractStatus CS, 
	--Country C, 
	--MCC MC, 
	--Stage S,
	--SalesChannel SC,
	--Industry I,
	[User] O,
	--Country AOD,
	--Country AOP,
	--Country AOC,
	--ThirdPartyContract TPC,
	--PCICert PC,
	--IntegrationMethod IM,
	[User] [U]
	WHERE 

	--AND M.CompanyTypeId = CT.Id
	--AND M.MerchantStatusId = MS.Id
	--AND M.ApplicationFormStatusId = AFS.Id
	    M.KYBStatusId = KS.Id
	AND M.ContractStatusId = CS.Id
	--AND M.CountryId = C.Id
	--AND M.MCCId = MC.Id
	--AND M.StageId = S.Id
	--AND M.SalesChannelId = SC.Id
	--AND M.IndustryId = I.Id
	AND M.OwnershipId = O.Id
	--AND M.AddressOnContractId = AOD.Id
	--AND M.AddressOnPRSId = AOP.Id
	--AND M.AddressOnCOIId = AOC.Id
	--AND M.ThirdPartyContractId = TPC.Id
	--AND M.PCICertId = PC.Id
	--AND M.IntegrationMethodId = IM.Id
	AND M.UserCreatedId = [U].Id

	AND M.Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SUB_CLIENT_SEARCH]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_CLIENT_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
	SELECT
	  [M].Id
	 ,[M].Name
	--,[M].CompanyWebsite
	--,[M].CompanyTypeId, CT.[Desc] AS CompanyTypeDesc
	--,[M].MerchantStatusId, MS.[Desc] AS MerchantStatusDesc
	--,[M].ContactPerson
	--,[M].ContactEmailAddress
	--,[M].ApplicationFormStatusId, AFS.[Desc] AS ApplicationFormStatusDesc
	,[M].OutageNotificationEmail
	,[M].KYBStatusId,  KS.[Desc] AS KYBStatusDesc
	,[M].EUCorp
	,[M].ContractStatusId, CS.[Desc] AS ContractStatusDesc
	,[M].LiveInACP
	,[M].Processing
	,[M].UpdatesNotes
	--,[M].CountryId, C.[Desc] AS CountryDesc
	--,[M].MCCId,  MC.[Desc] AS MCCDesc
	--,[M].RegisteredAddress
	--,[M].SepaEntityAddress
	--,[M].StageId, S.[Desc] AS StageDesc
	--,[M].SalesChannelId, SC.[Desc] AS SalesChannelDesc
	--,[M].IndustryId, I.[Desc] AS IndustryDesc
	--,[M].IntroducedBy
	--,[M].OwnershipId, [O].Firstname AS OwnershipFirstname, [O].Lastname AS OwnershipLastname
	--,[M].DocumentsOutstanding
	--,[M].AddressOnContractId, AOD.[Desc] AS AddressOnContractDesc
	--,[M].AddressOnPRSId, AOP.[Desc] AS AddressOnPRSDesc
	--,[M].AddressOnCOIId, AOC.[Desc] AS AddressOnCOIDesc
	--,[M].ThirdParty
	--,[M].ThirdPartyContractId, TPC.[Desc] AS ThirdPartyContractDesc
	--,[M].PCICertId, PC.[Desc] AS PCICertDesc
	--,[M].IntegrationMethodId, IM.[Desc] AS IntegrationMethodDesc
	,[M].DateCreated
	,[M].UserCreatedId AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
	FROM Merchant M, 
	--CompanyType CT,
	--MerchantStatus MS, 
	--ApplicationFormStatus AFS, 
	KYBStatus KS,
	ContractStatus CS, 
	--Country C, 
	--MCC MC, 
	--Stage S,
	--SalesChannel SC,
	--Industry I,
	[User] O,
	--Country AOD,
	--Country AOP,
	--Country AOC,
	--ThirdPartyContract TPC,
	--PCICert PC,
	--IntegrationMethod IM,
	[User] [U]
	WHERE 
	(M.Name	LIKE '%'+ @SearchText +'%'
		--OR M.CompanyWebsite	LIKE '%'+ @SearchText +'%'
		OR M.OutageNotificationEmail	LIKE '%'+ @SearchText +'%'
		OR M.UpdatesNotes	LIKE '%'+ @SearchText +'%'
		OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')

	--AND M.CompanyTypeId = CT.Id
	--AND M.MerchantStatusId = MS.Id
	--AND M.ApplicationFormStatusId = AFS.Id
	AND M.KYBStatusId = KS.Id
	AND M.ContractStatusId = CS.Id
	--AND M.CountryId = C.Id
	--AND M.MCCId = MC.Id
	--AND M.StageId = S.Id
	--AND M.SalesChannelId = SC.Id
	--AND M.IndustryId = I.Id
	AND M.OwnershipId = O.Id
	--AND M.AddressOnContractId = AOD.Id
	--AND M.AddressOnPRSId = AOP.Id
	--AND M.AddressOnCOIId = AOC.Id
	--AND M.ThirdPartyContractId = TPC.Id
	--AND M.PCICertId = PC.Id
	--AND M.IntegrationMethodId = IM.Id
	AND M.UserCreatedId = [U].Id

	AND M.Deleted = 0
	END

GO
/****** Object:  StoredProcedure [dbo].[SUB_CLIENT_UPDATE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_CLIENT_UPDATE]
	-- Add the parameters for the stored procedure here
	 @Id INT
	,@Name NVARCHAR(150)	
	,@OutageNotificationEmail NVARCHAR(150)
	,@KYBStatusId INT
	,@EUCorp BIT
	,@ContractStatusId INT
	,@LiveInACP BIT
	,@Processing BIT
	,@UpdatesNotes  NVARCHAR(MAX)

	--,@CompanyWebsite NVARCHAR(150)	
	--,@CompanyTypeId INT
	--,@MerchantStatusId INT
	--,@ContactPerson  NVARCHAR(150)
	--,@ContactEmailAddress NVARCHAR(150)
	--,@ApplicationFormStatusId INT
	--,@CountryId INT
	--,@MCCId INT
	--,@RegisteredAddress NVARCHAR(150)
	--,@SepaEntityAddress NVARCHAR(150)
	--,@StageId INT
	--,@SalesChannelId INT
	--,@IndustryId INT
	--,@IntroducedBy NVARCHAR(150)
	--,@OwnershipId INT
	--,@DocumentsOutstanding NVARCHAR(150)
	--,@AddressOnContractId INT
	--,@AddressOnPRSId INT
	--,@AddressOnCOIId INT
	--,@ThirdParty NVARCHAR(150)
	--,@ThirdPartyContractId INT
	--,@PCICertId INT
	--,@IntegrationMethodId INT
	--,@DateCreated DATETIME
	--,@UserCreatedId INT
	--,@Deleted
AS
BEGIN
   UPDATE Merchant SET 
	 Name = @Name 
	--,CompanyWebsite = @CompanyWebsite 
	--,CompanyTypeId = @CompanyTypeId 
	--,MerchantStatusId = @MerchantStatusId 
	--,ContactPerson = @ContactPerson 
	--,ContactEmailAddress = @ContactEmailAddress 
	--,ApplicationFormStatusId = @ApplicationFormStatusId 
	,OutageNotificationEmail = @OutageNotificationEmail 
	,KYBStatusId = @KYBStatusId 
	,EUCorp = @EUCorp 
	,ContractStatusId = @ContractStatusId 
	,LiveInACP = @LiveInACP 
	,Processing = @Processing 
	,UpdatesNotes = @UpdatesNotes  
	--,CountryId = @CountryId 
	--,MCCId = @MCCId 
	--,RegisteredAddress = @RegisteredAddress 
	--,SepaEntityAddress = @SepaEntityAddress 
	--,StageId = @StageId 
	--,SalesChannelId = @SalesChannelId 
	--,IndustryId = @IndustryId 
	--,IntroducedBy = @IntroducedBy 
	--,OwnershipId = @OwnershipId
	--,DocumentsOutstanding = @DocumentsOutstanding 
	--,AddressOnContractId = @AddressOnContractId 
	--,AddressOnPRSId = @AddressOnPRSId 
	--,AddressOnCOIId = @AddressOnCOIId 
	--,ThirdParty = @ThirdParty 
	--,ThirdPartyContractId = @ThirdPartyContractId 
	--,PCICertId = @PCICertId 
	--,IntegrationMethodId = @IntegrationMethodId 
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[SUB_CONTACTSTRACKER_GET]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_CONTACTSTRACKER_GET]
@Id INT
AS
BEGIN
		SELECT
			 [M].Id
			,[M].Name
			-- ,[M].CompanyWebsite
			-- ,[M].CompanyTypeId, [CT].[Desc] AS CompanyTypeDesc
			,[M].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc
			-- ,[M].ContactPerson
			-- ,[M].ContactEmailAddress
			-- ,[M].ApplicationFormStatusId, [AFS].[Desc] AS ApplicationFormStatusDesc
			-- ,[M].OutageNotificationEmail
			-- ,[M].KYBStatusId, [KS].[Desc] AS KYBStatusDesc
			,[M].EUCorp
			,[M].ContractStatusId, [CS].[Desc] AS ContractStatusDesc
			,[M].LiveInACP
			,[M].Processing
			,[M].UpdatesNotes
			-- ,[M].CountryId, [C].[Desc] AS CountryDesc
			-- ,[M].MCCId, [MC].[Desc] AS MCCDesc
			-- ,[M].RegisteredAddress
			-- ,[M].SepaEntityAddress
			-- ,[M].StageId, [S].[Desc] AS StageDesc
			-- ,[M].SalesChannelId, [SC].[Desc] AS SalesChannelDesc
			-- ,[M].IndustryId, [I].[Desc] AS IndustryDesc
			-- ,[M].IntroducedBy
			-- ,[M].OwnershipId, [O].Firstname AS OwnershipFirstname, [O].Lastname AS OwnershipLastname
			-- ,[M].DocumentsOutstanding
			,[M].AddressOnContractId, [AOD].[Desc] AS AddressOnContractDesc
			,[M].AddressOnPRSId, [AOP].[Desc] AS AddressOnPRSDesc
			,[M].AddressOnCOIId, [AOC].[Desc] AS AddressOnCOIDesc
			,[M].ThirdParty
			,[M].ThirdPartyContractId, [TPC].[Desc] AS ThirdPartyContractDesc
			,[M].PCICertId, [PC].[Desc] AS PCICertDesc
			,[M].IntegrationMethodId, [IM].[Desc] AS IntegrationMethodDesc
			,[M].DateCreated
			,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
			FROM Merchant [M]
			-- LEFT JOIN CompanyType [CT] ON [M].CompanyTypeId = [CT].Id
			LEFT JOIN MerchantStatus [MS] ON [M].CompanyTypeId = [MS].Id
			-- LEFT JOIN ApplicationFormStatus [AFS] ON [M].ApplicationFormStatusId = [AFS].Id
			-- LEFT JOIN KYBStatus [KS] ON [M].KYBStatusId = [KS].Id
			LEFT JOIN ContractStatus CS ON [M].ContractStatusId = CS.Id
			-- LEFT JOIN Country [C] ON [M].CountryId = C.Id
			-- LEFT JOIN MCC [MC] ON [M].MCCId = MC.Id
			-- LEFT JOIN Stage [S] ON[M].StageId = S.Id
			-- LEFT JOIN SalesChannel [SC] ON [M].SalesChannelId = SC.Id
			-- LEFT JOIN Industry [I] ON [M].IndustryId = I.Id
			-- LEFT JOIN [User] [O] ON [M].OwnershipId = O.Id
			LEFT JOIN Country [AOD] ON [M].AddressOnContractId = AOD.Id
			LEFT JOIN Country [AOP] ON [M].AddressOnPRSId = AOP.Id
			LEFT JOIN Country [AOC] ON [M].AddressOnCOIId = AOC.Id
			LEFT JOIN ThirdPartyContract [TPC] ON	 [M].ThirdPartyContractId = TPC.Id
			LEFT JOIN PCICert [PC] ON [M].PCICertId = PC.Id
			LEFT JOIN IntegrationMethod [IM] ON	 [M].IntegrationMethodId = IM.Id
			LEFT JOIN [User] [U] ON M.UserCreatedId = [U].Id

			WHERE [M].Id = @Id
			AND [M].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[SUB_CONTACTSTRACKER_GETALL]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_CONTACTSTRACKER_GETALL]
AS
BEGIN
		SELECT
			 [M].Id
			,[M].Name
			-- ,[M].CompanyWebsite
			-- ,[M].CompanyTypeId, [CT].[Desc] AS CompanyTypeDesc
			,[M].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc
			-- ,[M].ContactPerson
			-- ,[M].ContactEmailAddress
			-- ,[M].ApplicationFormStatusId, [AFS].[Desc] AS ApplicationFormStatusDesc
			-- ,[M].OutageNotificationEmail
			-- ,[M].KYBStatusId, [KS].[Desc] AS KYBStatusDesc
			,[M].EUCorp
			,[M].ContractStatusId, [CS].[Desc] AS ContractStatusDesc
			,[M].LiveInACP
			,[M].Processing
			,[M].UpdatesNotes
			-- ,[M].CountryId, [C].[Desc] AS CountryDesc
			-- ,[M].MCCId, [MC].[Desc] AS MCCDesc
			-- ,[M].RegisteredAddress
			-- ,[M].SepaEntityAddress
			-- ,[M].StageId, [S].[Desc] AS StageDesc
			-- ,[M].SalesChannelId, [SC].[Desc] AS SalesChannelDesc
			-- ,[M].IndustryId, [I].[Desc] AS IndustryDesc
			-- ,[M].IntroducedBy
			-- ,[M].OwnershipId, [O].Firstname AS OwnershipFirstname, [O].Lastname AS OwnershipLastname
			-- ,[M].DocumentsOutstanding
			,[M].AddressOnContractId, [AOD].[Desc] AS AddressOnContractDesc
			,[M].AddressOnPRSId, [AOP].[Desc] AS AddressOnPRSDesc
			,[M].AddressOnCOIId, [AOC].[Desc] AS AddressOnCOIDesc
			,[M].ThirdParty
			,[M].ThirdPartyContractId, [TPC].[Desc] AS ThirdPartyContractDesc
			,[M].PCICertId, [PC].[Desc] AS PCICertDesc
			,[M].IntegrationMethodId, [IM].[Desc] AS IntegrationMethodDesc
			,[M].DateCreated
			,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
			FROM Merchant [M]
			-- LEFT JOIN CompanyType [CT] ON [M].CompanyTypeId = [CT].Id
			LEFT JOIN MerchantStatus [MS] ON [M].CompanyTypeId = [MS].Id
			-- LEFT JOIN ApplicationFormStatus [AFS] ON [M].ApplicationFormStatusId = [AFS].Id
			-- LEFT JOIN KYBStatus [KS] ON [M].KYBStatusId = [KS].Id
			LEFT JOIN ContractStatus CS ON [M].ContractStatusId = CS.Id
			-- LEFT JOIN Country [C] ON [M].CountryId = C.Id
			-- LEFT JOIN MCC [MC] ON [M].MCCId = MC.Id
			-- LEFT JOIN Stage [S] ON[M].StageId = S.Id
			-- LEFT JOIN SalesChannel [SC] ON [M].SalesChannelId = SC.Id
			-- LEFT JOIN Industry [I] ON [M].IndustryId = I.Id
			-- LEFT JOIN [User] [O] ON [M].OwnershipId = O.Id
			LEFT JOIN Country [AOD] ON [M].AddressOnContractId = AOD.Id
			LEFT JOIN Country [AOP] ON [M].AddressOnPRSId = AOP.Id
			LEFT JOIN Country [AOC] ON [M].AddressOnCOIId = AOC.Id
			LEFT JOIN ThirdPartyContract [TPC] ON	 [M].ThirdPartyContractId = TPC.Id
			LEFT JOIN PCICert [PC] ON [M].PCICertId = PC.Id
			LEFT JOIN IntegrationMethod [IM] ON	 [M].IntegrationMethodId = IM.Id
			LEFT JOIN [User] [U] ON M.UserCreatedId = [U].Id

			WHERE [M].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SUB_CONTACTSTRACKER_SEARCH]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_CONTACTSTRACKER_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
	SELECT
			 [M].Id
			,[M].Name
			-- ,[M].CompanyWebsite
			-- ,[M].CompanyTypeId, [CT].[Desc] AS CompanyTypeDesc
			,[M].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc
			-- ,[M].ContactPerson
			-- ,[M].ContactEmailAddress
			-- ,[M].ApplicationFormStatusId, [AFS].[Desc] AS ApplicationFormStatusDesc
			-- ,[M].OutageNotificationEmail
			-- ,[M].KYBStatusId, [KS].[Desc] AS KYBStatusDesc
			,[M].EUCorp
			,[M].ContractStatusId, [CS].[Desc] AS ContractStatusDesc
			,[M].LiveInACP
			,[M].Processing
			,[M].UpdatesNotes
			-- ,[M].CountryId, [C].[Desc] AS CountryDesc
			-- ,[M].MCCId, [MC].[Desc] AS MCCDesc
			-- ,[M].RegisteredAddress
			-- ,[M].SepaEntityAddress
			-- ,[M].StageId, [S].[Desc] AS StageDesc
			-- ,[M].SalesChannelId, [SC].[Desc] AS SalesChannelDesc
			-- ,[M].IndustryId, [I].[Desc] AS IndustryDesc
			-- ,[M].IntroducedBy
			-- ,[M].OwnershipId, [O].Firstname AS OwnershipFirstname, [O].Lastname AS OwnershipLastname
			-- ,[M].DocumentsOutstanding
			,[M].AddressOnContractId, [AOD].[Desc] AS AddressOnContractDesc
			,[M].AddressOnPRSId, [AOP].[Desc] AS AddressOnPRSDesc
			,[M].AddressOnCOIId, [AOC].[Desc] AS AddressOnCOIDesc
			,[M].ThirdParty
			,[M].ThirdPartyContractId, [TPC].[Desc] AS ThirdPartyContractDesc
			,[M].PCICertId, [PC].[Desc] AS PCICertDesc
			,[M].IntegrationMethodId, [IM].[Desc] AS IntegrationMethodDesc
			,[M].DateCreated
			,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
			FROM Merchant [M]
			-- LEFT JOIN CompanyType [CT] ON [M].CompanyTypeId = [CT].Id
			LEFT JOIN MerchantStatus [MS] ON [M].CompanyTypeId = [MS].Id
			-- LEFT JOIN ApplicationFormStatus [AFS] ON [M].ApplicationFormStatusId = [AFS].Id
			-- LEFT JOIN KYBStatus [KS] ON [M].KYBStatusId = [KS].Id
			LEFT JOIN ContractStatus CS ON [M].ContractStatusId = CS.Id
			-- LEFT JOIN Country [C] ON [M].CountryId = C.Id
			-- LEFT JOIN MCC [MC] ON [M].MCCId = MC.Id
			-- LEFT JOIN Stage [S] ON[M].StageId = S.Id
			-- LEFT JOIN SalesChannel [SC] ON [M].SalesChannelId = SC.Id
			-- LEFT JOIN Industry [I] ON [M].IndustryId = I.Id
			-- LEFT JOIN [User] [O] ON [M].OwnershipId = O.Id
			LEFT JOIN Country [AOD] ON [M].AddressOnContractId = AOD.Id
			LEFT JOIN Country [AOP] ON [M].AddressOnPRSId = AOP.Id
			LEFT JOIN Country [AOC] ON [M].AddressOnCOIId = AOC.Id
			LEFT JOIN ThirdPartyContract [TPC] ON	 [M].ThirdPartyContractId = TPC.Id
			LEFT JOIN PCICert [PC] ON [M].PCICertId = PC.Id
			LEFT JOIN IntegrationMethod [IM] ON	 [M].IntegrationMethodId = IM.Id
			LEFT JOIN [User] [U] ON M.UserCreatedId = [U].Id

			WHERE	   ([M].Name LIKE '%'+ @SearchText +'%'
					OR [MS].[Desc]LIKE '%'+ @SearchText +'%'
					OR [CS].[Desc] LIKE '%'+ @SearchText +'%'
					OR [M].UpdatesNotes	LIKE '%'+ @SearchText +'%'
					OR [AOD].[Desc] LIKE '%'+ @SearchText +'%'
					OR [AOP].[Desc] LIKE '%'+ @SearchText +'%'
					OR [AOC].[Desc] LIKE '%'+ @SearchText +'%'
					OR [M].ThirdParty LIKE '%'+ @SearchText +'%'
					OR [TPC].[Desc] LIKE '%'+ @SearchText +'%'
					OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
					AND [M].Deleted = 0
	END

GO
/****** Object:  StoredProcedure [dbo].[SUB_CONTACTSTRACKER_UPDATE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_CONTACTSTRACKER_UPDATE]
	-- Add the parameters for the stored procedure here
	 @Id INT
	-- ,@Name NVARCHAR(150)	
	-- ,@CompanyWebsite NVARCHAR(150)	
	-- ,@CompanyTypeId INT
	-- ,@MerchantStatusId INT
	-- ,@ContactPerson  NVARCHAR(150)
	-- ,@ContactEmailAddress NVARCHAR(150)
	-- ,@ApplicationFormStatusId INT
	-- ,@OutageNotificationEmail NVARCHAR(150)
	-- ,@KYBStatusId INT
	,@EUCorp BIT
	,@ContractStatusId INT
	,@LiveInACP BIT
	,@Processing BIT
	-- ,@UpdatesNotes  NVARCHAR(MAX)
	-- ,@CountryId INT
	-- ,@MCCId INT
	-- ,@RegisteredAddress NVARCHAR(150)
	-- ,@SepaEntityAddress NVARCHAR(150)
	-- ,@StageId INT
	-- ,@SalesChannelId INT
	-- ,@IndustryId INT
	-- ,@IntroducedBy NVARCHAR(150)
	-- ,@OwnershipId INT
	-- ,@DocumentsOutstanding NVARCHAR(150)
	,@AddressOnContractId INT
	,@AddressOnPRSId INT
	,@AddressOnCOIId INT
	,@ThirdParty NVARCHAR(150)
	,@ThirdPartyContractId INT
	,@PCICertId INT
	,@IntegrationMethodId INT
	-- ,@DateCreated DATETIME
	-- ,@UserCreatedId INT
AS
BEGIN
   UPDATE Merchant SET 
	 -- Name = @Name 
	-- ,CompanyWebsite = @CompanyWebsite 
	-- ,CompanyTypeId = @CompanyTypeId 
	-- MerchantStatusId = @MerchantStatusId 
	-- ,ContactPerson = @ContactPerson 
	-- ,ContactEmailAddress = @ContactEmailAddress 
	-- ,ApplicationFormStatusId = @ApplicationFormStatusId 
	-- ,OutageNotificationEmail = @OutageNotificationEmail 
	-- ,KYBStatusId = @KYBStatusId 
	EUCorp = @EUCorp 
	,ContractStatusId = @ContractStatusId 
	,LiveInACP = @LiveInACP 
	,Processing = @Processing 
	-- ,UpdatesNotes = @UpdatesNotes  
	-- ,CountryId = @CountryId 
	-- ,MCCId = @MCCId 
	-- ,RegisteredAddress = @RegisteredAddress 
	-- ,SepaEntityAddress = @SepaEntityAddress 
	-- ,StageId = @StageId 
	-- ,SalesChannelId = @SalesChannelId 
	-- ,IndustryId = @IndustryId 
	-- ,IntroducedBy = @IntroducedBy 
	-- ,OwnershipId = @OwnershipId
	-- ,DocumentsOutstanding = @DocumentsOutstanding 
	,AddressOnContractId = @AddressOnContractId 
	,AddressOnPRSId = @AddressOnPRSId 
	,AddressOnCOIId = @AddressOnCOIId 
	,ThirdParty = @ThirdParty 
	,ThirdPartyContractId = @ThirdPartyContractId 
	,PCICertId = @PCICertId 
	,IntegrationMethodId = @IntegrationMethodId 
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[SUB_ISOPSPDETAILS_GET]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_ISOPSPDETAILS_GET]
@Id INT
AS
BEGIN
		SELECT
				[M].Id
				,[M].Name
				,[M].CompanyWebsite
				,[M].CompanyTypeId, [CT].[Desc] AS CompanyTypeDesc
				,[M].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc
				,[M].ContactPerson
				,[M].ContactEmailAddress
			-- ,[M].ApplicationFormStatusId, [AFS].[Desc] AS ApplicationFormStatusDesc
			-- ,[M].OutageNotificationEmail
			-- ,[M].KYBStatusId, [KS].[Desc] AS KYBStatusDesc
			-- ,[M].EUCorp
			-- ,[M].ContractStatusId, [CS].[Desc] AS ContractStatusDesc
			-- ,[M].LiveInACP
			-- ,[M].Processing
			-- ,[M].UpdatesNotes
			-- ,[M].CountryId, [C].[Desc] AS CountryDesc
			-- ,[M].MCCId, [MC].[Desc] AS MCCDesc
			-- ,[M].RegisteredAddress
			-- ,[M].SepaEntityAddress
			-- ,[M].StageId, [S].[Desc] AS StageDesc
			-- ,[M].SalesChannelId, [SC].[Desc] AS SalesChannelDesc
			-- ,[M].IndustryId, [I].[Desc] AS IndustryDesc
			,[M].IntroducedBy
			,[M].OwnershipId, [O].Firstname AS OwnershipFirstname, [O].Lastname AS OwnershipLastname
			-- ,[M].DocumentsOutstanding
			-- ,[M].AddressOnContractId, [AOD].[Desc] AS AddressOnContractDesc
			-- ,[M].AddressOnPRSId, [AOP].[Desc] AS AddressOnPRSDesc
			-- ,[M].AddressOnCOIId, [AOC].[Desc] AS AddressOnCOIDesc
			-- ,[M].ThirdParty
			-- ,[M].ThirdPartyContractId, [TPC].[Desc] AS ThirdPartyContractDesc
			-- ,[M].PCICertId, [PC].[Desc] AS PCICertDesc
			-- ,[M].IntegrationMethodId, [IM].[Desc] AS IntegrationMethodDesc
			,[M].DateCreated
			,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
			FROM Merchant [M]
			LEFT JOIN CompanyType [CT] ON [M].CompanyTypeId = [CT].Id
			LEFT JOIN MerchantStatus [MS] ON [M].CompanyTypeId = [MS].Id
			-- LEFT JOIN ApplicationFormStatus [AFS] ON [M].ApplicationFormStatusId = [AFS].Id
			-- LEFT JOIN KYBStatus [KS] ON [M].KYBStatusId = [KS].Id
			-- LEFT JOIN ContractStatus CS ON [M].ContractStatusId = CS.Id
			-- LEFT JOIN Country [C] ON [M].CountryId = C.Id
			-- LEFT JOIN MCC [MC] ON [M].MCCId = MC.Id
			-- LEFT JOIN Stage [S] ON[M].StageId = S.Id
			-- LEFT JOIN SalesChannel [SC] ON [M].SalesChannelId = SC.Id
			-- LEFT JOIN Industry [I] ON [M].IndustryId = I.Id
			LEFT JOIN [User] [O] ON [M].OwnershipId = O.Id
			-- LEFT JOIN Country [AOD] ON [M].AddressOnContractId = AOD.Id
			-- LEFT JOIN Country [AOP] ON [M].AddressOnPRSId = AOP.Id
			-- LEFT JOIN Country [AOC] ON [M].AddressOnCOIId = AOC.Id
			-- LEFT JOIN ThirdPartyContract [TPC] ON	 [M].ThirdPartyContractId = TPC.Id
			-- LEFT JOIN PCICert [PC] ON [M].PCICertId = PC.Id
			-- LEFT JOIN IntegrationMethod [IM] ON	 [M].IntegrationMethodId = IM.Id
			LEFT JOIN [User] [U] ON M.UserCreatedId = [U].Id

			WHERE [M].Id = @Id
			AND [M].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[SUB_ISOPSPDETAILS_GETALL]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_ISOPSPDETAILS_GETALL]
AS
BEGIN
		SELECT
	     [M].Id
		,[M].Name
		,[M].CompanyWebsite
		,[M].CompanyTypeId, [CT].[Desc] AS CompanyTypeDesc
		,[M].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc
		,[M].ContactPerson
		,[M].ContactEmailAddress
	-- ,[M].ApplicationFormStatusId, [AFS].[Desc] AS ApplicationFormStatusDesc
	-- ,[M].OutageNotificationEmail
	-- ,[M].KYBStatusId, [KS].[Desc] AS KYBStatusDesc
	-- ,[M].EUCorp
	-- ,[M].ContractStatusId, [CS].[Desc] AS ContractStatusDesc
	-- ,[M].LiveInACP
	-- ,[M].Processing
	-- ,[M].UpdatesNotes
	-- ,[M].CountryId, [C].[Desc] AS CountryDesc
	-- ,[M].MCCId, [MC].[Desc] AS MCCDesc
	-- ,[M].RegisteredAddress
	-- ,[M].SepaEntityAddress
	-- ,[M].StageId, [S].[Desc] AS StageDesc
	-- ,[M].SalesChannelId, [SC].[Desc] AS SalesChannelDesc
	-- ,[M].IndustryId, [I].[Desc] AS IndustryDesc
	,[M].IntroducedBy
	,[M].OwnershipId, [O].Firstname AS OwnershipFirstname, [O].Lastname AS OwnershipLastname
	-- ,[M].DocumentsOutstanding
	-- ,[M].AddressOnContractId, [AOD].[Desc] AS AddressOnContractDesc
	-- ,[M].AddressOnPRSId, [AOP].[Desc] AS AddressOnPRSDesc
	-- ,[M].AddressOnCOIId, [AOC].[Desc] AS AddressOnCOIDesc
	-- ,[M].ThirdParty
	-- ,[M].ThirdPartyContractId, [TPC].[Desc] AS ThirdPartyContractDesc
	-- ,[M].PCICertId, [PC].[Desc] AS PCICertDesc
	-- ,[M].IntegrationMethodId, [IM].[Desc] AS IntegrationMethodDesc
	,[M].DateCreated
	,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
			FROM Merchant [M]
			LEFT JOIN CompanyType [CT] ON [M].CompanyTypeId = [CT].Id
			LEFT JOIN MerchantStatus [MS] ON [M].CompanyTypeId = [MS].Id
			-- LEFT JOIN ApplicationFormStatus [AFS] ON [M].ApplicationFormStatusId = [AFS].Id
			-- LEFT JOIN KYBStatus [KS] ON [M].KYBStatusId = [KS].Id
			-- LEFT JOIN ContractStatus CS ON [M].ContractStatusId = CS.Id
			-- LEFT JOIN Country [C] ON [M].CountryId = C.Id
			-- LEFT JOIN MCC [MC] ON [M].MCCId = MC.Id
			-- LEFT JOIN Stage [S] ON[M].StageId = S.Id
			-- LEFT JOIN SalesChannel [SC] ON [M].SalesChannelId = SC.Id
			-- LEFT JOIN Industry [I] ON [M].IndustryId = I.Id
			LEFT JOIN [User] [O] ON [M].OwnershipId = O.Id
			-- LEFT JOIN Country [AOD] ON [M].AddressOnContractId = AOD.Id
			-- LEFT JOIN Country [AOP] ON [M].AddressOnPRSId = AOP.Id
			-- LEFT JOIN Country [AOC] ON [M].AddressOnCOIId = AOC.Id
			-- LEFT JOIN ThirdPartyContract [TPC] ON	 [M].ThirdPartyContractId = TPC.Id
			-- LEFT JOIN PCICert [PC] ON [M].PCICertId = PC.Id
			-- LEFT JOIN IntegrationMethod [IM] ON	 [M].IntegrationMethodId = IM.Id
			LEFT JOIN [User] [U] ON M.UserCreatedId = [U].Id

			WHERE 
			[M].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SUB_ISOPSPDETAILS_SEARCH]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_ISOPSPDETAILS_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
	SELECT
	     [M].Id
		,[M].Name
		,[M].CompanyWebsite
		,[M].CompanyTypeId, [CT].[Desc] AS CompanyTypeDesc
		,[M].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc
		,[M].ContactPerson
		,[M].ContactEmailAddress
	-- ,[M].ApplicationFormStatusId, [AFS].[Desc] AS ApplicationFormStatusDesc
	-- ,[M].OutageNotificationEmail
	-- ,[M].KYBStatusId, [KS].[Desc] AS KYBStatusDesc
	-- ,[M].EUCorp
	-- ,[M].ContractStatusId, [CS].[Desc] AS ContractStatusDesc
	-- ,[M].LiveInACP
	-- ,[M].Processing
	-- ,[M].UpdatesNotes
	-- ,[M].CountryId, [C].[Desc] AS CountryDesc
	-- ,[M].MCCId, [MC].[Desc] AS MCCDesc
	-- ,[M].RegisteredAddress
	-- ,[M].SepaEntityAddress
	-- ,[M].StageId, [S].[Desc] AS StageDesc
	-- ,[M].SalesChannelId, [SC].[Desc] AS SalesChannelDesc
	-- ,[M].IndustryId, [I].[Desc] AS IndustryDesc
	,[M].IntroducedBy
	,[M].OwnershipId, [O].Firstname AS OwnershipFirstname, [O].Lastname AS OwnershipLastname
	-- ,[M].DocumentsOutstanding
	-- ,[M].AddressOnContractId, [AOD].[Desc] AS AddressOnContractDesc
	-- ,[M].AddressOnPRSId, [AOP].[Desc] AS AddressOnPRSDesc
	-- ,[M].AddressOnCOIId, [AOC].[Desc] AS AddressOnCOIDesc
	-- ,[M].ThirdParty
	-- ,[M].ThirdPartyContractId, [TPC].[Desc] AS ThirdPartyContractDesc
	-- ,[M].PCICertId, [PC].[Desc] AS PCICertDesc
	-- ,[M].IntegrationMethodId, [IM].[Desc] AS IntegrationMethodDesc
	,[M].DateCreated
	,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
		FROM Merchant [M]
			LEFT JOIN CompanyType [CT] ON [M].CompanyTypeId = [CT].Id
			LEFT JOIN MerchantStatus [MS] ON [M].CompanyTypeId = [MS].Id
			-- LEFT JOIN ApplicationFormStatus [AFS] ON [M].ApplicationFormStatusId = [AFS].Id
			-- LEFT JOIN KYBStatus [KS] ON [M].KYBStatusId = [KS].Id
			-- LEFT JOIN ContractStatus CS ON [M].ContractStatusId = CS.Id
			-- LEFT JOIN Country [C] ON [M].CountryId = C.Id
			-- LEFT JOIN MCC [MC] ON [M].MCCId = MC.Id
			-- LEFT JOIN Stage [S] ON[M].StageId = S.Id
			-- LEFT JOIN SalesChannel [SC] ON [M].SalesChannelId = SC.Id
			-- LEFT JOIN Industry [I] ON [M].IndustryId = I.Id
			LEFT JOIN [User] [O] ON [M].OwnershipId = O.Id
			-- LEFT JOIN Country [AOD] ON [M].AddressOnContractId = AOD.Id
			-- LEFT JOIN Country [AOP] ON [M].AddressOnPRSId = AOP.Id
			-- LEFT JOIN Country [AOC] ON [M].AddressOnCOIId = AOC.Id
			-- LEFT JOIN ThirdPartyContract [TPC] ON	 [M].ThirdPartyContractId = TPC.Id
			-- LEFT JOIN PCICert [PC] ON [M].PCICertId = PC.Id
			-- LEFT JOIN IntegrationMethod [IM] ON	 [M].IntegrationMethodId = IM.Id
			LEFT JOIN [User] [U] ON M.UserCreatedId = [U].Id

		WHERE 
		(M.Name	LIKE '%'+ @SearchText +'%'
		OR M.CompanyWebsite	LIKE '%'+ @SearchText +'%'
		OR M.OutageNotificationEmail	LIKE '%'+ @SearchText +'%'
		OR M.UpdatesNotes	LIKE '%'+ @SearchText +'%'
		OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
		AND [M].Deleted = 0
	END

GO
/****** Object:  StoredProcedure [dbo].[SUB_ISOPSPDETAILS_UPDATE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_ISOPSPDETAILS_UPDATE]
	-- Add the parameters for the stored procedure here
		 @Id INT
		,@Name NVARCHAR(150)	
		,@CompanyWebsite NVARCHAR(150)	
		,@CompanyTypeId INT
		,@MerchantStatusId INT
		,@ContactPerson  NVARCHAR(150)
		,@ContactEmailAddress NVARCHAR(150)
	-- ,@ApplicationFormStatusId INT
	-- ,@OutageNotificationEmail NVARCHAR(150)
	-- ,@KYBStatusId INT
	-- ,@EUCorp BIT
	-- ,@ContractStatusId INT
	-- ,@LiveInACP BIT
	-- ,@Processing BIT
	-- ,@UpdatesNotes  NVARCHAR(MAX)
	-- ,@CountryId INT
	-- ,@MCCId INT
	-- ,@RegisteredAddress NVARCHAR(150)
	-- ,@SepaEntityAddress NVARCHAR(150)
	-- ,@StageId INT
	-- ,@SalesChannelId INT
	-- ,@IndustryId INT
		,@IntroducedBy NVARCHAR(150)
		,@OwnershipId INT
	-- ,@DocumentsOutstanding NVARCHAR(150)
	-- ,@AddressOnContractId INT
	-- ,@AddressOnPRSId INT
	-- ,@AddressOnCOIId INT
	-- ,@ThirdParty NVARCHAR(150)
	-- ,@ThirdPartyContractId INT
	-- ,@PCICertId INT
	-- ,@IntegrationMethodId INT
	--,@DateCreated DATETIME
	--,@UserCreatedId INT
	--,@Deleted
AS
BEGIN
   UPDATE Merchant SET 
	 Name = @Name 
	,CompanyWebsite = @CompanyWebsite 
	,CompanyTypeId = @CompanyTypeId 
	,MerchantStatusId = @MerchantStatusId 
	,ContactPerson = @ContactPerson 
	,ContactEmailAddress = @ContactEmailAddress 
	-- ,ApplicationFormStatusId = @ApplicationFormStatusId 
	-- ,OutageNotificationEmail = @OutageNotificationEmail 
	-- ,KYBStatusId = @KYBStatusId 
	-- ,EUCorp = @EUCorp 
	-- ,ContractStatusId = @ContractStatusId 
	-- ,LiveInACP = @LiveInACP 
	-- ,Processing = @Processing 
	-- ,UpdatesNotes = @UpdatesNotes  
	-- ,CountryId = @CountryId 
	-- ,MCCId = @MCCId 
	-- ,RegisteredAddress = @RegisteredAddress 
	-- ,SepaEntityAddress = @SepaEntityAddress 
	-- ,StageId = @StageId 
	-- ,SalesChannelId = @SalesChannelId 
	-- ,IndustryId = @IndustryId 
	,IntroducedBy = @IntroducedBy 
	,OwnershipId = @OwnershipId
	-- ,DocumentsOutstanding = @DocumentsOutstanding 
	-- ,AddressOnContractId = @AddressOnContractId 
	-- ,AddressOnPRSId = @AddressOnPRSId 
	-- ,AddressOnCOIId = @AddressOnCOIId 
	-- ,ThirdParty = @ThirdParty 
	-- ,ThirdPartyContractId = @ThirdPartyContractId 
	-- ,PCICertId = @PCICertId 
	-- ,IntegrationMethodId = @IntegrationMethodId 
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[SUB_MERCHANTMIDS_DELETE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_MERCHANTMIDS_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE MerchantMid SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[SUB_MERCHANTMIDS_GET]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_MERCHANTMIDS_GET]
@Id INT
AS
BEGIN
 SELECT 
	 [MM].Id
	,[M].Id AS MerchantId, [M].Name AS MerchantName
	,[M].CountryId AS CountryId, '(' + [CO].Code + ') ' + [CO].[Desc] AS CountryName
	,[M].MCCId AS MCCId, [MC].[Desc] AS MCCDesc
	,[M].MerchantStatusId AS MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc
	,[MM].CurrencyId, [C].Code AS CurrencyCode, [C].[Desc] AS CurrencyDesc
	,[MM].Mid
	,[MM].DateCreated
	,[MM].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM MerchantMid [MM]
		LEFT JOIN Merchant [M] ON [MM].MerchantId = [M].Id
		LEFT JOIN Currency [C] ON [MM].CurrencyId = [C].Id
		LEFT JOIN Country [CO] ON [M].CountryId = [CO].Id
		LEFT JOIN MCC [MC] ON [M].MccId = [MC].Id
		LEFT JOIN MerchantStatus [MS] ON [M].MerchantStatusId = [MS].Id
		LEFT JOIN [User] [U] ON [MM].UserCreatedId = [U].Id
		WHERE 
		 [MM].Id = @Id
		AND [MM].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SUB_MERCHANTMIDS_GETALL]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_MERCHANTMIDS_GETALL]
AS
BEGIN
	 SELECT 
		 [MM].Id
		,[M].Id AS MerchantId, [M].Name AS MerchantName
		,[M].CountryId AS CountryId, '(' + [CO].Code + ') ' + [CO].[Desc] AS CountryName
		,[M].MCCId AS MCCId, [MC].[Desc] AS MCCDesc
		,[M].MerchantStatusId AS MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc
		,[MM].CurrencyId, [C].Code AS CurrencyCode, [C].[Desc] AS CurrencyDesc
		,[MM].Mid
		,[MM].DateCreated
		,[MM].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM MerchantMid [MM]
		LEFT JOIN Merchant [M] ON [MM].MerchantId = [M].Id
		LEFT JOIN Currency [C] ON [MM].CurrencyId = [C].Id
		LEFT JOIN Country [CO] ON [M].CountryId = [CO].Id
		LEFT JOIN MCC [MC] ON [M].MccId = [MC].Id
		LEFT JOIN MerchantStatus [MS] ON [M].MerchantStatusId = [MS].Id
		LEFT JOIN [User] [U] ON [MM].UserCreatedId = [U].Id
		WHERE 
		[MM].Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[SUB_MERCHANTMIDS_INSERT]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_MERCHANTMIDS_INSERT]
	 @MerchantId INT
	,@CurrencyId INT
	,@Mid INT
	,@UserId INT
AS
BEGIN
   INSERT INTO MerchantMid 
	   (MerchantId
	   ,CurrencyId
	   ,Mid
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@MerchantId
	   ,@CurrencyId
	   ,@Mid
	   ,GETDATE()
	   ,@UserId
	   ,0)
END
GO
/****** Object:  StoredProcedure [dbo].[SUB_MERCHANTMIDS_SEARCH]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_MERCHANTMIDS_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [MM].Id
		,[M].Id AS MerchantId, [M].Name AS MerchantName
		,[M].CountryId AS CountryId, '(' + [CO].Code + ') ' + [CO].[Desc] AS CountryName
		,[M].MCCId AS MCCId, [MC].[Desc] AS MCCDesc
		,[M].MerchantStatusId AS MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc
		,[MM].CurrencyId, [C].Code AS CurrencyCode, [C].[Desc] AS CurrencyDesc
		,[MM].Mid
		,[MM].DateCreated
		,[MM].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM MerchantMid [MM]
		LEFT JOIN Merchant [M] ON [MM].MerchantId = [M].Id
		LEFT JOIN Currency [C] ON [MM].CurrencyId = [C].Id
		LEFT JOIN Country [CO] ON [M].CountryId = [CO].Id
		LEFT JOIN MCC [MC] ON [M].MccId = [MC].Id
		LEFT JOIN MerchantStatus [MS] ON [M].MerchantStatusId = [MS].Id
		LEFT JOIN [User] [U] ON [MM].UserCreatedId = [U].Id
    WHERE 
   ([M].Name LIKE '%'+ @SearchText +'%' OR [MM].Mid LIKE '%'+ @SearchText +'%'
	OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [MM].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SUB_MERCHANTMIDS_UPDATE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_MERCHANTMIDS_UPDATE]
	-- Add the parameters for the stored procedure here
	 @Id INT
	,@MerchantId INT
	,@CurrencyId INT
	,@Mid INT
AS
BEGIN
   UPDATE MerchantMid SET 
    MerchantId = @MerchantId
   ,CurrencyId = @CurrencyId
   ,Mid = @Mid
   WHERE Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[SUB_REGISTEREDADDRESS_GET]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_REGISTEREDADDRESS_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [M].Id
		,[M].Name
		,[M].RegisteredAddress
		,[M].SepaEntityAddress
		,[M].DateCreated
		,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Merchant [M], [User] [U]
	WHERE [M].Id = @Id
	AND [M].UserCreatedId = [U].Id
	AND [M].Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[SUB_REGISTEREDADDRESS_GETALL]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_REGISTEREDADDRESS_GETALL]
AS
BEGIN
		SELECT 
		 [M].Id
		,[M].Name
		,[M].RegisteredAddress
		,[M].SepaEntityAddress
		,[M].DateCreated
		,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Merchant [M], [User] [U]
	WHERE 
		[M].UserCreatedId = [U].Id
	AND [M].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SUB_REGISTEREDADDRESS_SEARCH]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_REGISTEREDADDRESS_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
	SELECT 
		 [M].Id
		,[M].Name
		,[M].RegisteredAddress
		,[M].SepaEntityAddress
		,[M].DateCreated
		,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM Merchant [M], [User] [U]
	WHERE 
	([M].RegisteredAddress LIKE '%'+ @SearchText +'%' OR [M].SepaEntityAddress LIKE '%'+ @SearchText +'%'
	 OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
	AND [M].UserCreatedId = [U].Id
	AND [M].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SUB_REGISTEREDADDRESS_UPDATE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_REGISTEREDADDRESS_UPDATE]
	-- Add the parameters for the stored procedure here
	 @Id INT
	,@RegisteredAddress NVARCHAR(250)
	,@SepaEntityAddress NVARCHAR(250)
AS
BEGIN
   UPDATE Merchant SET 
     RegisteredAddress = @RegisteredAddress
	,SepaEntityAddress = @SepaEntityAddress
   WHERE Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[SUB_SALESTRACKER_GET]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_SALESTRACKER_GET]
@Id INT
AS
BEGIN
		SELECT
			 [M].Id
			,[M].Name
			,[M].CompanyWebsite
		-- ,[M].CompanyTypeId, [CT].[Desc] AS CompanyTypeDesc
			,[M].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc
			,[M].ContactPerson
			,[M].ContactEmailAddress
		-- ,[M].ApplicationFormStatusId, [AFS].[Desc] AS ApplicationFormStatusDesc
		-- ,[M].OutageNotificationEmail
		-- ,[M].KYBStatusId, [KS].[Desc] AS KYBStatusDesc
		-- ,[M].EUCorp
		-- ,[M].ContractStatusId, [CS].[Desc] AS ContractStatusDesc
		-- ,[M].LiveInACP
		-- ,[M].Processing
		-- ,[M].UpdatesNotes
		-- ,[M].CountryId, [C].[Desc] AS CountryDesc
		-- ,[M].MCCId, [MC].[Desc] AS MCCDesc
		-- ,[M].RegisteredAddress
		-- ,[M].SepaEntityAddress
			,[M].StageId, [S].[Desc] AS StageDesc
			,[M].SalesChannelId, [SC].[Desc] AS SalesChannelDesc
			,[M].IndustryId, [I].[Desc] AS IndustryDesc
			,[M].IntroducedBy
			,[M].OwnershipId, [O].Firstname AS OwnershipFirstname, [O].Lastname AS OwnershipLastname
			,[M].DocumentsOutstanding
		-- ,[M].AddressOnContractId, [AOD].[Desc] AS AddressOnContractDesc
		-- ,[M].AddressOnPRSId, [AOP].[Desc] AS AddressOnPRSDesc
		-- ,[M].AddressOnCOIId, [AOC].[Desc] AS AddressOnCOIDesc
		-- ,[M].ThirdParty
		-- ,[M].ThirdPartyContractId, [TPC].[Desc] AS ThirdPartyContractDesc
		-- ,[M].PCICertId, [PC].[Desc] AS PCICertDesc
		-- ,[M].IntegrationMethodId, [IM].[Desc] AS IntegrationMethodDesc
		,[M].DateCreated
		,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
		FROM Merchant [M]
		-- LEFT JOIN CompanyType [CT] ON [M].CompanyTypeId = [CT].Id
		LEFT JOIN MerchantStatus [MS] ON [M].CompanyTypeId = [MS].Id
		-- LEFT JOIN ApplicationFormStatus [AFS] ON [M].ApplicationFormStatusId = [AFS].Id
		-- LEFT JOIN KYBStatus [KS] ON [M].KYBStatusId = [KS].Id
		-- LEFT JOIN ContractStatus CS ON [M].ContractStatusId = CS.Id
		-- LEFT JOIN Country [C] ON [M].CountryId = C.Id
		-- LEFT JOIN MCC [MC] ON [M].MCCId = MC.Id
		LEFT JOIN Stage [S] ON[M].StageId = S.Id
		LEFT JOIN SalesChannel [SC] ON [M].SalesChannelId = SC.Id
		LEFT JOIN Industry [I] ON [M].IndustryId = I.Id
		LEFT JOIN [User] [O] ON [M].OwnershipId = O.Id
		-- LEFT JOIN Country [AOD] ON [M].AddressOnContractId = AOD.Id
		-- LEFT JOIN Country [AOP] ON [M].AddressOnPRSId = AOP.Id
		-- LEFT JOIN Country [AOC] ON [M].AddressOnCOIId = AOC.Id
		-- LEFT JOIN ThirdPartyContract [TPC] ON	 [M].ThirdPartyContractId = TPC.Id
		-- LEFT JOIN PCICert [PC] ON [M].PCICertId = PC.Id
		-- LEFT JOIN IntegrationMethod [IM] ON	 [M].IntegrationMethodId = IM.Id
		LEFT JOIN [User] [U] ON M.UserCreatedId = [U].Id

			WHERE [M].Id = @Id
			AND [M].Deleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[SUB_SALESTRACKER_GETALL]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_SALESTRACKER_GETALL]
AS
BEGIN
		SELECT
			 [M].Id
			,[M].Name
			,[M].CompanyWebsite
		-- ,[M].CompanyTypeId, [CT].[Desc] AS CompanyTypeDesc
			,[M].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc
			,[M].ContactPerson
			,[M].ContactEmailAddress
		-- ,[M].ApplicationFormStatusId, [AFS].[Desc] AS ApplicationFormStatusDesc
		-- ,[M].OutageNotificationEmail
		-- ,[M].KYBStatusId, [KS].[Desc] AS KYBStatusDesc
		-- ,[M].EUCorp
		-- ,[M].ContractStatusId, [CS].[Desc] AS ContractStatusDesc
		-- ,[M].LiveInACP
		-- ,[M].Processing
		-- ,[M].UpdatesNotes
		-- ,[M].CountryId, [C].[Desc] AS CountryDesc
		-- ,[M].MCCId, [MC].[Desc] AS MCCDesc
		-- ,[M].RegisteredAddress
		-- ,[M].SepaEntityAddress
			,[M].StageId, [S].[Desc] AS StageDesc
			,[M].SalesChannelId, [SC].[Desc] AS SalesChannelDesc
			,[M].IndustryId, [I].[Desc] AS IndustryDesc
			,[M].IntroducedBy
			,[M].OwnershipId, [O].Firstname AS OwnershipFirstname, [O].Lastname AS OwnershipLastname
			,[M].DocumentsOutstanding
		-- ,[M].AddressOnContractId, [AOD].[Desc] AS AddressOnContractDesc
		-- ,[M].AddressOnPRSId, [AOP].[Desc] AS AddressOnPRSDesc
		-- ,[M].AddressOnCOIId, [AOC].[Desc] AS AddressOnCOIDesc
		-- ,[M].ThirdParty
		-- ,[M].ThirdPartyContractId, [TPC].[Desc] AS ThirdPartyContractDesc
		-- ,[M].PCICertId, [PC].[Desc] AS PCICertDesc
		-- ,[M].IntegrationMethodId, [IM].[Desc] AS IntegrationMethodDesc
		,[M].DateCreated
		,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
		FROM Merchant [M]
		-- LEFT JOIN CompanyType [CT] ON [M].CompanyTypeId = [CT].Id
		LEFT JOIN MerchantStatus [MS] ON [M].CompanyTypeId = [MS].Id
		-- LEFT JOIN ApplicationFormStatus [AFS] ON [M].ApplicationFormStatusId = [AFS].Id
		-- LEFT JOIN KYBStatus [KS] ON [M].KYBStatusId = [KS].Id
		-- LEFT JOIN ContractStatus CS ON [M].ContractStatusId = CS.Id
		-- LEFT JOIN Country [C] ON [M].CountryId = C.Id
		-- LEFT JOIN MCC [MC] ON [M].MCCId = MC.Id
		LEFT JOIN Stage [S] ON[M].StageId = S.Id
		LEFT JOIN SalesChannel [SC] ON [M].SalesChannelId = SC.Id
		LEFT JOIN Industry [I] ON [M].IndustryId = I.Id
		LEFT JOIN [User] [O] ON [M].OwnershipId = O.Id
		-- LEFT JOIN Country [AOD] ON [M].AddressOnContractId = AOD.Id
		-- LEFT JOIN Country [AOP] ON [M].AddressOnPRSId = AOP.Id
		-- LEFT JOIN Country [AOC] ON [M].AddressOnCOIId = AOC.Id
		-- LEFT JOIN ThirdPartyContract [TPC] ON	 [M].ThirdPartyContractId = TPC.Id
		-- LEFT JOIN PCICert [PC] ON [M].PCICertId = PC.Id
		-- LEFT JOIN IntegrationMethod [IM] ON	 [M].IntegrationMethodId = IM.Id
		LEFT JOIN [User] [U] ON M.UserCreatedId = [U].Id

			WHERE 
			[M].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[SUB_SALESTRACKER_SEARCH]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_SALESTRACKER_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
	SELECT
			 [M].Id
			,[M].Name
			,[M].CompanyWebsite
		-- ,[M].CompanyTypeId, [CT].[Desc] AS CompanyTypeDesc
			,[M].MerchantStatusId, [MS].[Desc] AS MerchantStatusDesc
			,[M].ContactPerson
			,[M].ContactEmailAddress
		-- ,[M].ApplicationFormStatusId, [AFS].[Desc] AS ApplicationFormStatusDesc
		-- ,[M].OutageNotificationEmail
		-- ,[M].KYBStatusId, [KS].[Desc] AS KYBStatusDesc
		-- ,[M].EUCorp
		-- ,[M].ContractStatusId, [CS].[Desc] AS ContractStatusDesc
		-- ,[M].LiveInACP
		-- ,[M].Processing
		-- ,[M].UpdatesNotes
		-- ,[M].CountryId, [C].[Desc] AS CountryDesc
		-- ,[M].MCCId, [MC].[Desc] AS MCCDesc
		-- ,[M].RegisteredAddress
		-- ,[M].SepaEntityAddress
			,[M].StageId, [S].[Desc] AS StageDesc
			,[M].SalesChannelId, [SC].[Desc] AS SalesChannelDesc
			,[M].IndustryId, [I].[Desc] AS IndustryDesc
			,[M].IntroducedBy
			,[M].OwnershipId, [O].Firstname AS OwnershipFirstname, [O].Lastname AS OwnershipLastname
			,[M].DocumentsOutstanding
		-- ,[M].AddressOnContractId, [AOD].[Desc] AS AddressOnContractDesc
		-- ,[M].AddressOnPRSId, [AOP].[Desc] AS AddressOnPRSDesc
		-- ,[M].AddressOnCOIId, [AOC].[Desc] AS AddressOnCOIDesc
		-- ,[M].ThirdParty
		-- ,[M].ThirdPartyContractId, [TPC].[Desc] AS ThirdPartyContractDesc
		-- ,[M].PCICertId, [PC].[Desc] AS PCICertDesc
		-- ,[M].IntegrationMethodId, [IM].[Desc] AS IntegrationMethodDesc
		,[M].DateCreated
		,[M].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
	
		FROM Merchant [M]
		-- LEFT JOIN CompanyType [CT] ON [M].CompanyTypeId = [CT].Id
		LEFT JOIN MerchantStatus [MS] ON [M].CompanyTypeId = [MS].Id
		-- LEFT JOIN ApplicationFormStatus [AFS] ON [M].ApplicationFormStatusId = [AFS].Id
		-- LEFT JOIN KYBStatus [KS] ON [M].KYBStatusId = [KS].Id
		-- LEFT JOIN ContractStatus CS ON [M].ContractStatusId = CS.Id
		-- LEFT JOIN Country [C] ON [M].CountryId = C.Id
		-- LEFT JOIN MCC [MC] ON [M].MCCId = MC.Id
		LEFT JOIN Stage [S] ON[M].StageId = S.Id
		LEFT JOIN SalesChannel [SC] ON [M].SalesChannelId = SC.Id
		LEFT JOIN Industry [I] ON [M].IndustryId = I.Id
		LEFT JOIN [User] [O] ON [M].OwnershipId = O.Id
		-- LEFT JOIN Country [AOD] ON [M].AddressOnContractId = AOD.Id
		-- LEFT JOIN Country [AOP] ON [M].AddressOnPRSId = AOP.Id
		-- LEFT JOIN Country [AOC] ON [M].AddressOnCOIId = AOC.Id
		-- LEFT JOIN ThirdPartyContract [TPC] ON	 [M].ThirdPartyContractId = TPC.Id
		-- LEFT JOIN PCICert [PC] ON [M].PCICertId = PC.Id
		-- LEFT JOIN IntegrationMethod [IM] ON	 [M].IntegrationMethodId = IM.Id
		LEFT JOIN [User] [U] ON M.UserCreatedId = [U].Id

		WHERE 
		(M.Name	LIKE '%'+ @SearchText +'%'
		OR M.CompanyWebsite	LIKE '%'+ @SearchText +'%'
		OR M.OutageNotificationEmail	LIKE '%'+ @SearchText +'%'
		OR M.UpdatesNotes	LIKE '%'+ @SearchText +'%'
		OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
		AND [M].Deleted = 0
	END

GO
/****** Object:  StoredProcedure [dbo].[SUB_SALESTRACKER_UPDATE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SUB_SALESTRACKER_UPDATE]
	-- Add the parameters for the stored procedure here
	 @Id INT
	,@Name NVARCHAR(150)	
	,@CompanyWebsite NVARCHAR(150)	
	-- ,@CompanyTypeId INT
	,@MerchantStatusId INT
	,@ContactPerson  NVARCHAR(150)
	,@ContactEmailAddress NVARCHAR(150)
	-- ,@ApplicationFormStatusId INT
	-- ,@OutageNotificationEmail NVARCHAR(150)
	-- ,@KYBStatusId INT
	-- ,@EUCorp BIT
	-- ,@ContractStatusId INT
	-- ,@LiveInACP BIT
	-- ,@Processing BIT
	-- ,@UpdatesNotes  NVARCHAR(MAX)
	-- ,@CountryId INT
	-- ,@MCCId INT
	-- ,@RegisteredAddress NVARCHAR(150)
	-- ,@SepaEntityAddress NVARCHAR(150)
	,@StageId INT
	,@SalesChannelId INT
	,@IndustryId INT
	,@IntroducedBy NVARCHAR(150)
	,@OwnershipId INT
	,@DocumentsOutstanding NVARCHAR(150)
	-- ,@AddressOnContractId INT
	-- ,@AddressOnPRSId INT
	-- ,@AddressOnCOIId INT
	-- ,@ThirdParty NVARCHAR(150)
	-- ,@ThirdPartyContractId INT
	-- ,@PCICertId INT
	-- ,@IntegrationMethodId INT
	--,@DateCreated DATETIME
	--,@UserCreatedId INT
	--,@Deleted
AS
BEGIN
   UPDATE Merchant SET 
	 Name = @Name 
	,CompanyWebsite = @CompanyWebsite 
	-- ,CompanyTypeId = @CompanyTypeId 
	,MerchantStatusId = @MerchantStatusId 
	,ContactPerson = @ContactPerson 
	,ContactEmailAddress = @ContactEmailAddress 
	-- ,ApplicationFormStatusId = @ApplicationFormStatusId 
	-- ,OutageNotificationEmail = @OutageNotificationEmail 
	-- ,KYBStatusId = @KYBStatusId 
	-- ,EUCorp = @EUCorp 
	-- ,ContractStatusId = @ContractStatusId 
	-- ,LiveInACP = @LiveInACP 
	-- ,Processing = @Processing 
	-- ,UpdatesNotes = @UpdatesNotes  
	-- ,CountryId = @CountryId 
	-- ,MCCId = @MCCId 
	-- ,RegisteredAddress = @RegisteredAddress 
	-- ,SepaEntityAddress = @SepaEntityAddress 
	,StageId = @StageId 
	,SalesChannelId = @SalesChannelId 
	,IndustryId = @IndustryId 
	,IntroducedBy = @IntroducedBy 
	,OwnershipId = @OwnershipId
	,DocumentsOutstanding = @DocumentsOutstanding 
	-- ,AddressOnContractId = @AddressOnContractId 
	-- ,AddressOnPRSId = @AddressOnPRSId 
	-- ,AddressOnCOIId = @AddressOnCOIId 
	-- ,ThirdParty = @ThirdParty 
	-- ,ThirdPartyContractId = @ThirdPartyContractId 
	-- ,PCICertId = @PCICertId 
	-- ,IntegrationMethodId = @IntegrationMethodId 
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[THIRDPARTYCONTRACT_DELETE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[THIRDPARTYCONTRACT_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE ThirdPartyContract SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[THIRDPARTYCONTRACT_GET]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[THIRDPARTYCONTRACT_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [TPC].Id
		,[TPC].[Desc]
		,[TPC].DateCreated
		,[TPC].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM ThirdPartyContract [TPC], [User] [U]
	WHERE [TPC].Id = @Id
	AND [TPC].UserCreatedId = [U].Id
	AND [TPC].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[THIRDPARTYCONTRACT_GETALL]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[THIRDPARTYCONTRACT_GETALL]
AS
BEGIN
	SELECT  
		 [TPC].Id
		,[TPC].[Desc]
		,[TPC].DateCreated
		,[TPC].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM ThirdPartyContract [TPC], [User] U
	WHERE 
		[TPC].UserCreatedId = [U].Id
	AND [TPC].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[THIRDPARTYCONTRACT_INSERT]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[THIRDPARTYCONTRACT_INSERT]
	 @Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO ThirdPartyContract 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[THIRDPARTYCONTRACT_SEARCH]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[THIRDPARTYCONTRACT_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [TPC].Id
		,[TPC].[Desc]
		,[TPC].DateCreated
		,[TPC].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM ThirdPartyContract [TPC], [User] [U]
    WHERE 
   ([TPC].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [TPC].UserCreatedId = [U].Id
   AND [TPC].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[THIRDPARTYCONTRACT_UPDATE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[THIRDPARTYCONTRACT_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE ThirdPartyContract SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[USER_DELETE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USER_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE [User] SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[USER_GET]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USER_GET]
@Id INT
AS
BEGIN
SELECT 
		 [US].Id
		,[US].Firstname
		,[US].Lastname
		,[US].Username
		--,[US].PasswordHash
		,[US].UserRoleId, [UR].[Desc] AS UserRoleDesc
		,[US].DateCreated
		,[US].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM [User] [US], [User] [U], [UserRole] [UR]
	WHERE [US].Id = @Id
	AND [US].UserCreatedId = [U].Id
	AND [US].UserRoleId = [UR].Id
	AND [US].Deleted = 0

	EXEC	[SCREEN_GETBYUSER]	@Id
END
GO
/****** Object:  StoredProcedure [dbo].[USER_GETALL]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USER_GETALL]
AS
BEGIN
	 SELECT 
		 [US].Id
		,[US].Firstname
		,[US].Lastname
		,[US].Username
		--,[US].PasswordHash
		,[US].UserRoleId, [UR].[Desc] AS UserRoleDesc
		,[US].DateCreated
		,[US].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM [User] [US], [User] [U], [UserRole] [UR]
    WHERE 
	   [US].UserCreatedId = [U].Id
   AND [US].UserRoleId = [UR].Id
   AND [US].Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[USER_INSERT]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USER_INSERT]
	 @Firstname NVARCHAR(250)
	,@Lastname NVARCHAR(250)
	,@Username NVARCHAR(250)
	,@PasswordHash NVARCHAR(MAX)
	,@UserRoleId INT
	,@UserCreatedId INT
AS
BEGIN
   INSERT INTO [User]
	   (Firstname
	   ,Lastname
	   ,Username
	   ,PasswordHash
	   ,UserRoleId
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Firstname
	   ,@Lastname
	   ,@Username
	   ,@PasswordHash
	   ,@UserRoleId
	   ,GETDATE()
	   ,@UserCreatedId
	   ,0)
END
SELECT CONVERT(INT, SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[USER_LOGIN]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USER_LOGIN]
@Username NVARCHAR(50),
@PasswordHash NVARCHAR(50)
AS
BEGIN
 
    DECLARE @userId INT;

SET	@userId = 
	(SELECT	 
		 [US].Id
		--,[US].Firstname
		--,[US].Lastname
		--,[US].Username
		----,[US].PasswordHash
		--,[US].UserRoleId, [UR].[Desc] AS UserRoleDesc
		--,[US].DateCreated
		--,[US].UserCreatedId
		--,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM [User] [US]
    WHERE [US].Username = @Username AND [US].PasswordHash = @PasswordHash
   --AND [US].UserCreatedId = [U].Id
   --AND [US].UserRoleId = [UR].Id
   AND [US].Deleted = 0)
   
   EXEC USER_GET @userId;
END

GO
/****** Object:  StoredProcedure [dbo].[USER_SEARCH]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USER_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [US].Id
		,[US].Firstname
		,[US].Lastname
		,[US].Username
		--,[US].PasswordHash
		,[US].UserRoleId, [UR].[Desc] AS UserRoleDesc
		,[US].DateCreated
		,[US].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM [User] [US], [User] [U], [UserRole] [UR]
    WHERE 
   ([US].Firstname LIKE '%'+ @SearchText +'%' OR [US].Lastname LIKE '%'+ @SearchText +'%' OR [US].Username LIKE '%'+ @SearchText +'%'
   OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [US].UserCreatedId = [U].Id
   AND [US].UserRoleId = [UR].Id
   AND [US].Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[USER_UPDATE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USER_UPDATE]
	-- Add the parameters for the stored procedure here
	 @Id INT
	,@Firstname NVARCHAR(250)
	,@Lastname NVARCHAR(250)
	,@Username NVARCHAR(250)
	--	,@PasswordHash NVARCHAR(MAX)
	,@UserRoleId INT
AS
BEGIN
   UPDATE [User] SET 
    Firstname = @Firstname
   ,Lastname = @Lastname
   ,Username = @Username
   --	,PasswordHash = @PasswordHash
   ,UserRoleId = @UserRoleId
   WHERE Id = @Id
END



GO
/****** Object:  StoredProcedure [dbo].[USER_UPDATEPASSWORD]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USER_UPDATEPASSWORD]
	 @Id INT
	 ,@PasswordHash NVARCHAR(MAX)
AS
BEGIN
   UPDATE [User] SET 
   PasswordHash = @PasswordHash
   WHERE Id = @Id
END



GO
/****** Object:  StoredProcedure [dbo].[USERROLE_DELETE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USERROLE_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT
AS
BEGIN
   UPDATE UserRole SET Deleted = 1
   WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[USERROLE_GET]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USERROLE_GET]
@Id INT
AS
BEGIN
	SELECT 
		 [US].Id
		,[US].[Desc]
		,[US].DateCreated
		,[US].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname 
		FROM UserRole [US], [User] [U]
	WHERE [US].Id = @Id
	AND [US].UserCreatedId = [U].Id
	AND [US].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[USERROLE_GETALL]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USERROLE_GETALL]
AS
BEGIN
	SELECT  
		 [UR].Id
		,[UR].[Desc]
		,[UR].DateCreated
		,[UR].UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM UserRole [UR], [User] U
	WHERE 
		[UR].UserCreatedId = [U].Id
	AND [UR].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[USERROLE_INSERT]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USERROLE_INSERT]
	 @Desc NVARCHAR(50)
	,@UserId INT
AS
BEGIN
   INSERT INTO UserRole 
	   ([Desc]
	   ,DateCreated
	   ,UserCreatedId
	   ,Deleted)
	VALUES
	   (@Desc
	   ,GETDATE()
	   ,@UserId
	   ,0)
END

GO
/****** Object:  StoredProcedure [dbo].[USERROLE_SEARCH]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USERROLE_SEARCH]
	-- Add the parameters for the stored procedure here
	@SearchText NVARCHAR(50)
AS
BEGIN
   SELECT 
		 [UR].Id
		,[UR].[Desc]
		,[UR].DateCreated
		,[UR].UserCreatedId
		,[U].Id AS UserCreatedId, [U].Username AS UserCreatedUsername, '(' + [U].Username + ') ' + [U].Firstname + ' ' + [U].Lastname AS UserCreatedFirstnameLastname
		FROM UserRole [UR], [User] [U]
    WHERE 
   ([UR].[Desc] LIKE '%'+ @SearchText +'%' OR [U].Firstname LIKE '%'+ @SearchText +'%' OR [U].Lastname LIKE '%'+ @SearchText +'%')
   AND [UR].UserCreatedId = [U].Id
   AND [UR].Deleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[USERROLE_UPDATE]    Script Date: 30/12/2016 13:49:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USERROLE_UPDATE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Desc NVARCHAR(50)
AS
BEGIN
   UPDATE UserRole SET 
   [Desc] = @Desc
   WHERE Id = @Id
END


GO
USE [master]
GO
ALTER DATABASE [InformationManagement] SET  READ_WRITE 
GO
