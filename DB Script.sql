USE [chikun1]
GO
/****** Object:  Table [dbo].[subjectmaster]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjectmaster](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[tid] [int] NULL,
	[sname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[technologymaster]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[technologymaster](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[tname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usermaster]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usermaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[username] [varchar](50) NULL,
	[userphoneno] [varchar](50) NULL,
	[useremail] [varchar](50) NULL,
	[userphoto] [varchar](50) NULL,
	[usertechnology] [int] NULL,
	[usersubject] [int] NULL,
	[status] [varchar](50) NULL,
 CONSTRAINT [PK__usermast__3213E83F8F5C1FB4] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.subjectmaster.sname, dbo.technologymaster.tname, dbo.usermaster.id, dbo.usermaster.userid, dbo.usermaster.password, dbo.usermaster.username, dbo.usermaster.userphoneno, dbo.usermaster.useremail, 
                         dbo.usermaster.userphoto, dbo.usermaster.status, dbo.usermaster.usersubject
FROM            dbo.subjectmaster INNER JOIN
                         dbo.technologymaster ON dbo.subjectmaster.tid = dbo.technologymaster.tid INNER JOIN
                         dbo.usermaster ON dbo.technologymaster.tid = dbo.usermaster.usertechnology AND dbo.subjectmaster.sid = dbo.usermaster.usersubject
GO
/****** Object:  Table [dbo].[account]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[Account_id] [int] IDENTITY(1,1) NOT NULL,
	[branch_id] [int] NOT NULL,
	[accounttype_id] [int] NULL,
	[GlOb_Type] [nvarchar](3) NULL,
	[GlOb_date] [date] NULL,
	[GlOb_Amount] [decimal](16, 2) NULL,
	[Gl_Status] [nvarchar](10) NULL,
	[Lad_Percentage] [decimal](16, 2) NULL,
	[Penal_Rate] [decimal](16, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accountType]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accountType](
	[AccountType_id] [int] IDENTITY(1,1) NOT NULL,
	[GlGroup_code] [nvarchar](3) NOT NULL,
	[gl_code] [nvarchar](4) NOT NULL,
	[gl_nature] [nvarchar](20) NULL,
	[GL_NAME] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[akb_USER]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[akb_USER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_ID] [varchar](10) NOT NULL,
	[USER_NAME] [varchar](35) NOT NULL,
	[USER_PASSWORD] [varchar](10) NOT NULL,
	[FROM_DATE] [date] NULL,
	[TO_DATE] [date] NULL,
	[USER_STATUS] [varchar](1) NULL,
	[ROLE_ID] [int] NOT NULL,
	[USER_EMAIL] [varchar](100) NULL,
	[USER_MOBILE] [varchar](20) NULL,
	[BRANCH_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[branch_details]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branch_details](
	[branch_id] [int] IDENTITY(1,1) NOT NULL,
	[Branch_Name] [varchar](150) NULL,
	[Branch_address] [varchar](200) NULL,
	[photosignature] [varchar](200) NULL,
 CONSTRAINT [PK_branch_details] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Connenction_master]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Connenction_master](
	[connenction_id] [int] IDENTITY(1,1) NOT NULL,
	[connenction_speed] [varchar](50) NULL,
	[provider_id] [int] NULL,
	[fees] [int] NULL,
 CONSTRAINT [pk3] PRIMARY KEY CLUSTERED 
(
	[connenction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[CUSTOMER_id] [int] IDENTITY(1,1) NOT NULL,
	[NAME_INITIALS] [nvarchar](100) NULL,
	[CUSTOMER_NAME] [nvarchar](100) NOT NULL,
	[FATHER_HUSBAND] [nvarchar](100) NULL,
	[MOTHER_WIFE] [nvarchar](100) NULL,
	[B_REL_1] [nvarchar](100) NULL,
	[B_REL_2] [nvarchar](100) NULL,
	[CASTE] [nvarchar](100) NULL,
	[SEX] [nvarchar](100) NULL,
	[SENIOR_CITIZEN] [nvarchar](100) NULL,
	[OCCUPATION] [nvarchar](100) NULL,
	[CUR_ADDRESS_1] [nvarchar](100) NULL,
	[CUR_ADDRESS_2] [nvarchar](100) NULL,
	[CUR_ADDRESS_3] [nvarchar](100) NULL,
	[PIN] [nvarchar](100) NULL,
	[PHONE_NO_1] [nvarchar](100) NULL,
	[PHONE_NO_2] [nvarchar](100) NULL,
	[PER_ADDRESS_1] [nvarchar](100) NULL,
	[PER_ADDRESS_2] [nvarchar](100) NULL,
	[PER_ADDRESS_3] [nvarchar](100) NULL,
	[PER_PIN] [nvarchar](100) NULL,
	[PER_PHN_1] [nvarchar](100) NULL,
	[PER_PHN_2] [nvarchar](100) NULL,
	[PAN_NO] [nvarchar](100) NULL,
	[DOB] [nvarchar](100) NULL,
	[DOM] [nvarchar](100) NULL,
	[IS_STAFF] [nvarchar](100) NULL,
	[IS_MINOR] [nvarchar](100) NULL,
	[DATE_ENROLLED] [nvarchar](100) NULL,
	[INTRODUCER_CUSTOMER_id] [int] NULL,
	[LEGAL_HAIR_NAME] [nvarchar](100) NULL,
	[QUALIFICATION] [nvarchar](100) NULL,
	[OCCUPATION_OTHER] [nvarchar](100) NULL,
	[SALARIED_WITH] [nvarchar](100) NULL,
	[SALARIED_WITH_OTHER] [nvarchar](100) NULL,
	[NATURE_OF_BUS] [nvarchar](100) NULL,
	[OTHER_NATURE_NAME] [nvarchar](100) NULL,
	[DATE_OF_INCORPORATION] [nvarchar](100) NULL,
	[TYPE_OF_COMP] [nvarchar](100) NULL,
	[TYPE_OF_COMP_OTHER] [nvarchar](100) NULL,
	[SELF_EMP_PROFESSIONAL] [nvarchar](100) NULL,
	[SELF_EMP_PROFESSIONAL_OTHER] [nvarchar](100) NULL,
	[SOURCE_OF_FUNDS] [nvarchar](100) NULL,
	[OTHER_SOURCE] [nvarchar](100) NULL,
	[ANNUAL_INCOME_1] [nvarchar](100) NULL,
	[ANNUAL_INCOME_2] [nvarchar](100) NULL,
	[RESIDENCE_TYPE] [nvarchar](100) NULL,
	[aadharno] [nvarchar](100) NULL,
	[idproof] [nvarchar](100) NULL,
	[addressproof] [nvarchar](100) NULL,
	[PHOTOSIGNATURE] [nvarchar](100) NULL,
	[CREATED_BY] [nvarchar](100) NULL,
	[PASSED_BY] [nvarchar](100) NULL,
	[AGE] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CUSTOMER_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designation_Leave]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation_Leave](
	[designatin_id] [int] IDENTITY(1,1) NOT NULL,
	[Designation_NAme] [varchar](50) NULL,
 CONSTRAINT [PK_Designation_Leave] PRIMARY KEY CLUSTERED 
(
	[designatin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Leave]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Leave](
	[Emp_ID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Code] [int] NOT NULL,
	[LeaveTyp_id] [int] NULL,
	[Documents] [varchar](40) NULL,
	[Leave_day] [int] NULL,
	[Reason] [varchar](50) NULL,
	[FROM_DATE] [date] NULL,
	[TO_DATE] [date] NULL,
 CONSTRAINT [PK_Employee_Leave_1] PRIMARY KEY CLUSTERED 
(
	[Emp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Record_L]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Record_L](
	[Emp_Code] [int] NULL,
	[Emp_Name] [varchar](50) NULL,
	[DesignationName] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[glgroup]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[glgroup](
	[GlGroup_id] [int] IDENTITY(1,1) NOT NULL,
	[grouptype_id] [int] NOT NULL,
	[GlGroup_code] [nvarchar](3) NOT NULL,
	[GlGroup_name] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grouptype]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grouptype](
	[Grouptype_id] [int] IDENTITY(1,1) NOT NULL,
	[grouptype_name] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leave_Record]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leave_Record](
	[id] [nchar](10) NOT NULL,
	[designatin_id] [int] NULL,
	[CL] [int] NULL,
	[ML] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leave_Type]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leave_Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Leave_Type] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_SC_ClubMaster]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_SC_ClubMaster](
	[ClubId] [int] IDENTITY(1,1) NOT NULL,
	[ClubName] [varchar](100) NULL,
 CONSTRAINT [PK_M_SC_ClubMaster] PRIMARY KEY CLUSTERED 
(
	[ClubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_SC_SportsMaster]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_SC_SportsMaster](
	[SportsId] [int] IDENTITY(1,1) NOT NULL,
	[ClubId] [int] NULL,
	[SportsName] [varchar](100) NULL,
	[Fees] [decimal](18, 2) NULL,
	[CreatedOn] [date] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [date] NULL,
	[DeletedFlag] [bit] NULL,
 CONSTRAINT [PK__M_SC_Spo__E1741EC1389D2BBC] PRIMARY KEY CLUSTERED 
(
	[SportsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_SMS_SUCESSMESSAGE]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_SMS_SUCESSMESSAGE](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[message] [varchar](50) NOT NULL,
 CONSTRAINT [PK_M_SMS_SUCESSMESSAGE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[master_user]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[master_user](
	[id] [varchar](20) NULL,
	[password] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provider_master]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provider_master](
	[provider_id] [int] IDENTITY(1,1) NOT NULL,
	[provider_name] [varchar](100) NULL,
 CONSTRAINT [pk4] PRIMARY KEY CLUSTERED 
(
	[provider_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[questionmaster]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questionmaster](
	[qid] [int] IDENTITY(1,1) NOT NULL,
	[tid] [int] NULL,
	[sid] [int] NULL,
	[qst] [varchar](max) NULL,
	[option1] [varchar](max) NULL,
	[option2] [varchar](max) NULL,
	[option3] [varchar](max) NULL,
	[option4] [varchar](max) NULL,
	[answer] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[qid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registration_details]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registration_details](
	[registration_id] [int] IDENTITY(1,1) NOT NULL,
	[applicant_name] [varchar](100) NOT NULL,
	[email_id] [varchar](100) NULL,
	[mobile_no] [varchar](12) NULL,
	[gender] [char](4) NULL,
	[dob] [datetime] NULL,
	[image_path] [varchar](max) NULL,
	[provider_id] [int] NULL,
	[connenction_id] [int] NULL,
	[registrationdate] [datetime] NULL,
	[fees] [int] NULL,
 CONSTRAINT [pk2] PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[resultdetails]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resultdetails](
	[slno] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[doe] [date] NULL,
	[qid] [int] NULL,
	[optchoose] [varchar](100) NULL,
	[rstatus] [varchar](100) NULL,
	[dstatus] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[slno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolType]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolType](
	[SchoolTypeID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolTypeName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SchoolTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SERVER_DATE]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SERVER_DATE](
	[Server_id] [int] IDENTITY(1,1) NOT NULL,
	[SERVER_DATE] [date] NOT NULL,
	[STATUS] [varchar](1) NOT NULL,
	[BRANCH_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[setupmaster]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[setupmaster](
	[noofqst] [int] NULL,
	[timeinminutes] [time](7) NULL,
	[rules] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STUDENT_TABLE]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STUDENT_TABLE](
	[STUD_ID] [int] IDENTITY(1,1) NOT NULL,
	[STUD_NAME] [varchar](50) NULL,
	[TOTAL_MARK] [int] NULL,
	[OBTAINED_MARK] [int] NULL,
	[PERCENTAGE_MARK] [decimal](8, 2) NULL,
	[Grade] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_SC_RegistrationMaster]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_SC_RegistrationMaster](
	[RegistrationId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicantName] [varchar](100) NULL,
	[EmailId] [varchar](100) NULL,
	[MobileNo] [varchar](100) NULL,
	[Gender] [varchar](100) NULL,
	[DOB] [date] NULL,
	[ImagePath] [varchar](100) NULL,
	[SportsId] [int] NULL,
	[ClubId] [int] NULL,
	[CreatedOn] [date] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [date] NULL,
	[DeletedFlag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RegistrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_accountType]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_accountType](
	[AccountType_id] [int] IDENTITY(1,1) NOT NULL,
	[GlGroup_code] [nvarchar](3) NOT NULL,
	[gl_code] [nvarchar](4) NOT NULL,
	[gl_nature] [nvarchar](20) NULL,
	[GL_NAME] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountType_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Customer]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Customer](
	[CUSTOMER_id] [int] IDENTITY(1,1) NOT NULL,
	[NAME_INITIALS] [nvarchar](100) NULL,
	[CUSTOMER_NAME] [nvarchar](100) NOT NULL,
	[FATHER_HUSBAND] [nvarchar](100) NULL,
	[MOTHER_WIFE] [nvarchar](100) NULL,
	[B_REL_1] [nvarchar](100) NULL,
	[B_REL_2] [nvarchar](100) NULL,
	[CASTE] [nvarchar](100) NULL,
	[SEX] [nvarchar](100) NULL,
	[SENIOR_CITIZEN] [nvarchar](100) NULL,
	[OCCUPATION] [nvarchar](100) NULL,
	[CUR_ADDRESS_1] [nvarchar](100) NULL,
	[CUR_ADDRESS_2] [nvarchar](100) NULL,
	[CUR_ADDRESS_3] [nvarchar](100) NULL,
	[PIN] [nvarchar](100) NULL,
	[PHONE_NO_1] [nvarchar](100) NULL,
	[PHONE_NO_2] [nvarchar](100) NULL,
	[PER_ADDRESS_1] [nvarchar](100) NULL,
	[PER_ADDRESS_2] [nvarchar](100) NULL,
	[PER_ADDRESS_3] [nvarchar](100) NULL,
	[PER_PIN] [nvarchar](100) NULL,
	[PER_PHN_1] [nvarchar](100) NULL,
	[PER_PHN_2] [nvarchar](100) NULL,
	[PAN_NO] [nvarchar](100) NULL,
	[DOB] [nvarchar](100) NULL,
	[DOM] [nvarchar](100) NULL,
	[IS_STAFF] [nvarchar](100) NULL,
	[IS_MINOR] [nvarchar](100) NULL,
	[DATE_ENROLLED] [nvarchar](100) NULL,
	[INTRODUCER_CUSTOMER_id] [int] NULL,
	[LEGAL_HAIR_NAME] [nvarchar](100) NULL,
	[QUALIFICATION] [nvarchar](100) NULL,
	[OCCUPATION_OTHER] [nvarchar](100) NULL,
	[SALARIED_WITH] [nvarchar](100) NULL,
	[SALARIED_WITH_OTHER] [nvarchar](100) NULL,
	[NATURE_OF_BUS] [nvarchar](100) NULL,
	[OTHER_NATURE_NAME] [nvarchar](100) NULL,
	[DATE_OF_INCORPORATION] [nvarchar](100) NULL,
	[TYPE_OF_COMP] [nvarchar](100) NULL,
	[TYPE_OF_COMP_OTHER] [nvarchar](100) NULL,
	[SELF_EMP_PROFESSIONAL] [nvarchar](100) NULL,
	[SELF_EMP_PROFESSIONAL_OTHER] [nvarchar](100) NULL,
	[SOURCE_OF_FUNDS] [nvarchar](100) NULL,
	[OTHER_SOURCE] [nvarchar](100) NULL,
	[ANNUAL_INCOME_1] [nvarchar](100) NULL,
	[ANNUAL_INCOME_2] [nvarchar](100) NULL,
	[RESIDENCE_TYPE] [nvarchar](100) NULL,
	[aadharno] [nvarchar](100) NULL,
	[idproof] [nvarchar](100) NULL,
	[addressproof] [nvarchar](100) NULL,
	[PHOTOSIGNATURE] [nvarchar](100) NULL,
	[CREATED_BY] [nvarchar](100) NULL,
	[PASSED_BY] [nvarchar](100) NULL,
	[AGE] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_glgroup]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_glgroup](
	[GlGroup_id] [int] IDENTITY(1,1) NOT NULL,
	[grouptype_id] [int] NOT NULL,
	[GlGroup_code] [nvarchar](3) NOT NULL,
	[GlGroup_name] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblDistrict]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDistrict](
	[DistrictID] [int] IDENTITY(1,1) NOT NULL,
	[StateID] [int] NULL,
	[DistrictName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblSchoolRegistration]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblSchoolRegistration](
	[SchoolID] [int] IDENTITY(1,1) NOT NULL,
	[StateID] [int] NULL,
	[DistrictID] [int] NULL,
	[SchoolName] [varchar](100) NULL,
	[SchoolTypeID] [int] NULL,
	[SchoolLevel] [varchar](50) NULL,
	[SchoolPhoto] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblState]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblState](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER_ROLES]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_ROLES](
	[ROLE_ID] [int] IDENTITY(1,1) NOT NULL,
	[ROLE_NAME] [varchar](50) NOT NULL,
	[ALLOW_GL] [varchar](1) NULL,
	[ALLOW_CC] [varchar](1) NULL,
	[ALLOW_EC] [varchar](1) NULL,
	[ALLOW_AC] [varchar](1) NULL,
	[ALLOW_SPCL] [varchar](1) NULL,
	[ALLOW_NEW_DEPO] [varchar](1) NULL,
	[ALLOW_NEW_LOAN] [varchar](1) NULL,
	[ALLOW_INT_PARA] [varchar](1) NULL,
	[ALLOW_VCH] [varchar](1) NULL,
	[ALLOW_DISBURSE] [varchar](1) NULL,
	[ALLOW_LN_REPAY] [varchar](1) NULL,
	[ALLOW_VCH_AP] [varchar](1) NULL,
	[ALLOW_DEPO_AP] [varchar](1) NULL,
	[ALLOW_LN_AP] [varchar](1) NULL,
	[ALLOW_CR_USR] [varchar](1) NULL,
	[ALLOW_BNK_INFO] [varchar](1) NULL,
	[ALLOW_RENEW_EXP] [varchar](1) NULL,
	[ALLOW_VCH_EDIT] [varchar](1) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[akb_USER] ON 

INSERT [dbo].[akb_USER] ([ID], [USER_ID], [USER_NAME], [USER_PASSWORD], [FROM_DATE], [TO_DATE], [USER_STATUS], [ROLE_ID], [USER_EMAIL], [USER_MOBILE], [BRANCH_id]) VALUES (2, N'chikun', N'chikun', N'chikun', CAST(N'2022-12-20' AS Date), CAST(N'2022-12-20' AS Date), N'A', 1, N'sushantasenapati718@gmail.com', N'8658193889', 1)
SET IDENTITY_INSERT [dbo].[akb_USER] OFF
GO
SET IDENTITY_INSERT [dbo].[Connenction_master] ON 

INSERT [dbo].[Connenction_master] ([connenction_id], [connenction_speed], [provider_id], [fees]) VALUES (1, N'ear phone', 1, 1500)
INSERT [dbo].[Connenction_master] ([connenction_id], [connenction_speed], [provider_id], [fees]) VALUES (2, N'Music Box', 2, 2500)
SET IDENTITY_INSERT [dbo].[Connenction_master] OFF
GO
SET IDENTITY_INSERT [dbo].[Designation_Leave] ON 

INSERT [dbo].[Designation_Leave] ([designatin_id], [Designation_NAme]) VALUES (1, N'MGR')
INSERT [dbo].[Designation_Leave] ([designatin_id], [Designation_NAme]) VALUES (2, N'SSD')
INSERT [dbo].[Designation_Leave] ([designatin_id], [Designation_NAme]) VALUES (3, N'SD')
SET IDENTITY_INSERT [dbo].[Designation_Leave] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee_Leave] ON 

INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (26, 101, 2, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (27, 101, 2, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (28, 101, 2, NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (30, 101, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (31, 101, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (32, 101, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (33, 101, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (34, 101, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (35, 101, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (36, 101, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (37, 103, 1, NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (38, 103, 1, NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (39, 103, 1, NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (40, 103, 1, NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (41, 103, 1, NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (42, 103, 1, NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (43, 103, 2, NULL, 4, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (44, 103, 2, NULL, 4, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (45, 103, 2, NULL, 4, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (46, 102, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (47, 102, 1, NULL, 1, N'gbfvdcs', NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (48, 102, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (49, 102, 1, N'prodimage/chiikkk.jfif', 1, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (50, 102, 2, N'No Document', 1, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (51, 102, 1, N'prodimage/abc.pdf', 1, NULL, NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (52, 102, 2, N'prodimage/NoPhoto.pdf', 1, N'efwf', NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (57, 102, 2, N'prodimage/NoPhoto.pdf', 1, N'de2', NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (58, 102, 1, N'prodimage/abc.pdf', 1, N'xsx', NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (59, 102, 2, N'prodimage/NoPhoto.pdf', 1, N'df', NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (60, 102, 2, N'prodimage/NoPhoto.pdf', 1, N'zz', NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (61, 102, 1, N'prodimage/phone.jpeg', 1, N'dd', NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (62, 102, 1, N'prodimage/phone.jpeg', 1, N'kk', NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (63, 101, 1, N'prodimage/abc.pdf', 1, N'sw', NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (64, 102, 1, N'prodimage/phone.jpeg', 1, N'dw', NULL, NULL)
INSERT [dbo].[Employee_Leave] ([Emp_ID], [Emp_Code], [LeaveTyp_id], [Documents], [Leave_day], [Reason], [FROM_DATE], [TO_DATE]) VALUES (69, 102, 1, N'prodimage/phone.jpeg', 1, N'ss', CAST(N'2023-03-26' AS Date), CAST(N'2023-03-26' AS Date))
SET IDENTITY_INSERT [dbo].[Employee_Leave] OFF
GO
INSERT [dbo].[Employee_Record_L] ([Emp_Code], [Emp_Name], [DesignationName]) VALUES (101, N'Amon Sahu', N'SD')
INSERT [dbo].[Employee_Record_L] ([Emp_Code], [Emp_Name], [DesignationName]) VALUES (102, N'Rahul', N'SSD')
INSERT [dbo].[Employee_Record_L] ([Emp_Code], [Emp_Name], [DesignationName]) VALUES (103, N'Susu', N'MGR')
GO
INSERT [dbo].[Leave_Record] ([id], [designatin_id], [CL], [ML]) VALUES (N'1         ', 1, 12, 12)
INSERT [dbo].[Leave_Record] ([id], [designatin_id], [CL], [ML]) VALUES (N'2         ', 2, 10, 10)
INSERT [dbo].[Leave_Record] ([id], [designatin_id], [CL], [ML]) VALUES (N'3         ', 3, 8, 8)
GO
SET IDENTITY_INSERT [dbo].[Leave_Type] ON 

INSERT [dbo].[Leave_Type] ([id], [Leave_Type]) VALUES (1, N'Medical')
INSERT [dbo].[Leave_Type] ([id], [Leave_Type]) VALUES (2, N'Casual')
SET IDENTITY_INSERT [dbo].[Leave_Type] OFF
GO
SET IDENTITY_INSERT [dbo].[M_SC_ClubMaster] ON 

INSERT [dbo].[M_SC_ClubMaster] ([ClubId], [ClubName]) VALUES (1, N'Royal Club')
INSERT [dbo].[M_SC_ClubMaster] ([ClubId], [ClubName]) VALUES (2, N'Shimba Club')
INSERT [dbo].[M_SC_ClubMaster] ([ClubId], [ClubName]) VALUES (3, N'Tiger Club')
INSERT [dbo].[M_SC_ClubMaster] ([ClubId], [ClubName]) VALUES (4, N'Loyal Club')
SET IDENTITY_INSERT [dbo].[M_SC_ClubMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[M_SC_SportsMaster] ON 

INSERT [dbo].[M_SC_SportsMaster] ([SportsId], [ClubId], [SportsName], [Fees], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (1, 1, N'Badminton', CAST(2500.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[M_SC_SportsMaster] ([SportsId], [ClubId], [SportsName], [Fees], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (2, 1, N'Ludo', CAST(1500.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[M_SC_SportsMaster] ([SportsId], [ClubId], [SportsName], [Fees], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (3, 2, N'Kho-Kho', CAST(3000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[M_SC_SportsMaster] ([SportsId], [ClubId], [SportsName], [Fees], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (4, 2, N'Kabbadi', CAST(2500.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[M_SC_SportsMaster] ([SportsId], [ClubId], [SportsName], [Fees], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (5, 3, N'Cricket', CAST(3500.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[M_SC_SportsMaster] ([SportsId], [ClubId], [SportsName], [Fees], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (6, 3, N'Hockey', CAST(3000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[M_SC_SportsMaster] ([SportsId], [ClubId], [SportsName], [Fees], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (7, 4, N'Badminton', CAST(2500.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[M_SC_SportsMaster] ([SportsId], [ClubId], [SportsName], [Fees], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (8, 4, N'Caram', CAST(1500.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[M_SC_SportsMaster] OFF
GO
INSERT [dbo].[master_user] ([id], [password]) VALUES (N'chikun', N'chikun')
GO
SET IDENTITY_INSERT [dbo].[provider_master] ON 

INSERT [dbo].[provider_master] ([provider_id], [provider_name]) VALUES (1, N'Boat')
INSERT [dbo].[provider_master] ([provider_id], [provider_name]) VALUES (2, N'JBL')
SET IDENTITY_INSERT [dbo].[provider_master] OFF
GO
SET IDENTITY_INSERT [dbo].[registration_details] ON 

INSERT [dbo].[registration_details] ([registration_id], [applicant_name], [email_id], [mobile_no], [gender], [dob], [image_path], [provider_id], [connenction_id], [registrationdate], [fees]) VALUES (1, N'sushanta', N'sushanta', N'kjhgvcxz', N'F   ', CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'Project20221226103916765.png', 1, 1, CAST(N'2022-12-26T10:39:16.800' AS DateTime), NULL)
INSERT [dbo].[registration_details] ([registration_id], [applicant_name], [email_id], [mobile_no], [gender], [dob], [image_path], [provider_id], [connenction_id], [registrationdate], [fees]) VALUES (2, N'pragyaqn', N'psn@gmail.com', N'9937643088', NULL, CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'Project20221226120206319.jpg', 2, 2, CAST(N'2022-12-26T12:02:06.363' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[registration_details] OFF
GO
SET IDENTITY_INSERT [dbo].[SchoolType] ON 

INSERT [dbo].[SchoolType] ([SchoolTypeID], [SchoolTypeName]) VALUES (1, N'Goverment')
INSERT [dbo].[SchoolType] ([SchoolTypeID], [SchoolTypeName]) VALUES (2, N'Private')
SET IDENTITY_INSERT [dbo].[SchoolType] OFF
GO
SET IDENTITY_INSERT [dbo].[STUDENT_TABLE] ON 

INSERT [dbo].[STUDENT_TABLE] ([STUD_ID], [STUD_NAME], [TOTAL_MARK], [OBTAINED_MARK], [PERCENTAGE_MARK], [Grade]) VALUES (1, N'Rama Chandra Sahoo', 600, 554, CAST(92.33 AS Decimal(8, 2)), N'A')
INSERT [dbo].[STUDENT_TABLE] ([STUD_ID], [STUD_NAME], [TOTAL_MARK], [OBTAINED_MARK], [PERCENTAGE_MARK], [Grade]) VALUES (2, N'Gopal Behera', 600, 532, CAST(88.67 AS Decimal(8, 2)), N'A')
INSERT [dbo].[STUDENT_TABLE] ([STUD_ID], [STUD_NAME], [TOTAL_MARK], [OBTAINED_MARK], [PERCENTAGE_MARK], [Grade]) VALUES (3, N'Suresh Routray', 600, 500, CAST(83.33 AS Decimal(8, 2)), N'A')
INSERT [dbo].[STUDENT_TABLE] ([STUD_ID], [STUD_NAME], [TOTAL_MARK], [OBTAINED_MARK], [PERCENTAGE_MARK], [Grade]) VALUES (4, N'Sahil Khan', 600, 498, CAST(83.00 AS Decimal(8, 2)), N'A')
INSERT [dbo].[STUDENT_TABLE] ([STUD_ID], [STUD_NAME], [TOTAL_MARK], [OBTAINED_MARK], [PERCENTAGE_MARK], [Grade]) VALUES (5, N'Amresh Kumar Pradhan', 600, 487, CAST(81.17 AS Decimal(8, 2)), N'A')
INSERT [dbo].[STUDENT_TABLE] ([STUD_ID], [STUD_NAME], [TOTAL_MARK], [OBTAINED_MARK], [PERCENTAGE_MARK], [Grade]) VALUES (6, N'Laxmipriya Jena', 600, 467, CAST(77.83 AS Decimal(8, 2)), N'B')
INSERT [dbo].[STUDENT_TABLE] ([STUD_ID], [STUD_NAME], [TOTAL_MARK], [OBTAINED_MARK], [PERCENTAGE_MARK], [Grade]) VALUES (7, N'Manisa Kara', 600, 432, CAST(72.00 AS Decimal(8, 2)), N'B')
INSERT [dbo].[STUDENT_TABLE] ([STUD_ID], [STUD_NAME], [TOTAL_MARK], [OBTAINED_MARK], [PERCENTAGE_MARK], [Grade]) VALUES (8, N'Hara Pattanaik', 600, 432, CAST(72.00 AS Decimal(8, 2)), N'B')
INSERT [dbo].[STUDENT_TABLE] ([STUD_ID], [STUD_NAME], [TOTAL_MARK], [OBTAINED_MARK], [PERCENTAGE_MARK], [Grade]) VALUES (9, N'Girija Nandan Behera', 600, 410, CAST(68.33 AS Decimal(8, 2)), N'B')
INSERT [dbo].[STUDENT_TABLE] ([STUD_ID], [STUD_NAME], [TOTAL_MARK], [OBTAINED_MARK], [PERCENTAGE_MARK], [Grade]) VALUES (10, N'Kamalesh Nagarkoti', 600, 350, CAST(58.33 AS Decimal(8, 2)), N'C')
SET IDENTITY_INSERT [dbo].[STUDENT_TABLE] OFF
GO
SET IDENTITY_INSERT [dbo].[subjectmaster] ON 

INSERT [dbo].[subjectmaster] ([sid], [tid], [sname]) VALUES (1, 1, N'java')
INSERT [dbo].[subjectmaster] ([sid], [tid], [sname]) VALUES (2, 1, N'Core')
SET IDENTITY_INSERT [dbo].[subjectmaster] OFF
GO
SET IDENTITY_INSERT [dbo].[T_SC_RegistrationMaster] ON 

INSERT [dbo].[T_SC_RegistrationMaster] ([RegistrationId], [ApplicantName], [EmailId], [MobileNo], [Gender], [DOB], [ImagePath], [SportsId], [ClubId], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (1, N'erftyujik', N'wertyui@gmail.com', N'6789455467', N'Female', CAST(N'1997-10-01' AS Date), NULL, 0, 0, CAST(N'2023-02-25' AS Date), NULL, NULL, CAST(N'2023-02-25' AS Date), 0)
INSERT [dbo].[T_SC_RegistrationMaster] ([RegistrationId], [ApplicantName], [EmailId], [MobileNo], [Gender], [DOB], [ImagePath], [SportsId], [ClubId], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (2, N'Shusxx', N'Shusanta@gmail.com', N'1123456799', N'Male', CAST(N'1998-09-12' AS Date), N'Project20230317123143417.jpg', 1, 1, CAST(N'2023-02-25' AS Date), NULL, NULL, CAST(N'2023-02-25' AS Date), 1)
INSERT [dbo].[T_SC_RegistrationMaster] ([RegistrationId], [ApplicantName], [EmailId], [MobileNo], [Gender], [DOB], [ImagePath], [SportsId], [ClubId], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (3, N'pragyan', N'pragyan@gmail.com', N'1234567890', N'Female', CAST(N'1997-10-01' AS Date), NULL, 1, 1, CAST(N'2023-02-25' AS Date), NULL, NULL, CAST(N'2023-02-25' AS Date), 1)
INSERT [dbo].[T_SC_RegistrationMaster] ([RegistrationId], [ApplicantName], [EmailId], [MobileNo], [Gender], [DOB], [ImagePath], [SportsId], [ClubId], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (4, N'Ankit Biswal', N'ankit@gmail.com', N'1234567890', N'Male', CAST(N'2000-06-20' AS Date), N'AMIT.JPG', 3, 2, CAST(N'2023-02-25' AS Date), NULL, NULL, CAST(N'2023-02-25' AS Date), 1)
INSERT [dbo].[T_SC_RegistrationMaster] ([RegistrationId], [ApplicantName], [EmailId], [MobileNo], [Gender], [DOB], [ImagePath], [SportsId], [ClubId], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (5, N'Shusant Singh Rajput', N'sus@gmail.com', N'1234567890', N'Male', CAST(N'2022-11-29' AS Date), NULL, 1, 1, CAST(N'2023-02-25' AS Date), NULL, NULL, CAST(N'2023-02-25' AS Date), 1)
INSERT [dbo].[T_SC_RegistrationMaster] ([RegistrationId], [ApplicantName], [EmailId], [MobileNo], [Gender], [DOB], [ImagePath], [SportsId], [ClubId], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (6, N'sdgsdfgh', N'sdfghj@gmail.com', N'1234567890', N'Male', CAST(N'2023-01-31' AS Date), NULL, 6, 3, CAST(N'2023-02-25' AS Date), NULL, NULL, CAST(N'2023-02-25' AS Date), 1)
INSERT [dbo].[T_SC_RegistrationMaster] ([RegistrationId], [ApplicantName], [EmailId], [MobileNo], [Gender], [DOB], [ImagePath], [SportsId], [ClubId], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (7, N'Shusant Singh Rajput', N'Rajput@gmail.com', N'1234567890', N'Male', CAST(N'2009-02-17' AS Date), N'Project20230317123157440.jpg', 6, 3, CAST(N'2023-02-25' AS Date), NULL, NULL, CAST(N'2023-02-25' AS Date), 1)
INSERT [dbo].[T_SC_RegistrationMaster] ([RegistrationId], [ApplicantName], [EmailId], [MobileNo], [Gender], [DOB], [ImagePath], [SportsId], [ClubId], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (8, N'Shusant Singh Rajput', N'Rajput@gmail.com', N'1234567890', N'Male', CAST(N'2009-02-17' AS Date), NULL, 6, 3, CAST(N'2023-02-25' AS Date), NULL, NULL, CAST(N'2023-02-25' AS Date), 1)
INSERT [dbo].[T_SC_RegistrationMaster] ([RegistrationId], [ApplicantName], [EmailId], [MobileNo], [Gender], [DOB], [ImagePath], [SportsId], [ClubId], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (9, N'dffghhj', N'asdfghj@gmail.com', N'1234567890', N'Female', CAST(N'2000-02-09' AS Date), NULL, 2, 1, CAST(N'2023-02-25' AS Date), NULL, NULL, CAST(N'2023-02-25' AS Date), 1)
INSERT [dbo].[T_SC_RegistrationMaster] ([RegistrationId], [ApplicantName], [EmailId], [MobileNo], [Gender], [DOB], [ImagePath], [SportsId], [ClubId], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (10, N'Pragyan', N'pragyan@gmail.com', N'9937643088', N'Female', CAST(N'1997-10-01' AS Date), N'Project20230321121820002.JPG', 3, 2, CAST(N'2023-03-15' AS Date), NULL, NULL, CAST(N'2023-03-15' AS Date), 0)
INSERT [dbo].[T_SC_RegistrationMaster] ([RegistrationId], [ApplicantName], [EmailId], [MobileNo], [Gender], [DOB], [ImagePath], [SportsId], [ClubId], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (11, N'Ankit Biswal', N'ankit@gmail.com', N'1234567890', N'Male', CAST(N'2000-06-07' AS Date), N'Project20230321111349421.jpg', 3, 2, CAST(N'2023-03-17' AS Date), NULL, NULL, CAST(N'2023-03-17' AS Date), 0)
INSERT [dbo].[T_SC_RegistrationMaster] ([RegistrationId], [ApplicantName], [EmailId], [MobileNo], [Gender], [DOB], [ImagePath], [SportsId], [ClubId], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (12, N'Pinky', N'pinky@gmail.com', N'9954326790', N'Female', CAST(N'1999-07-06' AS Date), N'Project20230317121337459.jpg', 7, 4, CAST(N'2023-03-17' AS Date), NULL, NULL, CAST(N'2023-03-17' AS Date), 1)
INSERT [dbo].[T_SC_RegistrationMaster] ([RegistrationId], [ApplicantName], [EmailId], [MobileNo], [Gender], [DOB], [ImagePath], [SportsId], [ClubId], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (13, N'ertyui', N'asdfghj@gmail.com', N'9876543210', N'Female', CAST(N'2004-03-02' AS Date), N'Project20230317124114521.JPG', 4, 2, CAST(N'2023-03-17' AS Date), NULL, NULL, CAST(N'2023-03-17' AS Date), 1)
INSERT [dbo].[T_SC_RegistrationMaster] ([RegistrationId], [ApplicantName], [EmailId], [MobileNo], [Gender], [DOB], [ImagePath], [SportsId], [ClubId], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (14, N'qwertyuio', N'sdfghjk@gmail.com', N'1234567890', N'Male', CAST(N'1989-03-02' AS Date), N'Project20230317125525845.JPG', 6, 3, CAST(N'2023-03-17' AS Date), NULL, NULL, CAST(N'2023-03-17' AS Date), 1)
INSERT [dbo].[T_SC_RegistrationMaster] ([RegistrationId], [ApplicantName], [EmailId], [MobileNo], [Gender], [DOB], [ImagePath], [SportsId], [ClubId], [CreatedOn], [CreatedBy], [UpdatedBy], [UpdatedOn], [DeletedFlag]) VALUES (15, N'Sita', N'sita@gmail.com', N'9963782963', N'Female', CAST(N'2000-06-06' AS Date), N'Project20230321121936023.jpg', 4, 2, CAST(N'2023-03-21' AS Date), NULL, NULL, CAST(N'2023-03-21' AS Date), 0)
SET IDENTITY_INSERT [dbo].[T_SC_RegistrationMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[TblDistrict] ON 

INSERT [dbo].[TblDistrict] ([DistrictID], [StateID], [DistrictName]) VALUES (1, 1, N'Cuttack')
INSERT [dbo].[TblDistrict] ([DistrictID], [StateID], [DistrictName]) VALUES (2, 1, N'Khurda')
INSERT [dbo].[TblDistrict] ([DistrictID], [StateID], [DistrictName]) VALUES (3, 1, N'Jajpur')
INSERT [dbo].[TblDistrict] ([DistrictID], [StateID], [DistrictName]) VALUES (4, 2, N'Hugil')
INSERT [dbo].[TblDistrict] ([DistrictID], [StateID], [DistrictName]) VALUES (5, 2, N'Malda')
INSERT [dbo].[TblDistrict] ([DistrictID], [StateID], [DistrictName]) VALUES (6, 2, N'Kolkata')
INSERT [dbo].[TblDistrict] ([DistrictID], [StateID], [DistrictName]) VALUES (7, 3, N'Guntur')
INSERT [dbo].[TblDistrict] ([DistrictID], [StateID], [DistrictName]) VALUES (8, 3, N'Vizag')
INSERT [dbo].[TblDistrict] ([DistrictID], [StateID], [DistrictName]) VALUES (9, 3, N'Araku')
INSERT [dbo].[TblDistrict] ([DistrictID], [StateID], [DistrictName]) VALUES (10, 4, N'Bhopal')
INSERT [dbo].[TblDistrict] ([DistrictID], [StateID], [DistrictName]) VALUES (11, 4, N'Umaria')
INSERT [dbo].[TblDistrict] ([DistrictID], [StateID], [DistrictName]) VALUES (12, 5, N'Chapra')
INSERT [dbo].[TblDistrict] ([DistrictID], [StateID], [DistrictName]) VALUES (13, 5, N'Arwal')
INSERT [dbo].[TblDistrict] ([DistrictID], [StateID], [DistrictName]) VALUES (14, 5, N'Bhojpur')
INSERT [dbo].[TblDistrict] ([DistrictID], [StateID], [DistrictName]) VALUES (15, 5, N'Nalanda')
SET IDENTITY_INSERT [dbo].[TblDistrict] OFF
GO
SET IDENTITY_INSERT [dbo].[TblSchoolRegistration] ON 

INSERT [dbo].[TblSchoolRegistration] ([SchoolID], [StateID], [DistrictID], [SchoolName], [SchoolTypeID], [SchoolLevel], [SchoolPhoto]) VALUES (1, 1, 1, N'kuliana', 1, N'10th,12th', N'Photo/pro1.jpg')
INSERT [dbo].[TblSchoolRegistration] ([SchoolID], [StateID], [DistrictID], [SchoolName], [SchoolTypeID], [SchoolLevel], [SchoolPhoto]) VALUES (3, 3, 8, N'kuliana', 1, N'10th', N'Photo/png1.png')
SET IDENTITY_INSERT [dbo].[TblSchoolRegistration] OFF
GO
SET IDENTITY_INSERT [dbo].[TblState] ON 

INSERT [dbo].[TblState] ([StateID], [StateName]) VALUES (1, N'Odisha')
INSERT [dbo].[TblState] ([StateID], [StateName]) VALUES (2, N'West Bengal')
INSERT [dbo].[TblState] ([StateID], [StateName]) VALUES (3, N'Andra Pradesh')
INSERT [dbo].[TblState] ([StateID], [StateName]) VALUES (4, N'Madhya Pradesh')
INSERT [dbo].[TblState] ([StateID], [StateName]) VALUES (5, N'Bihar')
SET IDENTITY_INSERT [dbo].[TblState] OFF
GO
SET IDENTITY_INSERT [dbo].[technologymaster] ON 

INSERT [dbo].[technologymaster] ([tid], [tname]) VALUES (1, N'Dot net')
INSERT [dbo].[technologymaster] ([tid], [tname]) VALUES (2, N'java')
SET IDENTITY_INSERT [dbo].[technologymaster] OFF
GO
SET IDENTITY_INSERT [dbo].[usermaster] ON 

INSERT [dbo].[usermaster] ([id], [userid], [password], [username], [userphoneno], [useremail], [userphoto], [usertechnology], [usersubject], [status]) VALUES (1, N'admin', N'admin', N'admin', N'8658193889', N'sushantasenapati718', N'p.jpg', 1, 1, N'APPROVED')
INSERT [dbo].[usermaster] ([id], [userid], [password], [username], [userphoneno], [useremail], [userphoto], [usertechnology], [usersubject], [status]) VALUES (2, N'sushanta', N'sushanta', N'sushanta', N'8658193889', N'sushantasenapati715@gmail.com', NULL, 1, 2, N'APPROVED')
SET IDENTITY_INSERT [dbo].[usermaster] OFF
GO
ALTER TABLE [dbo].[M_SC_SportsMaster] ADD  CONSTRAINT [DF_M_SC_SportsMaster_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[M_SC_SportsMaster] ADD  CONSTRAINT [DF_M_SC_SportsMaster_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[M_SC_SportsMaster] ADD  CONSTRAINT [DF_M_SC_SportsMaster_DeletedFlag]  DEFAULT ((0)) FOR [DeletedFlag]
GO
ALTER TABLE [dbo].[T_SC_RegistrationMaster] ADD  CONSTRAINT [DF_T_SC_RegistrationMaster_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[T_SC_RegistrationMaster] ADD  CONSTRAINT [DF_T_SC_RegistrationMaster_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[T_SC_RegistrationMaster] ADD  CONSTRAINT [DF_T_SC_RegistrationMaster_DeletedFlag]  DEFAULT ((0)) FOR [DeletedFlag]
GO
/****** Object:  StoredProcedure [dbo].[Emp_Leave]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Emp_Leave]
(@Emp_Code int=0,
@LeaveTyp_id int=0,
@Documents varchar(50)=null,
@Leave_day int=0,
@FROM_DATE date=null,
@TO_DATE date=null,
@Reason varchar(50)=null,
@mode varchar(30),

@PMSGOUT varchar(100)=null output
)
as
begin
    IF(@mode='BindEmployee')
		BEGIN
		   select Emp_Name,DesignationName from Employee_Record_L where Emp_Code=@Emp_Code 
		end
	else IF(@mode='BindLeave')
		BEGIN
		   select * from Leave_Type 
		end
	else IF(@mode='LeaveStatus')
    BEGIN
		declare @desig varchar(20)
		declare @desigid int
		select @desig=DesignationName from Employee_Record_L where Emp_Code=@Emp_Code
		select @desigid=designatin_id from Designation_Leave where Designation_NAme=@desig

		select (select ML from Leave_Record where designatin_id=@desigid)-
		isnull(sum(Leave_day),0) as restML,(select (select CL from Leave_Record where designatin_id=@desigid)-
		isnull(sum(Leave_day),0) as resetCL from Employee_Leave where LeaveTyp_id=2 and Emp_Code=@Emp_Code) as restCL from Employee_Leave where LeaveTyp_id=1 and Emp_Code=@Emp_Code 
	end
	else IF(@mode='insert')
	select * from Employee_Record_L
		BEGIN
		   declare @designam varchar(20)
		   declare @desigidd int
		   select @designam=DesignationName from Employee_Record_L where Emp_Code=@Emp_Code
		   select @desigidd=designatin_id from Designation_Leave where Designation_NAme=@designam

		   IF(@designam<>'MGR')
						BEGIN
									IF(@LeaveTyp_id=1)
									BEGIN
											IF(DATEDIFF(day, @FROM_DATE, @TO_DATE)+1 > 1)
												BEGIN
													SET @PMSGOUT='2'
												END
											ELSE
												BEGIN

												declare @desig1 varchar(20)
												declare @desigid1 int
												declare @limit int
												select @desig1=DesignationName from Employee_Record_L where Emp_Code=@Emp_Code
												select @desigid1=designatin_id from Designation_Leave where Designation_NAme=@desig1
												select @limit=(select ML from Leave_Record where designatin_id=@desigid1)-
											    isnull(	sum(Leave_day),0) from Employee_Leave where LeaveTyp_id=1 and Emp_Code=@Emp_Code 
													if(@limit-DATEDIFF(day, @FROM_DATE, @TO_DATE)>0)
														begin
															INSERT INTO Employee_Leave(Emp_Code, LeaveTyp_id, Documents, Leave_day, Reason,FROM_DATE,TO_DATE)
															VALUES(@Emp_Code,@LeaveTyp_id,@Documents,DATEDIFF(day, @FROM_DATE, @TO_DATE)+1,@Reason,@FROM_DATE,@TO_DATE)
															SET @PMSGOUT='1'
														end
													else
														  begin
														     SET @PMSGOUT='3'
														  end
												END
									END
									ELSE IF(@LeaveTyp_id=2)
										BEGIN
												IF(DATEDIFF(day, @FROM_DATE, @TO_DATE)+1 > 3)
													BEGIN
														SET @PMSGOUT='2'
													END
												ELSE
													BEGIN

													declare @desig2 varchar(20)
												    declare @desigid2 int
												    declare @limit1 int
												    select @desig2=DesignationName from Employee_Record_L where Emp_Code=@Emp_Code
												    select @desigid2=designatin_id from Designation_Leave where Designation_NAme=@desig2
												    select @limit1=(select CL from Leave_Record where designatin_id=@desigid2)-
											        isnull(	sum(Leave_day),0) from Employee_Leave where LeaveTyp_id=2 and Emp_Code=@Emp_Code 
													    if(@limit1-DATEDIFF(day, @FROM_DATE, @TO_DATE)>0)
															begin
																INSERT INTO Employee_Leave(Emp_Code, LeaveTyp_id, Documents, Leave_day, Reason,FROM_DATE,TO_DATE)
																VALUES(@Emp_Code,@LeaveTyp_id,@Documents,DATEDIFF(day, @FROM_DATE, @TO_DATE)+1,@Reason,@FROM_DATE,@TO_DATE)
																SET @PMSGOUT='1'
															end
														else
															  begin
																 SET @PMSGOUT='3'
															  end
													END
				
										END
								

					   END


			ELSE


				   BEGIN
							   BEGIN
										IF(@LeaveTyp_id=1)
		     								 BEGIN
																IF(DATEDIFF(day, @FROM_DATE, @TO_DATE)+1 > 2)
																	BEGIN
																		SET @PMSGOUT='2'
																	END
																ELSE
																	BEGIN

																	declare @desig3 varchar(20)
												                    declare @desigid3 int
												                    declare @limit3 int
												                    select @desig3=DesignationName from Employee_Record_L where Emp_Code=@Emp_Code
												                    select @desigid3=designatin_id from Designation_Leave where Designation_NAme=@desig3
																	select @limit3=(select ML from Leave_Record where designatin_id=@desigid3)-
																	isnull(	sum(Leave_day),0) from Employee_Leave where LeaveTyp_id=1 and Emp_Code=@Emp_Code 
												
																		if(@limit3-DATEDIFF(day, @FROM_DATE, @TO_DATE)>0)
																			begin
																				INSERT INTO Employee_Leave(Emp_Code, LeaveTyp_id, Documents, Leave_day, Reason,FROM_DATE,TO_DATE)
																				VALUES(@Emp_Code,@LeaveTyp_id,@Documents,DATEDIFF(day, @FROM_DATE, @TO_DATE)+1,@Reason,@FROM_DATE,@TO_DATE)
																				SET @PMSGOUT='1'
																			end
																		else
																			  begin
																				 SET @PMSGOUT='3'
																			  end

																	END
											END
														ELSE IF(@LeaveTyp_id=2)
														BEGIN
																IF(DATEDIFF(day, @FROM_DATE, @TO_DATE)+1 > 4)
																	BEGIN
																		SET @PMSGOUT='2'
																	END
																ELSE
																	BEGIN

																		declare @desig4 varchar(20)
																		declare @desigid4 int
																		declare @limit4 int
																		select @desig4=DesignationName from Employee_Record_L where Emp_Code=@Emp_Code
																		select @desigid4=designatin_id from Designation_Leave where Designation_NAme=@desig4
																		select @limit4=(select CL from Leave_Record where designatin_id=@desigid4)-
																		isnull(	sum(Leave_day),0) from Employee_Leave where LeaveTyp_id=2 and Emp_Code=@Emp_Code 
												
																		if(@limit4-DATEDIFF(day, @FROM_DATE, @TO_DATE)>0)
																			begin
																				INSERT INTO Employee_Leave(Emp_Code, LeaveTyp_id, Documents, Leave_day, Reason,FROM_DATE,TO_DATE)
																				VALUES(@Emp_Code,@LeaveTyp_id,@Documents,DATEDIFF(day, @FROM_DATE, @TO_DATE)+1,@Reason,@FROM_DATE,@TO_DATE)
																				SET @PMSGOUT='1'
																		    end
																		else
																			  begin
																				 SET @PMSGOUT='3'
																			  end

																	END
														END
								 
										END
								

							 END
			        
				   END
		

end
	
GO
/****** Object:  StoredProcedure [dbo].[Provider_Connenction_info]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Provider_Connenction_info]
(@action char(4),@pid int =0)
as
begin
if @action='gp'
Begin
BEGIN TRY
select * from provider_master
END TRY
BEGIN CATCH
  insert into  error_log values(
    ERROR_NUMBER(),
    ERROR_STATE(),
    ERROR_SEVERITY(),
    ERROR_PROCEDURE(),
    ERROR_LINE(),
    ERROR_MESSAGE(),GETDATE())
END CATCH;
end
else if @action='gc'
Begin
BEGIN TRY
select * from Connenction_master where provider_id=@pid
END TRY
BEGIN CATCH
  insert into  error_log values(
    ERROR_NUMBER(),
    ERROR_STATE(),
    ERROR_SEVERITY(),
    ERROR_PROCEDURE(),
    ERROR_LINE(),
    ERROR_MESSAGE(),GETDATE())
END CATCH;
end
else if @action='gf'
Begin
BEGIN TRY
select * from Connenction_master where connenction_id=@pid
END TRY
BEGIN CATCH
  insert into  error_log values(
    ERROR_NUMBER(),
    ERROR_STATE(),
    ERROR_SEVERITY(),
    ERROR_PROCEDURE(),
    ERROR_LINE(),
    ERROR_MESSAGE(),GETDATE())
END CATCH;
end
end
GO
/****** Object:  StoredProcedure [dbo].[Registration_config]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Registration_config](
@action char(4),
@applicant_name varchar(100)='',
@email_id varchar(100)='',
@mobile_no varchar(12)='',
@gender char(4)='',
@dob datetime='',
@image_path varchar(max)='',
@provider_id int=0,
@connenction_id int=0

)
as
begin
if @action='adr'
Begin
BEGIN TRY
insert into registration_details(applicant_name,email_id,mobile_no,gender,dob,image_path,provider_id ,connenction_id,registrationdate) values(@applicant_name,@email_id,@mobile_no,@gender,@dob,@image_path,@provider_id ,@connenction_id,getdate())
END TRY
BEGIN CATCH
  insert into  error_log values(
    ERROR_NUMBER(),
    ERROR_STATE(),
    ERROR_SEVERITY(),
    ERROR_PROCEDURE(),
    ERROR_LINE(),
    ERROR_MESSAGE(),GETDATE())
END CATCH;
end
else if @action='gdr'
Begin
BEGIN TRY
select  registration_details.registration_id,
registration_details.applicant_name ,
registration_details.email_id ,
registration_details.mobile_no ,
registration_details.gender ,
registration_details.dob ,
registration_details.registrationdate ,
registration_details.image_path ,
registration_details.provider_id ,
registration_details.connenction_id ,provider_master.provider_name,Connenction_master.connenction_speed,DATEDIFF(year,registration_details.dob,getdate()) as age,Connenction_master.fees from registration_details  join Connenction_master on registration_details.connenction_id=Connenction_master.connenction_id
join provider_master on registration_details.provider_id=provider_master.provider_id
WHERE CASE WHEN @provider_id IN (0) THEN @provider_id ELSE registration_details.provider_id END =@provider_id
AND CASE WHEN @connenction_id IN (0) THEN @connenction_id ELSE registration_details.connenction_id END =@connenction_id

END TRY
BEGIN CATCH
  insert into  error_log values(
    ERROR_NUMBER(),
    ERROR_STATE(),
    ERROR_SEVERITY(),
    ERROR_PROCEDURE(),
    ERROR_LINE(),
    ERROR_MESSAGE(),GETDATE())
END CATCH;
end
else if @action='ge'
Begin
BEGIN TRY
select r.provider_id,
max(c.connenction_speed) as connenction_speed,
max(c.fees) as fees,
COUNT(p.provider_name) as noofregd from registration_details r
join Connenction_master c on r.connenction_id=c.connenction_id
join provider_master p on r.provider_id=p.provider_id
group by r.provider_id
END TRY
BEGIN CATCH
  insert into  error_log values(
    ERROR_NUMBER(),
    ERROR_STATE(),
    ERROR_SEVERITY(),
    ERROR_PROCEDURE(),
    ERROR_LINE(),
    ERROR_MESSAGE(),GETDATE())
END CATCH;
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_accounttype_op]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_accounttype_op]
	(@AccountType_id int=0,
	@GlGroup_code nvarchar(3)=null,
	@gl_code nvarchar(4)=null,
	@gl_nature nvarchar(20)=null,
	@GL_NAME nvarchar(100)=null,
	@GlGroup_name nvarchar(20)=null,
	@action char(1),
    @PMSGOUT varchar(100)=null output
	)
	as
	begin
	if(@action='I')
	insert into tbl_accountType values(@GlGroup_code,@gl_code,@gl_nature,@GL_NAME)
	else if(@action='U')
	update tbl_accountType set GlGroup_code=@GlGroup_code,gl_code=@gl_code,gl_nature=@gl_nature,
	GL_NAME=@GL_NAME where AccountType_id=@AccountType_id
	else if(@action='D')
	delete from  tbl_accountType where AccountType_id=@AccountType_id
	else if(@action='S')
	select * from tbl_accountType where AccountType_id=@AccountType_id
	else if(@action='A')
	select * from tbl_accountType tbc inner join  tbl_glgroup tbg on tbc.GlGroup_code=tbg.GlGroup_code
	else if(@action='M')
	select * from tbl_glgroup;
	else if(@action='P')
    declare @GLCount int;declare @PMSGOUTp int;declare @count int;
	   select @PMSGOUTp=@GlGroup_code/100 from tbl_glgroup;	
	    set @PMSGOUT=(@PMSGOUTp*1000)+1
	if exists(select gl_code from tbl_accountType where GlGroup_code=@GlGroup_code)
			begin		
			   select @count= gl_code from tbl_accountType where GlGroup_code=@GlGroup_code
			   select @PMSGOUTp=@count+1
				set @PMSGOUT=@PMSGOUTp
			end	
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_onlineexamsystemadmin]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_onlineexamsystemadmin]
(
@id int =0,
@userid varchar(50)='',
@password varchar(50)='',
@username varchar(50)='',
@userphoneno varchar(50)='',
@useremail varchar(50)='',
@usertechnology varchar(50)='',
@usersubject varchar(50)='',
@status varchar(50)='Pending',
@tid int =0,
@tname varchar(50)='',
@sid int=0 ,
@sname varchar(50)='',
@qid int =0,
@qst varchar(max)='',
@option1 varchar(max)='',
@option2 varchar(max)='',
@option3 varchar(max)='',
@option4 varchar(max)='',
@answer varchar(max)='',
@doe date='',
@optchoose varchar(100)='',
@rstatus varchar(100)='',
@dstatus varchar(100)='',
@noofqst int=0,
@timeinminutes time='',
@rules varchar(50)='',
@action varchar(50)
)
as
begin
if(@action='UserInsert')
insert into usermaster(userid,username,password,userphoneno,useremail,status,usertechnology,usersubject )values
(@userid,@username,@password,@userphoneno,@useremail,'Pending',@usertechnology,@usersubject )
else if( @action='UpdateChange')
	begin
	  --check password is avaial or not then update details
		if @password=''
		begin
	    update usermaster set username=@username,userphoneno=@userphoneno,useremail=@useremail where userid=@userid
		end
		else
		begin
		-- finally udate password here
		update usermaster set password=@password where userid=@userid
		end
	end
else if (@action='TechnologyInsert')
begin
insert into technologymaster (tname) values(@tname);
end
	else if (@action='TechnologyUpdate')
begin
update technologymaster set tname=@tname where tid=@tid;
end
else if (@action='TechnologySelect')
begin
select * from technologymaster
end
else if (@action='TechnologySelectByTechnologyId')
begin
select * from technologymaster where tid=@tid
end
else if (@action='TechnologyDelete')
begin
delete from technologymaster  where tid=@tid;
end
else if (@action='SubjectSelect')
begin 
select *  from subjectmaster s left join technologymaster t on s.tid=t.tid
end
else if (@action='SubjectSelectBySubjectId')
begin 
select *  from subjectmaster  where sid=@sid
end
else if (@action='SubjectInsert')
begin
insert into subjectmaster (tid,sname) values(@tid,@sname);
end
else if (@action='SubjectUpdate')
begin
update subjectmaster set tid=@tid,sname=@sname where sid=@sid;
end
else if (@action='SubjectDelete')
begin
delete from subjectmaster where sid=@sid;
end
else if (@action='SubjectSelectByTechId')
begin 
select * from subjectmaster where tid=@tid
end
else if (@action='QuestionSelect')
begin 
select *  from questionmaster q join subjectmaster s on q.sid=s.sid join technologymaster t on t.tid=q.tid
end
else if (@action='QuestionSelectByQuestionId')
begin 
select *  from questionmaster q join subjectmaster s on q.sid=s.sid join technologymaster t on t.tid=q.tid where qid=@qid
end
else if (@action='QuestionInsert')
begin
insert into questionmaster(tid, sid, qst, option1, option2, option3, option4, answer)
values(@tid, @sid, @qst, @option1, @option2, @option3, @option4, @answer);
end
else if (@action='QuestionUpdate')
begin
update questionmaster set tid=@tid,sid=@sid,qst=@qst,option1=@option1,option2=@option2,
option3=@option3,option4=@option4,answer=@answer where qid=@qid;
end
else if (@action='QuestionDelete')
begin
delete from questionmaster where qid=@qid;
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_onlineexamsystemuser]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_onlineexamsystemuser]
(
@id int =0,
@userid varchar(50)='',
@password varchar(50)='',
@username varchar(50)='',
@userphoneno varchar(50)='',
@useremail varchar(50)='',
@usertechnology varchar(50)='',
@usersubject varchar(50)='',
@status varchar(50)='Pending',
@tid int =0,
@tname varchar(50)='',
@sid int=0 ,
@sname varchar(50)='',
@qid int =0,
@option1 varchar(max)='',
@option2 varchar(max)='',
@option3 varchar(max)='',
@option4 varchar(max)='',
@answer varchar(max)='',
@doe date='',
@optchoose varchar(100)='',
@rstatus varchar(100)='',
@dstatus varchar(100)='',
@noofqst int=0,
@timeinminutes time='',
@rules varchar(50)='',
@action varchar(50)
)
as
begin
if(@action='UserInsert')
insert into usermaster(userid,username,password,userphoneno,useremail,status,usertechnology,usersubject )values
(@userid,@username,@password,@userphoneno,@useremail,'Pending',@usertechnology,@usersubject )
else if( @action='UpdateChange')
	begin
	  --check password is avaial or not then update details
		if @password=''
		begin
	    update usermaster set username=@username,userphoneno=@userphoneno,useremail=@useremail where userid=@userid
		end
		else
		begin
		-- finally udate password here
		update usermaster set password=@password where userid=@userid
		end
	end
else if (@action='UserSelect')
    begin
	if @Password =''
	select id, userid, password, username, userphoneno, useremail, userphoto,s.sname as usersubjectname,t.tname as usertechnologyname,usertechnology, usersubject, status from usermaster u join technologymaster t on t.tid=u.usertechnology join subjectmaster s on s.sid=u.usersubject where userid=@userid
	else
					 SELECT        dbo.subjectmaster.sname, dbo.technologymaster.tname, dbo.usermaster.id, dbo.usermaster.userid, dbo.usermaster.password, dbo.usermaster.username, dbo.usermaster.userphoneno, dbo.usermaster.useremail, 
                         dbo.usermaster.userphoto, dbo.usermaster.status, dbo.usermaster.usersubject
FROM            dbo.subjectmaster INNER JOIN
                         dbo.technologymaster ON dbo.subjectmaster.tid = dbo.technologymaster.tid INNER JOIN
                         dbo.usermaster ON dbo.technologymaster.tid = dbo.usermaster.usertechnology AND dbo.subjectmaster.sid = dbo.usermaster.usersubject where userid=@userid
						 and password=@password and status='APPROVED'
						 end
	
	
else if (@action='PendingUserSelect')
begin
select id, userid, password, username, userphoneno, useremail, userphoto,s.sname as usersubjectname,t.tname as usertechnologyname,usertechnology, usersubject, status from usermaster u join technologymaster t on t.tid=u.usertechnology join subjectmaster s on s.sid=u.usertechnology
where   status='PENDING'
end
else if (@action='UserApprove')
	update usermaster set status='APPROVED' where id=@id  
else if (@action='QuestionSelectByUId')
begin 
select *  from questionmaster q join subjectmaster s on q.sid=s.sid join technologymaster t on t.tid=q.tid join usermaster u on q.sid=u.usersubject and q.tid=u.usertechnology where u.id=@id and u.id not in (select userid from resultdetails r where r.userid=@id)
end
else if(@action='ExamInsert')
begin
declare @chkrstatus varchar(50)='';
if(@optchoose=(select answer from questionmaster where qid=@qid))
begin
set @chkrstatus= 'CORRECT';
end
else
begin
set @chkrstatus= 'INCORRECT';
end
insert into resultdetails(userid, doe, qid, optchoose, rstatus )values
(@id, getdate(), @qid, @optchoose,@chkrstatus)
end
else if (@action='GetResult')
begin
select u.username as username,s.sname  as subjectname,t.tname  as technologyname,(select count(1) from resultdetails where userid=@id) as questions,
(select count(1) from resultdetails where userid=@id and optchoose is not null) as questionappeared,
(select count(1) from resultdetails where userid=@id and rstatus='CORRECT') as rightanswer,
((select count(1) from resultdetails where userid=@id and rstatus='CORRECT')*2) as mark
from usermaster u
join technologymaster t on t.tid=u.usertechnology join subjectmaster s on s.sid=u.usersubject 
where  u.id=@id
end
end
GO
/****** Object:  StoredProcedure [dbo].[SP_SchoolRegistration]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_SchoolRegistration]
(
@SchoolID int = 0,
@SchoolName Varchar(100) = null,
@SchoolTypeID int = 0,
@SchoolLevel Varchar(50) = null,
@SchoolPhoto Varchar(Max) = null,
@StateID int = 0,
@DistrictID int = 0,
@Action varchar(50)
)
As
Begin
If(@Action='FillState')
Select * From TblState
Else if(@Action='FillDistrict')
Select * From TblDistrict Where StateID=@StateID
Else if(@Action='FillTable')
Select A.SchoolID,B.StateName,C.DistrictName,A.SchoolName,D.SchoolTypeName,A.SchoolLevel,A.SchoolPhoto From TblSchoolRegistration A,TblState B, TblDistrict C, SchoolType D Where A.StateID=B.StateID and A.DistrictID=C.DistrictID and A.SchoolTypeID = D.SchoolTypeID
Else if(@Action='SelectOne')
Select * From TblSchoolRegistration Where SchoolID=@SchoolID
Else if(@Action='InsertOrUpdate')
Begin
If(@SchoolID=0)
insert into TblSchoolRegistration values(@StateID,@DistrictID,@SchoolName,@SchoolTypeID,@SchoolLevel,@SchoolPhoto)
Else
Update TblSchoolRegistration set 
StateID=@StateID,DistrictID=@DistrictID,SchoolName=@SchoolName,SchoolTypeID=@SchoolTypeID,SchoolLevel=@SchoolLevel,SchoolPhoto=@SchoolPhoto Where SchoolID=@SchoolID
End
Else if(@Action='Delete')
Delete From TblSchoolRegistration Where SchoolID=@SchoolID
End
GO
/****** Object:  StoredProcedure [dbo].[SP_STUDENT_MARKLIST]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_STUDENT_MARKLIST]
(
@STUD_NAME		VARCHAR(50)=null, 
@TOTAL_MARK		INT=0, 
@OBTAINED_MARK	INT=0,
@PERCENTAGE_MARK DECIMAL(8, 2)=0.0,
@Grade char(1)=null,
@ACTION			VARCHAR(20),
@P_MSGOUT	INT=0 OUT
)
AS
BEGIN
	IF(@ACTION='INSERT')
	BEGIN
		SET @PERCENTAGE_MARK=CONVERT(NUMERIC(8,2),(CONVERT(NUMERIC(8,2),@OBTAINED_MARK*100)/CONVERT(NUMERIC(8,2),@TOTAL_MARK)))

		IF(@PERCENTAGE_MARK >=90)
		BEGIN
			SET @Grade='A1'
		END
		ELSE IF(@PERCENTAGE_MARK >= 80 AND @PERCENTAGE_MARK < 90)
		BEGIN
			SET @Grade='A2'
		END
		ELSE IF(@PERCENTAGE_MARK >=70 AND @PERCENTAGE_MARK < 80)
		BEGIN
			SET @Grade='B1'
		END
		ELSE IF(@PERCENTAGE_MARK >=60 AND @PERCENTAGE_MARK < 70)
		BEGIN
			SET @Grade='B2'
		END
		ELSE IF(@PERCENTAGE_MARK >=50 AND @PERCENTAGE_MARK < 60)
		BEGIN
			SET @Grade='C'
		END
		ELSE IF(@PERCENTAGE_MARK >=40 AND @PERCENTAGE_MARK < 50)
		BEGIN
			SET @Grade='D'
		END
		ELSE IF(@PERCENTAGE_MARK >=33 AND @PERCENTAGE_MARK < 40)
		BEGIN
			SET @Grade='E'
		END
		ELSE IF(@PERCENTAGE_MARK < 33)
		BEGIN
			SET @Grade='F'
		END

		INSERT INTO STUDENT_TABLE VALUES(@STUD_NAME,@TOTAL_MARK,@OBTAINED_MARK,@PERCENTAGE_MARK,@Grade)

		SET @P_MSGOUT=1
	END

	ELSE IF(@ACTION='SELECTALL')
	BEGIN
		SELECT * FROM STUDENT_TABLE
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_account]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[usp_account](
@Account_id  int=0,
@branch_id int=0,--ddl (create table
@accounttype_id int=0,--ddl (create table
@GlOb_Type nvarchar(3)=NULL,--ddl static data(CR,DR) no table required
@GlOb_date date=NULL, --TextBob Data Calnder 
@GlOb_Amount decimal(16, 2)=NULL,--TextBob
@Gl_Status nvarchar(10)=NULL,--ddl static data(A,I,F,C) no table required
@Lad_Percentage decimal(16, 2)=NULL,--TextBob
@Penal_Rate decimal(16, 2)=NULL,--TextBob
@Action char(4)
)
AS
BEGIN
if(@Action='I')   ----Insert Into [account] Table
INSERT INTO [dbo].[account]
           ([branch_id]
           ,[accounttype_id]
           ,[GlOb_Type]
           ,[GlOb_date]
           ,[GlOb_Amount]
           ,[Gl_Status]
           ,[Lad_Percentage]
           ,[Penal_Rate])
     VALUES
           (@branch_id,
		   @accounttype_id,
		   @GlOb_Type,
		   @GlOb_date,
		   @GlOb_Amount,
		   @Gl_Status,
		   @Lad_Percentage,
		   @Penal_Rate)
else if(@Action='U')  ----Update Table Data [account]
UPDATE [dbo].[account]
   SET [branch_id] = @branch_id
      ,[accounttype_id] = @accounttype_id
      ,[GlOb_Type] = @GlOb_Type
      ,[GlOb_date] = @GlOb_date
      ,[GlOb_Amount] = @GlOb_Amount
      ,[Gl_Status] = @Gl_Status
      ,[Lad_Percentage] = @Lad_Percentage
      ,[Penal_Rate] = @Penal_Rate
 WHERE Account_id=@Account_id
else if(@Action='D') ----Delete Data from [account]
DELETE FROM [dbo].[account]
      WHERE Account_id=@Account_id
else if(@Action='S') ----Select all Data from [account]
SELECT [Account_id]
      ,[branch_id]
      ,[accounttype_id]
      ,[GlOb_Type]
      ,[GlOb_date]
      ,[GlOb_Amount]
      ,[Gl_Status]
      ,[Lad_Percentage]
      ,[Penal_Rate]
  FROM [dbo].[account]
else if(@action='S0') ----Select particular Data from [account]
SELECT [Account_id]
      ,[branch_id]
      ,[accounttype_id]
      ,[GlOb_Type]
      ,[GlOb_date]
      ,[GlOb_Amount]
      ,[Gl_Status]
      ,[Lad_Percentage]
      ,[Penal_Rate]
  FROM [dbo].[account] WHERE Account_id=@Account_id
else if(@action='SB') ----Select particular Data from [Branch Details]
SELECT [branch_id]
      ,[Branch_Name]
  FROM [dbo].[branch_details]
else if(@action='SA') ----Select particular Data from [accountType ]
SELECT [AccountType_id]
  FROM accountType
End
GO
/****** Object:  StoredProcedure [dbo].[USP_AKB_USER]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_AKB_USER]
(
@ID int=0,
@USER_ID VARCHAR(10)=NULL,
@USER_NAME VARCHAR(35)=NULL,
@USER_PASSWORD VARCHAR(10)=NULL,
@FROM_DATE DATE= null,
@TO_DATE DATE=null,
@ROLE_ID int=0,
@USER_EMAIL varchar(100),
@USER_MOBILE varchar(20),
@USER_STATUS varchar(1)=null,
@BRANCH_id int=0,
@PMSGOUT varchar(100)=null output,
@Action char(1)
)
as
begin
IF(@Action='I')
Begin
INSERT INTO [dbo].[akb_USER]
           ( [USER_ID],[USER_NAME],[USER_PASSWORD],[FROM_DATE],[TO_DATE],[USER_STATUS],[ROLE_ID],[USER_EMAIL],[USER_MOBILE],[BRANCH_id])
     VALUES
           (@USER_ID,@USER_NAME,@USER_PASSWORD,@FROM_DATE,@TO_DATE,'1',@ROLE_ID,@USER_EMAIL,@USER_MOBILE,@BRANCH_id)
		   set @PMSGOUT='1' 
END
END
GO
/****** Object:  StoredProcedure [dbo].[usp_akb_USER_Operation]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[usp_akb_USER_Operation]
(
@ID int = 0,
@USER_ID varchar(10)=null,
@USER_NAME varchar(35)=null,
@USER_PASSWORD varchar(10)=null,
@FROM_DATE date =null,
@TO_DATE date =null,
@USER_STATUS varchar(1) = null,
@ROLE_ID int =0,
@ROLE_NAME VARCHAR(50)=null,
@USER_EMAIL varchar(100)=null,
@USER_MOBILE varchar(20)=null,
@BRANCH_id int = 0,
@action char(1)
)
as
begin
--insert data of EmployeeTable
	if(@action='I')
	INSERT INTO [dbo].[akb_USER]
           ([USER_ID]
           ,[USER_NAME]
           ,[USER_PASSWORD]
           ,[FROM_DATE]
           ,[TO_DATE]
           ,[USER_STATUS]
           ,[ROLE_ID]
           ,[USER_EMAIL]
           ,[USER_MOBILE]
           ,[BRANCH_id])
     VALUES
           (@USER_ID,
           @USER_NAME,
           @USER_PASSWORD,
           @FROM_DATE, 
           @TO_DATE, 
           @USER_STATUS,
           @ROLE_ID,
           @USER_EMAIL,
           @USER_MOBILE,
           @BRANCH_id)

	else if(@action='U')
	begin
	update akb_USER
	SET 
		[USER_ID] = @USER_ID,
		[USER_NAME] = @USER_NAME,
      [USER_PASSWORD] = @USER_PASSWORD,
      [FROM_DATE] = @FROM_DATE,
      [TO_DATE] = @TO_DATE,
      [USER_STATUS] = @USER_STATUS,
      [ROLE_ID] = @ROLE_ID, 
      [USER_EMAIL] = @USER_EMAIL,
      [USER_MOBILE] = @USER_MOBILE, 
      [BRANCH_id] = @BRANCH_id
 WHERE ID = @ID
 end

	else if(@action='D')
	begin
	delete from  [dbo].[akb_USER] where ID= @ID
	end


	else if(@action='S')
	begin
	select * from [dbo].[akb_USER]
	end

	else if(@action='E')
	begin
	select * from [dbo].[akb_USER] where ID= @ID
	end

	else if(@action='A')
	begin
	select ROLE_ID,ROLE_NAME from [dbo].USER_ROLES 
	end

	else if(@action='F')
	begin
	select BRANCH_id,Branch_Name from branch_details
	end
	
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_Branch_Details]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Usp_Branch_Details]
	(
	@branch_id int=0,
	@Branch_Name varchar(150)= NULL,
	@Branch_address varchar(200)=NULL,	
	@photosignature	 varchar(200)=Null,
	@action char(1)
	)
AS
BEGIN 	
	if(@action='I')--For insert 
	INSERT into branch_details values(@Branch_Name,@Branch_address,@photosignature)
	Else if(@action='U')--For update
	update branch_details set Branch_Name=@Branch_Name, Branch_address=@Branch_address, photosignature=photosignature where branch_id=@branch_id
	Else if(@action='D')--For delete 
	delete from branch_details where branch_id=@branch_id
	Else if(@action='S') --For select
	Select * from  branch_details
	Else if(@action='O')
	Select * from branch_details where branch_id=@branch_id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Branchdetails]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_Branchdetails]
(
@branch_id int=0,
@Branch_Name varchar(255)=null,
@Branch_address varchar(255)=null,
@photosignature varchar(255)=null,
@PMSGOUT varchar(100)=null output,
@Action char(1)
)
as 
begin
IF(@Action='I')
begin
  if EXISTS(select  branch_id from branch_details where Branch_Name = @Branch_Name)
  begin
    set @PMSGOUT='1'
  end
else
   begin
     insert into branch_details values(@Branch_Name,@Branch_address,@photosignature) set @PMSGOUT='2'
   end
end
ELSE IF(@Action='U')
begin
update  branch_details set Branch_Name=@Branch_Name,Branch_address=@Branch_address,photosignature=@photosignature where branch_id=@branch_id
set @PMSGOUT='3'
end
ELSE IF(@Action='D')
Delete from  branch_details  where branch_id=@branch_id
ELSE IF(@Action='A')
select branch_id,Branch_Name,Branch_address,photosignature as photosignaturelbl from  branch_details  
ELSE IF(@Action='S')
select branch_id,Branch_Name,Branch_address,photosignature as photosignaturelbl from  branch_details where branch_id=@branch_id 
end
GO
/****** Object:  StoredProcedure [dbo].[USP_customer]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[USP_customer]
(
@CUSTOMER_id int=0,
@NAME_INITIALS nvarchar(100)=null,
@CUSTOMER_NAME nvarchar(100)=null,
@FATHER_HUSBAND nvarchar(100)=null,
@MOTHER_WIFE nvarchar(100)=null,
@B_REL_1 nvarchar(100)=null,
@B_REL_2 nvarchar(100)=null,
@CASTE nvarchar(100)=null,
@SEX  nvarchar(100)=null,
@SENIOR_CITIZEN  nvarchar(100)=null,
@OCCUPATION  nvarchar(100)=null,
@CUR_ADDRESS_1  nvarchar(100)=null,
@CUR_ADDRESS_2 nvarchar(100)=null,
@CUR_ADDRESS_3 nvarchar(100)=null,
@PIN nvarchar(100)=null,
@PHONE_NO_1 nvarchar(100)=null,
@PHONE_NO_2 nvarchar(100)=null,
@PER_ADDRESS_1 nvarchar(100)=null,
@PER_ADDRESS_2 nvarchar(100)=null,
@PER_ADDRESS_3 nvarchar(100)=null,
@PER_PIN nvarchar(100)=null,
@PER_PHN_1 nvarchar(100)=null,
@PER_PHN_2 nvarchar(100)=null,
@PAN_NO nvarchar(100)=null,
@DOB nvarchar(100)=null,
@DOM nvarchar(100)=null,
@IS_STAFF nvarchar(100)=null,
@IS_MINOR nvarchar(100)=null,
@DATE_ENROLLED nvarchar(100)=null,
@INTRODUCER_CUSTOMER_id int=0,
@LEGAL_HAIR_NAME nvarchar(100)=null,
@QUALIFICATION nvarchar(100)=null,
@OCCUPATION_OTHER nvarchar(100)=null,
@SALARIED_WITH nvarchar(100)=null,
@SALARIED_WITH_OTHER nvarchar(100)=null,
@NATURE_OF_BUS nvarchar(100)=null,
@OTHER_NATURE_NAME nvarchar(100)=null,
@DATE_OF_INCORPORATION nvarchar(100)=null,
@TYPE_OF_COMP nvarchar(100)=null,
@TYPE_OF_COMP_OTHER nvarchar(100)=null,
@SELF_EMP_PROFESSIONAL nvarchar(100)=null,
@SELF_EMP_PROFESSIONAL_OTHER nvarchar(100)=null,
@SOURCE_OF_FUNDS nvarchar(100)=null,
@OTHER_SOURCE nvarchar(100)=null,
@ANNUAL_INCOME_1 nvarchar(100)=null,
@ANNUAL_INCOME_2 nvarchar(100)=null,
@RESIDENCE_TYPE nvarchar(100)=null,
@aadharno nvarchar(100)=null,
@idproof nvarchar(100)=null,
@addressproof nvarchar(100)=null,
@PHOTOSIGNATURE nvarchar(100)=null,
@CREATED_BY nvarchar(100)=null,
@PASSED_BY nvarchar(100)=null,
@AGE nvarchar(100)=null,
@Action char(1),
@PMSGOUT varchar(100)=null output
)
as
begin
if(@Action='I')
BEGIN
INSERT INTO TBL_Customer(NAME_INITIALS,CUSTOMER_NAME,FATHER_HUSBAND,MOTHER_WIFE,
B_REL_1,B_REL_2,CASTE,SEX,SENIOR_CITIZEN,OCCUPATION,CUR_ADDRESS_1,CUR_ADDRESS_2,CUR_ADDRESS_3,
PIN,PHONE_NO_1,PHONE_NO_2,PER_ADDRESS_1,PER_ADDRESS_2,PER_ADDRESS_3,PER_PIN,PER_PHN_1,PER_PHN_2,
PAN_NO,DOB,DOM,IS_STAFF,IS_MINOR,DATE_ENROLLED,INTRODUCER_CUSTOMER_id,LEGAL_HAIR_NAME,
QUALIFICATION,OCCUPATION_OTHER,SALARIED_WITH,SALARIED_WITH_OTHER,NATURE_OF_BUS,OTHER_NATURE_NAME,
DATE_OF_INCORPORATION,TYPE_OF_COMP,TYPE_OF_COMP_OTHER,SELF_EMP_PROFESSIONAL,SELF_EMP_PROFESSIONAL_OTHER,
SOURCE_OF_FUNDS,OTHER_SOURCE,ANNUAL_INCOME_1,ANNUAL_INCOME_2,RESIDENCE_TYPE,aadharno,idproof,
addressproof,PHOTOSIGNATURE,CREATED_BY,PASSED_BY,AGE) VALUES
(@NAME_INITIALS,@CUSTOMER_NAME,@FATHER_HUSBAND,@MOTHER_WIFE,
@B_REL_1,@B_REL_2,@CASTE,@SEX,@SENIOR_CITIZEN,@OCCUPATION,@CUR_ADDRESS_1,@CUR_ADDRESS_2,@CUR_ADDRESS_3,
@PIN,@PHONE_NO_1,@PHONE_NO_2,@PER_ADDRESS_1,@PER_ADDRESS_2,@PER_ADDRESS_3,@PER_PIN,@PER_PHN_1,@PER_PHN_2,
@PAN_NO,@DOB,@DOM,@IS_STAFF,@IS_MINOR,@DATE_ENROLLED,@INTRODUCER_CUSTOMER_id,@LEGAL_HAIR_NAME,
@QUALIFICATION,@OCCUPATION_OTHER,@SALARIED_WITH,@SALARIED_WITH_OTHER,@NATURE_OF_BUS,@OTHER_NATURE_NAME,
@DATE_OF_INCORPORATION,@TYPE_OF_COMP,@TYPE_OF_COMP_OTHER,@SELF_EMP_PROFESSIONAL,@SELF_EMP_PROFESSIONAL_OTHER,
@SOURCE_OF_FUNDS,@OTHER_SOURCE,@ANNUAL_INCOME_1,@ANNUAL_INCOME_2,@RESIDENCE_TYPE,@aadharno,@idproof,
@addressproof,@PHOTOSIGNATURE,@CREATED_BY,@PASSED_BY,@AGE)
END
ELSE IF(@Action='U')
BEGIN
UPDATE TBL_Customer SET NAME_INITIALS=@NAME_INITIALS,CUSTOMER_NAME=@CUSTOMER_NAME,
FATHER_HUSBAND=@FATHER_HUSBAND,MOTHER_WIFE=@MOTHER_WIFE,
B_REL_1=@B_REL_1,B_REL_2=@B_REL_2,CASTE=@CASTE,SEX=@SEX,SENIOR_CITIZEN=@SENIOR_CITIZEN,
OCCUPATION=@OCCUPATION,CUR_ADDRESS_1=@CUR_ADDRESS_1,CUR_ADDRESS_2=@CUR_ADDRESS_2,CUR_ADDRESS_3=@CUR_ADDRESS_3,
PIN=@PIN,PHONE_NO_1=@PHONE_NO_1,PHONE_NO_2=@PHONE_NO_2,PER_ADDRESS_1=@PER_ADDRESS_1,PER_ADDRESS_2=@PER_ADDRESS_2,
PER_ADDRESS_3=@PER_ADDRESS_3,PER_PIN=@PER_PIN,PER_PHN_1=@PER_PHN_1,PER_PHN_2=@PER_PHN_2,
PAN_NO=@PAN_NO,DOB=@DOB,DOM=@DOM,IS_STAFF=@IS_STAFF,IS_MINOR=@IS_MINOR,DATE_ENROLLED=@DATE_ENROLLED,
INTRODUCER_CUSTOMER_id=@INTRODUCER_CUSTOMER_id,LEGAL_HAIR_NAME=@LEGAL_HAIR_NAME,QUALIFICATION=@QUALIFICATION,
OCCUPATION_OTHER=@OCCUPATION_OTHER,SALARIED_WITH=@SALARIED_WITH,SALARIED_WITH_OTHER=@SALARIED_WITH_OTHER,
NATURE_OF_BUS=@NATURE_OF_BUS,OTHER_NATURE_NAME=@OTHER_NATURE_NAME,
DATE_OF_INCORPORATION=@DATE_OF_INCORPORATION,TYPE_OF_COMP=@TYPE_OF_COMP,TYPE_OF_COMP_OTHER=@TYPE_OF_COMP_OTHER,
SELF_EMP_PROFESSIONAL=@SELF_EMP_PROFESSIONAL,SELF_EMP_PROFESSIONAL_OTHER=@SELF_EMP_PROFESSIONAL_OTHER,
SOURCE_OF_FUNDS=@SOURCE_OF_FUNDS,OTHER_SOURCE=@OTHER_SOURCE,ANNUAL_INCOME_1=@ANNUAL_INCOME_1,ANNUAL_INCOME_2=@ANNUAL_INCOME_2,
RESIDENCE_TYPE=@RESIDENCE_TYPE,aadharno=@aadharno,idproof=@idproof,
addressproof=@addressproof,PHOTOSIGNATURE=@PHOTOSIGNATURE,CREATED_BY=@CREATED_BY,PASSED_BY=@PASSED_BY,AGE=@AGE
  WHERE CUSTOMER_id=@CUSTOMER_id
END
ELSE IF(@Action='D')
BEGIN
DELETE FROM TBL_Customer WHERE  CUSTOMER_id=@CUSTOMER_id
END
ELSE IF(@Action='S')
BEGIN
SELECT * FROM TBL_Customer WHERE  CUSTOMER_id=@CUSTOMER_id
END
ELSE IF(@Action='A')
BEGIN
SELECT * FROM TBL_Customer
END
end

GO
/****** Object:  StoredProcedure [dbo].[USP_glgroup]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_glgroup]
(
@GlGroup_id int=0,
@grouptype_id int=0,
@GlGroup_code nvarchar(3)=null,
@GlGroup_name varchar(20)=null,
@Action char(1),
@PMSGOUT varchar(100)=null output
)
as
begin
if(@Action='I')
begin
   if exists(select 1 from glgroup where grouptype_id=@grouptype_id)
		begin
		 set @PMSGOUT='1';
		end
  else
    begin
       insert into glgroup (grouptype_id,GlGroup_code,GlGroup_name) values(@grouptype_id,@GlGroup_code,@GlGroup_name)
	   set @PMSGOUT= '2';
    end
 end
else if (@Action='U')
begin
  update glgroup 
  set grouptype_id=@grouptype_id ,GlGroup_code=@GlGroup_code,
  GlGroup_name=@GlGroup_name
   where GlGroup_id=@GlGroup_id
   set  @PMSGOUT= '3';
  end
  else if (@Action='A')
  BEGIN
  SELECT GlGroup_id, grouptype_id,GlGroup_code,GlGroup_name  from glgroup 
  END
    else if (@Action='S')
	begin
	 SELECT GlGroup_id,grouptype_id,GlGroup_code,GlGroup_name  from glgroup  where GlGroup_id=@GlGroup_id
	end
	else if (@Action='B')
	begin
	select Grouptype_id,grouptype_name from [dbo].[grouptype]
	end
end
GO
/****** Object:  StoredProcedure [dbo].[USP_grouptype]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_grouptype]
(
@Grouptype_id int=0,
@grouptype_name varchar(20)=null,
@Action char(4)
)
as
begin
	if @Action='I'
	Begin
	INSERT INTO [dbo].[grouptype]
			   ([grouptype_name])
		 VALUES
			   (@grouptype_name)
	end

	if @Action='U'
	Begin
	UPDATE [dbo].[grouptype]
   SET [grouptype_name] = @grouptype_name 
 WHERE Grouptype_id=@Grouptype_id
	end
  if @Action='S'
	Begin
	select * from [grouptype];
	end
	if @Action='SO'
	Begin
	select * from [grouptype] where Grouptype_id=@Grouptype_id ;
	end
	if @Action='D'
	Begin
	Delete from [grouptype] where Grouptype_id=@Grouptype_id ;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[usp_login]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_login]
(
@USER_ID VARCHAR(10)=null,
@USER_PASSWORD VARCHAR(10)=null,
@action char(10)
)
as begin
if(@ACTION='LOGIN')
select * from akb_USER where USER_ID=@USER_ID and USER_PASSWORD=@USER_PASSWORD
end
GO
/****** Object:  StoredProcedure [dbo].[usp_master_login]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[usp_master_login]
(@id varchar(20),
@password varchar(20),
@action char(10)
)
as
begin
if(@action='login')
select * from master_user where id=@id and password=@password
end
GO
/****** Object:  StoredProcedure [dbo].[USP_SC_Registration]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USP_SC_Registration]
(
@RegistrationId int=0,
@ApplicantName varchar(100)=null,
@EmailId varchar(100)=null,
@MobileNo varchar(100)=null,
@Gender varchar(100)=null,
@DOB date=null,
@ImagePath varchar(100)=null,
@RegdDate date=null,
@Fees decimal(18,2)=0.0,
@ClubId int=0,
@SportsId int=0,
@action varchar(100),
@PMSGOUT varchar(100) output
)
as
begin
if(@action='InsertUpdate')
begin
   if(@RegistrationId=0)
       begin
	        IF Exists (Select 1 from T_SC_RegistrationMaster where DeletedFlag=0 AND ApplicantName=@ApplicantName)
				begin
				   SET @PMSGOUT='4'; 
				end
			else
			declare @age int;
               set @age=DATEDIFF(year, @dob, getdate())
			   if(@age>13)
			begin
			   insert into T_SC_RegistrationMaster(ClubId,SportsId,ApplicantName, EmailId,MobileNo, DOB, Gender, ImagePath,CreatedOn)
			   values(@ClubId,@SportsId,@ApplicantName, @EmailId,@MobileNo, @DOB, @Gender, @ImagePath,getdate())
			   set @PMSGOUT='1';
		    end
			else if(@age<13)
					begin
				    	set @PMSGOUT='5';
					end
	   end
   else
	   begin
	   IF Exists (Select 1 from T_SC_RegistrationMaster where DeletedFlag=0 AND ApplicantName=@ApplicantName and RegistrationId!=@RegistrationId)
				begin
				   SET @PMSGOUT='4'; 
				end
		   else
		    declare @agee int;
            set @agee=DATEDIFF(year, @dob, getdate())
		   if(@agee>13)
		   begin
			   update T_SC_RegistrationMaster set ClubId=@ClubId,SportsId=@SportsId,ApplicantName=@ApplicantName,EmailId=@EmailId,MobileNo=@MobileNo,DOB=@DOB,Gender=@Gender,ImagePath=@ImagePath where RegistrationId=@RegistrationId
			   set @PMSGOUT='2';
		   end
		   else
			begin  if(@agee<13)
				set @PMSGOUT='5';
				end
		end
end


 else if(@action='Delete')
 begin
 update T_SC_RegistrationMaster set DeletedFlag=1  where RegistrationId=@RegistrationId
 set @PMSGOUT='3';
 end
else if(@action='SelectAll')
 select r.RegistrationId,r.ClubId,r.SportsId,ApplicantName, EmailId,MobileNo, DOB, Gender, ImagePath,p.ClubName,c.SportsName,c.Fees,
 DATEDIFF(year, r.dob, getdate()) AS Age,convert(varchar,r.CreatedOn,103)  as RegdDate from T_SC_RegistrationMaster r 
 inner join M_SC_ClubMaster p on r.ClubId=p.ClubId 
 inner join M_SC_SportsMaster c on r.SportsId=c.SportsId
 where r.DeletedFlag=0
order by r.CreatedOn desc
 else if(@action='SelectOne')
 begin
--select RegistrationId,ClubId,SportsId,ApplicantName, EmailId,MobileNo, DOB, Gender, ImagePath,Fees,CreatedOn  from T_SC_RegistrationMaster where  RegistrationId=@RegistrationId  
select r.RegistrationId,r.ClubId,r.SportsId,ApplicantName, EmailId,MobileNo, DOB, Gender, ImagePath,p.ClubName,c.SportsName,c.Fees,
 DATEDIFF(year, r.dob, getdate()) AS Age,convert(varchar,r.CreatedOn,103)  as RegdDate from T_SC_RegistrationMaster r 
 inner join M_SC_ClubMaster p on r.ClubId=p.ClubId 
 inner join M_SC_SportsMaster c on r.SportsId=c.SportsId
 where r.DeletedFlag=0 and  r.RegistrationId=@RegistrationId  
 end
 else if(@action='SelectClub')
 begin
select *  from [dbo].[M_SC_ClubMaster]  
 end
 else if(@action='SelectSports')
 begin
select *  from [dbo].[M_SC_SportsMaster] where ClubId=@ClubId  
 end
 else if(@action='GetFeesBySports')
Begin
select  Fees,SportsName from  M_SC_SportsMaster where SportsId= @SportsId
End
else if(@action='BindDate')--bind current date
begin
select convert(varchar,GETDATE(),103) as RegdDate
end
else if(@action='GetAllMembersByClubId')
begin
 select r.ClubId,min(s.SportsName)as SportsName,c.ClubName,
min(s.Fees) as Fees,
count (c.ClubName) as Noofmember from T_SC_RegistrationMaster r 
join M_SC_ClubMaster c on r.ClubId=c.ClubId
join M_SC_SportsMaster s on  r.SportsId=s.SportsId  
and r.DeletedFlag=0  and r.ClubId=@ClubId 
group by r.ClubId,s.SportsId,ClubName
end
end




GO
/****** Object:  StoredProcedure [dbo].[USP_Server]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_Server]
(
@Server_id int=0,
@SERVER_DATE datetime=null,
@STATUS varchar(1)=null,
@BRANCH_id int=0,
@Action char(1)
)
as
begin
IF(@Action='I')
Begin

if EXISTS(select [BRANCH_id] from SERVER_DATE where [BRANCH_id] = @BRANCH_id)
Begin
UPDATE [dbo].[SERVER_DATE]
   SET [SERVER_DATE] = @SERVER_DATE
      ,[STATUS] = @STATUS
      
 WHERE [BRANCH_id] = @BRANCH_id
END
ELSE
BEGIN
INSERT INTO [dbo].[SERVER_DATE]
           ([SERVER_DATE]
           ,[STATUS]
           ,[BRANCH_id])
     VALUES
           (@SERVER_DATE
           ,@STATUS
           ,@BRANCH_id)
END
end

ELSE IF @Action='S'
BEGIN
select SERVER_DATE,STATUS from SERVER_DATE  WHERE [BRANCH_id] = @BRANCH_id
 END
ELSE IF @Action='U'
BEGIN
UPDATE [dbo].[SERVER_DATE]
   SET [SERVER_DATE] = @SERVER_DATE
      ,[STATUS] = @STATUS
      
 WHERE [BRANCH_id] = @BRANCH_id

 END
 END
GO
/****** Object:  StoredProcedure [dbo].[Usp_UserRole]    Script Date: 26-03-2023 22:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Usp_UserRole]
(
@ROLE_ID int=0,
@ROLE_NAME VARCHAR(50)=null,
@ALLOW_GL VARCHAR(50)=null,
@ALLOW_CC VARCHAR(50)=null,
@ALLOW_EC VARCHAR(50)=null,
@ALLOW_AC VARCHAR(50)=null,
@ALLOW_SPCL VARCHAR(50)=null,
@ALLOW_NEW_DEPO VARCHAR(50)=null,
@ALLOW_NEW_LOAN VARCHAR(50)=null,
@ALLOW_INT_PARA VARCHAR(50)=null,
@ALLOW_VCH VARCHAR(50)=null,
@ALLOW_DISBURSE VARCHAR(50)=null,
@ALLOW_LN_REPAY VARCHAR(50)=null,
@ALLOW_VCH_AP VARCHAR(50)=null,
@ALLOW_DEPO_AP VARCHAR(50)=null,
@ALLOW_LN_AP VARCHAR(50)=null,
@ALLOW_CR_USR VARCHAR(50)=null,
@ALLOW_BNK_INFO VARCHAR(50)=null,
@ALLOW_RENEW_EXP VARCHAR(50)=null,
@ALLOW_VCH_EDIT VARCHAR(50)=null,
@Action char(10)=null,
@PMSGOUT varchar(100)=null output
)
as 
begin
IF(@Action='I')
begin
	if exists(select 1 from USER_ROLES where ROLE_NAME=@ROLE_NAME)
	begin
		set @PMSGOUT= '1';
	end
 else
	begin
		INSERT INTO USER_ROLES
           (
		   ROLE_NAME ,ALLOW_GL,ALLOW_CC,ALLOW_EC,ALLOW_AC,ALLOW_SPCL,ALLOW_NEW_DEPO,ALLOW_NEW_LOAN
           ,ALLOW_INT_PARA,ALLOW_VCH,ALLOW_DISBURSE,ALLOW_LN_REPAY,ALLOW_VCH_AP,ALLOW_DEPO_AP,ALLOW_LN_AP
		   ,ALLOW_CR_USR,ALLOW_BNK_INFO,ALLOW_RENEW_EXP,ALLOW_VCH_EDIT)
     VALUES
           (@ROLE_NAME,
		   case when @ALLOW_GL='true' THEN 'Y' else 'N' end,
		   case when @ALLOW_CC='true' THEN 'Y' else 'N' end,
		   case when @ALLOW_EC='true' THEN 'Y' else 'N' end, 
		   case when  @ALLOW_AC='true' THEN 'Y' else 'N' end,
		   case when @ALLOW_SPCL='true' THEN 'Y' else 'N' end,
		   case when @ALLOW_NEW_DEPO='true' THEN 'Y' else 'N' end,
		   case when @ALLOW_NEW_LOAN='true' THEN 'Y' else 'N' end,
		   case when @ALLOW_INT_PARA='true' THEN 'Y' else 'N' end,
		  case when @ALLOW_VCH='true' THEN 'Y' else 'N' end,
		case when @ALLOW_DISBURSE='true' THEN 'Y' else 'N' end,
		case when @ALLOW_LN_REPAY='true' THEN 'Y' else 'N' end,
		case when @ALLOW_VCH_AP='true' THEN 'Y' else 'N' end,
		case when  @ALLOW_DEPO_AP='true' THEN 'Y' else 'N' end,
		case when @ALLOW_LN_AP='true' THEN 'Y' else 'N' end,
		case when @ALLOW_CR_USR='true' THEN 'Y' else 'N' end,
		case when @ALLOW_BNK_INFO='true' THEN 'Y' else 'N' end,
		case when @ALLOW_RENEW_EXP='true' THEN 'Y' else 'N' end,
		case when @ALLOW_VCH_EDIT='true' THEN 'Y' else 'N' end) set @PMSGOUT= '2';
	 end
     
 end
  else if(@Action='A')
  begin
  select  ROLE_ID, ROLE_NAME ,ALLOW_GL,ALLOW_CC,ALLOW_EC,ALLOW_AC,ALLOW_SPCL,ALLOW_NEW_DEPO,ALLOW_NEW_LOAN
           ,ALLOW_INT_PARA,ALLOW_VCH,ALLOW_DISBURSE,ALLOW_LN_REPAY,ALLOW_VCH_AP,ALLOW_DEPO_AP,ALLOW_LN_AP
		   ,ALLOW_CR_USR,ALLOW_BNK_INFO,ALLOW_RENEW_EXP,ALLOW_VCH_EDIT  FROM USER_ROLES
          
  end
   else if(@Action='S')
  begin
  select  ROLE_ID, ROLE_NAME ,ALLOW_GL,ALLOW_CC,ALLOW_EC,ALLOW_AC,ALLOW_SPCL,ALLOW_NEW_DEPO,ALLOW_NEW_LOAN
           ,ALLOW_INT_PARA,ALLOW_VCH,ALLOW_DISBURSE,ALLOW_LN_REPAY,ALLOW_VCH_AP,ALLOW_DEPO_AP,ALLOW_LN_AP
		   ,ALLOW_CR_USR,ALLOW_BNK_INFO,ALLOW_RENEW_EXP,ALLOW_VCH_EDIT  FROM USER_ROLES WHERE ROLE_ID=@ROLE_ID
          
  end
   else if(@Action='U')
  begin
  update USER_ROLES set 
			 ROLE_NAME=@ROLE_NAME, 
		    ALLOW_GL= case when @ALLOW_GL='true' then 'Y' ELSE 'N' END,
			 ALLOW_CC= case when @ALLOW_CC='true' then 'Y' ELSE 'N' END,
			ALLOW_EC=  case when @ALLOW_EC='true' then 'Y' ELSE 'N' END,
			 ALLOW_AC=  case when @ALLOW_AC='true' then 'Y' ELSE 'N' END,
			  ALLOW_SPCL= case when @ALLOW_SPCL='true' then 'Y' ELSE 'N' END,
			ALLOW_NEW_DEPO= case when @ALLOW_NEW_DEPO='true' then 'Y' ELSE 'N' END,
			 ALLOW_NEW_LOAN= case when @ALLOW_NEW_LOAN='true' then 'Y' ELSE 'N' END,
			ALLOW_INT_PARA= CASE when @ALLOW_INT_PARA='true' then 'Y' ELSE 'N' END,
			  ALLOW_VCH= case when @ALLOW_VCH='true' then 'Y' ELSE 'N' END,
			ALLOW_DISBURSE= case when @ALLOW_DISBURSE='true' then 'Y' ELSE 'N' END,
			ALLOW_LN_REPAY= case when @ALLOW_LN_REPAY='true' then 'Y' ELSE 'N' END,
			ALLOW_VCH_AP= case when @ALLOW_VCH_AP='true' then 'Y' ELSE 'N' END,
			ALLOW_DEPO_AP= case when @ALLOW_DEPO_AP='true' then 'Y' ELSE 'N' END,
			ALLOW_LN_AP= case when @ALLOW_LN_AP='true' then 'Y' ELSE 'N' END,
			ALLOW_CR_USR= case when @ALLOW_CR_USR='true' then 'Y' ELSE 'N' END,
			ALLOW_BNK_INFO= case when @ALLOW_BNK_INFO='true' then 'Y' ELSE 'N' END,
			ALLOW_RENEW_EXP= case when @ALLOW_RENEW_EXP='true' then 'Y' ELSE 'N' END,
			ALLOW_VCH_EDIT= case when @ALLOW_VCH_EDIT='true' then 'Y' ELSE 'N' END 
			WHERE ROLE_ID=@ROLE_ID
                                                                     set @PMSGOUT='3'; 
          
  end
  else if(@Action='B')
  begin
  select  ROLE_ID, ROLE_NAME ,
  case when ALLOW_GL ='Y' then 'true' else 'false' end as ALLOW_GL,
  case when ALLOW_CC ='Y' then 'true' else 'false' end as ALLOW_CC, 
  case when ALLOW_EC='Y' then 'true' else 'false' end as ALLOW_EC ,
  case when ALLOW_AC='Y' then 'true' else 'false' end as ALLOW_AC,
  case when ALLOW_SPCL='Y' then 'true' else 'false' end as ALLOW_SPCL,
  case when ALLOW_NEW_DEPO='Y' then 'true' else 'false' end as ALLOW_NEW_DEPO,
  case  when ALLOW_NEW_LOAN='Y' then 'true' else 'false' end as ALLOW_NEW_LOAN,
  case  when ALLOW_INT_PARA='Y' then 'true' else 'false' end as ALLOW_INT_PARA,
  case  when ALLOW_VCH='Y' then 'true' else 'false' end as ALLOW_VCH,
  case  when ALLOW_DISBURSE='Y' then 'true' else 'false' end as ALLOW_DISBURSE,
  case  when ALLOW_LN_REPAY='Y' then 'true' else 'false' end as ALLOW_LN_REPAY,
  case  when ALLOW_VCH_AP='Y' then 'true' else 'false' end as ALLOW_VCH_AP,
  case  when ALLOW_DEPO_AP='Y' then 'true' else 'false' end as ALLOW_DEPO_AP,
  case  when ALLOW_LN_AP='Y' then 'true' else 'false' end as ALLOW_LN_AP,
  case  when ALLOW_CR_USR='Y' then 'true' else 'false' end as ALLOW_CR_USR,
  case  when ALLOW_BNK_INFO='Y' then 'true' else 'false' end as ALLOW_BNK_INFO,
  case  when ALLOW_RENEW_EXP='Y' then 'true' else 'false' end as ALLOW_RENEW_EXP,
  case  when ALLOW_VCH_EDIT='Y' then 'true' else 'false' end as ALLOW_VCH_EDIT
  FROM USER_ROLES WHERE ROLE_ID=@ROLE_ID
          
  end

end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[61] 4[5] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "subjectmaster"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 157
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "technologymaster"
            Begin Extent = 
               Top = 162
               Left = 314
               Bottom = 356
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "usermaster"
            Begin Extent = 
               Top = 2
               Left = 637
               Bottom = 206
               Right = 808
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
