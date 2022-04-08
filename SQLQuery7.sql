USE [HRIS]
GO

/****** Object:  StoredProcedure [dbo].[REPORT_ATTENDANCE_LACTY2_V3]    Script Date: 2022/02/07 PM 01:04:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[REPORT_ATTENDANCE_LACTY2_V3] (@CHECKDAY DATE,@DEPARTMENT VARCHAR(100))
AS 
BEGIN

IF OBJECT_ID('Tempdb..#Basic_CheckAt_Table_V3') IS NOT NULL DROP TABLE #Basic_CheckAt_Table_V3
SELECT *  INTO #Basic_CheckAt_Table_V3 FROM(
select 
PS.Person_ID,
Person_Name,
Department_ID,
ProducOrNot Dr_InDr,
ISNULL( Shift_ID,'CHC') SHIFTKEY ,
ISNULL( Start_Time,(SELECT Start_Time 
                    FROM Data_Shift 
                    where Shift_Serial_Key='S0006'))Start_Time,
CASE WHEN (SELECT COUNT(*)
			FROM Rec_Check_In_Out 
           WHERE YEAR( Check_Time)=YEAR(@CHECKDAY) 
           AND MONTH(Check_Time)=MONTH(@CHECKDAY) 
           AND DAY(Check_Time)=DAY(@CHECKDAY) 
           AND Magneticcard_ID=Card_Number )>0 THEN 'C' ELSE 'K' END  Att_Abs,
	'PART1' SHIFT_NOTE
	,PER_DETAIL.Youth_Union_Place
	,PER_DETAIL.Position_NAME
	,(CASE WHEN PER_DETAIL.Position_NAME =N'CÔNG NHÂN' AND PER_DETAIL.Youth_Union_Place NOT IN (N'VÒNG NGOÀI',N'giao nhận',N'Sắp việc') THEN  'DERECT' ELSE 'INDERECT' END ) TYPESS	
--INTO #Basic_CheckAt_Table
from Data_Person PS 
LEFT JOIN Data_Department DP ON PS.Department_Serial_Key=DP.Department_Serial_Key  
LEFT JOIN Data_Shift_Register DS on PS.Person_Serial_Key=DS.Person_Serial_Key  AND @CHECKDAY BETWEEN Shift_From_Date AND Shift_To_Date 
left join Data_Shift DSt on DS.Shift_Serial_Key=DSt.Shift_Serial_Key
LEFT JOIN (SELECT DP.Person_Serial_Key ,DP.Person_ID, DP.Youth_Union_Place, DP2.Position_NAME
FROM DATA_PERSON_DETAIL DP
LEFT JOIN Data_Position AS dp2 ON DP2.Position_ID=DP.Position_ID) PER_DETAIL ON PER_DETAIL.Person_Serial_Key=PS.Person_Serial_Key
where Date_Work_End>@CHECKDAY 
AND PS.Department_Serial_Key NOT IN (SELECT Department_Serial_Key 
                                     FROM Data_Department
                                     WHERE Department_ID IN ('TYXUAN', 'CGLACTY', 'LACTY', 'LTY2', 'TRACKING T10', 'TRACKING T11', 'TRACKING T12', 'TRACKING', 'CG_TV', 'LYH','NVMOI','BLD_CONGTY','BLD_XUONG','CHUYENGIA')) 
AND ( DATEPART(HOUR, Start_Time)<9 OR Start_Time IS NULL)

UNION ALL
select 
PS.Person_ID,
Person_Name,
Department_ID,
ProducOrNot Dr_InDr,
ISNULL( Shift_ID,'CHC') SHIFTKEY ,
ISNULL( Start_Time,(SELECT Start_Time 
                    FROM Data_Shift 
                    where Shift_Serial_Key='S0006'))Start_Time,
CASE WHEN (SELECT COUNT(*) 
           FROM Rec_Check_In_Out 
           WHERE YEAR( Check_Time)=YEAR(@CHECKDAY) 
           AND MONTH(Check_Time)=MONTH(@CHECKDAY) 
           AND DAY(Check_Time)=DAY(@CHECKDAY)-1 
           AND Magneticcard_ID=Card_Number )>0 THEN 'C' ELSE 'K' END  Att_Abs ,
'PART2' SHIFT_NOTE
,PER_DETAIL.Youth_Union_Place
	,PER_DETAIL.Position_NAME
	,(CASE WHEN PER_DETAIL.Position_NAME =N'CÔNG NHÂN' AND PER_DETAIL.Youth_Union_Place NOT IN (N'VÒNG NGOÀI',N'giao nhận',N'Sắp việc') THEN  'DERECT' ELSE 'INDERECT' END ) TYPESS
--INTO #Basic_CheckAt_Table
from Data_Person PS 
LEFT JOIN Data_Department DP ON PS.Department_Serial_Key=DP.Department_Serial_Key  
LEFT JOIN Data_Shift_Register DS on PS.Person_Serial_Key=DS.Person_Serial_Key  AND @CHECKDAY BETWEEN Shift_From_Date AND Shift_To_Date 
left join Data_Shift DSt on DS.Shift_Serial_Key=DSt.Shift_Serial_Key
LEFT JOIN (SELECT DP.Person_Serial_Key ,DP.Person_ID, DP.Youth_Union_Place, DP2.Position_NAME
FROM DATA_PERSON_DETAIL DP
LEFT JOIN Data_Position AS dp2 ON DP2.Position_ID=DP.Position_ID) PER_DETAIL ON PER_DETAIL.Person_Serial_Key=PS.Person_Serial_Key
where Date_Work_End>@CHECKDAY 
AND PS.Department_Serial_Key NOT IN (SELECT Department_Serial_Key 
                                     FROM Data_Department 
                                     WHERE Department_ID IN ('TYXUAN', 'CGLACTY', 'LACTY', 'LTY2', 'TRACKING T10', 'TRACKING T11', 'TRACKING T12', 'TRACKING', 'CG_TV', 'LYH','NVMOI','BLD_CONGTY','BLD_XUONG','CHUYENGIA')) 
AND ( DATEPART(HOUR, Start_Time)>=9 AND DATEPART(HOUR, Start_Time)<18 )

UNION ALL
select 
PS.Person_ID,
Person_Name,
Department_ID,
ProducOrNot Dr_InDr,
ISNULL( Shift_ID,'CHC') SHIFTKEY ,
ISNULL( Start_Time,(SELECT Start_Time 
                    FROM Data_Shift 
                    where Shift_Serial_Key='S0006'))Start_Time,
CASE WHEN (SELECT COUNT(*) 
           FROM Rec_Check_In_Out 
           WHERE YEAR( Check_Time)=YEAR(@CHECKDAY) 
           AND MONTH(Check_Time)=MONTH(@CHECKDAY) 
           AND DAY(Check_Time)=DAY(@CHECKDAY)-1 
           AND DATEPART(HOUR,Check_Time)>=18 
           AND Magneticcard_ID=Card_Number  )>0 THEN 'C' ELSE 'K' END  Att_Abs,
'PART3' SHIFT_NOTE
,PER_DETAIL.Youth_Union_Place
	,PER_DETAIL.Position_NAME
	,(CASE WHEN PER_DETAIL.Position_NAME =N'CÔNG NHÂN' AND PER_DETAIL.Youth_Union_Place NOT IN (N'VÒNG NGOÀI',N'giao nhận',N'Sắp việc') THEN  'DERECT' ELSE 'INDERECT' END ) TYPESS
--INTO #Basic_CheckAt_Table
from Data_Person PS 
LEFT JOIN Data_Department DP ON PS.Department_Serial_Key=DP.Department_Serial_Key  
LEFT JOIN Data_Shift_Register DS on PS.Person_Serial_Key=DS.Person_Serial_Key  AND @CHECKDAY BETWEEN Shift_From_Date AND Shift_To_Date 
left join Data_Shift DSt on DS.Shift_Serial_Key=DSt.Shift_Serial_Key
LEFT JOIN (SELECT DP.Person_Serial_Key ,DP.Person_ID, DP.Youth_Union_Place, DP2.Position_NAME
FROM DATA_PERSON_DETAIL DP
LEFT JOIN Data_Position AS dp2 ON DP2.Position_ID=DP.Position_ID) PER_DETAIL ON PER_DETAIL.Person_Serial_Key=PS.Person_Serial_Key
where Date_Work_End>@CHECKDAY 
AND PS.Department_Serial_Key NOT IN (SELECT Department_Serial_Key 
                                     FROM Data_Department 
                                     WHERE Department_ID IN ('TYXUAN', 'CGLACTY', 'LACTY', 'LTY2', 'TRACKING T10', 'TRACKING T11', 'TRACKING T12', 'TRACKING', 'CG_TV', 'LYH','NVMOI','BLD_CONGTY','BLD_XUONG','CHUYENGIA')) 
AND ( DATEPART(HOUR, Start_Time)>=18 )
) A

IF OBJECT_ID('Tempdb..#CheckAt_Department_Table_V3') IS NOT NULL DROP TABLE #CheckAt_Department_Table_V3
SELECT  Department_ID,COUNT(Person_ID) Total_Emp   
INTO #CheckAt_Department_Table_V3
FROM #Basic_CheckAt_Table_V3 GROUP BY Department_ID

IF OBJECT_ID('Tempdb..#CheckAt_Detail_Table_V3') IS NOT NULL DROP TABLE #CheckAt_Detail_Table_V3
select 
Department_ID,
CONVERT(decimal(10,2), Total_Emp) Total_Emp, 
CONVERT(decimal(10,2), (SELECT COUNT(*) FROM #Basic_CheckAt_Table_V3 BS WHERE BS.Department_ID=CD.Department_ID AND Att_Abs='C' )) AT_ALL,
CONVERT(decimal(10,2), (SELECT COUNT(*) FROM #Basic_CheckAt_Table_V3 BS WHERE BS.Department_ID=CD.Department_ID AND Att_Abs='C' AND TYPESS='DERECT' )) AT_DR,
CONVERT(decimal(10,2),(SELECT COUNT(*) FROM #Basic_CheckAt_Table_V3 BS WHERE BS.Department_ID=CD.Department_ID AND Att_Abs='C' AND TYPESS='INDERECT' )) AT_IN_DR,
CONVERT(decimal(10,2),(SELECT COUNT(*) FROM #Basic_CheckAt_Table_V3 BS WHERE BS.Department_ID=CD.Department_ID AND Att_Abs='K' )) AB_ALL,
CONVERT(decimal(10,2),(SELECT COUNT(*) FROM #Basic_CheckAt_Table_V3 BS WHERE BS.Department_ID=CD.Department_ID AND Att_Abs='K' AND TYPESS='DERECT' )) AB_DR,
CONVERT(decimal(10,2),(SELECT COUNT(*) FROM #Basic_CheckAt_Table_V3 BS WHERE BS.Department_ID=CD.Department_ID AND Att_Abs='K' AND TYPESS='INDERECT' )) AB_IN_DR
INTO #CheckAt_Detail_Table_V3
FROM  #CheckAt_Department_Table_V3 CD

DECLARE @SQLTEXT varchar(max)='

SELECT ''TOTAL_ALL'' DEPARTMENT_ID, 
CONVERT(numeric(8,0), SUM(Total_Emp)) TOTAL_EMPLOYEE,
CONVERT (numeric(8,0), SUM(AT_ALL)) AT_ALL,
CONVERT (decimal(5,2), SUM(AT_ALL)/SUM(Total_Emp)*100) PERCENT_AT_ALL, 
CONVERT (numeric(8,0), SUM(AT_DR)) AT_DR,
CONVERT (decimal(5,2), SUM(AT_DR)/SUM(Total_Emp)*100) PERCENT_AT_DR ,
CONVERT (numeric(8,0), SUM(AT_IN_DR)) AT_IN_DR,
CONVERT (decimal(5,2), SUM(AT_IN_DR)/SUM(Total_Emp)*100) PERCENT_AT_IN_DR ,
CONVERT (numeric(8,0), SUM(AB_ALL)) AB_ALL,
CONVERT (decimal(5,2), SUM(AB_ALL)/SUM(Total_Emp)*100) PERCENT_AB_ALL, 
CONVERT (numeric(8,0), SUM(AB_DR)) AB_DR,
CONVERT (decimal(5,2), SUM(AB_DR)/SUM(Total_Emp)*100) PERCENT_AB_DR ,
CONVERT (numeric(8,0), SUM(AB_IN_DR)) AB_IN_DR,
CONVERT (decimal(5,2), SUM(AB_IN_DR)/SUM(Total_Emp)*100) PERCENT_AB_IN_DR 
FROM #CheckAt_Detail_Table_V3 

UNION ALL

SELECT 
DEPARTMENT_ID,
CONVERT(numeric(8,0), Total_Emp)TOTAL_EMPLOYEE,
CONVERT(numeric(8,0), AT_ALL)AT_ALL,
CONVERT(decimal(5,2), AT_ALL/Total_Emp*100)  PERCENT_AT_ALL,
CONVERT(numeric(8,0), AT_DR)AT_DR,
CONVERT(decimal(5,2), AT_DR/Total_Emp*100)  PERCENT_AT_DR,
CONVERT(numeric(8,0), AT_IN_DR)AT_IN_DR,
CONVERT(decimal(5,2), AT_IN_DR/Total_Emp*100)  PERCENT_AT_IN_DR,
CONVERT(numeric(8,0), AB_ALL)AB_ALL,
CONVERT(decimal(5,2), AB_ALL/Total_Emp*100)  PERCENT_AB_ALL,
CONVERT(numeric(8,0), AB_DR)AB_DR,
CONVERT(decimal(5,2), AB_DR/Total_Emp*100)  PERCENT_AB_DR,
CONVERT(numeric(8,0), AB_IN_DR)AB_IN_DR,
CONVERT(decimal(5,2), AB_IN_DR/Total_Emp*100)  PERCENT_AB_IN_DR
FROM #CheckAt_Detail_Table_V3 '

IF(@DEPARTMENT<>'')BEGIN SET  @SQLTEXT=@SQLTEXT+' WHERE DEPARTMENT_ID='''+@DEPARTMENT+'''' END

EXEC(@SQLTEXT)

END


GO


