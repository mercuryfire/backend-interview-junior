-- =============================================
-- 建立資料庫 Myoffice_ACPD
-- =============================================
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Myoffice_ACPD')
BEGIN
    CREATE DATABASE [Myoffice_ACPD]
END
GO

USE [Myoffice_ACPD]
GO
/****** Object:  Table [dbo].[MyOffice_ACPD]    Script Date: 2024/12/18 �W�� 11:24:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MyOffice_ACPD](
	[ACPD_SID] [char](20) NOT NULL,
	[ACPD_Cname] [nvarchar](60) NULL,
	[ACPD_Ename] [nvarchar](40) NULL,
	[ACPD_Sname] [nvarchar](40) NULL,
	[ACPD_Email] [nvarchar](60) NULL,
	[ACPD_Status] [tinyint] NULL,
	[ACPD_Stop] [bit] NULL,
	[ACPD_StopMemo] [nvarchar](60) NULL,
	[ACPD_LoginID] [nvarchar](30) NULL,
	[ACPD_LoginPWD] [nvarchar](60) NULL,
	[ACPD_Memo] [nvarchar](600) NULL,
	[ACPD_NowDateTime] [datetime] NULL,
	[ACPD_NowID] [nvarchar](20) NULL,
	[ACPD_UPDDateTime] [datetime] NULL,
	[ACPD_UPDID] [nvarchar](20) NULL,
 CONSTRAINT [PK_MyOffice_ACPD] PRIMARY KEY CLUSTERED 
(
	[ACPD_SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MyOffice_ACPD] ADD  CONSTRAINT [DF_MyOffice_ACPD_acpd_status]  DEFAULT ((0)) FOR [ACPD_Status]
GO

ALTER TABLE [dbo].[MyOffice_ACPD] ADD  CONSTRAINT [DF_MyOffice_ACPD_acpd_stop]  DEFAULT ((0)) FOR [ACPD_Stop]
GO

ALTER TABLE [dbo].[MyOffice_ACPD] ADD  CONSTRAINT [DF_MyOffice_ACPD_acpd_nowdatetime]  DEFAULT (getdate()) FOR [ACPD_NowDateTime]
GO

ALTER TABLE [dbo].[MyOffice_ACPD] ADD  CONSTRAINT [DF_MyOffice_ACPD_acpd_upddatetime]  DEFAULT (getdate()) FOR [ACPD_UPDDateTime]
GO


-- =============================================
-- 插入測試資料
-- =============================================

-- 測試資料1: 正常狀態用戶
INSERT INTO [dbo].[MyOffice_ACPD] (
    ACPD_SID, ACPD_Cname, ACPD_Ename, ACPD_Sname, ACPD_Email, 
    ACPD_Status, ACPD_Stop, ACPD_LoginID, ACPD_LoginPWD, 
    ACPD_Memo, ACPD_NowID, ACPD_UPDID
)
VALUES (
    'A0001001000000000001', N'王小明', N'Wang Ming', N'小明', N'wangming@example.com',
    0, 0, N'wangming', N'Password123!', 
    N'正常狀態的一般用戶', N'SYSTEM', N'SYSTEM'
)

-- 測試資料2: VIP用戶 (Status=1)
INSERT INTO [dbo].[MyOffice_ACPD] (
    ACPD_SID, ACPD_Cname, ACPD_Ename, ACPD_Sname, ACPD_Email, 
    ACPD_Status, ACPD_Stop, ACPD_LoginID, ACPD_LoginPWD, 
    ACPD_Memo, ACPD_NowID, ACPD_UPDID
)
VALUES (
    'A0001001000000000002', N'李美麗', N'Lee Beauty', N'美麗', N'leebeauty@example.com',
    1, 0, N'leebeauty', N'VipPass456!', 
    N'VIP會員，享有進階功能', N'SYSTEM', N'SYSTEM'
)

-- 測試資料3: 管理員用戶 (Status=2)
INSERT INTO [dbo].[MyOffice_ACPD] (
    ACPD_SID, ACPD_Cname, ACPD_Ename, ACPD_Sname, ACPD_Email, 
    ACPD_Status, ACPD_Stop, ACPD_LoginID, ACPD_LoginPWD, 
    ACPD_Memo, ACPD_NowID, ACPD_UPDID
)
VALUES (
    'A0001001000000000003', N'陳管理', N'Chen Admin', N'管理', N'admin@example.com',
    2, 0, N'admin', N'Admin789!', 
    N'系統管理員帳號', N'SYSTEM', N'SYSTEM'
)

-- 測試資料4: 已停用用戶 - 主動停用
INSERT INTO [dbo].[MyOffice_ACPD] (
    ACPD_SID, ACPD_Cname, ACPD_Ename, ACPD_Sname, ACPD_Email, 
    ACPD_Status, ACPD_Stop, ACPD_StopMemo, ACPD_LoginID, ACPD_LoginPWD, 
    ACPD_Memo, ACPD_NowID, ACPD_UPDID
)
VALUES (
    'A0001001000000000004', N'張三', N'Zhang San', N'三哥', N'zhangsan@example.com',
    0, 1, N'用戶主動申請停用', N'zhangsan', N'Pass123!', 
    N'已停用的帳號 - 主動停用', N'SYSTEM', N'ADMIN001'
)

-- 測試資料5: 已停用用戶 - 違規停用
INSERT INTO [dbo].[MyOffice_ACPD] (
    ACPD_SID, ACPD_Cname, ACPD_Ename, ACPD_Sname, ACPD_Email, 
    ACPD_Status, ACPD_Stop, ACPD_StopMemo, ACPD_LoginID, ACPD_LoginPWD, 
    ACPD_Memo, ACPD_NowID, ACPD_UPDID
)
VALUES (
    'A0001001000000000005', N'趙四', N'Zhao Si', N'四爺', N'zhaosi@example.com',
    0, 1, N'違反使用條款，強制停用', N'zhaosi', N'Pass456!', 
    N'因違規行為被停用', N'SYSTEM', N'ADMIN001'
)

-- 測試資料6: 待審核用戶 (Status=3)
INSERT INTO [dbo].[MyOffice_ACPD] (
    ACPD_SID, ACPD_Cname, ACPD_Ename, ACPD_Sname, ACPD_Email, 
    ACPD_Status, ACPD_Stop, ACPD_LoginID, ACPD_LoginPWD, 
    ACPD_Memo, ACPD_NowID, ACPD_UPDID
)
VALUES (
    'A0001001000000000006', N'劉五', N'Liu Wu', N'阿五', N'liuwu@example.com',
    3, 0, N'liuwu', N'Pending789!', 
    N'待審核狀態，等待管理員確認', N'SYSTEM', N'SYSTEM'
)

-- 測試資料7: 測試帳號
INSERT INTO [dbo].[MyOffice_ACPD] (
    ACPD_SID, ACPD_Cname, ACPD_Ename, ACPD_Sname, ACPD_Email, 
    ACPD_Status, ACPD_Stop, ACPD_LoginID, ACPD_LoginPWD, 
    ACPD_Memo, ACPD_NowID, ACPD_UPDID
)
VALUES (
    'A0001001000000000007', N'測試用戶', N'Test User', N'測試', N'testuser@example.com',
    0, 0, N'testuser', N'Test123!', 
    N'用於系統測試的帳號', N'SYSTEM', N'SYSTEM'
)

-- 測試資料8: 停用的測試帳號
INSERT INTO [dbo].[MyOffice_ACPD] (
    ACPD_SID, ACPD_Cname, ACPD_Ename, ACPD_Sname, ACPD_Email, 
    ACPD_Status, ACPD_Stop, ACPD_StopMemo, ACPD_LoginID, ACPD_LoginPWD, 
    ACPD_Memo, ACPD_NowID, ACPD_UPDID
)
VALUES (
    'A0001001000000000008', N'停用測試', N'Stop Test', N'停測', N'stoptest@example.com',
    0, 1, N'測試完成後停用', N'stoptest', N'StopTest123!', 
    N'已停用的測試帳號', N'SYSTEM', N'ADMIN001'
)

-- 測試資料9: 進階用戶
INSERT INTO [dbo].[MyOffice_ACPD] (
    ACPD_SID, ACPD_Cname, ACPD_Ename, ACPD_Sname, ACPD_Email, 
    ACPD_Status, ACPD_Stop, ACPD_LoginID, ACPD_LoginPWD, 
    ACPD_Memo, ACPD_NowID, ACPD_UPDID
)
VALUES (
    'A0001001000000000009', N'周進階', N'Zhou Advanced', N'進階', N'advanced@example.com',
    1, 0, N'advanced', N'Advanced123!', 
    N'進階用戶，可使用額外功能', N'SYSTEM', N'SYSTEM'
)

-- 測試資料10: 一般用戶
INSERT INTO [dbo].[MyOffice_ACPD] (
    ACPD_SID, ACPD_Cname, ACPD_Ename, ACPD_Sname, ACPD_Email, 
    ACPD_Status, ACPD_Stop, ACPD_LoginID, ACPD_LoginPWD, 
    ACPD_Memo, ACPD_NowID, ACPD_UPDID
)
VALUES (
    'A0001001000000000010', N'吳普通', N'Wu Normal', N'普通', N'normal@example.com',
    0, 0, N'normal', N'Normal123!', 
    N'一般用戶帳號', N'SYSTEM', N'SYSTEM'
)

GO

-- =============================================
-- 查詢所有測試資料，驗證插入是否成功
-- =============================================
SELECT 
    ACPD_SID AS '帳號ID',
    ACPD_Cname AS '中文姓名',
    ACPD_Ename AS '英文姓名',
    ACPD_Email AS '電子郵件',
    ACPD_Status AS '狀態',
    ACPD_Stop AS '停用',
    ACPD_StopMemo AS '停用原因',
    ACPD_LoginID AS '登入帳號',
    ACPD_Memo AS '備註'
FROM [dbo].[MyOffice_ACPD]
ORDER BY ACPD_SID
GO