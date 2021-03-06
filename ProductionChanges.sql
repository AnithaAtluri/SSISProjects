1)Altering table tblJISA_Stage
Notes: Since CaseNo is a Computed coulmn we need to drop the column and re-add it 

A) Drop the Index IX_JISA_Stage_CaseNo

USE [mf_court]
GO

/****** Object:  Index [IX_JISA_Stage_CaseNo]    Script Date: 09/24/2013 11:12:35 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblJISA_Stage]') AND name = 
N'IX_JISA_Stage_CaseNo')
DROP INDEX [IX_JISA_Stage_CaseNo] ON [dbo].[tblJISA_Stage] WITH ( ONLINE = OFF )
GO

B)
 Alter Table dbo.tblJISA_Stage
 drop column CaseNo

C)
Alter table dbo.tblJISA_Stage
Add CaseNo AS (left(replace(substring([RawText],(32),(9)),'-',''),(9)))



D) Create Index 
USE [mf_court]
GO

SET ARITHABORT ON
GO

SET CONCAT_NULL_YIELDS_NULL ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_WARNINGS ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

/****** Object:  Index [IX_JISA_Stage_CaseNo]    Script Date: 09/24/2013 10:09:58 ******/
CREATE NONCLUSTERED INDEX [IX_JISA_Stage_CaseNo] ON [dbo].[tblJISA_Stage] 
(
	[CaseNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = 
OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


2)Changing the CaseNo in tblCaseFiling

A) Drop the primary key  from the 

USE [mf_court]
GO

/****** Object:  Index [PK_tblCaseFiling_CaseNo]    Script Date: 09/24/2013 10:35:21 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblCaseFiling]') AND name = 
N'PK_tblCaseFiling_CaseNo')
ALTER TABLE [dbo].[tblCaseFiling] DROP CONSTRAINT [PK_tblCaseFiling_CaseNo]
GO

B) Alter the column Query

Alter table dbo.tblCaseFiling
Alter column CaseNo VARCHAR(9) NOT NULL

C)Define Primary Index on the table

USE [mf_court]
GO

/****** Object:  Index [PK_tblCaseFiling_CaseNo]    Script Date: 09/24/2013 10:36:53 ******/
ALTER TABLE [dbo].[tblCaseFiling] ADD  CONSTRAINT [PK_tblCaseFiling_CaseNo] PRIMARY KEY CLUSTERED 
(
	[CaseNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, 
ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


3) Changing CaseNo in tblCaseAssignment

A) Drop the Primary key from the table
USE [mf_court]
GO

/****** Object:  Index [PK_tblCaseAssignment_CaseNo]    Script Date: 09/24/2013 10:53:56 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblCaseAssignment]') AND name = 
N'PK_tblCaseAssignment_CaseNo')
ALTER TABLE [dbo].[tblCaseAssignment] DROP CONSTRAINT [PK_tblCaseAssignment_CaseNo]
GO

B) Alter column Query
Alter table dbo.tblCaseAssignment
Alter column CaseNo VARCHAR(9) NOT NULL

c) Define Primary key

USE [mf_court]
GO

/****** Object:  Index [PK_tblCaseAssignment_CaseNo]    Script Date: 09/24/2013 10:52:27 ******/
ALTER TABLE [dbo].[tblCaseAssignment] ADD  CONSTRAINT [PK_tblCaseAssignment_CaseNo] PRIMARY KEY CLUSTERED 
(
	[CaseNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, 
ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


4) Stored Procs that have been changed in 10.10.101.161

  A)  JISA_010_CaseFiling
  B)  JISA_020_CaseAssignment
  c)  JISA_030_CaseAddress
  D)  JISC_010_CourtRec


5) Changing the CaseNo in tblCaseAddress

A) Drop the Primary Key

USE [mf_court]
GO

/****** Object:  Index [PK_tblCaseAddress_CaseNo]    Script Date: 09/24/2013 11:09:40 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblCaseAddress]') AND name = 
N'PK_tblCaseAddress_CaseNo')
ALTER TABLE [dbo].[tblCaseAddress] DROP CONSTRAINT [PK_tblCaseAddress_CaseNo]
GO



B) Alter the Column CaseNo
    Alter table dbo.tblCaseAddress
    Alter column CaseNo VARCHAR(9) NOT NULL

C) Define Primary key on CaseNO

USE [mf_court]
GO

/****** Object:  Index [PK_tblCaseAddress_CaseNo]    Script Date: 09/24/2013 11:05:31 ******/
ALTER TABLE [dbo].[tblCaseAddress] ADD  CONSTRAINT [PK_tblCaseAddress_CaseNo] PRIMARY KEY CLUSTERED 
(
	[CaseNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, 
ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


6) Changing the CaseNo in tblCJIS

 A) Drop the Primary Key

USE [mf_court]
GO

/****** Object:  Index [PK_tblCJIS_CaseNo]    Script Date: 09/24/2013 11:19:58 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblCJIS]') AND name = 
N'PK_tblCJIS_CaseNo')
ALTER TABLE [dbo].[tblCJIS] DROP CONSTRAINT [PK_tblCJIS_CaseNo]
GO

B) Alter Query

Alter table dbo.tblCJIS
Alter column CaseNo VARCHAR(9) NOT NULL

C)Define Primary Key 

USE [mf_court]
GO

/****** Object:  Index [PK_tblCJIS_CaseNo]    Script Date: 09/24/2013 11:20:36 ******/
ALTER TABLE [dbo].[tblCJIS] ADD  CONSTRAINT [PK_tblCJIS_CaseNo] PRIMARY KEY CLUSTERED 
(
	[CaseNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, 
ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

7) Altering table tblJISB_Stage

A) Drop the Index IX_JISB_Stage_CaseTypeRecSEQ

USE [mf_court]
GO

/****** Object:  Index [IX_JISB_Stage_CaseTypeRecSeq]    Script Date: 09/24/2013 11:32:20 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblJISB_Stage]') AND name = 
N'IX_JISB_Stage_CaseTypeRecSeq')
DROP INDEX [IX_JISB_Stage_CaseTypeRecSeq] ON [dbo].[tblJISB_Stage] WITH ( ONLINE = OFF )
GO

B) Alter column 

Alter Table dbo.tblJISB_Stage
 drop column CaseNo

C) readding the column


Alter table dbo.tblJISB_Stage
Add CaseNo AS (left(replace(substring([RawText],(32),(9)),'-',''),(9)))

D) Create the Index

USE [mf_court]
GO

SET ARITHABORT ON
GO

SET CONCAT_NULL_YIELDS_NULL ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_WARNINGS ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

/****** Object:  Index [IX_JISB_Stage_CaseTypeRecSeq]    Script Date: 09/24/2013 11:33:40 ******/
CREATE NONCLUSTERED INDEX [IX_JISB_Stage_CaseTypeRecSeq] ON [dbo].[tblJISB_Stage] 
(
	[CaseNo] ASC,
	[RecordType] ASC,
	[RecordNum] ASC,
	[SeqNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = 
OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

8) Altering table dbo.tblJISC_Stage

 A) Drop the Indexe  IX_JISC_Stage_CaseTypeRecSeq

USE [mf_court]
GO

/****** Object:  Index [IX_JISC_Stage_CaseTypeRecSeq]    Script Date: 09/24/2013 11:42:11 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblJISC_Stage]') AND name = 
N'IX_JISC_Stage_CaseTypeRecSeq')
DROP INDEX [IX_JISC_Stage_CaseTypeRecSeq] ON [dbo].[tblJISC_Stage] WITH ( ONLINE = OFF )
GO


B) Drop the Index IX_JISC_Stage_CaseTypeRecSeqSub

USE [mf_court]
GO

/****** Object:  Index [IX_JISC_Stage_CaseTypeRecSeqSub]    Script Date: 09/24/2013 11:43:15 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblJISC_Stage]') AND name = 
N'IX_JISC_Stage_CaseTypeRecSeqSub')
DROP INDEX [IX_JISC_Stage_CaseTypeRecSeqSub] ON [dbo].[tblJISC_Stage] WITH ( ONLINE = OFF )
GO

c)  Drop the column

Alter Table dbo.tblJISC_Stage
 drop column CaseNo

D) Readd the Column


Alter table dbo.tblJISC_Stage
Add CaseNo AS (left(replace(substring([RawText],(32),(9)),'-',''),(9)))

E) Recreate the Index for IX_JISC_Stage_CaseTypeRecSeqSub


USE [mf_court]
GO

SET ARITHABORT ON
GO

SET CONCAT_NULL_YIELDS_NULL ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_WARNINGS ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

/****** Object:  Index [IX_JISC_Stage_CaseTypeRecSeqSub]    Script Date: 09/24/2013 11:43:49 ******/
CREATE NONCLUSTERED INDEX [IX_JISC_Stage_CaseTypeRecSeqSub] ON [dbo].[tblJISC_Stage] 
(
	[CaseNo] ASC,
	[RecordType] ASC,
	[RecordNum] ASC,
	[SeqNum] ASC,
	[SeqSub] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = 
OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


F) Recreate the Index for IX_JISC_Stage_CaseTypeRecSeq

USE [mf_court]
GO

SET ARITHABORT ON
GO

SET CONCAT_NULL_YIELDS_NULL ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_WARNINGS ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

/****** Object:  Index [IX_JISC_Stage_CaseTypeRecSeq]    Script Date: 09/24/2013 11:43:45 ******/
CREATE NONCLUSTERED INDEX [IX_JISC_Stage_CaseTypeRecSeq] ON [dbo].[tblJISC_Stage] 
(
	[CaseNo] ASC,
	[RecordType] ASC,
	[RecordNum] ASC,
	[SeqNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = 
OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


9) Alter the table dbo.tblWarrantComments

A) Drop the Index IX_WarrantComments_CaseNo

USE [mf_court]
GO

/****** Object:  Index [IX_WarrantComments_CaseNo]    Script Date: 09/24/2013 11:52:35 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblWarrantComments]') AND name = 
N'IX_WarrantComments_CaseNo')
DROP INDEX [IX_WarrantComments_CaseNo] ON [dbo].[tblWarrantComments] WITH ( ONLINE = OFF )
GO

B) Drop the Index IX_WarrantComments_CaseRecSeqDate

USE [mf_court]
GO

/****** Object:  Index [IX_WarrantComments_CaseRecSeqDate]    Script Date: 09/24/2013 11:53:27 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblWarrantComments]') AND name = 
N'IX_WarrantComments_CaseRecSeqDate')
DROP INDEX [IX_WarrantComments_CaseRecSeqDate] ON [dbo].[tblWarrantComments] WITH ( ONLINE = OFF )
GO

c) Alter table 

Alter table dbo.tblWarrantComments
Alter column CaseNo Varchar(9) 

D) Readding the Index  IX_WarrantComments_CaseNo

USE [mf_court]
GO

/****** Object:  Index [IX_WarrantComments_CaseNo]    Script Date: 09/24/2013 11:54:10 ******/
CREATE NONCLUSTERED INDEX [IX_WarrantComments_CaseNo] ON [dbo].[tblWarrantComments] 
(
	[CaseNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = 
OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

E) Readding the Index IX_WarrantComments_CaseRecSeqDate

USE [mf_court]
GO

/****** Object:  Index [IX_WarrantComments_CaseRecSeqDate]    Script Date: 09/24/2013 11:54:41 ******/
CREATE NONCLUSTERED INDEX [IX_WarrantComments_CaseRecSeqDate] ON [dbo].[tblWarrantComments] 
(
	[CaseNo] ASC,
	[RecNum] ASC,
	[SeqNum] ASC,
	[DateKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = 
OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


10) Alter table dbo.tblBondSets

Alter table dbo.tblBondSets
Alter Column CaseNo Varchar(9)


11)Alter table dbo.tblAttorneyRecs

Alter table dbo.tblAttorneyRecs
Alter Column CaseNo Varchar(9)


12) Alter table dbo.tblCourtSettings

Alter table dbo.tblCourtSettings
Alter Column CaseNo Varchar(9)

13) Alter table dbo.tblMentalIllness

Alter table dbo.tblMentalIllness
Alter Column CaseNo VarChar(9)


14) Alter table dbo.tblCourtComments
Alter table dbo.tblCourtComments
Alter Column CaseNo VarChar(9)


15) Alter table dbo.tblMotions

Alter table dbo.tblMotions
Alter Column CaseNo VarChar(9)

16) dbo.tblSpecialConditions

Alter table dbo.tblSpecialConditions
Alter Column CaseNo VarChar(9)

17) dbo.tblSentences

Alter table dbo.tblSentences
Alter Column CaseNo VarChar(9)

18)dbo.tblProbations

Alter table dbo.tblProbations
Alter Column CaseNo VarChar(9)

19)dbo.tblAppeals

Alter table dbo.tblAppeals
Alter Column CaseNo VarChar(9)


20)dbo.tblAppealComments

Alter table dbo.tblAppealComments
Alter Column CaseNo VarChar(9)


21) Altering table tblCourtRec

Alter table dbo.tblCourtRec
Alter column CaseNo Varchar(9) Not Null

22) dbo.tblCJIS_ArrestRef

Alter table dbo.tblCJIS_ArrestRef
Alter column CaseNo Varchar(9) 

23) Add Column CaseType in dbo.tblCJIS

Alter table dbo.tblCJIS
Add  CaseType VarChar(2) 