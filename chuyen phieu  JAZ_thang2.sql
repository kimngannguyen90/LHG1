SELECT * FROM kcrk WHERE rkno IN ('20220200086','20220200087','20220200088','20220200089')
SELECT * FROM kcrks WHERE rkno IN ('20220200086','20220200087','20220200088','20220200089')
SELECT * FROM kcrk WHERE rkno IN ('20220200005','20220200069','20220200070')
SELECT * FROM kcrks WHERE rkno IN ('20220200005','20220200069','20220200070')

SELECT * FROM kcrks WHERE rkno='20220200005'  AND clbh IN ('Z202038341','Z202038342','Z202038343','Z202038344')
UPDATE kcrks SET RKNO = '20220200087' WHERE rkno='20220200005'  AND clbh IN ('Z202038341','Z202038342','Z202038343','Z202038344')
UPDATE kcrks_hg SET RKNO = '20220200087' WHERE rkno='20220200005'  AND clbh IN ('Z202038341','Z202038342','Z202038343','Z202038344')
UPDATE kcllsss SET RKNO = '20220200087' WHERE rkno='20220200005'  AND clbh IN ('Z202038341','Z202038342','Z202038343','Z202038344')
INSERT INTO kcrk
SELECT '20220200090'RKNO,	GSBH,	CKBH,	ZSBH,	ZSNO,	DOCNO,	USERID,	USERDATE,	CFMID,	CFMDATE,	YN,	SB,	SampleExPrint,	
EX_ACC_CFMID,	EX_ACC_CFMDATE,	QCID,	QCDATE,	MEMO,	PurConfirm,	Payment,	Charge,	Charge_VN,	Charge_Reason,	HGLB,	Declaration	, VATNO
--20220200069	JAZ	JAZ	KL01	20220200028	NULL	00236	2022-02-25 00:00:00	THANH	2022-03-01 07:52:00	5	1	NULL	NULL	NULL	OK	2022-02-25 00:00:00	NULL	NULL	Right Source	NULL	NULL	NULL	HD	NULL	NULL 
FROM kcrk WHERE rkno='20220200069'

INSERT INTO kcrk
SELECT '20220200091'RKNO,	GSBH,	CKBH,	ZSBH,	ZSNO,	DOCNO,	USERID,	USERDATE,	CFMID,	CFMDATE,	YN,	SB,	SampleExPrint,	
EX_ACC_CFMID,	EX_ACC_CFMDATE,	QCID,	QCDATE,	MEMO,	PurConfirm,	Payment,	Charge,	Charge_VN,	Charge_Reason,	HGLB,	Declaration	, VATNO
--20220200069	JAZ	JAZ	KL01	20220200028	NULL	00236	2022-02-25 00:00:00	THANH	2022-03-01 07:52:00	5	1	NULL	NULL	NULL	OK	2022-02-25 00:00:00	NULL	NULL	Right Source	NULL	NULL	NULL	HD	NULL	NULL 
FROM kcrk WHERE rkno='20220200070'INSERT INTO kcrk


INSERT INTO kcrk
SELECT '20220200092'RKNO,	GSBH,	CKBH,	ZSBH,	ZSNO,	DOCNO,	USERID,	USERDATE,	CFMID,	CFMDATE,	YN,	SB,	SampleExPrint,	
EX_ACC_CFMID,	EX_ACC_CFMDATE,	QCID,	QCDATE,	MEMO,	PurConfirm,	Payment,	Charge,	Charge_VN,	Charge_Reason,	HGLB,	Declaration	, VATNO
--20220200069	JAZ	JAZ	KL01	20220200028	NULL	00236	2022-02-25 00:00:00	THANH	2022-03-01 07:52:00	5	1	NULL	NULL	NULL	OK	2022-02-25 00:00:00	NULL	NULL	Right Source	NULL	NULL	NULL	HD	NULL	NULL 
FROM kcrk WHERE rkno='20220200041'


INSERT INTO kcrk
SELECT '20220200093'RKNO,	GSBH,	CKBH,	ZSBH,	ZSNO,	DOCNO,	USERID,	USERDATE,	CFMID,	CFMDATE,	YN,	SB,	SampleExPrint,	
EX_ACC_CFMID,	EX_ACC_CFMDATE,	QCID,	QCDATE,	MEMO,	PurConfirm,	Payment,	Charge,	Charge_VN,	Charge_Reason,	HGLB,	Declaration	, VATNO
--20220200069	JAZ	JAZ	KL01	20220200028	NULL	00236	2022-02-25 00:00:00	THANH	2022-03-01 07:52:00	5	1	NULL	NULL	NULL	OK	2022-02-25 00:00:00	NULL	NULL	Right Source	NULL	NULL	NULL	HD	NULL	NULL 
FROM kcrk WHERE rkno='20220200042'


INSERT INTO kcrk
SELECT '20220200094'RKNO,	GSBH,	CKBH,	ZSBH,	ZSNO,	DOCNO,	USERID,	USERDATE,	CFMID,	CFMDATE,	YN,	SB,	SampleExPrint,	
EX_ACC_CFMID,	EX_ACC_CFMDATE,	QCID,	QCDATE,	MEMO,	PurConfirm,	Payment,	Charge,	Charge_VN,	Charge_Reason,	HGLB,	Declaration	, VATNO
--20220200069	JAZ	JAZ	KL01	20220200028	NULL	00236	2022-02-25 00:00:00	THANH	2022-03-01 07:52:00	5	1	NULL	NULL	NULL	OK	2022-02-25 00:00:00	NULL	NULL	Right Source	NULL	NULL	NULL	HD	NULL	NULL 
FROM kcrk WHERE rkno='20220200068'

SELECT * FROM kcrks WHERE rkno ='20220200070' AND  clbh=''

UPDATE kcrks SET RKNO = '20220200090' WHERE rkno='20220200069'  AND clbh IN ('Z202038245')
UPDATE kcrks_hg SET RKNO = '20220200090' WHERE rkno='20220200069'  AND clbh IN ('Z202038245')
UPDATE kcllsss SET RKNO = '20220200090' WHERE rkno='20220200069'  AND clbh IN ('Z202038245')

UPDATE kcrks SET RKNO = '20220200091' WHERE rkno='20220200070'  AND clbh IN ('X104000001')
UPDATE kcrks_hg SET RKNO = '20220200091' WHERE rkno='20220200070'  AND clbh IN  ('X104000001')
UPDATE kcllsss SET RKNO = '20220200091' WHERE rkno='20220200070'  AND clbh IN  ('X104000001')



UPDATE kcrks SET RKNO = '20220200092' WHERE rkno='20220200041'  AND clbh IN ('Z202038295')
UPDATE kcrks_hg SET RKNO = '20220200092' WHERE rkno='20220200041'  AND clbh IN  ('Z202038295')
UPDATE kcllsss SET RKNO = '20220200092' WHERE rkno='20220200041'  AND clbh IN  ('Z202038295')


UPDATE kcrks SET RKNO = '20220200093' WHERE rkno='20220200042'  AND clbh IN ('Z202038295')
UPDATE kcrks_hg SET RKNO = '20220200093' WHERE rkno='20220200042'  AND clbh IN  ('Z202038295')
UPDATE kcllsss SET RKNO = '20220200093' WHERE rkno='20220200042'  AND clbh IN  ('Z202038295')

UPDATE kcrks SET RKNO = '20220200094' WHERE rkno='20220200068'  AND clbh IN ('Z202038245')
UPDATE kcrks_hg SET RKNO = '20220200094' WHERE rkno='20220200068'  AND clbh IN  ('Z202038245')
UPDATE kcllsss SET RKNO = '20220200094' WHERE rkno='20220200068'  AND clbh IN  ('Z202038245')



UPDATE kcrk SET RKNO = '20220200095',USERDATE = '2022/02/25' WHERE rkno='20220300001'  
UPDATE kcrks SET RKNO = '20220200095',USERDATE = '2022/02/25' WHERE rkno='20220300001'  
UPDATE kcrks_hg SET RKNO = '20220200095',USERDATE = '2022/02/25' WHERE rkno='20220300001' 
UPDATE kcllsss SET RKNO = '20220200095',USERDATE = '2022/02/25' WHERE rkno='20220300001' 



SELECT * FROM kcrk WHERE rkno ='20220300001'
SELECT * FROM kcrks WHERE rkno ='20220200005'
SELECT * FROM kcrk WHERE rkno ='20220101041'

