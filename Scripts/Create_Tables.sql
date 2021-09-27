/* The below tables do not need updating for the report to run but should be checked for new information.
 * Inparticular check for updates to the sensitive ICD-10 codes in the concept library */

/*Create preparation tables*/
	
CREATE TABLE SAILW0572V.VB_PEDW_EPS_2015ON_PRE AS
	(SELECT	sp.ALF_PE, 
			sp.ALF_STS_CD, 
			sp.PROV_UNIT_CD, 
			sp.SPELL_NUM_PE,
			sp.ADMIS_MTHD_CD,
			ep.DIAG_CD_123,
			ep.DIAG_CD_1234,
			ep.OPER_CD_123,
			ep.OPER_CD, 
			ep.EPI_STR_DT, 
			ep.EPI_END_DT, 
			ep.EPI_END_YR, 
			ep.EPI_NUM,
			ep.FINISHED_EPI_FLG,
			icd.CHAPTER_NUMBER,
			icd.CATEGORY_1_DESCRIPTION
		FROM	SAIL0572V.PEDW_SPELL_20210801 AS sp, 
				SAIL0572V.PEDW_EPISODE_20210801 AS ep,
				SAILUKHDV.ICD10_CODES_AND_TITLES_AND_METADATA_20210803 AS icd) WITH NO DATA;

ALTER TABLE SAILW0572V.VB_PEDW_EPS_2015ON_PRE
	ADD	COLUMN SPELL_ID VARCHAR(14)
	ADD COLUMN EPI_ID VARCHAR(16)
	ADD COLUMN EPI_END_MT INTEGER
	ADD COLUMN EPI_END_WK INTEGER
	ADD COLUMN OPER_INIT VARCHAR(1);

CREATE TABLE SAILW0572V.VB_PEDW_EPS_2015ON_ALF AS
	(SELECT	*
		FROM SAILW0572V.VB_PEDW_EPS_2015ON_PRE) WITH NO DATA;
	
CREATE TABLE SAILW0572V.VB_PEDW_EPS_2015ON_ALF_SICD AS
	(SELECT	*
		FROM SAILW0572V.VB_PEDW_EPS_2015ON_ALF) WITH NO DATA;
	
CREATE TABLE SAILW0572V.VB_PEDW_EPS_2015ON_ALF_SICD_OPCS AS
	(SELECT	*
		FROM SAILW0572V.VB_PEDW_EPS_2015ON_ALF_SICD) WITH NO DATA;
	
CREATE TABLE SAILW0572V.VB_PEDW_EPS_2015ON_ALF_SICD_OPCS_HB AS
	(SELECT	*
		FROM SAILW0572V.VB_PEDW_EPS_2015ON_ALF_SICD_OPCS) WITH NO DATA;

CREATE TABLE SAILW0572V.VB_PEDW_FIRST_REPORT_INSTANCE (
	EPI_ID VARCHAR(25),
	DIAG_CD VARCHAR(4SAILW0572VILABLE_FROM_DT DATE);

CREATE TABLE SAILW0572V.VB_PEDW_FIRST_REPORT_INSTANCE_UNIQUE (
	EPI_ID VARCHAR(16),
	FIRST_REPORT_DT DATE);
	
/* Create table ICD-10 first recorded date NOTE THAT THIS WILL IDENTIFY THE FIRST REPORT WHERE A PRIMARY DIAG CODE WAS ADDED AND NOT IF IT HAD CHANGED*/
	
CREATE TABLE SAILW0572V.VB_PEDW_FIRST_ICD_INSTANCE (
	EPI_ID VARCHAR(25),
	DIAG_CD VARCHAR(4),
	AVAILABLE_FROM_DT DATE);

CREATE TABLE SAILW0572V.VB_PEDW_FIRST_ICD_INSTANCE_UNIQUE (
	EPI_ID VARCHAR(16),
	FIRST_ICD_DT DATE);

/* Create table OPCS-4 first recorded date NOTE THAT THIS WILL IDENTIFY THE FIRST REPORT WHERE A PRIMARY OPER CODE WAS ADDED AND NOT IF IT HAD CHANGED*/
		
CREATE TABLE SAILW0572V.VB_PEDW_FIRST_OPCS_INSTANCE (
	EPI_ID VARCHAR(25),
	OPER_CD VARCHAR(4),
	AVAILABLE_FROM_DT DATE);

CREATE TABLE SAILW0572V.VB_PEDW_FIRST_OPCS_INSTANCE_UNIQUE (
	EPI_ID VARCHAR(16),
	FIRST_OPCS_DT DATE);
											
/* health board table creation */
					
CREATE TABLE SAILW0572V.VB_HEALTH_BOARDS (
	PROV_UNIT_CD VARCHAR(3),
	HEALTH_BOARD VARCHAR(25);
					
INSERT INTO SAILW0572V.VB_HEALTH_BOARDS VALUES 
	('7A1','Betsi Cadwaladr'),
	('7A2','Hywel Dda'),
	('7A3','Abertawe Bro Morgannwg'),
	('7A4','Cardiff & Vale'),
	('7A5','Cwm Taf'),
	('7A6','Aneurin Bevan'),
	('7A7','Powys')
	('RQF','Velindre NHS Trust');
					
/* CREATE Admissions GROUPING TABLE */

CREATE TABLE SAILW0572V.VB_ADMIS_MTHD_GROUPINGS (
	ADMIS_MTHD_CD VARCHAR (2),
	ADMIS_GROUP VARCHAR (50),
	ADMIS_TYPE VARCHAR (20));
					
INSERT INTO SAILW0572V.VB_ADMIS_MTHD_GROUPINGS VALUES 
	('11','Elective Admission Episodes', 'Waiting list'),
	('12','Elective Admission Episodes', 'Booked'),
	('13','Elective Admission Episodes', 'Planned'),
	('14','Elective Admission Episodes', 'Elective- Other'),
	('15','Elective Admission Episodes', 'Elective- Other'),
	('21','Emergency Admission Episodes', 'A & E'),
	('22','Emergency Admission Episodes', 'GP'),
	('23','Emergency Admission Episodes', 'Emergency - Other'),
	('24','Emergency Admission Episodes', 'Emergency - Other'),
	('25','Emergency Admission Episodes', 'Emergency - Other'),
	('27','Emergency Admission Episodes', 'Emergency - Other'),
	('28','Emergency Admission Episodes', 'Emergency - Other'),
	('31','Other Admission Episodes Including Maternity', 'Other'),
	('32','Other Admission Episodes Including Maternity', 'Other'),
	('81','Other Admission Episodes Including Maternity', 'Other'),
	('82','Other Admission Episodes Including Maternity', 'Other'),
	('83','Other Admission Episodes Including Maternity', 'Other'),
	('98','Other Admission Episodes Including Maternity', 'Other'),
	('99','Other Admission Episodes Including Maternity', 'Other');
	
 /* Create Sensitive ICD-10 codes list table from the concept library */

CREATE TABLE SAILW0572V.VB_SENSITIVE_ICD_CODES (
	code VARCHAR (10),
	description VARCHAR (150),
	coding_system VARCHAR (50),
	concept_id VARCHAR(10),
	concept_version_id VARCHAR(10),
	concept_name VARCHAR (100));

 /* Create Sensitive OPCS-4 codes list table from the concept library */
/*when updating with the latest version from the concept library must ensure decimals are removed from the OCDE column*/

CREATE TABLE SAILW0572V.VB_SENSITIVE_OPCS_CODES (
	code VARCHAR (10),
	description VARCHAR (150),
	coding_system VARCHAR (50),
	concept_id VARCHAR(10),
	concept_version_id VARCHAR(10),
	concept_name VARCHAR (100));
		
/* CREATE TABLE TO link LOCAL health board TO unitary authoritary */

CREATE TABLE SAILW0572V.VB_LHB_LOOKUP (
	LSOA_DESC VARCHAR (50),
	LHB VARCHAR (50));
	
INSERT INTO SAILW0572V.VB_LHB_LOOKUP VALUES 
	('Blaenau Gwent','Aneurin Bevan'),
	('Bridgend','Abertawe Bro Morgannwg'),
	('Caerphilly','Aneurin Bevan'),
	('Cardiff','Cardiff & Vale'),
	('Carmarthenshire','Hwyel Dda'),
	('Ceredigion','Hwyel Dda'),
	('Conwy','Betsi Cadwaladr'),
	('Denbighshire','Betsi Cadwaladr'),
	('Flintshire','Betsi Cadwaladr'),
	('Gwynedd','Betsi Cadwaladr'),
	('Isle of Anglesey','Betsi Cadwaladr'),
	('Merthyr Tydfil','Cwm Taf'),
	('Monmouthshire','Aneurin Bevan'),
	('Neath Port Talbot','Abertawe Bro Morgannwg'),
	('Newport','Aneurin Bevan'),
	('Pembrokeshire','Hwyel Dda'),
	('Powys','Powys'),
	('Rhondda Cynon Taf','Cwm Taf'),
	('Swansea','Abertawe Bro Morgannwg'),
	('Torfaen','Aneurin Bevan'),
	('Vale of Glamorgan','Cardiff & Vale'),
	('Wrexham','Betsi Cadwaladr');
