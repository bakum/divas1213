--------------------------------------------------------
--  DDL for Type DIVISIONTYPE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DIVISIONTYPE" AS OBJECT 
(n varchar2(50), u_name varchar2(1000))

/
--------------------------------------------------------
--  DDL for Type DIVISIONTABLE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DIVISIONTABLE" 
AS TABLE OF divisiontype;

/
--------------------------------------------------------
--  DDL for Type KONTRAGTYPE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "KONTRAGTYPE" as object 
(n varchar2(50), u_name varchar2(1000), root number)

/
--------------------------------------------------------
--  DDL for Type KONTRAGTABLE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "KONTRAGTABLE" 
AS TABLE OF kontragtype;

/
--------------------------------------------------------
--  DDL for Type ROW_BALLANS
--------------------------------------------------------

  CREATE OR REPLACE TYPE "ROW_BALLANS" as object 
( ID VARCHAR2(50 CHAR),
    CODE VARCHAR2(6 CHAR),
    FULLNAME VARCHAR2(3000 CHAR),
    ACTIVE_START NUMBER,
    ACTIVE_DEB NUMBER,
    ACTIVE_KRED NUMBER,
    ACTIVE_OBOROT NUMBER,
    ACTIVE_END NUMBER,
    PASSIVE_START NUMBER,
    PASSIVE_DEB NUMBER,
    PASSIVE_KRED NUMBER,
    PASSIVE_OBOROT NUMBER,
    PASSIVE_END NUMBER,
    DIVISION_ID VARCHAR2(50 CHAR)    
)

/
--------------------------------------------------------
--  DDL for Type ROW_RATING
--------------------------------------------------------

  CREATE OR REPLACE TYPE "ROW_RATING" as object 
(   PLACE NUMBER,
    DIVISION_ID VARCHAR2(50 CHAR),
    CNT NUMBER,
    TOTAL NUMBER,
    BALL_SUM NUMBER,
    BALL_CNT NUMBER,
    BALL_TOTAL NUMBER
)

/
--------------------------------------------------------
--  DDL for Type ROW_REFERENCE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "ROW_REFERENCE" as object 
(   TABLE_ID VARCHAR2(50),
    MAIN_ID VARCHAR2(50),
    TABLE_NAME VARCHAR2(30),
    COLUMN_NAME VARCHAR2(4000),
    CONSTRAINT_TYPE VARCHAR2(1)    
)

/
--------------------------------------------------------
--  DDL for Type ROW_SALES
--------------------------------------------------------

  CREATE OR REPLACE TYPE "ROW_SALES" as object 
( ORDER_ID VARCHAR2(50 CHAR),
    KONTRAG_ID VARCHAR2(50 CHAR),
    PERIOD DATE,
    DIVISION_ID VARCHAR2(50 CHAR),
    SALES_SUMMA NUMBER,
    FACT_SEBEST_SUMMA NUMBER,
    PLAN_SEBEST_SUMMA NUMBER
)

/
--------------------------------------------------------
--  DDL for Type ROW_TABLE_DELETED
--------------------------------------------------------

  CREATE OR REPLACE TYPE "ROW_TABLE_DELETED" as object 
(   TABLE_ID VARCHAR2(50),
    MAIN_ID VARCHAR2(50),
    TABLE_NAME VARCHAR2(30),
    COLUMN_NAME VARCHAR2(4000),
    CONSTRAINT_TYPE VARCHAR2(1),
    REF_STR VARCHAR2(4000)
)

/
--------------------------------------------------------
--  DDL for Type ROW_TABLE_REFERENCE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "ROW_TABLE_REFERENCE" as object 
(   TABLE_NAME VARCHAR2(30),
    CONSTRAINT_NAME VARCHAR2(30),
    COLUMN_NAME VARCHAR2(4000),
    R_TABLE_NAME VARCHAR2(30),
    POSITION NUMBER,
    CONSTRAINT_TYPE VARCHAR2(1)    
)

/
--------------------------------------------------------
--  DDL for Type ROW_ZATRATY
--------------------------------------------------------

  CREATE OR REPLACE TYPE "ROW_ZATRATY" as object 
( REGISTRATOR_ID VARCHAR2(50 CHAR),
    TABLE_NAME VARCHAR2(100 CHAR),
    CODE VARCHAR2(6 CHAR),
    SUMMA number,
    ZATRATY_ID varchar2(50 CHAR),
    ZATRATY_NAME varchar2(150 CHAR),
    DIVISION_ID varchar2(50 CHAR),
    PERIOD TIMESTAMP(6)
)

/
--------------------------------------------------------
--  DDL for Type TBL_BALLANS
--------------------------------------------------------

  CREATE OR REPLACE TYPE "TBL_BALLANS" 
AS TABLE OF row_ballans;

/
--------------------------------------------------------
--  DDL for Type TBL_DELETED
--------------------------------------------------------

  CREATE OR REPLACE TYPE "TBL_DELETED" 
AS TABLE OF row_table_deleted;

/
--------------------------------------------------------
--  DDL for Type TBL_DELETED_REF
--------------------------------------------------------

  CREATE OR REPLACE TYPE "TBL_DELETED_REF" 
AS TABLE OF row_table_deleted;

/
--------------------------------------------------------
--  DDL for Type TBL_RATING
--------------------------------------------------------

  CREATE OR REPLACE TYPE "TBL_RATING" 
AS TABLE OF row_rating;

/
--------------------------------------------------------
--  DDL for Type TBL_REFERENCE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "TBL_REFERENCE" 
AS TABLE OF ROW_TABLE_REFERENCE;

/
--------------------------------------------------------
--  DDL for Type TBL_REF_TAB
--------------------------------------------------------

  CREATE OR REPLACE TYPE "TBL_REF_TAB" 
AS TABLE OF row_reference;

/
--------------------------------------------------------
--  DDL for Type TBL_SALES
--------------------------------------------------------

  CREATE OR REPLACE TYPE "TBL_SALES" 
AS TABLE OF row_sales;

/
--------------------------------------------------------
--  DDL for Type TBL_ZATRATY
--------------------------------------------------------

  CREATE OR REPLACE TYPE "TBL_ZATRATY" 
AS TABLE OF row_zatraty;

/
--------------------------------------------------------
--  DDL for Type USERTYPE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "USERTYPE" as object 
(n varchar2(50), u_name varchar2(1000))

/
--------------------------------------------------------
--  DDL for Type USERTABLE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "USERTABLE" 
AS TABLE OF usertype;

/
--------------------------------------------------------
--  DDL for Sequence ORDERS_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ORDERS_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence OTHER_ZATR_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OTHER_ZATR_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence PKO_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PKO_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence PROFIT_DISTRIB_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROFIT_DISTRIB_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence PS_TXN_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PS_TXN_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 50 START WITH 264201 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RKO_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RKO_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence START_OST_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "START_OST_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Table ASTER_SETTINGS
--------------------------------------------------------

  CREATE TABLE "ASTER_SETTINGS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"SERVER" VARCHAR2(100 CHAR), 
	"LOGIN_AM" VARCHAR2(20 CHAR), 
	"PASS_AM" VARCHAR2(20 CHAR), 
	"CHANNEL" VARCHAR2(20 CHAR), 
	"CONTEXT" VARCHAR2(20 CHAR), 
	"PRIORITY" VARCHAR2(20 CHAR), 
	"PORT" VARCHAR2(20 CHAR)
   ) ;
 

   COMMENT ON TABLE "ASTER_SETTINGS"  IS 'Настройки Asterisk';
--------------------------------------------------------
--  DDL for Table BALLANS
--------------------------------------------------------

  CREATE TABLE "BALLANS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"CODE" VARCHAR2(6 CHAR), 
	"FULLNAME" VARCHAR2(3000 CHAR), 
	"ACTIVE_START" NUMBER, 
	"ACTIVE_DEB" NUMBER, 
	"ACTIVE_KRED" NUMBER, 
	"ACTIVE_OBOROT" NUMBER, 
	"ACTIVE_END" NUMBER, 
	"PASSIVE_START" NUMBER, 
	"PASSIVE_DEB" NUMBER, 
	"PASSIVE_KRED" NUMBER, 
	"PASSIVE_OBOROT" NUMBER, 
	"PASSIVE_END" NUMBER, 
	"DIVISION_ID" VARCHAR2(50 CHAR), 
	"F_DAT" DATE, 
	"L_DAT" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table BASE_OF_CALC
--------------------------------------------------------

  CREATE TABLE "BASE_OF_CALC" 
   (	"ID" VARCHAR2(50 CHAR), 
	"NAME" VARCHAR2(100 CHAR), 
	"FULLNAME" VARCHAR2(100 CHAR)
   ) ;
 

   COMMENT ON TABLE "BASE_OF_CALC"  IS 'Алгоритмы расчетов';
--------------------------------------------------------
--  DDL for Table BASE_OF_NACHISL
--------------------------------------------------------

  CREATE TABLE "BASE_OF_NACHISL" 
   (	"ID" VARCHAR2(50 CHAR), 
	"NAME" VARCHAR2(20 CHAR), 
	"FULLNAME" VARCHAR2(100 CHAR)
   ) ;
 

   COMMENT ON TABLE "BASE_OF_NACHISL"  IS 'Алгоритмы начислений';
--------------------------------------------------------
--  DDL for Table CALENDAR
--------------------------------------------------------

  CREATE TABLE "CALENDAR" 
   (	"ID" VARCHAR2(50 CHAR), 
	"PROVIDER" VARCHAR2(100 CHAR), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"DESCRIPTION" VARCHAR2(200 CHAR)
   ) ;
 

   COMMENT ON TABLE "CALENDAR"  IS 'Календарь';
--------------------------------------------------------
--  DDL for Table CALL_LISTS
--------------------------------------------------------

  CREATE TABLE "CALL_LISTS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"USERS_ID" VARCHAR2(50 CHAR), 
	"KONTRAGENTS_ID" VARCHAR2(50 CHAR), 
	"LIST_NAME" VARCHAR2(50 BYTE), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
 

   COMMENT ON TABLE "CALL_LISTS"  IS 'Листы обзвона';
--------------------------------------------------------
--  DDL for Table CALL_LOG
--------------------------------------------------------

  CREATE TABLE "CALL_LOG" 
   (	"ID" VARCHAR2(50 CHAR), 
	"CALL_STATUS" VARCHAR2(50 CHAR), 
	"CONTACT_ID" VARCHAR2(50 CHAR), 
	"COMP_DET_ID" VARCHAR2(50 CHAR), 
	"MEMO" VARCHAR2(2000 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"DAT" DATE DEFAULT current_timestamp, 
	"CALL_RESULTS" VARCHAR2(50 CHAR), 
	"KONTRAG_ID" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "CALL_LOG"  IS 'ПротоколЗвонков';
--------------------------------------------------------
--  DDL for Table CALL_MEMO
--------------------------------------------------------

  CREATE TABLE "CALL_MEMO" 
   (	"ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"DAT" DATE, 
	"CALL_LOG" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "CALL_MEMO"  IS 'ТЧ_ПротоколЗвонков';
--------------------------------------------------------
--  DDL for Table CALL_RESULTS
--------------------------------------------------------

  CREATE TABLE "CALL_RESULTS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"NAME" VARCHAR2(20 CHAR), 
	"FULLNAME" VARCHAR2(25 CHAR)
   ) ;
 

   COMMENT ON TABLE "CALL_RESULTS"  IS 'РезультатыЗвонков';
--------------------------------------------------------
--  DDL for Table CALL_STATUS
--------------------------------------------------------

  CREATE TABLE "CALL_STATUS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"NAME" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "CALL_STATUS"  IS 'СтатусыЗвонков';
--------------------------------------------------------
--  DDL for Table CDR
--------------------------------------------------------

  CREATE TABLE "CDR" 
   (	"ID" VARCHAR2(50 CHAR), 
	"KONTRAGENT_ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"CALL_START_TIME" DATE, 
	"CALL_ANSWER_TIME" DATE, 
	"CALL_END_TIME" DATE, 
	"ALL_CALL_TIME" NUMBER(10,0), 
	"CALL_STATUS" VARCHAR2(20 BYTE), 
	"PHONE" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "CDR"  IS 'AsteriskCDR';
--------------------------------------------------------
--  DDL for Table COMPAIGNS
--------------------------------------------------------

  CREATE TABLE "COMPAIGNS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"NAME" VARCHAR2(100 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"ENABLED" NUMBER(1,0) DEFAULT 1, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0, 
	"DELETED" NUMBER(1,0) DEFAULT 0
   ) ;
 

   COMMENT ON TABLE "COMPAIGNS"  IS 'ЛистыОбзвона';
--------------------------------------------------------
--  DDL for Table COMPAIGNS_DETAILS
--------------------------------------------------------

  CREATE TABLE "COMPAIGNS_DETAILS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"COMPAIGN_ID" VARCHAR2(50 CHAR), 
	"KONTRAG_ID" VARCHAR2(50 CHAR), 
	"CONTACT_ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
 

   COMMENT ON TABLE "COMPAIGNS_DETAILS"  IS 'ТЧ_ЛистыОбзвона';
--------------------------------------------------------
--  DDL for Table CONTACT_DETAILS
--------------------------------------------------------

  CREATE TABLE "CONTACT_DETAILS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"KONTRAG_ID" VARCHAR2(50 CHAR), 
	"ADRESS" VARCHAR2(1000 CHAR), 
	"PHONE" VARCHAR2(15 CHAR), 
	"EMAIL" VARCHAR2(100 CHAR)
   ) ;
 

   COMMENT ON TABLE "CONTACT_DETAILS"  IS 'ТЧ_Контрагенты';
--------------------------------------------------------
--  DDL for Table CURRENCY
--------------------------------------------------------

  CREATE TABLE "CURRENCY" 
   (	"ID" VARCHAR2(50 CHAR), 
	"IS_GROUP" NUMBER(1,0) DEFAULT 0, 
	"PARENT_ID" VARCHAR2(50 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"FULLNAME" VARCHAR2(5 CHAR), 
	"CODE" VARCHAR2(3 CHAR), 
	"NAMEFULL" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0, 
	"ID_XML" VARCHAR2(3 CHAR) DEFAULT '0'
   ) ;
 

   COMMENT ON TABLE "CURRENCY"  IS 'Валюты';
--------------------------------------------------------
--  DDL for Table DIR_FILE_UPLOAD
--------------------------------------------------------

  CREATE TABLE "DIR_FILE_UPLOAD" 
   (	"ID" VARCHAR2(50 CHAR), 
	"DIRECTORY" VARCHAR2(100 CHAR)
   ) ;
 

   COMMENT ON TABLE "DIR_FILE_UPLOAD"  IS 'НастройкиВыгрузки';
--------------------------------------------------------
--  DDL for Table DIVISIONS
--------------------------------------------------------

  CREATE TABLE "DIVISIONS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(150 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"IS_GROUP" NUMBER(1,0) DEFAULT 0, 
	"PARENT_ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0, 
	"MAIN_USER" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "DIVISIONS"  IS 'Подразделения';
--------------------------------------------------------
--  DDL for Table DIVISION_SOTR
--------------------------------------------------------

  CREATE TABLE "DIVISION_SOTR" 
   (	"ID" VARCHAR2(50 CHAR), 
	"DIV_ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"DESCRIPTION" VARCHAR2(1000 CHAR)
   ) ;
 

   COMMENT ON TABLE "DIVISION_SOTR"  IS 'ТЧ_Подразделения - Сотрудники';
--------------------------------------------------------
--  DDL for Table ENTRY_SETTINGS
--------------------------------------------------------

  CREATE TABLE "ENTRY_SETTINGS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"TYPEDEF_ID" VARCHAR2(50 CHAR), 
	"PLAN_ACC_DEB_ID" VARCHAR2(50 CHAR), 
	"PLAN_ACC_KRED_ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"CHAIN" NUMBER(10,0), 
	"DESCRIPTION" VARCHAR2(1000 CHAR)
   ) ;
 

   COMMENT ON TABLE "ENTRY_SETTINGS"  IS 'НастройкиПроводок';
--------------------------------------------------------
--  DDL for Table ENUM_ACCOUNT_TYPE
--------------------------------------------------------

  CREATE TABLE "ENUM_ACCOUNT_TYPE" 
   (	"ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(20 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
 

   COMMENT ON TABLE "ENUM_ACCOUNT_TYPE"  IS 'ТипыСчетов';
--------------------------------------------------------
--  DDL for Table EX_RATES_SETTINGS
--------------------------------------------------------

  CREATE TABLE "EX_RATES_SETTINGS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"CURR_ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
 

   COMMENT ON TABLE "EX_RATES_SETTINGS"  IS 'НастройкиЗагрузкиКурсовВалют';
--------------------------------------------------------
--  DDL for Table FIRMS
--------------------------------------------------------

  CREATE TABLE "FIRMS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(150 CHAR), 
	"PRINTNAME" VARCHAR2(200 CHAR), 
	"UR_FIZ" NUMBER(1,0) DEFAULT 0, 
	"INN" VARCHAR2(50 CHAR), 
	"OKPO" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0
   ) ;
 

   COMMENT ON TABLE "FIRMS"  IS 'Организации';
--------------------------------------------------------
--  DDL for Table GROUPMEMBERS
--------------------------------------------------------

  CREATE TABLE "GROUPMEMBERS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"G_NAME" VARCHAR2(50 CHAR), 
	"G_MEMBER" VARCHAR2(30 CHAR)
   ) ;
 

   COMMENT ON TABLE "GROUPMEMBERS"  IS 'ЧленыРолей';
--------------------------------------------------------
--  DDL for Table GROUPS
--------------------------------------------------------

  CREATE TABLE "GROUPS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(50 CHAR), 
	"G_DESCRIPTION" VARCHAR2(1000 CHAR)
   ) ;
 

   COMMENT ON TABLE "GROUPS"  IS 'РолиПользователей';
--------------------------------------------------------
--  DDL for Table IMPORTED_PRICE
--------------------------------------------------------

  CREATE TABLE "IMPORTED_PRICE" 
   (	"ID" VARCHAR2(50 CHAR), 
	"DAT" DATE DEFAULT sysdate, 
	"ARTIKUL" VARCHAR2(50 CHAR), 
	"GROUPS" VARCHAR2(50 CHAR), 
	"NOM_NAME" VARCHAR2(1000 CHAR), 
	"ED_IZM" VARCHAR2(20 CHAR), 
	"PRICE_USL" NUMBER(10,2), 
	"PRICE_GOODS" NUMBER(10,2), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
 

   COMMENT ON TABLE "IMPORTED_PRICE"  IS 'ИмпортированныеПрайсЛисты';
--------------------------------------------------------
--  DDL for Table KASSA
--------------------------------------------------------

  CREATE TABLE "KASSA" 
   (	"ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(100 CHAR), 
	"IS_GROUP" NUMBER(1,0) DEFAULT 0, 
	"PARENT_ID" VARCHAR2(50 CHAR), 
	"CURR_ID" VARCHAR2(50 CHAR), 
	"DIVISION_ID" VARCHAR2(50 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0, 
	"FIRMA_ID" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "KASSA"  IS 'Кассы';
--------------------------------------------------------
--  DDL for Table KASSA_SETTINGS
--------------------------------------------------------

  CREATE TABLE "KASSA_SETTINGS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"KASSA_ID" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "KASSA_SETTINGS"  IS 'НастройкиПользователяДляКассы';
--------------------------------------------------------
--  DDL for Table KONTRAGENTS
--------------------------------------------------------

  CREATE TABLE "KONTRAGENTS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"IS_GROUP" NUMBER(1,0) DEFAULT 0, 
	"PARENT_ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(150 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"INN" VARCHAR2(50 CHAR), 
	"OKPO" VARCHAR2(50 CHAR), 
	"KPP" VARCHAR2(50 CHAR), 
	"NAMEFULL" VARCHAR2(150 CHAR), 
	"UR_FIZ" NUMBER(1,0) DEFAULT 0, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0, 
	"IS_SUPPLIER" NUMBER(1,0) DEFAULT 0, 
	"IS_BUYER" NUMBER(1,0) DEFAULT 0, 
	"IS_MEASURER" NUMBER(1,0) DEFAULT 0, 
	"USER_ID" VARCHAR2(50 CHAR), 
	"PHOTO" BLOB
   ) ;
 

   COMMENT ON TABLE "KONTRAGENTS"  IS 'Контрагенты';
--------------------------------------------------------
--  DDL for Table KONTRAG_SETTINGS
--------------------------------------------------------

  CREATE TABLE "KONTRAG_SETTINGS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"KONTRAG_ID" VARCHAR2(50 CHAR), 
	"PAY_ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"BASE_ID" VARCHAR2(50 CHAR), 
	"DIVISION_ID" VARCHAR2(50 CHAR), 
	"SUMMA" NUMBER
   ) ;
 

   COMMENT ON TABLE "KONTRAG_SETTINGS"  IS 'ТЧ_Контрагенты - НастройкиНачислений';
--------------------------------------------------------
--  DDL for Table MEASURE_UNIT
--------------------------------------------------------

  CREATE TABLE "MEASURE_UNIT" 
   (	"ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(20 CHAR), 
	"CODE" VARCHAR2(3 CHAR) DEFAULT '000', 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
 

   COMMENT ON TABLE "MEASURE_UNIT"  IS 'ЕдиницыИзмерения';
--------------------------------------------------------
--  DDL for Table MOVES
--------------------------------------------------------

  CREATE TABLE "MOVES" 
   (	"ID" VARCHAR2(50 CHAR), 
	"PERIOD" TIMESTAMP (6), 
	"REGISTRATOR_TYPE" VARCHAR2(50 CHAR), 
	"REGISTRATOR_ID" VARCHAR2(50 CHAR), 
	"PLAN_ACC_DEB_ID" VARCHAR2(50 CHAR), 
	"SUBCONTO1_DEB" VARCHAR2(50 CHAR), 
	"SUBCONTO2_DEB" VARCHAR2(50 CHAR), 
	"SUBCONTO3_DEB" VARCHAR2(50 CHAR), 
	"QUANTITY_DEB" NUMBER(10,4), 
	"CURR_DEB" VARCHAR2(50 CHAR), 
	"SUMM_VAL_DEB" NUMBER(10,2), 
	"PLAN_ACC_KRED_ID" VARCHAR2(50 CHAR), 
	"SUBCONTO1_KRED" VARCHAR2(50 CHAR), 
	"SUBCONTO2_KRED" VARCHAR2(50 CHAR), 
	"SUBCONTO3_KRED" VARCHAR2(50 CHAR), 
	"QUANTITY_KRED" NUMBER(10,4), 
	"CURR_KRED" VARCHAR2(50 CHAR), 
	"SUMM_VAL_KREDIT" NUMBER(10,2), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"SUMM_UPR_DEB" NUMBER(10,2), 
	"SUMM_UPR_KRED" NUMBER(10,2), 
	"ACTIVITIES_ID" VARCHAR2(50 CHAR), 
	"DESCRIPTION" VARCHAR2(1000 CHAR), 
	"DIVISION_ID" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "MOVES"  IS 'Проводки';
--------------------------------------------------------
--  DDL for Table NACHISL_SETTINGS
--------------------------------------------------------

  CREATE TABLE "NACHISL_SETTINGS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"PAY_ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"BASE_ID" VARCHAR2(50 CHAR), 
	"DIVISION_ID" VARCHAR2(50 CHAR), 
	"SUMMA" NUMBER
   ) ;
 

   COMMENT ON TABLE "NACHISL_SETTINGS"  IS 'НастройкиНачисленийПользователей';
--------------------------------------------------------
--  DDL for Table NOMENKLATURA
--------------------------------------------------------

  CREATE TABLE "NOMENKLATURA" 
   (	"ID" VARCHAR2(50 BYTE), 
	"FULLNAME" VARCHAR2(150 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"IS_GROUP" NUMBER(1,0) DEFAULT 0, 
	"PARENT_ID" VARCHAR2(50 CHAR), 
	"USLUGA" NUMBER(1,0) DEFAULT 1, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"ARTIKUL" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "NOMENKLATURA"  IS 'Номенклатура';
--------------------------------------------------------
--  DDL for Table NOTIFICATION
--------------------------------------------------------

  CREATE TABLE "NOTIFICATION" 
   (	"ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"DAT" DATE, 
	"DESCRIPTION" VARCHAR2(200 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"CONTACT" VARCHAR2(50 BYTE), 
	"SERVER" NUMBER(1,0), 
	"CLIENT" NUMBER(1,0), 
	"TRG_NAME" VARCHAR2(50 CHAR), 
	"USER_LOGIN" VARCHAR2(50 CHAR), 
	"OBJECT_ID" VARCHAR2(50 CHAR), 
	"START_DATE" DATE, 
	"END_DATE" DATE
   ) ;
 

   COMMENT ON TABLE "NOTIFICATION"  IS 'Уведомления';
--------------------------------------------------------
--  DDL for Table NUMERATOR
--------------------------------------------------------

  CREATE TABLE "NUMERATOR" 
   (	"ID" VARCHAR2(50 CHAR), 
	"TYPEDEF_ID" VARCHAR2(50 CHAR), 
	"PREFIX" VARCHAR2(20 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
 

   COMMENT ON TABLE "NUMERATOR"  IS 'Нумераторы';
--------------------------------------------------------
--  DDL for Table OPERATION_PKO
--------------------------------------------------------

  CREATE TABLE "OPERATION_PKO" 
   (	"ID" VARCHAR2(50 CHAR), 
	"NAME" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "OPERATION_PKO"  IS 'ОперацииПКО';
--------------------------------------------------------
--  DDL for Table OPERATION_RKO
--------------------------------------------------------

  CREATE TABLE "OPERATION_RKO" 
   (	"ID" VARCHAR2(50 CHAR), 
	"NAME" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "OPERATION_RKO"  IS 'ОперацииРКО';
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "ORDERS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"DAT" DATE DEFAULT current_timestamp, 
	"NUM" VARCHAR2(50 CHAR), 
	"KONTRAG_ID" VARCHAR2(50 CHAR), 
	"CURR_ID" VARCHAR2(50 CHAR), 
	"KASSA_ID" VARCHAR2(50 CHAR), 
	"DIVISION_ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"KURS" NUMBER(10,6) DEFAULT 1, 
	"KRATNOST" NUMBER(10,0) DEFAULT 1, 
	"DISCRIPTION" VARCHAR2(2000 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"POSTED" NUMBER(1,0) DEFAULT 0, 
	"FIRM_ID" VARCHAR2(50 CHAR), 
	"ACTIVITIES_ID" VARCHAR2(50 CHAR), 
	"STATUS_ID" VARCHAR2(50 CHAR), 
	"ZAMER_ID" VARCHAR2(50 CHAR), 
	"DAT_ZAM" DATE DEFAULT sysdate, 
	"TIME_ZAM" VARCHAR2(5 CHAR) DEFAULT '00:00', 
	"SUMM_PLAN" NUMBER(10,2) DEFAULT 0, 
	"DAT_COMPLETE" DATE, 
	"AGENT_ID" VARCHAR2(50 CHAR), 
	"DAT_COMPLETE_FACT" DATE
   ) ;
 

   COMMENT ON TABLE "ORDERS"  IS 'Заказы';
--------------------------------------------------------
--  DDL for Table ORDERS_TP_NACHISL
--------------------------------------------------------

  CREATE TABLE "ORDERS_TP_NACHISL" 
   (	"ID" VARCHAR2(50 CHAR), 
	"ORDER_ID" VARCHAR2(50 CHAR), 
	"DAT_NACH" DATE DEFAULT sysdate, 
	"KONTR_ID" VARCHAR2(50 CHAR), 
	"SUMM" NUMBER(10,2), 
	"DESCRIPTION" VARCHAR2(1000 CHAR), 
	"CALC_ID" VARCHAR2(50 CHAR), 
	"PERCENT" NUMBER(10,2), 
	"PAY_ID" VARCHAR2(50 CHAR), 
	"MANUAL" NUMBER(1,0)
   ) ;
 

   COMMENT ON TABLE "ORDERS_TP_NACHISL"  IS 'ТЧ_Заказы - Начисления';
--------------------------------------------------------
--  DDL for Table ORDERS_TP_OPLATY
--------------------------------------------------------

  CREATE TABLE "ORDERS_TP_OPLATY" 
   (	"ID" VARCHAR2(50 CHAR), 
	"ORDER_ID" VARCHAR2(50 CHAR), 
	"DAT" DATE DEFAULT sysdate, 
	"SUM" NUMBER(10,2), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"COMMENTS" VARCHAR2(1000 CHAR), 
	"ZAMER_ID" VARCHAR2(50 CHAR), 
	"KASSA_ID" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "ORDERS_TP_OPLATY"  IS 'ТЧ_Заказы - Оплаты';
--------------------------------------------------------
--  DDL for Table ORDERS_TP_RASHODY
--------------------------------------------------------

  CREATE TABLE "ORDERS_TP_RASHODY" 
   (	"ID" VARCHAR2(50 CHAR), 
	"ORDER_ID" VARCHAR2(50 CHAR), 
	"DAT_RASH" DATE DEFAULT sysdate, 
	"KONTR_ID" VARCHAR2(50 CHAR), 
	"SUMM" NUMBER(10,2), 
	"DESCRIPTION" VARCHAR2(1000 CHAR), 
	"ZATRATY_ID" VARCHAR2(50 CHAR), 
	"KASSA_ID" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "ORDERS_TP_RASHODY"  IS 'ТЧ_Заказы - Расходы';
--------------------------------------------------------
--  DDL for Table ORDERS_TP_USLUGI
--------------------------------------------------------

  CREATE TABLE "ORDERS_TP_USLUGI" 
   (	"ID" VARCHAR2(50 CHAR), 
	"ORDER_ID" VARCHAR2(50 CHAR), 
	"NOM_ID" VARCHAR2(50 CHAR), 
	"PRICE" NUMBER(10,3), 
	"SUMM" NUMBER(10,2), 
	"DAT_COMPLETE" DATE DEFAULT sysdate, 
	"SOTR_ID" VARCHAR2(50 CHAR), 
	"DAT_TO_PAY" DATE DEFAULT sysdate, 
	"GROUP_ID" VARCHAR2(50 CHAR), 
	"MEASURE_ID" VARCHAR2(50 CHAR), 
	"QUANTITY" NUMBER(10,3), 
	"ADD_WORK" VARCHAR2(1000 CHAR), 
	"PRICE_ADD" NUMBER(10,2)
   ) ;
 

   COMMENT ON TABLE "ORDERS_TP_USLUGI"  IS 'ТЧ_Заказы - Услуги';
--------------------------------------------------------
--  DDL for Table ORDER_STATUS
--------------------------------------------------------

  CREATE TABLE "ORDER_STATUS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"NAME" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "ORDER_STATUS"  IS 'СтатусыЗаказов';
--------------------------------------------------------
--  DDL for Table OTHER_ZATRATY
--------------------------------------------------------

  CREATE TABLE "OTHER_ZATRATY" 
   (	"ID" VARCHAR2(50 CHAR), 
	"DAT" DATE DEFAULT sysdate, 
	"NUM" VARCHAR2(50 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"POSTED" NUMBER(1,0) DEFAULT 0, 
	"DIVISION_ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"COMMENTS" VARCHAR2(255 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"CURR_ID" VARCHAR2(50 CHAR), 
	"KASSA_ID" VARCHAR2(50 CHAR), 
	"ACTIVITIES_ID" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "OTHER_ZATRATY"  IS 'ПрочиеЗатраты';
--------------------------------------------------------
--  DDL for Table OTHER_ZATRATY_TAB_PART_ZATRATY
--------------------------------------------------------

  CREATE TABLE "OTHER_ZATRATY_TAB_PART_ZATRATY" 
   (	"ID" VARCHAR2(50 CHAR), 
	"OTH_ID" VARCHAR2(50 CHAR), 
	"ZATR_ID" VARCHAR2(50 CHAR), 
	"SUMMA" NUMBER(38,2)
   ) ;
 

   COMMENT ON TABLE "OTHER_ZATRATY_TAB_PART_ZATRATY"  IS 'ТЧ_ПрочиеЗатраты - Затраты';
--------------------------------------------------------
--  DDL for Table PAY_SETTINGS
--------------------------------------------------------

  CREATE TABLE "PAY_SETTINGS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"NAME" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(100 CHAR), 
	"STAVKA" NUMBER, 
	"DESCRIPTION" VARCHAR2(500 BYTE), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"BASE_ID" VARCHAR2(50 CHAR), 
	"SUMMA" NUMBER DEFAULT 0, 
	"IN_PROFIT" NUMBER(1,0) DEFAULT 0
   ) ;
 

   COMMENT ON TABLE "PAY_SETTINGS"  IS 'ВидыНачислений';
--------------------------------------------------------
--  DDL for Table PKO
--------------------------------------------------------

  CREATE TABLE "PKO" 
   (	"ID" VARCHAR2(50 CHAR), 
	"DAT" DATE DEFAULT sysdate, 
	"NUM" VARCHAR2(50 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"POSTED" NUMBER(1,0) DEFAULT 0, 
	"DIVISION_ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"COMMENTS" VARCHAR2(255 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"CURR_ID" VARCHAR2(50 CHAR), 
	"KASSA_ID" VARCHAR2(50 CHAR), 
	"ACTIVITIES_ID" VARCHAR2(50 CHAR), 
	"OPERATION_ID" VARCHAR2(50 CHAR), 
	"SUMMA" NUMBER, 
	"KONTRAG_ID" VARCHAR2(50 CHAR), 
	"ORDER_ID" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "PKO"  IS 'ПриходныеКассовыеОрдера';
--------------------------------------------------------
--  DDL for Table PLAN_ACC
--------------------------------------------------------

  CREATE TABLE "PLAN_ACC" 
   (	"ID" VARCHAR2(50 CHAR), 
	"ACC_TYPE" VARCHAR2(50 CHAR), 
	"PARENT_ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(3000 CHAR), 
	"ZABALANSOV" NUMBER(1,0) DEFAULT 0, 
	"VALUTN" NUMBER(1,0) DEFAULT 0, 
	"KOLISHESTV" NUMBER(1,0) DEFAULT 0, 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"CODE" VARCHAR2(6 CHAR) DEFAULT NULL
   ) ;
 

   COMMENT ON TABLE "PLAN_ACC"  IS 'УправленческийПланСчетов';
--------------------------------------------------------
--  DDL for Table PLAN_ACC_SUBCONTO
--------------------------------------------------------

  CREATE TABLE "PLAN_ACC_SUBCONTO" 
   (	"ID" VARCHAR2(50 CHAR), 
	"PLAN_ACC_ID" VARCHAR2(50 CHAR), 
	"PLAN_TYPE_SUBC" VARCHAR2(50 CHAR), 
	"OBOROT_ONLY" NUMBER(1,0) DEFAULT 0, 
	"SUMMOVOY" NUMBER(1,0) DEFAULT 1, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
 

   COMMENT ON TABLE "PLAN_ACC_SUBCONTO"  IS 'СубконтоСчетов';
--------------------------------------------------------
--  DDL for Table PLAN_TYPE_SUBCONTO
--------------------------------------------------------

  CREATE TABLE "PLAN_TYPE_SUBCONTO" 
   (	"ID" VARCHAR2(50 CHAR), 
	"TYPE_OF_OBJ" VARCHAR2(50 BYTE), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"FULLNAME" VARCHAR2(100 CHAR)
   ) ;
 

   COMMENT ON TABLE "PLAN_TYPE_SUBCONTO"  IS 'ТипыСубконто';
--------------------------------------------------------
--  DDL for Table PROFIT_DISTRIB
--------------------------------------------------------

  CREATE TABLE "PROFIT_DISTRIB" 
   (	"ID" VARCHAR2(50 CHAR), 
	"DAT" DATE DEFAULT sysdate, 
	"NUM" VARCHAR2(50 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"POSTED" NUMBER(1,0) DEFAULT 0, 
	"DIVISION_ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"COMMENTS" VARCHAR2(255 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"CURR_ID" VARCHAR2(50 CHAR), 
	"ACTIVITIES_ID" VARCHAR2(50 CHAR), 
	"SUMM" NUMBER(10,3)
   ) ;
 

   COMMENT ON TABLE "PROFIT_DISTRIB"  IS 'РаспределениеПрибыли';
--------------------------------------------------------
--  DDL for Table PROFIT_DISTRIB_TP
--------------------------------------------------------

  CREATE TABLE "PROFIT_DISTRIB_TP" 
   (	"ID" VARCHAR2(50 CHAR), 
	"PROFIT_ID" VARCHAR2(50 CHAR), 
	"DAT_NACH" DATE DEFAULT sysdate, 
	"KONTR_ID" VARCHAR2(50 CHAR), 
	"SUMM" NUMBER(10,2), 
	"DESCRIPTION" VARCHAR2(1000 CHAR), 
	"CALC_ID" VARCHAR2(50 CHAR), 
	"PERCENT" NUMBER(10,2), 
	"PAY_ID" VARCHAR2(50 CHAR), 
	"MANUAL" NUMBER(1,0)
   ) ;
 

   COMMENT ON TABLE "PROFIT_DISTRIB_TP"  IS 'ТЧ_РаспределениеПрибыли';
--------------------------------------------------------
--  DDL for Table PROG_SETTINGS
--------------------------------------------------------

  CREATE TABLE "PROG_SETTINGS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"DATE_AFTER" DATE, 
	"DATE_AFTER_PROFIT" DATE
   ) ;
 

   COMMENT ON TABLE "PROG_SETTINGS"  IS 'НастройкиПрограммы';
--------------------------------------------------------
--  DDL for Table PS_TXN
--------------------------------------------------------

  CREATE TABLE "PS_TXN" 
   (	"ID" NUMBER(20,0), 
	"PARENTID" NUMBER(20,0), 
	"COLLID" NUMBER(10,0), 
	"CONTENT" BLOB, 
	"CREATION_DATE" DATE DEFAULT sysdate
   ) ;
 

   COMMENT ON TABLE "PS_TXN"  IS 'Служебный';
--------------------------------------------------------
--  DDL for Table QRTZ_BLOB_TRIGGERS
--------------------------------------------------------

  CREATE TABLE "QRTZ_BLOB_TRIGGERS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"TRIGGER_NAME" VARCHAR2(200 BYTE), 
	"TRIGGER_GROUP" VARCHAR2(200 BYTE), 
	"BLOB_DATA" BLOB
   ) ;
 

   COMMENT ON TABLE "QRTZ_BLOB_TRIGGERS"  IS 'Quartz_2.2.1';
--------------------------------------------------------
--  DDL for Table QRTZ_CALENDARS
--------------------------------------------------------

  CREATE TABLE "QRTZ_CALENDARS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"CALENDAR_NAME" VARCHAR2(200 BYTE), 
	"CALENDAR" BLOB
   ) ;
 

   COMMENT ON TABLE "QRTZ_CALENDARS"  IS 'Quartz_2.2.1';
--------------------------------------------------------
--  DDL for Table QRTZ_CRON_TRIGGERS
--------------------------------------------------------

  CREATE TABLE "QRTZ_CRON_TRIGGERS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"TRIGGER_NAME" VARCHAR2(200 BYTE), 
	"TRIGGER_GROUP" VARCHAR2(200 BYTE), 
	"CRON_EXPRESSION" VARCHAR2(120 BYTE), 
	"TIME_ZONE_ID" VARCHAR2(80 BYTE)
   ) ;
 

   COMMENT ON TABLE "QRTZ_CRON_TRIGGERS"  IS 'Quartz_2.2.1';
--------------------------------------------------------
--  DDL for Table QRTZ_FIRED_TRIGGERS
--------------------------------------------------------

  CREATE TABLE "QRTZ_FIRED_TRIGGERS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"ENTRY_ID" VARCHAR2(95 BYTE), 
	"TRIGGER_NAME" VARCHAR2(200 BYTE), 
	"TRIGGER_GROUP" VARCHAR2(200 BYTE), 
	"INSTANCE_NAME" VARCHAR2(200 BYTE), 
	"FIRED_TIME" NUMBER(13,0), 
	"SCHED_TIME" NUMBER(13,0), 
	"PRIORITY" NUMBER(13,0), 
	"STATE" VARCHAR2(16 BYTE), 
	"JOB_NAME" VARCHAR2(200 BYTE), 
	"JOB_GROUP" VARCHAR2(200 BYTE), 
	"IS_NONCONCURRENT" VARCHAR2(1 BYTE), 
	"REQUESTS_RECOVERY" VARCHAR2(1 BYTE)
   ) ;
 

   COMMENT ON TABLE "QRTZ_FIRED_TRIGGERS"  IS 'Quartz_2.2.1';
--------------------------------------------------------
--  DDL for Table QRTZ_JOB_DETAILS
--------------------------------------------------------

  CREATE TABLE "QRTZ_JOB_DETAILS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"JOB_NAME" VARCHAR2(200 BYTE), 
	"JOB_GROUP" VARCHAR2(200 BYTE), 
	"DESCRIPTION" VARCHAR2(250 BYTE), 
	"JOB_CLASS_NAME" VARCHAR2(250 BYTE), 
	"IS_DURABLE" VARCHAR2(1 BYTE), 
	"IS_NONCONCURRENT" VARCHAR2(1 BYTE), 
	"IS_UPDATE_DATA" VARCHAR2(1 BYTE), 
	"REQUESTS_RECOVERY" VARCHAR2(1 BYTE), 
	"JOB_DATA" BLOB
   ) ;
 

   COMMENT ON TABLE "QRTZ_JOB_DETAILS"  IS 'Quartz_2.2.1';
--------------------------------------------------------
--  DDL for Table QRTZ_LOCKS
--------------------------------------------------------

  CREATE TABLE "QRTZ_LOCKS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"LOCK_NAME" VARCHAR2(40 BYTE)
   ) ;
 

   COMMENT ON TABLE "QRTZ_LOCKS"  IS 'Quartz_2.2.1';
--------------------------------------------------------
--  DDL for Table QRTZ_PAUSED_TRIGGER_GRPS
--------------------------------------------------------

  CREATE TABLE "QRTZ_PAUSED_TRIGGER_GRPS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"TRIGGER_GROUP" VARCHAR2(200 BYTE)
   ) ;
 

   COMMENT ON TABLE "QRTZ_PAUSED_TRIGGER_GRPS"  IS 'Quartz_2.2.1';
--------------------------------------------------------
--  DDL for Table QRTZ_SCHEDULER_STATE
--------------------------------------------------------

  CREATE TABLE "QRTZ_SCHEDULER_STATE" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"INSTANCE_NAME" VARCHAR2(200 BYTE), 
	"LAST_CHECKIN_TIME" NUMBER(13,0), 
	"CHECKIN_INTERVAL" NUMBER(13,0)
   ) ;
 

   COMMENT ON TABLE "QRTZ_SCHEDULER_STATE"  IS 'Quartz_2.2.1';
--------------------------------------------------------
--  DDL for Table QRTZ_SIMPLE_TRIGGERS
--------------------------------------------------------

  CREATE TABLE "QRTZ_SIMPLE_TRIGGERS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"TRIGGER_NAME" VARCHAR2(200 BYTE), 
	"TRIGGER_GROUP" VARCHAR2(200 BYTE), 
	"REPEAT_COUNT" NUMBER(7,0), 
	"REPEAT_INTERVAL" NUMBER(12,0), 
	"TIMES_TRIGGERED" NUMBER(10,0)
   ) ;
 

   COMMENT ON TABLE "QRTZ_SIMPLE_TRIGGERS"  IS 'Quartz_2.2.1';
--------------------------------------------------------
--  DDL for Table QRTZ_SIMPROP_TRIGGERS
--------------------------------------------------------

  CREATE TABLE "QRTZ_SIMPROP_TRIGGERS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"TRIGGER_NAME" VARCHAR2(200 BYTE), 
	"TRIGGER_GROUP" VARCHAR2(200 BYTE), 
	"STR_PROP_1" VARCHAR2(512 BYTE), 
	"STR_PROP_2" VARCHAR2(512 BYTE), 
	"STR_PROP_3" VARCHAR2(512 BYTE), 
	"INT_PROP_1" NUMBER(10,0), 
	"INT_PROP_2" NUMBER(10,0), 
	"LONG_PROP_1" NUMBER(13,0), 
	"LONG_PROP_2" NUMBER(13,0), 
	"DEC_PROP_1" NUMBER(13,4), 
	"DEC_PROP_2" NUMBER(13,4), 
	"BOOL_PROP_1" VARCHAR2(1 BYTE), 
	"BOOL_PROP_2" VARCHAR2(1 BYTE)
   ) ;
 

   COMMENT ON TABLE "QRTZ_SIMPROP_TRIGGERS"  IS 'Quartz_2.2.1';
--------------------------------------------------------
--  DDL for Table QRTZ_TRIGGERS
--------------------------------------------------------

  CREATE TABLE "QRTZ_TRIGGERS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"TRIGGER_NAME" VARCHAR2(200 BYTE), 
	"TRIGGER_GROUP" VARCHAR2(200 BYTE), 
	"JOB_NAME" VARCHAR2(200 BYTE), 
	"JOB_GROUP" VARCHAR2(200 BYTE), 
	"DESCRIPTION" VARCHAR2(250 BYTE), 
	"NEXT_FIRE_TIME" NUMBER(13,0), 
	"PREV_FIRE_TIME" NUMBER(13,0), 
	"PRIORITY" NUMBER(13,0), 
	"TRIGGER_STATE" VARCHAR2(16 BYTE), 
	"TRIGGER_TYPE" VARCHAR2(8 BYTE), 
	"START_TIME" NUMBER(13,0), 
	"END_TIME" NUMBER(13,0), 
	"CALENDAR_NAME" VARCHAR2(200 BYTE), 
	"MISFIRE_INSTR" NUMBER(2,0), 
	"JOB_DATA" BLOB
   ) ;
 

   COMMENT ON TABLE "QRTZ_TRIGGERS"  IS 'Quartz_2.2.1';
--------------------------------------------------------
--  DDL for Table QUARTZ_PROPERTY
--------------------------------------------------------

  CREATE TABLE "QUARTZ_PROPERTY" 
   (	"ID" VARCHAR2(50 CHAR), 
	"INSTANCE_NAME" VARCHAR2(60 CHAR), 
	"THREADPOOL_CLASS" VARCHAR2(50 CHAR), 
	"THREAD_COUNT" VARCHAR2(60 CHAR), 
	"THREADS_CONTEXT" VARCHAR2(60 CHAR), 
	"JOBSTORE_CLASS" VARCHAR2(60 CHAR), 
	"DRIVER_DELEGATE" VARCHAR2(60 CHAR), 
	"TABLE_PREFIX" VARCHAR2(60 CHAR), 
	"DATA_SOURCE" VARCHAR2(60 CHAR), 
	"DRIVER" VARCHAR2(60 CHAR), 
	"URL" VARCHAR2(60 CHAR), 
	"USR" VARCHAR2(50 CHAR), 
	"PASSWORD" VARCHAR2(50 CHAR), 
	"MAX_CONNECTIONS" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "QUARTZ_PROPERTY"  IS 'НастройкиQuartz_2.2.1';
--------------------------------------------------------
--  DDL for Table RATING_SETTINGS
--------------------------------------------------------

  CREATE TABLE "RATING_SETTINGS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"SUM_DIVIDER" NUMBER(10,0) DEFAULT 1, 
	"SUM_BAL" NUMBER(10,2), 
	"CNT_DIVIDER" NUMBER(10,0) DEFAULT 1, 
	"CNT_BAL" NUMBER(10,2)
   ) ;
 

   COMMENT ON TABLE "RATING_SETTINGS"  IS 'НастройкиРейтинга';
--------------------------------------------------------
--  DDL for Table REG_PRICES
--------------------------------------------------------

  CREATE TABLE "REG_PRICES" 
   (	"ID" VARCHAR2(50 CHAR), 
	"NOM_ID" VARCHAR2(50 CHAR), 
	"PERIOD" DATE, 
	"ED_IZM" VARCHAR2(50 CHAR), 
	"PRICE_USL" NUMBER(10,2), 
	"PRICE_GOODS" NUMBER(10,2)
   ) ;
 

   COMMENT ON TABLE "REG_PRICES"  IS 'ПрайсЛисты';
--------------------------------------------------------
--  DDL for Table REG_RATES
--------------------------------------------------------

  CREATE TABLE "REG_RATES" 
   (	"CURR_ID" VARCHAR2(50 CHAR), 
	"PERIOD" DATE DEFAULT to_date('01-01-1980 00:00:00','DD-MM-YYYY HH24:MI:SS'), 
	"ID" VARCHAR2(50 CHAR), 
	"KURS" NUMBER(10,6) DEFAULT 1, 
	"KRATNOST" NUMBER(10,0) DEFAULT 1, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
 

   COMMENT ON TABLE "REG_RATES"  IS 'КурсыВалют';
--------------------------------------------------------
--  DDL for Table RKO
--------------------------------------------------------

  CREATE TABLE "RKO" 
   (	"ID" VARCHAR2(50 CHAR), 
	"DAT" DATE DEFAULT sysdate, 
	"NUM" VARCHAR2(50 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"POSTED" NUMBER(1,0) DEFAULT 0, 
	"DIVISION_ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"COMMENTS" VARCHAR2(255 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"CURR_ID" VARCHAR2(50 CHAR), 
	"KASSA_ID" VARCHAR2(50 CHAR), 
	"ACTIVITIES_ID" VARCHAR2(50 CHAR), 
	"OPERATION_ID" VARCHAR2(50 CHAR), 
	"KONTRAG_ID" VARCHAR2(50 CHAR), 
	"SUMMA" NUMBER, 
	"DEST_KASSA_ID" VARCHAR2(50 CHAR), 
	"ORDER_ID" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "RKO"  IS 'РасходныеКассовыеОрдера';
--------------------------------------------------------
--  DDL for Table START_OST
--------------------------------------------------------

  CREATE TABLE "START_OST" 
   (	"ID" VARCHAR2(50 CHAR), 
	"DAT" DATE DEFAULT sysdate, 
	"NUM" VARCHAR2(50 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"POSTED" NUMBER(1,0) DEFAULT 0, 
	"DIVISION_ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"COMMENTS" VARCHAR2(255 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"CURR_ID" VARCHAR2(50 CHAR), 
	"ACTIVITIES_ID" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "START_OST"  IS 'НачальныеОстатки';
--------------------------------------------------------
--  DDL for Table START_OST_TP
--------------------------------------------------------

  CREATE TABLE "START_OST_TP" 
   (	"ID" VARCHAR2(50 CHAR), 
	"PLAN_ACC_DEB_ID" VARCHAR2(50 CHAR), 
	"SUBCONTO1_DEB" VARCHAR2(50 CHAR), 
	"SUBCONTO2_DEB" VARCHAR2(50 CHAR), 
	"PLAN_ACC_KRED_ID" VARCHAR2(50 CHAR), 
	"SUBCONTO1_KRED" VARCHAR2(50 CHAR), 
	"SUBCONTO2_KRED" VARCHAR2(50 CHAR), 
	"SUMM" NUMBER(10,2), 
	"DESCRIPTION" VARCHAR2(1000 CHAR), 
	"START_OST_ID" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "START_OST_TP"  IS 'ТЧ_НачальныеОстатки';
--------------------------------------------------------
--  DDL for Table TYPE_DEF
--------------------------------------------------------

  CREATE TABLE "TYPE_DEF" 
   (	"ID" VARCHAR2(50 CHAR), 
	"TABLE_NAME" VARCHAR2(100 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
 

   COMMENT ON TABLE "TYPE_DEF"  IS 'ТипыОбъектов';
--------------------------------------------------------
--  DDL for Table TYPE_OF_ACTIVITIES
--------------------------------------------------------

  CREATE TABLE "TYPE_OF_ACTIVITIES" 
   (	"ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"FULLNAME" VARCHAR2(150 CHAR)
   ) ;
 

   COMMENT ON TABLE "TYPE_OF_ACTIVITIES"  IS 'ВидыДеятельности';
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "USERS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"FIRST_NAME" VARCHAR2(50 CHAR) DEFAULT 'NoFirstName', 
	"LAST_NAME" VARCHAR2(50 CHAR) DEFAULT 'NoLastName', 
	"EMAIL" VARCHAR2(100 CHAR) DEFAULT 'no@email.com', 
	"IS_ADMIN" NUMBER(1,0) DEFAULT 0, 
	"PASS_WD" VARCHAR2(100 CHAR), 
	"LOGIN" VARCHAR2(30 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0, 
	"U_DESCRIPTION" VARCHAR2(1000 CHAR), 
	"IS_ZAMER" NUMBER(1,0) DEFAULT 0, 
	"IS_ACTIVE" NUMBER(1,0) DEFAULT 1, 
	"DATE_BEFORE" DATE, 
	"DATE_BEFIRE_ACCEPT" NUMBER(1,0) DEFAULT 0, 
	"PHOTO" BLOB
   ) ;
 

   COMMENT ON TABLE "USERS"  IS 'Пользователи';
--------------------------------------------------------
--  DDL for Table USERS_GROUPS
--------------------------------------------------------

  CREATE TABLE "USERS_GROUPS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"GROUPS_ID" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "USERS_GROUPS"  IS 'ГруппыПользователей';
--------------------------------------------------------
--  DDL for Table USER_SETTINGS
--------------------------------------------------------

  CREATE TABLE "USER_SETTINGS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"DIVISION_ID" VARCHAR2(50 CHAR), 
	"FIRMA_ID" VARCHAR2(50 CHAR), 
	"CURRENCY_ID" VARCHAR2(50 CHAR), 
	"KASSA_ID" VARCHAR2(50 CHAR), 
	"MAIN_USLUGA" VARCHAR2(50 CHAR), 
	"ACTIVITIES_ID" VARCHAR2(50 CHAR), 
	"ZAMERKONTRAG_ID" VARCHAR2(50 CHAR), 
	"KONTRAG_ID" VARCHAR2(50 CHAR), 
	"NET_ID" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON TABLE "USER_SETTINGS"  IS 'НастройкиПользователей';
--------------------------------------------------------
--  DDL for Table VOUCHER
--------------------------------------------------------

  CREATE TABLE "VOUCHER" 
   (	"ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"EXPIRED_BY" TIMESTAMP (6), 
	"CODE" RAW(64)
   ) ;
 

   COMMENT ON TABLE "VOUCHER"  IS 'Ваучеры';
--------------------------------------------------------
--  DDL for Table WLS_SETTINGS
--------------------------------------------------------

  CREATE TABLE "WLS_SETTINGS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"PORT" VARCHAR2(5 CHAR) DEFAULT 7001, 
	"USERNAME" VARCHAR2(200 CHAR), 
	"PASSWORD" VARCHAR2(200 CHAR), 
	"HOST" VARCHAR2(500 CHAR) DEFAULT '127.0.0.1'
   ) ;
 

   COMMENT ON TABLE "WLS_SETTINGS"  IS 'НастройкиWLS';
--------------------------------------------------------
--  DDL for Table XML_T
--------------------------------------------------------

  CREATE TABLE "XML_T" 
   (	"ID" VARCHAR2(50 CHAR), 
	"ONE" "XMLTYPE" , 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
 

   COMMENT ON TABLE "XML_T"  IS 'Служебный';
--------------------------------------------------------
--  DDL for Table ZATRATY
--------------------------------------------------------

  CREATE TABLE "ZATRATY" 
   (	"ID" VARCHAR2(50 CHAR), 
	"IS_GROUP" NUMBER(1,0) DEFAULT 0, 
	"PARENT_ID" VARCHAR2(50 BYTE), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"FULLNAME" VARCHAR2(150 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0
   ) ;
 

   COMMENT ON TABLE "ZATRATY"  IS 'СтатьиЗатрат';
--------------------------------------------------------
--  DDL for View BALLANS_BY_KASSA
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BALLANS_BY_KASSA" ("ID", "KASSA_ID", "KASSA", "CODE", "BALLANS") AS 
  SELECT MAX(MOVE_KASSA.ID) ID,
  MOVE_KASSA.KASSA_ID,
  MOVE_KASSA.KASSA,
  MOVE_KASSA.CODE,
  SUM(MOVE_KASSA.SUMM) BALLANS
FROM MOVE_KASSA
GROUP BY MOVE_KASSA.KASSA_ID,
  MOVE_KASSA.KASSA,
  MOVE_KASSA.CODE;
--------------------------------------------------------
--  DDL for View BALLANS_BY_KONTRAG
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BALLANS_BY_KONTRAG" ("ID", "KONTRAG", "CODE", "BALLANS") AS 
  select KONTRAG_ID ID, 
KONTRAG, 
CODE, 
sum(case 
  when code like '5091' then -summ
  else summ
  end) BALLANS 
from MOVE_KONTRAG
group by KONTRAG_ID, KONTRAG, CODE;
--------------------------------------------------------
--  DDL for View LAST_PRICES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "LAST_PRICES" ("ID", "NOM_ID", "PERIOD", "ED_IZM", "PRICE_USL", "PRICE_GOODS") AS 
  select "ID","NOM_ID","PERIOD","ED_IZM","PRICE_USL","PRICE_GOODS" from reg_prices where period = (select max(period) from reg_prices where period<=(sysdate));
--------------------------------------------------------
--  DDL for View MOVE_KASSA
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "MOVE_KASSA" ("ID", "KASSA_ID", "KASSA", "CODE", "SUMM", "REGISTRATOR_ID", "TABLE_NAME", "PERIOD", "DIVISION_ID") AS 
  SELECT VW_MOVES.ID,
  KASSA.ID                       AS Kassa_id,
  KASSA.FULLNAME                 AS Kassa,
  VW_MOVES.DEB                   AS Code,
  SUM(DISTINCT VW_MOVES.SUM_DEB) AS Summ,
  VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.TABLE_NAME,
  VW_MOVES.PERIOD,
  VW_MOVES.DIVISION_ID
FROM KASSA
INNER JOIN VW_MOVES
ON KASSA.ID = VW_MOVES.SUBCONTO1_DEB
GROUP BY VW_MOVES.ID,
  KASSA.ID,
  KASSA.FULLNAME,
  VW_MOVES.DEB,
  VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.TABLE_NAME,
  VW_MOVES.PERIOD,
  VW_MOVES.DIVISION_ID
UNION ALL
SELECT VW_MOVES.ID,
  KASSA.ID AS Kontrag_id,
  KASSA.FULLNAME,
  VW_MOVES.KRED,
  SUM(DISTINCT VW_MOVES.SUM_KRED) AS Summ,
  VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.TABLE_NAME,
  VW_MOVES.PERIOD,
  VW_MOVES.DIVISION_ID
FROM KASSA
INNER JOIN VW_MOVES
ON KASSA.ID = VW_MOVES.SUBCONTO1_KRED
GROUP BY VW_MOVES.ID,
  KASSA.ID,
  KASSA.FULLNAME,
  VW_MOVES.KRED,
  VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.TABLE_NAME,
  VW_MOVES.PERIOD,
  VW_MOVES.DIVISION_ID;
--------------------------------------------------------
--  DDL for View MOVE_KONTRAG
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "MOVE_KONTRAG" ("KONTRAG_ID", "KONTRAG", "CODE", "SUMM", "REGISTRATOR_ID", "TABLE_NAME", "PERIOD", "ID", "DIVISION_ID") AS 
  SELECT KONTRAGENTS.ID            AS Kontrag_id,
  KONTRAGENTS.FULLNAME           AS Kontrag,
  VW_MOVES.DEB                   AS Code,
  SUM(DISTINCT VW_MOVES.SUM_DEB) AS Summ,
  VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.TABLE_NAME,
  VW_MOVES.PERIOD,
  VW_MOVES.ID,
  VW_MOVES.DIVISION_ID
FROM KONTRAGENTS
INNER JOIN VW_MOVES
ON KONTRAGENTS.ID = VW_MOVES.SUBCONTO1_DEB
GROUP BY KONTRAGENTS.ID,
  KONTRAGENTS.FULLNAME,
  VW_MOVES.DEB,
  VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.TABLE_NAME,
  VW_MOVES.PERIOD,
  VW_MOVES.ID,
  VW_MOVES.DIVISION_ID
UNION ALL
SELECT KONTRAGENTS.ID AS Kontrag_id,
  KONTRAGENTS.FULLNAME,
  VW_MOVES.KRED,
  SUM(DISTINCT VW_MOVES.SUM_KRED) AS Summ,
  VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.TABLE_NAME,
  VW_MOVES.PERIOD,
  VW_MOVES.ID,
  VW_MOVES.DIVISION_ID
FROM KONTRAGENTS
INNER JOIN VW_MOVES
ON KONTRAGENTS.ID = VW_MOVES.SUBCONTO1_KRED
GROUP BY KONTRAGENTS.ID,
  KONTRAGENTS.FULLNAME,
  VW_MOVES.KRED,
  VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.TABLE_NAME,
  VW_MOVES.PERIOD,
  VW_MOVES.ID,
  VW_MOVES.DIVISION_ID;
--------------------------------------------------------
--  DDL for View OBOROT_600
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "OBOROT_600" ("REGISTRATOR_ID", "DEB", "SUM_DEB", "KRED", "SUM_KRED", "OSTATOK") AS 
  SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  SUM(DISTINCT VW_MOVES.SUM_DEB) AS SUM_DEB,
  VW_MOVES1.KRED,
  SUM(DISTINCT VW_MOVES1.SUM_KRED) AS SUM_KRED,
  SUM(DISTINCT VW_MOVES1.SUM_KRED)+SUM(DISTINCT VW_MOVES.SUM_DEB) AS OSTATOK
FROM VW_MOVES
INNER JOIN VW_MOVES VW_MOVES1
ON VW_MOVES.REGISTRATOR_ID = VW_MOVES1.REGISTRATOR_ID
WHERE VW_MOVES.DEB         = '600'
AND VW_MOVES1.KRED         = '600'
GROUP BY VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES1.KRED;
--------------------------------------------------------
--  DDL for View OBOROT_MOVIES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "OBOROT_MOVIES" ("ID", "ACC_TYPE", "PARENT_ID", "FULLNAME", "DIVISION_ID", "CODE", "START_OST", "SUM_DEB", "SUM_KRED", "END_OST") AS 
  WITH acc_deb AS
  (SELECT OBOROT_MOVIES_DEB.PLAN_ACC_ID, OBOROT_MOVIES_DEB.DIVISION_ID,
    SUM(OBOROT_MOVIES_DEB.SUM_DEB) Sum_Deb
  FROM OBOROT_MOVIES_DEB
  GROUP BY OBOROT_MOVIES_DEB.PLAN_ACC_ID, OBOROT_MOVIES_DEB.DIVISION_ID
  ),
  acc_kred as
  (SELECT OBOROT_MOVIES_KRED.PLAN_ACC_ID, OBOROT_MOVIES_KRED.DIVISION_ID,
    SUM(OBOROT_MOVIES_KRED.SUM_KRED) Sum_Kred
  FROM OBOROT_MOVIES_KRED
  GROUP BY OBOROT_MOVIES_KRED.PLAN_ACC_ID, OBOROT_MOVIES_KRED.DIVISION_ID
  ), div as
  (select id from divisions where is_group = 0 and deleted = 0)
SELECT p.ID, p.ACC_TYPE, p.PARENT_ID, p.FULLNAME, div.id division_id,
  p.CODE, entry.get_ostatok_by_date(p.CODE,ORDERS_ENTRY.get_startdatmoves(),div.id) start_ost,
  NVL((SELECT Sum_Deb FROM acc_deb WHERE acc_deb.PLAN_ACC_ID = p.ID and acc_deb.DIVISION_ID = div.id
  ),0) sum_deb,
  NVL((SELECT Sum_Kred FROM acc_kred WHERE acc_kred.PLAN_ACC_ID = p.ID and acc_kred.DIVISION_ID = div.id
  ),0) sum_kred, entry.get_ostatok_by_date(p.CODE,ORDERS_ENTRY.get_enddatmoves(), div.id) end_ost
FROM PLAN_ACC p, div
order by p.CODE;
--------------------------------------------------------
--  DDL for View OBOROT_MOVIES_DEB
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "OBOROT_MOVIES_DEB" ("PLAN_ACC_ID", "DEB", "SUM_DEB", "SUBCONTO1_DEB", "SUBCONTO2_DEB", "CURRENCY", "REGISTRATOR_ID", "ACTIVITIES_ID", "PERIOD", "DIVISION_ID") AS 
  SELECT PLAN_ACC.ID              AS Plan_Acc_Id,
  PLAN_ACC.CODE                 AS Deb,
  NVL(SUM(VW_MOVES.SUM_DEB), 0) AS Sum_Deb,
  VW_MOVES.SUBCONTO1_DEB,
  VW_MOVES.SUBCONTO2_DEB,
  VW_MOVES.CURRENCY,
  VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.ACTIVITIES_ID,
  VW_MOVES.PERIOD,
  VW_MOVES.DIVISION_ID
FROM PLAN_ACC
INNER JOIN VW_MOVES
ON PLAN_ACC.CODE              = VW_MOVES.DEB
WHERE TRUNC(VW_MOVES.PERIOD) >= TRUNC(ORDERS_ENTRY.get_startdatmoves())
AND TRUNC(VW_MOVES.PERIOD)   <= TRUNC(ORDERS_ENTRY.GET_ENDDATMOVES())
GROUP BY PLAN_ACC.ID,
  PLAN_ACC.CODE,
  VW_MOVES.SUBCONTO1_DEB,
  VW_MOVES.SUBCONTO2_DEB,
  VW_MOVES.CURRENCY,
  VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.ACTIVITIES_ID,
  VW_MOVES.PERIOD,
  VW_MOVES.DIVISION_ID
ORDER BY Deb;
--------------------------------------------------------
--  DDL for View OBOROT_MOVIES_KRED
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "OBOROT_MOVIES_KRED" ("PLAN_ACC_ID", "KRED", "SUM_KRED", "SUBCONTO1_KRED", "SUBCONTO2_KRED", "CURRENCY", "REGISTRATOR_ID", "ACTIVITIES_ID", "PERIOD", "DIVISION_ID") AS 
  SELECT PLAN_ACC.ID               AS Plan_Acc_Id,
  PLAN_ACC.CODE                  AS Kred,
  NVL(SUM(VW_MOVES.SUM_KRED), 0) AS Sum_Kred,
  VW_MOVES.SUBCONTO1_KRED,
  VW_MOVES.SUBCONTO2_KRED,
  VW_MOVES.CURRENCY,
  VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.ACTIVITIES_ID,
  VW_MOVES.PERIOD,
  VW_MOVES.DIVISION_ID
FROM PLAN_ACC
INNER JOIN VW_MOVES
ON PLAN_ACC.CODE              = VW_MOVES.KRED
WHERE TRUNC(VW_MOVES.PERIOD) >= TRUNC(ORDERS_ENTRY.get_startdatmoves())
AND TRUNC(VW_MOVES.PERIOD)   <= TRUNC(ORDERS_ENTRY.GET_ENDDATMOVES())
GROUP BY PLAN_ACC.ID,
  PLAN_ACC.CODE,
  VW_MOVES.SUBCONTO1_KRED,
  VW_MOVES.SUBCONTO2_KRED,
  VW_MOVES.CURRENCY,
  VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.ACTIVITIES_ID,
  VW_MOVES.PERIOD,
  VW_MOVES.DIVISION_ID
ORDER BY Kred;
--------------------------------------------------------
--  DDL for View ORDERS_CALC
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ORDERS_CALC" ("ID", "KONTRAG_ID", "KONTRAGNAME", "DIVISION_ID", "OPLATY", "USLUGIALL", "DEBT") AS 
  SELECT ID,
  KONTRAG_ID,
  FULLNAME AS KontragName,
  DIVISION_ID,
  Oplaty,
  (Uslugi + UslugiAdd) UslugiAll,
  (Uslugi + UslugiAdd - Oplaty) Debt
FROM
  (SELECT ORDERS.ID,
    ORDERS.KONTRAG_ID,
    ORDERS.DIVISION_ID,
    NVL(SUM(DISTINCT ORDERS_TP_OPLATY.SUM), 0)       AS Oplaty,
    NVL(SUM(DISTINCT ORDERS_TP_USLUGI.SUMM), 0)      AS Uslugi,
    NVL(SUM(DISTINCT ORDERS_TP_USLUGI.PRICE_ADD), 0) AS UslugiAdd,
    KONTRAGENTS.FULLNAME
  FROM ORDERS
  LEFT JOIN ORDERS_TP_OPLATY
  ON ORDERS.ID = ORDERS_TP_OPLATY.ORDER_ID
  LEFT JOIN ORDERS_TP_USLUGI
  ON ORDERS.ID = ORDERS_TP_USLUGI.ORDER_ID
  INNER JOIN KONTRAGENTS
  ON KONTRAGENTS.ID = ORDERS.KONTRAG_ID
  where ORDERS.POSTED = 1
  GROUP BY ORDERS.ID,
    ORDERS.KONTRAG_ID,
    ORDERS.DIVISION_ID,
    KONTRAGENTS.FULLNAME
  );
--------------------------------------------------------
--  DDL for View VW_BALLANS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_BALLANS" ("ID", "PARENT_ID", "ACC_TYPE", "ACTIVE_PASSIVE", "CODE", "FULLNAME", "START_OST", "SUM_DEB", "SUM_KRED", "END_OST", "DIVISION_ID") AS 
  SELECT oborot_movies.ID,
  oborot_movies.PARENT_ID,
  oborot_movies.ACC_TYPE,
  ENUM_ACCOUNT_TYPE.FULLNAME AS Active_Passive,
  oborot_movies.CODE,
  oborot_movies.FULLNAME,
  oborot_movies.START_OST,
  oborot_movies.SUM_DEB,
  oborot_movies.SUM_KRED,
  oborot_movies.END_OST,
  oborot_movies.DIVISION_ID
FROM oborot_movies
INNER JOIN ENUM_ACCOUNT_TYPE
ON oborot_movies.ACC_TYPE     = ENUM_ACCOUNT_TYPE.ID
WHERE (oborot_movies.SUM_DEB <> 0)
OR (oborot_movies.SUM_KRED   <> 0)
OR (oborot_movies.START_OST  <> 0)
OR (oborot_movies.END_OST    <> 0);
--------------------------------------------------------
--  DDL for View VW_BALLANS_AP
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_BALLANS_AP" ("ID", "CODE", "FULLNAME", "ACTIVE_START", "ACTIVE_DEB", "ACTIVE_KRED", "ACTIVE_OBOROT", "ACTIVE_END", "PASSIVE_START", "PASSIVE_DEB", "PASSIVE_KRED", "PASSIVE_OBOROT", "PASSIVE_END", "DIVISION_ID") AS 
  with act as
(select code,start_ost, sum_deb, sum_kred, end_ost, division_id, end_ost-start_ost oborot from vw_ballans where upper(ACTIVE_PASSIVE)=upper('Активный')
or upper(ACTIVE_PASSIVE)=upper('Активный/Пассивный')),
pass as
(select code,start_ost, sum_deb, sum_kred, end_ost, division_id, end_ost-start_ost oborot from vw_ballans where upper(ACTIVE_PASSIVE)=upper('Пассивный'))
select b.id, b.code, b.fullname, 
nvl((select start_ost from act where code = b.code and division_id = b.division_id),0) Active_Start,
nvl((select sum_deb from act where code = b.code and division_id = b.division_id),0) Active_Deb,
nvl((select sum_kred from act where code = b.code and division_id = b.division_id),0) Active_Kred,
nvl((select oborot from act where code = b.code and division_id = b.division_id),0) Active_Oborot,
nvl((select end_ost from act where code = b.code and division_id = b.division_id),0) Active_end,
nvl((select start_ost from pass where code = b.code and division_id = b.division_id),0) Passive_Start,
nvl((select sum_deb from pass where code = b.code and division_id = b.division_id),0) Passive_Deb,
nvl((select sum_kred from pass where code = b.code and division_id = b.division_id),0) Passive_Kred,
nvl((select oborot from pass where code = b.code and division_id = b.division_id),0) Passive_Oborot,
nvl((select end_ost from pass where code = b.code and division_id = b.division_id),0) Passive_End,
b.division_id from vw_ballans b;
--------------------------------------------------------
--  DDL for View VW_MOVES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_MOVES" ("ID", "REGISTRATOR_ID", "TABLE_NAME", "DEB", "SUM_DEB", "KRED", "SUM_KRED", "CURRENCY", "SUBCONTO1_DEB", "SUBCONTO2_DEB", "SUBCONTO1_KRED", "SUBCONTO2_KRED", "ACTIVITIES_ID", "DIVISION_ID", "PERIOD", "CURR_ID", "DESCRIPTION") AS 
  SELECT MOVES.ID,
  MOVES.REGISTRATOR_ID,
  TYPE_DEF.TABLE_NAME,
  PLAN_ACC.CODE              AS Deb,
  SUM(MOVES.SUMM_VAL_DEB)    AS Sum_Deb,
  PLAN_ACC1.CODE             AS Kred,
  SUM(MOVES.SUMM_VAL_KREDIT) AS Sum_Kred,
  CURRENCY.FULLNAME          AS Currency,
  MOVES.SUBCONTO1_DEB,
  MOVES.SUBCONTO2_DEB,
  MOVES.SUBCONTO1_KRED,
  MOVES.SUBCONTO2_KRED,
  MOVES.ACTIVITIES_ID,
  MOVES.DIVISION_ID,
  MOVES.PERIOD,
  CURRENCY.ID AS Curr_Id,
  MOVES.DESCRIPTION
FROM MOVES
INNER JOIN PLAN_ACC
ON PLAN_ACC.ID = MOVES.PLAN_ACC_DEB_ID
INNER JOIN PLAN_ACC PLAN_ACC1
ON PLAN_ACC1.ID = MOVES.PLAN_ACC_KRED_ID
INNER JOIN CURRENCY
ON CURRENCY.ID = MOVES.CURR_DEB
INNER JOIN TYPE_DEF
ON MOVES.REGISTRATOR_TYPE = TYPE_DEF.ID
GROUP BY MOVES.ID,
  MOVES.REGISTRATOR_ID,
  TYPE_DEF.TABLE_NAME,
  PLAN_ACC.CODE,
  PLAN_ACC1.CODE,
  CURRENCY.FULLNAME,
  MOVES.SUBCONTO1_DEB,
  MOVES.SUBCONTO2_DEB,
  MOVES.SUBCONTO1_KRED,
  MOVES.SUBCONTO2_KRED,
  MOVES.ACTIVITIES_ID,
  MOVES.DIVISION_ID,
  MOVES.PERIOD,
  CURRENCY.ID,
  MOVES.DESCRIPTION
ORDER BY Deb;
--------------------------------------------------------
--  DDL for View VW_MOVE_ORDERS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_MOVE_ORDERS" ("REGISTRATOR_ID", "DEB", "SUM_DEB", "KRED", "SUM_KRED", "SUBCONTO1_DEB", "SUBCONTO1_KRED", "SUBCONTO2_KRED") AS 
  SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  KONTRAGENTS.FULLNAME  AS Subconto1_Deb,
  DIVISIONS.FULLNAME    AS Subconto1_Kred,
  NOMENKLATURA.FULLNAME AS Subconto2_Kred
FROM VW_MOVES
INNER JOIN KONTRAGENTS
ON VW_MOVES.SUBCONTO1_DEB = KONTRAGENTS.ID
INNER JOIN DIVISIONS
ON VW_MOVES.SUBCONTO1_KRED = DIVISIONS.ID
LEFT JOIN NOMENKLATURA
ON VW_MOVES.SUBCONTO2_KRED = NOMENKLATURA.ID
UNION
SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  KONTRAGENTS.FULLNAME AS Subconto1_Deb,
  KASSA.FULLNAME,
  NOMENKLATURA.FULLNAME AS FULLNAME1
FROM VW_MOVES
INNER JOIN KONTRAGENTS
ON VW_MOVES.SUBCONTO1_DEB = KONTRAGENTS.ID
INNER JOIN KASSA
ON VW_MOVES.SUBCONTO1_KRED = KASSA.ID
LEFT JOIN NOMENKLATURA
ON VW_MOVES.SUBCONTO2_KRED = NOMENKLATURA.ID
UNION
SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  KASSA.FULLNAME,
  KONTRAGENTS.FULLNAME  AS Subconto1_Deb,
  NOMENKLATURA.FULLNAME AS FULLNAME1
FROM VW_MOVES
INNER JOIN KASSA
ON VW_MOVES.SUBCONTO1_DEB = KASSA.ID
INNER JOIN KONTRAGENTS
ON VW_MOVES.SUBCONTO1_KRED = KONTRAGENTS.ID
LEFT JOIN NOMENKLATURA
ON VW_MOVES.SUBCONTO2_KRED = NOMENKLATURA.ID
UNION
SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  ZATRATY.FULLNAME      AS Subconto1_Deb,
  KASSA.FULLNAME        AS Subconto1_Kred,
  NOMENKLATURA.FULLNAME AS Subconto2_Kred
FROM VW_MOVES
INNER JOIN ZATRATY
ON VW_MOVES.SUBCONTO1_DEB = ZATRATY.ID
INNER JOIN KASSA
ON VW_MOVES.SUBCONTO1_KRED = KASSA.ID
LEFT JOIN NOMENKLATURA
ON VW_MOVES.SUBCONTO2_KRED = NOMENKLATURA.ID
UNION
SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  DIVISIONS.FULLNAME,
  ZATRATY.FULLNAME      AS FULLNAME1,
  NOMENKLATURA.FULLNAME AS FULLNAME2
FROM VW_MOVES
INNER JOIN DIVISIONS
ON VW_MOVES.SUBCONTO1_DEB = DIVISIONS.ID
INNER JOIN ZATRATY
ON VW_MOVES.SUBCONTO1_KRED = ZATRATY.ID
LEFT JOIN NOMENKLATURA
ON VW_MOVES.SUBCONTO2_KRED = NOMENKLATURA.ID
UNION
SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  DIVISIONS.FULLNAME,
  KONTRAGENTS.FULLNAME  AS FULLNAME1,
  NOMENKLATURA.FULLNAME AS FULLNAME2
FROM VW_MOVES
INNER JOIN DIVISIONS
ON VW_MOVES.SUBCONTO1_DEB = DIVISIONS.ID
LEFT JOIN NOMENKLATURA
ON VW_MOVES.SUBCONTO2_KRED = NOMENKLATURA.ID
INNER JOIN KONTRAGENTS
ON VW_MOVES.SUBCONTO1_KRED = KONTRAGENTS.ID
UNION
SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  DIVISIONS.FULLNAME,
  DIVISIONS1.FULLNAME   AS FULLNAME1,
  NOMENKLATURA.FULLNAME AS FULLNAME2
FROM VW_MOVES
INNER JOIN DIVISIONS
ON VW_MOVES.SUBCONTO1_DEB = DIVISIONS.ID
INNER JOIN DIVISIONS DIVISIONS1
ON VW_MOVES.SUBCONTO1_KRED = DIVISIONS1.ID
LEFT JOIN NOMENKLATURA
ON VW_MOVES.SUBCONTO2_KRED = NOMENKLATURA.ID
UNION
SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  ZATRATY.FULLNAME      AS Subconto1_Deb,
  KONTRAGENTS.FULLNAME        AS Subconto1_Kred,
  NOMENKLATURA.FULLNAME AS Subconto2_Kred
FROM VW_MOVES
INNER JOIN ZATRATY
ON VW_MOVES.SUBCONTO1_DEB = ZATRATY.ID
INNER JOIN KONTRAGENTS
ON VW_MOVES.SUBCONTO1_KRED = KONTRAGENTS.ID
LEFT JOIN NOMENKLATURA
ON VW_MOVES.SUBCONTO2_KRED = NOMENKLATURA.ID;
--------------------------------------------------------
--  DDL for View VW_MOVE_OTHER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_MOVE_OTHER" ("REGISTRATOR_ID", "DEB", "SUM_DEB", "KRED", "SUM_KRED", "SUBCONTO1_DEB", "SUBCONTO1_KRED") AS 
  SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  ZATRATY.FULLNAME AS Subconto1_Deb,
  KASSA.FULLNAME   AS Subconto1_Kred
FROM VW_MOVES
INNER JOIN ZATRATY
ON VW_MOVES.SUBCONTO1_DEB = ZATRATY.ID
INNER JOIN KASSA
ON VW_MOVES.SUBCONTO1_KRED = KASSA.ID
UNION
SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  DIVISIONS.FULLNAME,
  ZATRATY.FULLNAME AS FULLNAME1
FROM VW_MOVES
INNER JOIN DIVISIONS
ON VW_MOVES.SUBCONTO1_DEB = DIVISIONS.ID
INNER JOIN ZATRATY
ON VW_MOVES.SUBCONTO1_KRED = ZATRATY.ID;
--------------------------------------------------------
--  DDL for View VW_MOVE_PKO
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_MOVE_PKO" ("REGISTRATOR_ID", "DEB", "SUM_DEB", "KRED", "SUM_KRED", "SUBCONTO_DEB1", "SUBCONTO_KRED1") AS 
  SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  KASSA.FULLNAME       AS Subconto_Deb1,
  KONTRAGENTS.FULLNAME AS Subconto_kred1
FROM VW_MOVES
LEFT JOIN KASSA
ON VW_MOVES.SUBCONTO1_DEB = KASSA.ID
LEFT JOIN KONTRAGENTS
ON VW_MOVES.SUBCONTO1_KRED = KONTRAGENTS.ID
WHERE VW_MOVES.DEB         = '2081' and
UPPER(VW_MOVES.TABLE_NAME) = UPPER('PKO');
--------------------------------------------------------
--  DDL for View VW_MOVE_PROFIT
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_MOVE_PROFIT" ("REGISTRATOR_ID", "DEB", "SUM_DEB", "KRED", "SUM_KRED", "SUBCONTO_DEB1", "SUBCONTO_KRED1") AS 
  SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  DIVISIONS.FULLNAME       AS Subconto_Deb1,
  KONTRAGENTS.FULLNAME AS Subconto_kred1
FROM VW_MOVES
LEFT JOIN DIVISIONS
ON VW_MOVES.SUBCONTO1_DEB = DIVISIONS.ID
LEFT JOIN KONTRAGENTS
ON VW_MOVES.SUBCONTO1_KRED = KONTRAGENTS.ID
WHERE VW_MOVES.DEB         = '900' and
VW_MOVES.KRED         = '5091' and
UPPER(VW_MOVES.TABLE_NAME) = UPPER('PROFIT_DISTRIB')
UNION
SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  DIVISIONS.FULLNAME,
  d.FULLNAME
FROM VW_MOVES
LEFT JOIN DIVISIONS
ON VW_MOVES.SUBCONTO1_DEB = DIVISIONS.ID
LEFT JOIN DIVISIONS d
ON VW_MOVES.SUBCONTO1_KRED = d.ID
WHERE VW_MOVES.DEB         = '900' and
VW_MOVES.KRED         = '000' and
UPPER(VW_MOVES.TABLE_NAME) = UPPER('PROFIT_DISTRIB')
UNION
SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  DIVISIONS.FULLNAME,
  d.FULLNAME
FROM VW_MOVES
LEFT JOIN DIVISIONS
ON VW_MOVES.SUBCONTO1_DEB = DIVISIONS.ID
LEFT JOIN DIVISIONS d
ON VW_MOVES.SUBCONTO1_KRED = d.ID
WHERE VW_MOVES.DEB         = '000' and
VW_MOVES.KRED         = '900' and
UPPER(VW_MOVES.TABLE_NAME) = UPPER('PROFIT_DISTRIB');
--------------------------------------------------------
--  DDL for View VW_MOVE_RKO
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_MOVE_RKO" ("REGISTRATOR_ID", "DEB", "SUM_DEB", "KRED", "SUM_KRED", "SUBCONTO_DEB1", "SUBCONTO_KRED1") AS 
  SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  case
    when KONTRAGENTS.FULLNAME is null
      then (select fullname from kassa where id = VW_MOVES.SUBCONTO1_DEB)
    else KONTRAGENTS.FULLNAME
  end AS Subconto_Deb1,   
  KASSA.FULLNAME       AS Subconto_Kred1
FROM VW_MOVES
LEFT JOIN KONTRAGENTS
ON VW_MOVES.SUBCONTO1_DEB = KONTRAGENTS.ID
LEFT JOIN KASSA
ON VW_MOVES.SUBCONTO1_KRED     = KASSA.ID
WHERE (VW_MOVES.KRED            = '2081')
AND UPPER(VW_MOVES.TABLE_NAME) = UPPER('RKO');
--------------------------------------------------------
--  DDL for View VW_MOVE_START_OST
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_MOVE_START_OST" ("REGISTRATOR_ID", "DEB", "SUM_DEB", "SUBCONTO1_DEB", "SUBCONTO2_DEB", "KRED", "SUM_KRED", "SUBCONTO1_KRED", "SUBCONTO2_KRED") AS 
  SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.DEB,
  VW_MOVES.SUM_DEB,
  VW_MOVES.SUBCONTO1_DEB,
  VW_MOVES.SUBCONTO2_DEB,
  VW_MOVES.KRED,
  VW_MOVES.SUM_KRED,
  VW_MOVES.SUBCONTO1_KRED,
  VW_MOVES.SUBCONTO2_KRED
FROM VW_MOVES
WHERE UPPER(VW_MOVES.TABLE_NAME) = UPPER('start_ost');
--------------------------------------------------------
--  DDL for View VW_NET
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_NET" ("ID", "PARENT_ID", "FULLNAME", "DELETED", "INN", "OKPO", "KPP", "NAMEFULL", "UR_FIZ", "IS_SUPPLIER", "IS_BUYER", "IS_MEASURER", "USER_ID", "PHOTO") AS 
  SELECT KONTRAG_SETTINGS.KONTRAG_ID AS ID,
  KONTRAG_SETTINGS.DIVISION_ID     AS Parent_id,
  KONTRAGENTS.FULLNAME             AS fullname,
  KONTRAGENTS.DELETED,
  KONTRAGENTS.INN,
  KONTRAGENTS.OKPO,
  KONTRAGENTS.KPP,
  KONTRAGENTS.NAMEFULL,
  KONTRAGENTS.UR_FIZ,
  KONTRAGENTS.IS_SUPPLIER,
  KONTRAGENTS.IS_BUYER,
  KONTRAGENTS.IS_MEASURER,
  KONTRAGENTS.USER_ID,
  KONTRAGENTS.PHOTO
FROM KONTRAG_SETTINGS
INNER JOIN KONTRAGENTS
ON KONTRAGENTS.ID = KONTRAG_SETTINGS.KONTRAG_ID
where base_id in (select id from BASE_OF_NACHISL where name = 'IERARHIA')
and pay_id in (select id from PAY_SETTINGS where PAY_SETTINGS.IN_PROFIT = 0);
--------------------------------------------------------
--  DDL for View VW_NOTIFICATION_CALENDAR
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_NOTIFICATION_CALENDAR" ("ID", "SCHED_NAME", "JOB_NAME", "JOB_GROUP", "JOB_DESCRIPTION", "JOB_CLASS_NAME", "TRIGGER_NAME", "NEXT_FIRE_TIME", "PREV_FIRE_TIME", "TRG_DESCRIPTION", "TRIGGER_TYPE", "CRON_EXPRESSION", "DAT", "DESCRIPTION", "USER_ID", "CONTACT", "SERVER", "CLIENT", "USER_LOGIN", "OBJECT_ID", "START_DATE", "END_DATE") AS 
  SELECT NOTIFICATION.ID,
  QRTZ_JOB_DETAILS.SCHED_NAME,
  QRTZ_JOB_DETAILS.JOB_NAME,
  QRTZ_JOB_DETAILS.JOB_GROUP,
  QRTZ_JOB_DETAILS.DESCRIPTION AS JOB_DESCRIPTION,
  QRTZ_JOB_DETAILS.JOB_CLASS_NAME,
  QRTZ_TRIGGERS.TRIGGER_NAME,
  (TO_DATE('01/01/1970 00:00:00','DD/MM/YYYY HH24:MI:SS') + (QRTZ_TRIGGERS.NEXT_FIRE_TIME /1000/60/60/24)) AS NEXT_FIRE_TIME,
  (TO_DATE('01/01/1970 00:00:00','DD/MM/YYYY HH24:MI:SS') + (QRTZ_TRIGGERS.PREV_FIRE_TIME /1000/60/60/24)) AS PREV_FIRE_TIME,
  QRTZ_TRIGGERS.DESCRIPTION AS TRG_DESCRIPTION,
  QRTZ_TRIGGERS.TRIGGER_TYPE,
  QRTZ_CRON_TRIGGERS.CRON_EXPRESSION,
  NOTIFICATION.DAT,
  NOTIFICATION.DESCRIPTION,
  NOTIFICATION.USER_ID,
  NOTIFICATION.CONTACT,
  NOTIFICATION.SERVER,
  NOTIFICATION.CLIENT,
  NOTIFICATION.USER_LOGIN,
  NOTIFICATION.OBJECT_ID,
  NOTIFICATION.START_DATE,
  NOTIFICATION.END_DATE
FROM QRTZ_JOB_DETAILS
INNER JOIN QRTZ_TRIGGERS
ON QRTZ_JOB_DETAILS.SCHED_NAME = QRTZ_TRIGGERS.SCHED_NAME
AND QRTZ_JOB_DETAILS.JOB_NAME  = QRTZ_TRIGGERS.JOB_NAME
AND QRTZ_JOB_DETAILS.JOB_GROUP = QRTZ_TRIGGERS.JOB_GROUP
INNER JOIN QRTZ_CRON_TRIGGERS
ON QRTZ_TRIGGERS.SCHED_NAME     = QRTZ_CRON_TRIGGERS.SCHED_NAME
AND QRTZ_TRIGGERS.TRIGGER_NAME  = QRTZ_CRON_TRIGGERS.TRIGGER_NAME
AND QRTZ_TRIGGERS.TRIGGER_GROUP = QRTZ_CRON_TRIGGERS.TRIGGER_GROUP
RIGHT JOIN NOTIFICATION
ON QRTZ_TRIGGERS.TRIGGER_NAME = NOTIFICATION.TRG_NAME;
--------------------------------------------------------
--  DDL for View VW_RATING
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_RATING" ("PLACE", "DIVISION_ID", "CNT", "TOTAL", "BALL_SUM", "BALL_CNT", "BALL_TOTAL") AS 
  select rownum place, division_id, cnt, total, totalsum ball_sum, totalcnt ball_cnt, totalball ball_total
from 
(select division_id, cnt, total, 
  total*nvl((select RATING_SETTINGS.SUM_BAL from RATING_SETTINGS where rownum = 1),0)/nvl((select RATING_SETTINGS.SUM_DIVIDER from RATING_SETTINGS where rownum = 1),1) TotalSum,
  cnt*nvl((select RATING_SETTINGS.CNT_BAL from RATING_SETTINGS where rownum = 1),0)/nvl((select RATING_SETTINGS.CNT_DIVIDER from RATING_SETTINGS where rownum = 1),1) TotalCnt,
  (total*nvl((select RATING_SETTINGS.SUM_BAL from RATING_SETTINGS where rownum = 1),0)/nvl((select RATING_SETTINGS.SUM_DIVIDER from RATING_SETTINGS where rownum = 1),1))
  +(cnt*nvl((select RATING_SETTINGS.CNT_BAL from RATING_SETTINGS where rownum = 1),0)/nvl((select RATING_SETTINGS.CNT_DIVIDER from RATING_SETTINGS where rownum = 1),1)) TotalBall
  from (SELECT COUNT(DISTINCT ORDERS.ID) cnt,
    (select kontrag_id from user_settings where user_id = ORDERS.USER_ID and rownum = 1) as DIVISION_ID,
    SUM((NVL(ORDERS_TP_USLUGI.SUMM, 0) + NVL(ORDERS_TP_USLUGI.PRICE_ADD, 0))) Total
    FROM ORDERS
    INNER JOIN ORDERS_TP_USLUGI
    ON ORDERS.ID = ORDERS_TP_USLUGI.ORDER_ID
    WHERE ORDERS.STATUS_ID NOT IN (select os.id from ORDER_STATUS os where os.name in ('Отказ','Аннулирован','Контроль'))
    AND (ORDERS.DAT between ORDERS_ENTRY.get_startdatmoves() and ORDERS_ENTRY.GET_ENDDATMOVES())
    GROUP BY ORDERS.USER_ID)
ORDER BY TOTALBALL DESC);
--------------------------------------------------------
--  DDL for View VW_SALES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_SALES" ("ORDER_ID", "KONTRAG_ID", "PERIOD", "DIVISION_ID", "SALES_SUMMA", "FACT_SEBEST_SUMMA", "PLAN_SEBEST_SUMMA", "STATUS_ID", "DAT_COMPLETE") AS 
  with sales as
(select registrator_id, period, summa, VW_SALES_ORDERS.SUBCONTO1_DEB kontrag_id from VW_SALES_ORDERS
where trunc(period) >= trunc(ORDERS_ENTRY.get_startdatmoves())
and trunc(period) <= trunc(ORDERS_ENTRY.get_enddatmoves())),
sebest as
(select registrator_id, period, summa, VW_SEBEST_ORDERS.SUBCONTO1_DEB division_id from VW_SEBEST_ORDERS
where trunc(period) >= trunc(ORDERS_ENTRY.get_startdatmoves())
and trunc(period) <= trunc(ORDERS_ENTRY.get_enddatmoves()))
select o.id order_id, o.kontrag_id, o.dat period, o.division_id,
(select sales.summa from sales where sales.registrator_id =o.id) sales_summa,
(select sebest.summa from sebest where sebest.registrator_id =o.id) fact_sebest_summa,
o.summ_plan plan_sebest_summa, o.status_id, o.dat_complete
from orders o where o.deleted = 0
and trunc(o.dat) >= trunc(ORDERS_ENTRY.get_startdatmoves())
and trunc(o.dat) <= trunc(ORDERS_ENTRY.get_enddatmoves());
--------------------------------------------------------
--  DDL for View VW_SALES_ORDERS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_SALES_ORDERS" ("REGISTRATOR_ID", "TABLE_NAME", "CODE", "SUMMA", "SUBCONTO1_DEB", "FULLNAME", "PERIOD") AS 
  SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.TABLE_NAME,
  VW_MOVES.DEB           AS Code,
  SUM(VW_MOVES.SUM_DEB)  AS Summa,
  VW_MOVES.SUBCONTO1_DEB AS Subconto1_Deb,
  KONTRAGENTS.FULLNAME,
  VW_MOVES.PERIOD
FROM VW_MOVES
INNER JOIN KONTRAGENTS
ON VW_MOVES.SUBCONTO1_DEB = KONTRAGENTS.ID
WHERE VW_MOVES.DEB        = '20711'
GROUP BY VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.TABLE_NAME,
  VW_MOVES.DEB,
  VW_MOVES.SUBCONTO1_DEB,
  KONTRAGENTS.FULLNAME,
  VW_MOVES.PERIOD;
--------------------------------------------------------
--  DDL for View VW_SEBEST_ORDERS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_SEBEST_ORDERS" ("REGISTRATOR_ID", "TABLE_NAME", "CODE", "SUMMA", "SUMM_PLAN", "SUBCONTO1_DEB", "FULLNAME", "PERIOD") AS 
  SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.TABLE_NAME,
  VW_MOVES.DEB          AS Code,
  SUM(VW_MOVES.SUM_DEB) AS Summa,
  ORDERS.SUMM_PLAN,
  VW_MOVES.SUBCONTO1_DEB AS Subconto1_Deb,
  DIVISIONS.FULLNAME,
  VW_MOVES.PERIOD
FROM VW_MOVES
INNER JOIN DIVISIONS
ON VW_MOVES.SUBCONTO1_DEB = DIVISIONS.ID
INNER JOIN ORDERS
ON VW_MOVES.REGISTRATOR_ID = ORDERS.ID
WHERE VW_MOVES.DEB         = '701'
GROUP BY VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.TABLE_NAME,
  VW_MOVES.DEB,
  ORDERS.SUMM_PLAN,
  VW_MOVES.SUBCONTO1_DEB,
  DIVISIONS.FULLNAME,
  VW_MOVES.PERIOD;
--------------------------------------------------------
--  DDL for View VW_TBL_DELETED
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_TBL_DELETED" ("TABLE_ID", "MAIN_ID", "TABLE_NAME", "OBJNAME", "CONSTRAINT_TYPE", "REF_STR") AS 
  select "TABLE_ID","MAIN_ID","TABLE_NAME","COLUMN_NAME" as ObjName,"CONSTRAINT_TYPE","REF_STR" from
  table(cast(REPORT_PKG.get_deleted_tables() as tbl_deleted));
--------------------------------------------------------
--  DDL for View VW_TBL_DEL_REF
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_TBL_DEL_REF" ("TABLE_ID", "MAIN_ID", "TABLE_NAME", "COLUMN_NAME", "CONSTRAINT_TYPE", "REF_STR") AS 
  select "TABLE_ID","MAIN_ID","TABLE_NAME","COLUMN_NAME","CONSTRAINT_TYPE","REF_STR" from table(cast(REPORT_PKG.get_deletedref_tables() as tbl_deleted_ref)) ref_tbl;
--------------------------------------------------------
--  DDL for View VW_ZATRATY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VW_ZATRATY" ("REGISTRATOR_ID", "TABLE_NAME", "CODE", "SUMMA", "ZATRATY_ID", "ZATRATY_NAME", "DIVISION_ID", "PERIOD") AS 
  SELECT VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.TABLE_NAME,
  VW_MOVES.DEB           AS Code,
  SUM(VW_MOVES.SUM_DEB)  AS Summa,
  VW_MOVES.SUBCONTO1_DEB AS Zatraty_id,
  ZATRATY.FULLNAME       AS Zatraty_name,
  VW_MOVES.DIVISION_ID,
  VW_MOVES.PERIOD
FROM VW_MOVES
INNER JOIN ZATRATY
ON VW_MOVES.SUBCONTO1_DEB = ZATRATY.ID
WHERE VW_MOVES.DEB        = '80212'
and trunc(VW_MOVES.PERIOD) >= trunc(ORDERS_ENTRY.get_startdatmoves())
and trunc(VW_MOVES.PERIOD) <= trunc(ORDERS_ENTRY.get_enddatmoves())
GROUP BY VW_MOVES.REGISTRATOR_ID,
  VW_MOVES.TABLE_NAME,
  VW_MOVES.DEB,
  VW_MOVES.SUBCONTO1_DEB,
  ZATRATY.FULLNAME,
  VW_MOVES.DIVISION_ID,
  VW_MOVES.PERIOD;
--------------------------------------------------------
--  DDL for Index ASTER_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ASTER_SETTINGS_PK" ON "ASTER_SETTINGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index BASE_OF_CALC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BASE_OF_CALC_PK" ON "BASE_OF_CALC" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index BASE_OF_NACHISL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BASE_OF_NACHISL_PK" ON "BASE_OF_NACHISL" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CALENDAR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CALENDAR_PK" ON "CALENDAR" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CALL_LISTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CALL_LISTS_PK" ON "CALL_LISTS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CALL_LOG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CALL_LOG_PK" ON "CALL_LOG" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CALL_MEMO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CALL_MEMO_PK" ON "CALL_MEMO" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CALL_RESULTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CALL_RESULTS_PK" ON "CALL_RESULTS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CALL_STATUS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CALL_STATUS_PK" ON "CALL_STATUS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CDR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CDR_PK" ON "CDR" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index COMPAIGNS_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COMPAIGNS_DETAILS_PK" ON "COMPAIGNS_DETAILS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index COMPAIGNS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COMPAIGNS_PK" ON "COMPAIGNS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CONTACT_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CONTACT_DETAILS_PK" ON "CONTACT_DETAILS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CURRENCY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CURRENCY_PK" ON "CURRENCY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index DIR_FILE_UPLOAD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DIR_FILE_UPLOAD_PK" ON "DIR_FILE_UPLOAD" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index DIVISIONS_INDEX1
--------------------------------------------------------

  CREATE INDEX "DIVISIONS_INDEX1" ON "DIVISIONS" ("IS_GROUP", "DELETED") 
  ;
--------------------------------------------------------
--  DDL for Index DIVISIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DIVISIONS_PK" ON "DIVISIONS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index DIVISION_SOTR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DIVISION_SOTR_PK" ON "DIVISION_SOTR" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ENTRY_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENTRY_SETTINGS_PK" ON "ENTRY_SETTINGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ENUM_ACCOUNT_TYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENUM_ACCOUNT_TYPE_PK" ON "ENUM_ACCOUNT_TYPE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ENUM_ACCOUNT_TYPE_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENUM_ACCOUNT_TYPE_UK1" ON "ENUM_ACCOUNT_TYPE" ("FULLNAME") 
  ;
--------------------------------------------------------
--  DDL for Index EX_RATES_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EX_RATES_SETTINGS_PK" ON "EX_RATES_SETTINGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index EX_RATES_SETTINGS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "EX_RATES_SETTINGS_UK1" ON "EX_RATES_SETTINGS" ("CURR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index FIRMS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FIRMS_PK" ON "FIRMS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index GROUPMEMBERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "GROUPMEMBERS_PK" ON "GROUPMEMBERS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index GROUPS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "GROUPS_UK1" ON "GROUPS" ("FULLNAME") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_FT_INST_JOB_REQ_RCVRY
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_FT_INST_JOB_REQ_RCVRY" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "INSTANCE_NAME", "REQUESTS_RECOVERY") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_FT_JG
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_FT_JG" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "JOB_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_FT_J_G
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_FT_J_G" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "JOB_NAME", "JOB_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_FT_TG
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_FT_TG" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_FT_TRIG_INST_NAME
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_FT_TRIG_INST_NAME" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "INSTANCE_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_FT_T_G
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_FT_T_G" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_J_GRP
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_J_GRP" ON "QRTZ_JOB_DETAILS" ("SCHED_NAME", "JOB_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_J_REQ_RECOVERY
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_J_REQ_RECOVERY" ON "QRTZ_JOB_DETAILS" ("SCHED_NAME", "REQUESTS_RECOVERY") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_C
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_C" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "CALENDAR_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_G
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_G" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_J
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_J" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "JOB_NAME", "JOB_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_JG
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_JG" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "JOB_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_NEXT_FIRE_TIME
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_NEXT_FIRE_TIME" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "NEXT_FIRE_TIME") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_NFT_MISFIRE
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_NFT_MISFIRE" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "MISFIRE_INSTR", "NEXT_FIRE_TIME") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_NFT_ST
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_NFT_ST" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_STATE", "NEXT_FIRE_TIME") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_NFT_ST_MISFIRE
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_NFT_ST_MISFIRE" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "MISFIRE_INSTR", "NEXT_FIRE_TIME", "TRIGGER_STATE") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_NFT_ST_MISFIRE_GRP
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_NFT_ST_MISFIRE_GRP" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "MISFIRE_INSTR", "NEXT_FIRE_TIME", "TRIGGER_GROUP", "TRIGGER_STATE") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_N_G_STATE
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_N_G_STATE" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_GROUP", "TRIGGER_STATE") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_N_STATE
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_N_STATE" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP", "TRIGGER_STATE") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_STATE
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_STATE" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_STATE") 
  ;
--------------------------------------------------------
--  DDL for Index IMPORTED_PRICE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMPORTED_PRICE_PK" ON "IMPORTED_PRICE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index KASSA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KASSA_PK" ON "KASSA" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index KASSA_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KASSA_SETTINGS_PK" ON "KASSA_SETTINGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index KONTRAGENTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KONTRAGENTS_PK" ON "KONTRAGENTS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index KONTRAG_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KONTRAG_SETTINGS_PK" ON "KONTRAG_SETTINGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MEASURE_UNIT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEASURE_UNIT_PK" ON "MEASURE_UNIT" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX1
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX1" ON "MOVES" ("PLAN_ACC_DEB_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX10
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX10" ON "MOVES" ("CURR_DEB") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX11
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX11" ON "MOVES" ("CURR_KRED") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX12
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX12" ON "MOVES" ("PERIOD") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX13
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX13" ON "MOVES" ("PLAN_ACC_DEB_ID", "DIVISION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX14
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX14" ON "MOVES" ("PLAN_ACC_KRED_ID", "DIVISION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX15
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX15" ON "MOVES" ("REGISTRATOR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX16
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX16" ON "MOVES" ("REGISTRATOR_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX2
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX2" ON "MOVES" ("PLAN_ACC_KRED_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX3
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX3" ON "MOVES" ("SUBCONTO1_DEB") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX4
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX4" ON "MOVES" ("SUBCONTO2_DEB") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX5
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX5" ON "MOVES" ("SUBCONTO3_DEB") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX6
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX6" ON "MOVES" ("SUBCONTO1_KRED") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX7
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX7" ON "MOVES" ("SUBCONTO2_KRED") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX8
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX8" ON "MOVES" ("SUBCONTO3_KRED") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_INDEX9
--------------------------------------------------------

  CREATE INDEX "MOVES_INDEX9" ON "MOVES" ("DIVISION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOVES_PK" ON "MOVES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index NACHISL_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NACHISL_SETTINGS_PK" ON "NACHISL_SETTINGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index NOMENKLATURA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NOMENKLATURA_PK" ON "NOMENKLATURA" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index NOTIFICATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NOTIFICATION_PK" ON "NOTIFICATION" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index NUMERATOR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NUMERATOR_PK" ON "NUMERATOR" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index OPERATION_PKO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OPERATION_PKO_PK" ON "OPERATION_PKO" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index OPERATION_RKO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OPERATION_RKO_PK" ON "OPERATION_RKO" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDERS_INDEX1
--------------------------------------------------------

  CREATE INDEX "ORDERS_INDEX1" ON "ORDERS" ("DAT") 
  ;
--------------------------------------------------------
--  DDL for Index ORDERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORDERS_PK" ON "ORDERS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDERS_TP_NACHISL_INDEX1
--------------------------------------------------------

  CREATE INDEX "ORDERS_TP_NACHISL_INDEX1" ON "ORDERS_TP_NACHISL" ("ORDER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDERS_TP_NACHISL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORDERS_TP_NACHISL_PK" ON "ORDERS_TP_NACHISL" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDERS_TP_OPLATY_INDEX1
--------------------------------------------------------

  CREATE INDEX "ORDERS_TP_OPLATY_INDEX1" ON "ORDERS_TP_OPLATY" ("ORDER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDERS_TP_OPLATY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORDERS_TP_OPLATY_PK" ON "ORDERS_TP_OPLATY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDERS_TP_RASHODY_INDEX1
--------------------------------------------------------

  CREATE INDEX "ORDERS_TP_RASHODY_INDEX1" ON "ORDERS_TP_RASHODY" ("ORDER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDERS_TP_RASHODY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORDERS_TP_RASHODY_PK" ON "ORDERS_TP_RASHODY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDERS_TP_USLUGI_INDEX1
--------------------------------------------------------

  CREATE INDEX "ORDERS_TP_USLUGI_INDEX1" ON "ORDERS_TP_USLUGI" ("ORDER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDERS_TP_USLUGI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORDERS_TP_USLUGI_PK" ON "ORDERS_TP_USLUGI" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDER_STATUS_INDEX1
--------------------------------------------------------

  CREATE INDEX "ORDER_STATUS_INDEX1" ON "ORDER_STATUS" ("NAME") 
  ;
--------------------------------------------------------
--  DDL for Index ORDER_STATUS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORDER_STATUS_PK" ON "ORDER_STATUS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index OTHER_ZATRATY_INDEX1
--------------------------------------------------------

  CREATE INDEX "OTHER_ZATRATY_INDEX1" ON "OTHER_ZATRATY" ("DAT") 
  ;
--------------------------------------------------------
--  DDL for Index OTHER_ZATRATY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OTHER_ZATRATY_PK" ON "OTHER_ZATRATY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index OTHER_ZATRATY_TAB_PART_ZAT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OTHER_ZATRATY_TAB_PART_ZAT_PK" ON "OTHER_ZATRATY_TAB_PART_ZATRATY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PAY_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PAY_SETTINGS_PK" ON "PAY_SETTINGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PKO_INDEX1
--------------------------------------------------------

  CREATE INDEX "PKO_INDEX1" ON "PKO" ("DAT") 
  ;
--------------------------------------------------------
--  DDL for Index PKO_INDEX2
--------------------------------------------------------

  CREATE INDEX "PKO_INDEX2" ON "PKO" ("ORDER_ID", "POSTED") 
  ;
--------------------------------------------------------
--  DDL for Index PKO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PKO_PK" ON "PKO" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PLAN_ACC_INDEX1
--------------------------------------------------------

  CREATE INDEX "PLAN_ACC_INDEX1" ON "PLAN_ACC" ("ACC_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index PLAN_ACC_INDEX2
--------------------------------------------------------

  CREATE INDEX "PLAN_ACC_INDEX2" ON "PLAN_ACC" ("CODE") 
  ;
--------------------------------------------------------
--  DDL for Index PLAN_ACC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PLAN_ACC_PK" ON "PLAN_ACC" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PLAN_ACC_SUBCONTO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PLAN_ACC_SUBCONTO_PK" ON "PLAN_ACC_SUBCONTO" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PLAN_ACC_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "PLAN_ACC_UK1" ON "PLAN_ACC" ("FULLNAME", "CODE") 
  ;
--------------------------------------------------------
--  DDL for Index PLAN_TYPE_SUBCONTO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PLAN_TYPE_SUBCONTO_PK" ON "PLAN_TYPE_SUBCONTO" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PLAN_TYPE_SUBCONTO_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "PLAN_TYPE_SUBCONTO_UK1" ON "PLAN_TYPE_SUBCONTO" ("TYPE_OF_OBJ") 
  ;
--------------------------------------------------------
--  DDL for Index PROFIT_DISTRIB_INDEX1
--------------------------------------------------------

  CREATE INDEX "PROFIT_DISTRIB_INDEX1" ON "PROFIT_DISTRIB" ("DAT") 
  ;
--------------------------------------------------------
--  DDL for Index PROFIT_DISTRIB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROFIT_DISTRIB_PK" ON "PROFIT_DISTRIB" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PROFIT_DISTRIB_TP_INDEX1
--------------------------------------------------------

  CREATE INDEX "PROFIT_DISTRIB_TP_INDEX1" ON "PROFIT_DISTRIB_TP" ("PROFIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PROFIT_DISTRIB_TP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROFIT_DISTRIB_TP_PK" ON "PROFIT_DISTRIB_TP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PROG_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROG_SETTINGS_PK" ON "PROG_SETTINGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PS_TXN_IDX
--------------------------------------------------------

  CREATE INDEX "PS_TXN_IDX" ON "PS_TXN" ("COLLID", "ID") REVERSE 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_BLOB_TRIG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_BLOB_TRIG_PK" ON "QRTZ_BLOB_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_CALENDARS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_CALENDARS_PK" ON "QRTZ_CALENDARS" ("SCHED_NAME", "CALENDAR_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_CRON_TRIG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_CRON_TRIG_PK" ON "QRTZ_CRON_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_FIRED_TRIGGER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_FIRED_TRIGGER_PK" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "ENTRY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_JOB_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_JOB_DETAILS_PK" ON "QRTZ_JOB_DETAILS" ("SCHED_NAME", "JOB_NAME", "JOB_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_LOCKS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_LOCKS_PK" ON "QRTZ_LOCKS" ("SCHED_NAME", "LOCK_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_PAUSED_TRIG_GRPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_PAUSED_TRIG_GRPS_PK" ON "QRTZ_PAUSED_TRIGGER_GRPS" ("SCHED_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_SCHEDULER_STATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_SCHEDULER_STATE_PK" ON "QRTZ_SCHEDULER_STATE" ("SCHED_NAME", "INSTANCE_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_SIMPLE_TRIG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_SIMPLE_TRIG_PK" ON "QRTZ_SIMPLE_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_SIMPROP_TRIG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_SIMPROP_TRIG_PK" ON "QRTZ_SIMPROP_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_TRIGGERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_TRIGGERS_PK" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index QUARTZ_PROPERTY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QUARTZ_PROPERTY_PK" ON "QUARTZ_PROPERTY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index RATING_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RATING_SETTINGS_PK" ON "RATING_SETTINGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index REG_PRICES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "REG_PRICES_PK" ON "REG_PRICES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index REG_RATES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "REG_RATES_PK" ON "REG_RATES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index RKO_INDEX1
--------------------------------------------------------

  CREATE INDEX "RKO_INDEX1" ON "RKO" ("DAT") 
  ;
--------------------------------------------------------
--  DDL for Index RKO_INDEX2
--------------------------------------------------------

  CREATE INDEX "RKO_INDEX2" ON "RKO" ("ORDER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index RKO_INDEX3
--------------------------------------------------------

  CREATE INDEX "RKO_INDEX3" ON "RKO" ("ORDER_ID", "POSTED") 
  ;
--------------------------------------------------------
--  DDL for Index RKO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RKO_PK" ON "RKO" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index START_OST_INDEX1
--------------------------------------------------------

  CREATE INDEX "START_OST_INDEX1" ON "START_OST" ("DAT") 
  ;
--------------------------------------------------------
--  DDL for Index START_OST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "START_OST_PK" ON "START_OST" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index START_OST_TP_INDEX1
--------------------------------------------------------

  CREATE INDEX "START_OST_TP_INDEX1" ON "START_OST_TP" ("START_OST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index START_OST_TP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "START_OST_TP_PK" ON "START_OST_TP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index TYPE_DEF_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TYPE_DEF_PK" ON "TYPE_DEF" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index TYPE_OF_ACTIVITIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TYPE_OF_ACTIVITIES_PK" ON "TYPE_OF_ACTIVITIES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index USERS_GROUPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERS_GROUPS_PK" ON "USERS_GROUPS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index USERS_GROUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERS_GROUP_PK" ON "GROUPS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERS_PK" ON "USERS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index USERS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERS_UK1" ON "USERS" ("LOGIN") 
  ;
--------------------------------------------------------
--  DDL for Index USER_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USER_SETTINGS_PK" ON "USER_SETTINGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index USER_SETTINGS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "USER_SETTINGS_UK1" ON "USER_SETTINGS" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index VOUCHER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "VOUCHER_PK" ON "VOUCHER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index WLS_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "WLS_SETTINGS_PK" ON "WLS_SETTINGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index XML_T_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XML_T_PK" ON "XML_T" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ZATRATY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ZATRATY_PK" ON "ZATRATY" ("ID") 
  ;
--------------------------------------------------------
--  Constraints for Table ASTER_SETTINGS
--------------------------------------------------------

  ALTER TABLE "ASTER_SETTINGS" ADD CONSTRAINT "ASTER_SETTINGS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "ASTER_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ASTER_SETTINGS" MODIFY ("SERVER" NOT NULL ENABLE);
 
  ALTER TABLE "ASTER_SETTINGS" MODIFY ("LOGIN_AM" NOT NULL ENABLE);
 
  ALTER TABLE "ASTER_SETTINGS" MODIFY ("PASS_AM" NOT NULL ENABLE);
 
  ALTER TABLE "ASTER_SETTINGS" MODIFY ("PORT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BALLANS
--------------------------------------------------------

  ALTER TABLE "BALLANS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "BALLANS" MODIFY ("CODE" NOT NULL ENABLE);
 
  ALTER TABLE "BALLANS" MODIFY ("FULLNAME" NOT NULL ENABLE);
 
  ALTER TABLE "BALLANS" MODIFY ("DIVISION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BASE_OF_CALC
--------------------------------------------------------

  ALTER TABLE "BASE_OF_CALC" ADD CONSTRAINT "BASE_OF_CALC_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "BASE_OF_CALC" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "BASE_OF_CALC" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "BASE_OF_CALC" MODIFY ("FULLNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BASE_OF_NACHISL
--------------------------------------------------------

  ALTER TABLE "BASE_OF_NACHISL" ADD CONSTRAINT "BASE_OF_NACHISL_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "BASE_OF_NACHISL" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "BASE_OF_NACHISL" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "BASE_OF_NACHISL" MODIFY ("FULLNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CALENDAR
--------------------------------------------------------

  ALTER TABLE "CALENDAR" ADD CONSTRAINT "CALENDAR_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "CALENDAR" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "CALENDAR" MODIFY ("PROVIDER" NOT NULL ENABLE);
 
  ALTER TABLE "CALENDAR" MODIFY ("START_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "CALENDAR" MODIFY ("END_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "CALENDAR" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CALL_LISTS
--------------------------------------------------------

  ALTER TABLE "CALL_LISTS" ADD CONSTRAINT "CALL_LISTS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "CALL_LISTS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_LISTS" MODIFY ("USERS_ID" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_LISTS" MODIFY ("KONTRAGENTS_ID" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_LISTS" MODIFY ("LIST_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_LISTS" MODIFY ("VERSION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CALL_LOG
--------------------------------------------------------

  ALTER TABLE "CALL_LOG" ADD CONSTRAINT "CALL_LOG_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "CALL_LOG" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_LOG" MODIFY ("CALL_STATUS" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_LOG" MODIFY ("CONTACT_ID" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_LOG" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_LOG" MODIFY ("DAT" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_LOG" MODIFY ("CALL_RESULTS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CALL_MEMO
--------------------------------------------------------

  ALTER TABLE "CALL_MEMO" ADD CONSTRAINT "CALL_MEMO_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "CALL_MEMO" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_MEMO" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_MEMO" MODIFY ("DAT" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_MEMO" MODIFY ("CALL_LOG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CALL_RESULTS
--------------------------------------------------------

  ALTER TABLE "CALL_RESULTS" ADD CONSTRAINT "CALL_RESULTS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "CALL_RESULTS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_RESULTS" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_RESULTS" MODIFY ("FULLNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CALL_STATUS
--------------------------------------------------------

  ALTER TABLE "CALL_STATUS" ADD CONSTRAINT "CALL_STATUS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "CALL_STATUS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_STATUS" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "CALL_STATUS" MODIFY ("FULLNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CDR
--------------------------------------------------------

  ALTER TABLE "CDR" ADD CONSTRAINT "CDR_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "CDR" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "CDR" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "CDR" MODIFY ("PHONE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COMPAIGNS
--------------------------------------------------------

  ALTER TABLE "COMPAIGNS" ADD CONSTRAINT "COMPAIGNS_DELETED_CHK" CHECK (deleted in (0,1)) ENABLE;
 
  ALTER TABLE "COMPAIGNS" ADD CONSTRAINT "COMPAIGNS_ENABLED_CHK" CHECK (enabled in (0,1)) ENABLE;
 
  ALTER TABLE "COMPAIGNS" ADD CONSTRAINT "COMPAIGNS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "COMPAIGNS" ADD CONSTRAINT "COMPAIGNS_PREDEFINED_CHK" CHECK (predefined in (0,1)) ENABLE;
 
  ALTER TABLE "COMPAIGNS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "COMPAIGNS" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "COMPAIGNS" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "COMPAIGNS" MODIFY ("ENABLED" NOT NULL ENABLE);
 
  ALTER TABLE "COMPAIGNS" MODIFY ("PREDEFINED" NOT NULL ENABLE);
 
  ALTER TABLE "COMPAIGNS" MODIFY ("DELETED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COMPAIGNS_DETAILS
--------------------------------------------------------

  ALTER TABLE "COMPAIGNS_DETAILS" ADD CONSTRAINT "COMPAIGNS_DETAILS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "COMPAIGNS_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "COMPAIGNS_DETAILS" MODIFY ("COMPAIGN_ID" NOT NULL ENABLE);
 
  ALTER TABLE "COMPAIGNS_DETAILS" MODIFY ("KONTRAG_ID" NOT NULL ENABLE);
 
  ALTER TABLE "COMPAIGNS_DETAILS" MODIFY ("CONTACT_ID" NOT NULL ENABLE);
 
  ALTER TABLE "COMPAIGNS_DETAILS" MODIFY ("VERSION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CONTACT_DETAILS
--------------------------------------------------------

  ALTER TABLE "CONTACT_DETAILS" ADD CONSTRAINT "CONTACT_DETAILS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "CONTACT_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "CONTACT_DETAILS" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "CONTACT_DETAILS" MODIFY ("KONTRAG_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CURRENCY
--------------------------------------------------------

  ALTER TABLE "CURRENCY" ADD CONSTRAINT "CURRENCY_CHK1" CHECK (deleted in (0,1)) ENABLE;
 
  ALTER TABLE "CURRENCY" ADD CONSTRAINT "CURRENCY_CHK2" CHECK (PREDEFINED in (0,1)) ENABLE;
 
  ALTER TABLE "CURRENCY" ADD CONSTRAINT "CURRENCY_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "CURRENCY" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "CURRENCY" MODIFY ("IS_GROUP" NOT NULL ENABLE);
 
  ALTER TABLE "CURRENCY" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "CURRENCY" MODIFY ("FULLNAME" NOT NULL ENABLE);
 
  ALTER TABLE "CURRENCY" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "CURRENCY" MODIFY ("PREDEFINED" NOT NULL ENABLE);
 
  ALTER TABLE "CURRENCY" MODIFY ("ID_XML" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DIR_FILE_UPLOAD
--------------------------------------------------------

  ALTER TABLE "DIR_FILE_UPLOAD" ADD CONSTRAINT "DIR_FILE_UPLOAD_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "DIR_FILE_UPLOAD" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "DIR_FILE_UPLOAD" MODIFY ("DIRECTORY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DIVISIONS
--------------------------------------------------------

  ALTER TABLE "DIVISIONS" ADD CONSTRAINT "DIVISIONS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "DIVISIONS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "DIVISIONS" MODIFY ("FULLNAME" NOT NULL ENABLE);
 
  ALTER TABLE "DIVISIONS" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "DIVISIONS" MODIFY ("IS_GROUP" NOT NULL ENABLE);
 
  ALTER TABLE "DIVISIONS" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "DIVISIONS" MODIFY ("PREDEFINED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DIVISION_SOTR
--------------------------------------------------------

  ALTER TABLE "DIVISION_SOTR" ADD CONSTRAINT "DIVISION_SOTR_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "DIVISION_SOTR" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "DIVISION_SOTR" MODIFY ("DIV_ID" NOT NULL ENABLE);
 
  ALTER TABLE "DIVISION_SOTR" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ENTRY_SETTINGS
--------------------------------------------------------

  ALTER TABLE "ENTRY_SETTINGS" ADD CONSTRAINT "ENTRY_SETTINGS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "ENTRY_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENTRY_SETTINGS" MODIFY ("TYPEDEF_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENTRY_SETTINGS" MODIFY ("PLAN_ACC_DEB_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENTRY_SETTINGS" MODIFY ("PLAN_ACC_KRED_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENTRY_SETTINGS" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "ENTRY_SETTINGS" MODIFY ("CHAIN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ENUM_ACCOUNT_TYPE
--------------------------------------------------------

  ALTER TABLE "ENUM_ACCOUNT_TYPE" ADD CONSTRAINT "ENUM_ACCOUNT_TYPE_CHK1" CHECK (FULLNAME IN ('Активный', 'Пассивный', 'Активный/Пассивный')) ENABLE;
 
  ALTER TABLE "ENUM_ACCOUNT_TYPE" ADD CONSTRAINT "ENUM_ACCOUNT_TYPE_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "ENUM_ACCOUNT_TYPE" ADD CONSTRAINT "ENUM_ACCOUNT_TYPE_UK1" UNIQUE ("FULLNAME") ENABLE;
 
  ALTER TABLE "ENUM_ACCOUNT_TYPE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENUM_ACCOUNT_TYPE" MODIFY ("FULLNAME" NOT NULL ENABLE);
 
  ALTER TABLE "ENUM_ACCOUNT_TYPE" MODIFY ("VERSION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EX_RATES_SETTINGS
--------------------------------------------------------

  ALTER TABLE "EX_RATES_SETTINGS" ADD CONSTRAINT "EX_RATES_SETTINGS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "EX_RATES_SETTINGS" ADD CONSTRAINT "EX_RATES_SETTINGS_UK1" UNIQUE ("CURR_ID") ENABLE;
 
  ALTER TABLE "EX_RATES_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "EX_RATES_SETTINGS" MODIFY ("CURR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "EX_RATES_SETTINGS" MODIFY ("VERSION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FIRMS
--------------------------------------------------------

  ALTER TABLE "FIRMS" ADD CONSTRAINT "FIRMS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "FIRMS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "FIRMS" MODIFY ("FULLNAME" NOT NULL ENABLE);
 
  ALTER TABLE "FIRMS" MODIFY ("PRINTNAME" NOT NULL ENABLE);
 
  ALTER TABLE "FIRMS" MODIFY ("UR_FIZ" NOT NULL ENABLE);
 
  ALTER TABLE "FIRMS" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "FIRMS" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "FIRMS" MODIFY ("PREDEFINED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GROUPMEMBERS
--------------------------------------------------------

  ALTER TABLE "GROUPMEMBERS" ADD CONSTRAINT "GROUPMEMBERS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "GROUPMEMBERS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "GROUPMEMBERS" MODIFY ("G_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "GROUPMEMBERS" MODIFY ("G_MEMBER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GROUPS
--------------------------------------------------------

  ALTER TABLE "GROUPS" ADD CONSTRAINT "GROUPS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "GROUPS" ADD CONSTRAINT "GROUPS_UK1" UNIQUE ("FULLNAME") ENABLE;
 
  ALTER TABLE "GROUPS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "GROUPS" MODIFY ("FULLNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table IMPORTED_PRICE
--------------------------------------------------------

  ALTER TABLE "IMPORTED_PRICE" ADD CONSTRAINT "IMPORTED_PRICE_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "IMPORTED_PRICE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "IMPORTED_PRICE" MODIFY ("DAT" NOT NULL ENABLE);
 
  ALTER TABLE "IMPORTED_PRICE" MODIFY ("NOM_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "IMPORTED_PRICE" MODIFY ("ED_IZM" NOT NULL ENABLE);
 
  ALTER TABLE "IMPORTED_PRICE" MODIFY ("PRICE_USL" NOT NULL ENABLE);
 
  ALTER TABLE "IMPORTED_PRICE" MODIFY ("PRICE_GOODS" NOT NULL ENABLE);
 
  ALTER TABLE "IMPORTED_PRICE" MODIFY ("VERSION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KASSA
--------------------------------------------------------

  ALTER TABLE "KASSA" ADD CONSTRAINT "KASSA_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "KASSA" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "KASSA" MODIFY ("FULLNAME" NOT NULL ENABLE);
 
  ALTER TABLE "KASSA" MODIFY ("IS_GROUP" NOT NULL ENABLE);
 
  ALTER TABLE "KASSA" MODIFY ("CURR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "KASSA" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "KASSA" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "KASSA" MODIFY ("PREDEFINED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KASSA_SETTINGS
--------------------------------------------------------

  ALTER TABLE "KASSA_SETTINGS" ADD CONSTRAINT "KASSA_SETTINGS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "KASSA_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "KASSA_SETTINGS" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "KASSA_SETTINGS" MODIFY ("KASSA_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KONTRAGENTS
--------------------------------------------------------

  ALTER TABLE "KONTRAGENTS" ADD CONSTRAINT "KONTRAGENTS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "KONTRAGENTS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "KONTRAGENTS" MODIFY ("IS_GROUP" NOT NULL ENABLE);
 
  ALTER TABLE "KONTRAGENTS" MODIFY ("FULLNAME" NOT NULL ENABLE);
 
  ALTER TABLE "KONTRAGENTS" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "KONTRAGENTS" MODIFY ("UR_FIZ" NOT NULL ENABLE);
 
  ALTER TABLE "KONTRAGENTS" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "KONTRAGENTS" MODIFY ("PREDEFINED" NOT NULL ENABLE);
 
  ALTER TABLE "KONTRAGENTS" MODIFY ("IS_SUPPLIER" NOT NULL ENABLE);
 
  ALTER TABLE "KONTRAGENTS" MODIFY ("IS_BUYER" NOT NULL ENABLE);
 
  ALTER TABLE "KONTRAGENTS" MODIFY ("IS_MEASURER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KONTRAG_SETTINGS
--------------------------------------------------------

  ALTER TABLE "KONTRAG_SETTINGS" ADD CONSTRAINT "KONTRAG_SETTINGS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "KONTRAG_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "KONTRAG_SETTINGS" MODIFY ("KONTRAG_ID" NOT NULL ENABLE);
 
  ALTER TABLE "KONTRAG_SETTINGS" MODIFY ("PAY_ID" NOT NULL ENABLE);
 
  ALTER TABLE "KONTRAG_SETTINGS" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "KONTRAG_SETTINGS" MODIFY ("BASE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEASURE_UNIT
--------------------------------------------------------

  ALTER TABLE "MEASURE_UNIT" ADD CONSTRAINT "MEASURE_UNIT_CHK1" CHECK (DELETED IN (1, 0)) ENABLE;
 
  ALTER TABLE "MEASURE_UNIT" ADD CONSTRAINT "MEASURE_UNIT_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MEASURE_UNIT" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MEASURE_UNIT" MODIFY ("FULLNAME" NOT NULL ENABLE);
 
  ALTER TABLE "MEASURE_UNIT" MODIFY ("CODE" NOT NULL ENABLE);
 
  ALTER TABLE "MEASURE_UNIT" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "MEASURE_UNIT" MODIFY ("VERSION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MOVES
--------------------------------------------------------

  ALTER TABLE "MOVES" ADD CONSTRAINT "MOVES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MOVES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MOVES" MODIFY ("PERIOD" NOT NULL ENABLE);
 
  ALTER TABLE "MOVES" MODIFY ("REGISTRATOR_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "MOVES" MODIFY ("REGISTRATOR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MOVES" MODIFY ("PLAN_ACC_DEB_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MOVES" MODIFY ("PLAN_ACC_KRED_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MOVES" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "MOVES" MODIFY ("SUMM_UPR_DEB" NOT NULL ENABLE);
 
  ALTER TABLE "MOVES" MODIFY ("SUMM_UPR_KRED" NOT NULL ENABLE);
 
  ALTER TABLE "MOVES" MODIFY ("ACTIVITIES_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MOVES" MODIFY ("DIVISION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NACHISL_SETTINGS
--------------------------------------------------------

  ALTER TABLE "NACHISL_SETTINGS" ADD CONSTRAINT "NACHISL_SETTINGS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "NACHISL_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "NACHISL_SETTINGS" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "NACHISL_SETTINGS" MODIFY ("PAY_ID" NOT NULL ENABLE);
 
  ALTER TABLE "NACHISL_SETTINGS" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "NACHISL_SETTINGS" MODIFY ("BASE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NOMENKLATURA
--------------------------------------------------------

  ALTER TABLE "NOMENKLATURA" ADD CONSTRAINT "NOMENKLATURA_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "NOMENKLATURA" MODIFY ("IS_GROUP" NOT NULL ENABLE);
 
  ALTER TABLE "NOMENKLATURA" MODIFY ("USLUGA" NOT NULL ENABLE);
 
  ALTER TABLE "NOMENKLATURA" MODIFY ("PREDEFINED" NOT NULL ENABLE);
 
  ALTER TABLE "NOMENKLATURA" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "NOMENKLATURA" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "NOMENKLATURA" MODIFY ("FULLNAME" NOT NULL ENABLE);
 
  ALTER TABLE "NOMENKLATURA" MODIFY ("DELETED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NOTIFICATION
--------------------------------------------------------

  ALTER TABLE "NOTIFICATION" ADD CONSTRAINT "NOTIFICATION_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "NOTIFICATION" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "NOTIFICATION" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "NOTIFICATION" MODIFY ("DAT" NOT NULL ENABLE);
 
  ALTER TABLE "NOTIFICATION" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
 
  ALTER TABLE "NOTIFICATION" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "NOTIFICATION" MODIFY ("START_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "NOTIFICATION" MODIFY ("END_DATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NUMERATOR
--------------------------------------------------------

  ALTER TABLE "NUMERATOR" ADD CONSTRAINT "NUMERATOR_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "NUMERATOR" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "NUMERATOR" MODIFY ("TYPEDEF_ID" NOT NULL ENABLE);
 
  ALTER TABLE "NUMERATOR" MODIFY ("PREFIX" NOT NULL ENABLE);
 
  ALTER TABLE "NUMERATOR" MODIFY ("VERSION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OPERATION_PKO
--------------------------------------------------------

  ALTER TABLE "OPERATION_PKO" ADD CONSTRAINT "OPERATION_PKO_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "OPERATION_PKO" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "OPERATION_PKO" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "OPERATION_PKO" MODIFY ("FULLNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OPERATION_RKO
--------------------------------------------------------

  ALTER TABLE "OPERATION_RKO" ADD CONSTRAINT "OPERATION_RKO_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "OPERATION_RKO" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "OPERATION_RKO" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "OPERATION_RKO" MODIFY ("FULLNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_CHK1" CHECK (DELETED IN (1, 0)) ENABLE;
 
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_CHK2" CHECK (POSTED IN (1, 0)) ENABLE;
 
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "ORDERS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("DAT" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("NUM" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("KONTRAG_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("CURR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("KASSA_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("DIVISION_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("KURS" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("KRATNOST" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("POSTED" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("FIRM_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("ACTIVITIES_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("STATUS_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("DAT_ZAM" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("TIME_ZAM" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS" MODIFY ("SUMM_PLAN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDERS_TP_NACHISL
--------------------------------------------------------

  ALTER TABLE "ORDERS_TP_NACHISL" ADD CONSTRAINT "ORDERS_TP_NACHISL_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "ORDERS_TP_NACHISL" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_NACHISL" MODIFY ("ORDER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_NACHISL" MODIFY ("DAT_NACH" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_NACHISL" MODIFY ("KONTR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_NACHISL" MODIFY ("SUMM" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_NACHISL" MODIFY ("CALC_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_NACHISL" MODIFY ("PERCENT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDERS_TP_OPLATY
--------------------------------------------------------

  ALTER TABLE "ORDERS_TP_OPLATY" ADD CONSTRAINT "ORDERS_TP_OPLATY_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "ORDERS_TP_OPLATY" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_OPLATY" MODIFY ("ORDER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_OPLATY" MODIFY ("DAT" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_OPLATY" MODIFY ("SUM" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_OPLATY" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDERS_TP_RASHODY
--------------------------------------------------------

  ALTER TABLE "ORDERS_TP_RASHODY" ADD CONSTRAINT "ORDERS_TP_RASHODY_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "ORDERS_TP_RASHODY" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_RASHODY" MODIFY ("ORDER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_RASHODY" MODIFY ("DAT_RASH" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_RASHODY" MODIFY ("SUMM" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_RASHODY" MODIFY ("ZATRATY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDERS_TP_USLUGI
--------------------------------------------------------

  ALTER TABLE "ORDERS_TP_USLUGI" ADD CONSTRAINT "ORDERS_TP_USLUGI_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("ORDER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("NOM_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("PRICE" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("SUMM" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("DAT_COMPLETE" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("SOTR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("MEASURE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("QUANTITY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDER_STATUS
--------------------------------------------------------

  ALTER TABLE "ORDER_STATUS" ADD CONSTRAINT "ORDER_STATUS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "ORDER_STATUS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ORDER_STATUS" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "ORDER_STATUS" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OTHER_ZATRATY
--------------------------------------------------------

  ALTER TABLE "OTHER_ZATRATY" ADD CONSTRAINT "OTHER_ZATRATY_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "OTHER_ZATRATY" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "OTHER_ZATRATY" MODIFY ("DAT" NOT NULL ENABLE);
 
  ALTER TABLE "OTHER_ZATRATY" MODIFY ("NUM" NOT NULL ENABLE);
 
  ALTER TABLE "OTHER_ZATRATY" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "OTHER_ZATRATY" MODIFY ("POSTED" NOT NULL ENABLE);
 
  ALTER TABLE "OTHER_ZATRATY" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "OTHER_ZATRATY" MODIFY ("DIVISION_ID" NOT NULL ENABLE);
 
  ALTER TABLE "OTHER_ZATRATY" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "OTHER_ZATRATY" MODIFY ("CURR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "OTHER_ZATRATY" MODIFY ("KASSA_ID" NOT NULL ENABLE);
 
  ALTER TABLE "OTHER_ZATRATY" MODIFY ("ACTIVITIES_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OTHER_ZATRATY_TAB_PART_ZATRATY
--------------------------------------------------------

  ALTER TABLE "OTHER_ZATRATY_TAB_PART_ZATRATY" ADD CONSTRAINT "OTHER_ZATRATY_TAB_PART_ZAT_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "OTHER_ZATRATY_TAB_PART_ZATRATY" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "OTHER_ZATRATY_TAB_PART_ZATRATY" MODIFY ("OTH_ID" NOT NULL ENABLE);
 
  ALTER TABLE "OTHER_ZATRATY_TAB_PART_ZATRATY" MODIFY ("ZATR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "OTHER_ZATRATY_TAB_PART_ZATRATY" MODIFY ("SUMMA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PAY_SETTINGS
--------------------------------------------------------

  ALTER TABLE "PAY_SETTINGS" ADD CONSTRAINT "PAY_SETTINGS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "PAY_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "PAY_SETTINGS" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "PAY_SETTINGS" MODIFY ("FULLNAME" NOT NULL ENABLE);
 
  ALTER TABLE "PAY_SETTINGS" MODIFY ("STAVKA" NOT NULL ENABLE);
 
  ALTER TABLE "PAY_SETTINGS" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "PAY_SETTINGS" MODIFY ("BASE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PAY_SETTINGS" MODIFY ("SUMMA" NOT NULL ENABLE);
 
  ALTER TABLE "PAY_SETTINGS" MODIFY ("IN_PROFIT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PKO
--------------------------------------------------------

  ALTER TABLE "PKO" ADD CONSTRAINT "PKO_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "PKO" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "PKO" MODIFY ("DAT" NOT NULL ENABLE);
 
  ALTER TABLE "PKO" MODIFY ("NUM" NOT NULL ENABLE);
 
  ALTER TABLE "PKO" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "PKO" MODIFY ("POSTED" NOT NULL ENABLE);
 
  ALTER TABLE "PKO" MODIFY ("DIVISION_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PKO" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PKO" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "PKO" MODIFY ("CURR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PKO" MODIFY ("KASSA_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PKO" MODIFY ("ACTIVITIES_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PKO" MODIFY ("OPERATION_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PKO" MODIFY ("SUMMA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PLAN_ACC
--------------------------------------------------------

  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_CHK1" CHECK (ZABALANSOV IN (1, 0)) ENABLE;
 
  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_CHK2" CHECK (VALUTN IN (1, 0)) ENABLE;
 
  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_CHK3" CHECK (DELETED IN (1, 0)) ENABLE;
 
  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_CHK4" CHECK (KOLISHESTV IN (1, 0)) ENABLE;
 
  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_UK1" UNIQUE ("FULLNAME", "CODE") ENABLE;
 
  ALTER TABLE "PLAN_ACC" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "PLAN_ACC" MODIFY ("ACC_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "PLAN_ACC" MODIFY ("FULLNAME" NOT NULL ENABLE);
 
  ALTER TABLE "PLAN_ACC" MODIFY ("ZABALANSOV" NOT NULL ENABLE);
 
  ALTER TABLE "PLAN_ACC" MODIFY ("VALUTN" NOT NULL ENABLE);
 
  ALTER TABLE "PLAN_ACC" MODIFY ("KOLISHESTV" NOT NULL ENABLE);
 
  ALTER TABLE "PLAN_ACC" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "PLAN_ACC" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "PLAN_ACC" MODIFY ("CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PLAN_ACC_SUBCONTO
--------------------------------------------------------

  ALTER TABLE "PLAN_ACC_SUBCONTO" ADD CONSTRAINT "PLAN_ACC_SUBCONTO_CHK1" CHECK (OBOROT_ONLY IN (1, 0)) ENABLE;
 
  ALTER TABLE "PLAN_ACC_SUBCONTO" ADD CONSTRAINT "PLAN_ACC_SUBCONTO_CHK2" CHECK (SUMMOVOY IN (1, 0)) ENABLE;
 
  ALTER TABLE "PLAN_ACC_SUBCONTO" ADD CONSTRAINT "PLAN_ACC_SUBCONTO_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "PLAN_ACC_SUBCONTO" MODIFY ("SUMMOVOY" NOT NULL ENABLE);
 
  ALTER TABLE "PLAN_ACC_SUBCONTO" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "PLAN_ACC_SUBCONTO" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "PLAN_ACC_SUBCONTO" MODIFY ("PLAN_ACC_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PLAN_ACC_SUBCONTO" MODIFY ("PLAN_TYPE_SUBC" NOT NULL ENABLE);
 
  ALTER TABLE "PLAN_ACC_SUBCONTO" MODIFY ("OBOROT_ONLY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PLAN_TYPE_SUBCONTO
--------------------------------------------------------

  ALTER TABLE "PLAN_TYPE_SUBCONTO" ADD CONSTRAINT "PLAN_TYPE_SUBCONTO_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "PLAN_TYPE_SUBCONTO" ADD CONSTRAINT "PLAN_TYPE_SUBCONTO_UK1" UNIQUE ("TYPE_OF_OBJ") ENABLE;
 
  ALTER TABLE "PLAN_TYPE_SUBCONTO" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "PLAN_TYPE_SUBCONTO" MODIFY ("TYPE_OF_OBJ" NOT NULL ENABLE);
 
  ALTER TABLE "PLAN_TYPE_SUBCONTO" MODIFY ("VERSION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROFIT_DISTRIB
--------------------------------------------------------

  ALTER TABLE "PROFIT_DISTRIB" ADD CONSTRAINT "PROFIT_DISTRIB_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "PROFIT_DISTRIB" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB" MODIFY ("DAT" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB" MODIFY ("NUM" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB" MODIFY ("POSTED" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB" MODIFY ("DIVISION_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB" MODIFY ("CURR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB" MODIFY ("ACTIVITIES_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB" MODIFY ("SUMM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROFIT_DISTRIB_TP
--------------------------------------------------------

  ALTER TABLE "PROFIT_DISTRIB_TP" ADD CONSTRAINT "PROFIT_DISTRIB_TP_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "PROFIT_DISTRIB_TP" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB_TP" MODIFY ("PROFIT_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB_TP" MODIFY ("DAT_NACH" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB_TP" MODIFY ("KONTR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB_TP" MODIFY ("SUMM" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB_TP" MODIFY ("CALC_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB_TP" MODIFY ("PERCENT" NOT NULL ENABLE);
 
  ALTER TABLE "PROFIT_DISTRIB_TP" MODIFY ("MANUAL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROG_SETTINGS
--------------------------------------------------------

  ALTER TABLE "PROG_SETTINGS" ADD CONSTRAINT "PROG_SETTINGS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "PROG_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PS_TXN
--------------------------------------------------------

  ALTER TABLE "PS_TXN" ADD CONSTRAINT "PS_TXN_PK" PRIMARY KEY ("COLLID", "ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table QRTZ_BLOB_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_BLOB_TRIGGERS" ADD CONSTRAINT "QRTZ_BLOB_TRIG_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
 
  ALTER TABLE "QRTZ_BLOB_TRIGGERS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_BLOB_TRIGGERS" MODIFY ("TRIGGER_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_BLOB_TRIGGERS" MODIFY ("TRIGGER_GROUP" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QRTZ_CALENDARS
--------------------------------------------------------

  ALTER TABLE "QRTZ_CALENDARS" ADD CONSTRAINT "QRTZ_CALENDARS_PK" PRIMARY KEY ("SCHED_NAME", "CALENDAR_NAME") ENABLE;
 
  ALTER TABLE "QRTZ_CALENDARS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_CALENDARS" MODIFY ("CALENDAR_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_CALENDARS" MODIFY ("CALENDAR" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QRTZ_CRON_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "QRTZ_CRON_TRIG_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
 
  ALTER TABLE "QRTZ_CRON_TRIGGERS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_CRON_TRIGGERS" MODIFY ("TRIGGER_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_CRON_TRIGGERS" MODIFY ("TRIGGER_GROUP" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_CRON_TRIGGERS" MODIFY ("CRON_EXPRESSION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QRTZ_FIRED_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "QRTZ_FIRED_TRIGGER_PK" PRIMARY KEY ("SCHED_NAME", "ENTRY_ID") ENABLE;
 
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("ENTRY_ID" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("TRIGGER_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("TRIGGER_GROUP" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("INSTANCE_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("FIRED_TIME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("SCHED_TIME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("PRIORITY" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("STATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QRTZ_JOB_DETAILS
--------------------------------------------------------

  ALTER TABLE "QRTZ_JOB_DETAILS" ADD CONSTRAINT "QRTZ_JOB_DETAILS_PK" PRIMARY KEY ("SCHED_NAME", "JOB_NAME", "JOB_GROUP") ENABLE;
 
  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("JOB_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("JOB_GROUP" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("JOB_CLASS_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("IS_DURABLE" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("IS_NONCONCURRENT" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("IS_UPDATE_DATA" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("REQUESTS_RECOVERY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QRTZ_LOCKS
--------------------------------------------------------

  ALTER TABLE "QRTZ_LOCKS" ADD CONSTRAINT "QRTZ_LOCKS_PK" PRIMARY KEY ("SCHED_NAME", "LOCK_NAME") ENABLE;
 
  ALTER TABLE "QRTZ_LOCKS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_LOCKS" MODIFY ("LOCK_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QRTZ_PAUSED_TRIGGER_GRPS
--------------------------------------------------------

  ALTER TABLE "QRTZ_PAUSED_TRIGGER_GRPS" ADD CONSTRAINT "QRTZ_PAUSED_TRIG_GRPS_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_GROUP") ENABLE;
 
  ALTER TABLE "QRTZ_PAUSED_TRIGGER_GRPS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_PAUSED_TRIGGER_GRPS" MODIFY ("TRIGGER_GROUP" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QRTZ_SCHEDULER_STATE
--------------------------------------------------------

  ALTER TABLE "QRTZ_SCHEDULER_STATE" ADD CONSTRAINT "QRTZ_SCHEDULER_STATE_PK" PRIMARY KEY ("SCHED_NAME", "INSTANCE_NAME") ENABLE;
 
  ALTER TABLE "QRTZ_SCHEDULER_STATE" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_SCHEDULER_STATE" MODIFY ("INSTANCE_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_SCHEDULER_STATE" MODIFY ("LAST_CHECKIN_TIME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_SCHEDULER_STATE" MODIFY ("CHECKIN_INTERVAL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QRTZ_SIMPLE_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPLE_TRIG_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
 
  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" MODIFY ("TRIGGER_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" MODIFY ("TRIGGER_GROUP" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" MODIFY ("REPEAT_COUNT" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" MODIFY ("REPEAT_INTERVAL" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" MODIFY ("TIMES_TRIGGERED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QRTZ_SIMPROP_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPROP_TRIG_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
 
  ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" MODIFY ("TRIGGER_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" MODIFY ("TRIGGER_GROUP" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QRTZ_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "QRTZ_TRIGGERS_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
 
  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("TRIGGER_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("TRIGGER_GROUP" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("JOB_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("JOB_GROUP" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("TRIGGER_STATE" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("TRIGGER_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("START_TIME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QUARTZ_PROPERTY
--------------------------------------------------------

  ALTER TABLE "QUARTZ_PROPERTY" ADD CONSTRAINT "QUARTZ_PROPERTY_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "QUARTZ_PROPERTY" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RATING_SETTINGS
--------------------------------------------------------

  ALTER TABLE "RATING_SETTINGS" ADD CONSTRAINT "RATING_SETTINGS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "RATING_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "RATING_SETTINGS" MODIFY ("SUM_DIVIDER" NOT NULL ENABLE);
 
  ALTER TABLE "RATING_SETTINGS" MODIFY ("SUM_BAL" NOT NULL ENABLE);
 
  ALTER TABLE "RATING_SETTINGS" MODIFY ("CNT_DIVIDER" NOT NULL ENABLE);
 
  ALTER TABLE "RATING_SETTINGS" MODIFY ("CNT_BAL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REG_PRICES
--------------------------------------------------------

  ALTER TABLE "REG_PRICES" ADD CONSTRAINT "REG_PRICES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "REG_PRICES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "REG_PRICES" MODIFY ("NOM_ID" NOT NULL ENABLE);
 
  ALTER TABLE "REG_PRICES" MODIFY ("PERIOD" NOT NULL ENABLE);
 
  ALTER TABLE "REG_PRICES" MODIFY ("PRICE_USL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REG_RATES
--------------------------------------------------------

  ALTER TABLE "REG_RATES" ADD CONSTRAINT "REG_RATES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "REG_RATES" MODIFY ("CURR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "REG_RATES" MODIFY ("PERIOD" NOT NULL ENABLE);
 
  ALTER TABLE "REG_RATES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "REG_RATES" MODIFY ("KURS" NOT NULL ENABLE);
 
  ALTER TABLE "REG_RATES" MODIFY ("KRATNOST" NOT NULL ENABLE);
 
  ALTER TABLE "REG_RATES" MODIFY ("VERSION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RKO
--------------------------------------------------------

  ALTER TABLE "RKO" ADD CONSTRAINT "RKO_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "RKO" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "RKO" MODIFY ("DAT" NOT NULL ENABLE);
 
  ALTER TABLE "RKO" MODIFY ("NUM" NOT NULL ENABLE);
 
  ALTER TABLE "RKO" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "RKO" MODIFY ("POSTED" NOT NULL ENABLE);
 
  ALTER TABLE "RKO" MODIFY ("DIVISION_ID" NOT NULL ENABLE);
 
  ALTER TABLE "RKO" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "RKO" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "RKO" MODIFY ("CURR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "RKO" MODIFY ("KASSA_ID" NOT NULL ENABLE);
 
  ALTER TABLE "RKO" MODIFY ("ACTIVITIES_ID" NOT NULL ENABLE);
 
  ALTER TABLE "RKO" MODIFY ("OPERATION_ID" NOT NULL ENABLE);
 
  ALTER TABLE "RKO" MODIFY ("SUMMA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table START_OST
--------------------------------------------------------

  ALTER TABLE "START_OST" ADD CONSTRAINT "START_OST_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "START_OST" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "START_OST" MODIFY ("DAT" NOT NULL ENABLE);
 
  ALTER TABLE "START_OST" MODIFY ("NUM" NOT NULL ENABLE);
 
  ALTER TABLE "START_OST" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "START_OST" MODIFY ("POSTED" NOT NULL ENABLE);
 
  ALTER TABLE "START_OST" MODIFY ("DIVISION_ID" NOT NULL ENABLE);
 
  ALTER TABLE "START_OST" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "START_OST" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "START_OST" MODIFY ("CURR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "START_OST" MODIFY ("ACTIVITIES_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table START_OST_TP
--------------------------------------------------------

  ALTER TABLE "START_OST_TP" ADD CONSTRAINT "START_OST_TP_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "START_OST_TP" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "START_OST_TP" MODIFY ("PLAN_ACC_DEB_ID" NOT NULL ENABLE);
 
  ALTER TABLE "START_OST_TP" MODIFY ("PLAN_ACC_KRED_ID" NOT NULL ENABLE);
 
  ALTER TABLE "START_OST_TP" MODIFY ("SUMM" NOT NULL ENABLE);
 
  ALTER TABLE "START_OST_TP" MODIFY ("START_OST_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TYPE_DEF
--------------------------------------------------------

  ALTER TABLE "TYPE_DEF" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "TYPE_DEF" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "TYPE_DEF" ADD CONSTRAINT "TYPE_DEF_PK" PRIMARY KEY ("ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table TYPE_OF_ACTIVITIES
--------------------------------------------------------

  ALTER TABLE "TYPE_OF_ACTIVITIES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "TYPE_OF_ACTIVITIES" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "TYPE_OF_ACTIVITIES" MODIFY ("FULLNAME" NOT NULL ENABLE);
 
  ALTER TABLE "TYPE_OF_ACTIVITIES" ADD CONSTRAINT "TYPE_OF_ACTIVITIES_PK" PRIMARY KEY ("ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "USERS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("FIRST_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("LAST_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("IS_ADMIN" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("PASS_WD" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("LOGIN" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("PREDEFINED" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("IS_ACTIVE" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" ADD CONSTRAINT "USERS_CHK1" CHECK (is_zamer in (0,1)) ENABLE;
 
  ALTER TABLE "USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "USERS" ADD CONSTRAINT "USERS_UK1" UNIQUE ("LOGIN") ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS_GROUPS
--------------------------------------------------------

  ALTER TABLE "USERS_GROUPS" MODIFY ("GROUPS_ID" NOT NULL DISABLE);
 
  ALTER TABLE "USERS_GROUPS" MODIFY ("ID" NOT NULL DISABLE);
 
  ALTER TABLE "USERS_GROUPS" MODIFY ("USER_ID" NOT NULL DISABLE);
 
  ALTER TABLE "USERS_GROUPS" ADD CONSTRAINT "USERS_GROUPS_PK" PRIMARY KEY ("ID") DISABLE;
--------------------------------------------------------
--  Constraints for Table USER_SETTINGS
--------------------------------------------------------

  ALTER TABLE "USER_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "USER_SETTINGS" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "USER_SETTINGS" MODIFY ("DIVISION_ID" NOT NULL ENABLE);
 
  ALTER TABLE "USER_SETTINGS" MODIFY ("FIRMA_ID" NOT NULL ENABLE);
 
  ALTER TABLE "USER_SETTINGS" MODIFY ("CURRENCY_ID" NOT NULL ENABLE);
 
  ALTER TABLE "USER_SETTINGS" MODIFY ("KASSA_ID" NOT NULL ENABLE);
 
  ALTER TABLE "USER_SETTINGS" MODIFY ("ACTIVITIES_ID" NOT NULL ENABLE);
 
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_UK1" UNIQUE ("USER_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table VOUCHER
--------------------------------------------------------

  ALTER TABLE "VOUCHER" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "VOUCHER" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "VOUCHER" MODIFY ("EXPIRED_BY" NOT NULL ENABLE);
 
  ALTER TABLE "VOUCHER" MODIFY ("CODE" NOT NULL ENABLE);
 
  ALTER TABLE "VOUCHER" ADD CONSTRAINT "VOUCHER_PK" PRIMARY KEY ("ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table WLS_SETTINGS
--------------------------------------------------------

  ALTER TABLE "WLS_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "WLS_SETTINGS" MODIFY ("PORT" NOT NULL ENABLE);
 
  ALTER TABLE "WLS_SETTINGS" MODIFY ("USERNAME" NOT NULL ENABLE);
 
  ALTER TABLE "WLS_SETTINGS" MODIFY ("PASSWORD" NOT NULL ENABLE);
 
  ALTER TABLE "WLS_SETTINGS" MODIFY ("HOST" NOT NULL ENABLE);
 
  ALTER TABLE "WLS_SETTINGS" ADD CONSTRAINT "WLS_SETTINGS_PK" PRIMARY KEY ("ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table XML_T
--------------------------------------------------------

  ALTER TABLE "XML_T" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "XML_T" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "XML_T" MODIFY ("ONE" NOT NULL ENABLE);
 
  ALTER TABLE "XML_T" ADD CONSTRAINT "XML_T_PK" PRIMARY KEY ("ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table ZATRATY
--------------------------------------------------------

  ALTER TABLE "ZATRATY" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ZATRATY" MODIFY ("IS_GROUP" NOT NULL ENABLE);
 
  ALTER TABLE "ZATRATY" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "ZATRATY" MODIFY ("FULLNAME" NOT NULL ENABLE);
 
  ALTER TABLE "ZATRATY" MODIFY ("VERSION" NOT NULL ENABLE);
 
  ALTER TABLE "ZATRATY" MODIFY ("PREDEFINED" NOT NULL ENABLE);
 
  ALTER TABLE "ZATRATY" ADD CONSTRAINT "ZATRATY_PK" PRIMARY KEY ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CALL_LISTS
--------------------------------------------------------

  ALTER TABLE "CALL_LISTS" ADD CONSTRAINT "CALL_LISTS_FK1" FOREIGN KEY ("KONTRAGENTS_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CALL_LOG
--------------------------------------------------------

  ALTER TABLE "CALL_LOG" ADD CONSTRAINT "CALL_LOG_FK1" FOREIGN KEY ("CALL_STATUS")
	  REFERENCES "CALL_STATUS" ("ID") ON DELETE SET NULL ENABLE;
 
  ALTER TABLE "CALL_LOG" ADD CONSTRAINT "CALL_LOG_FK2" FOREIGN KEY ("CONTACT_ID")
	  REFERENCES "CONTACT_DETAILS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "CALL_LOG" ADD CONSTRAINT "CALL_LOG_FK3" FOREIGN KEY ("COMP_DET_ID")
	  REFERENCES "COMPAIGNS_DETAILS" ("ID") ENABLE;
 
  ALTER TABLE "CALL_LOG" ADD CONSTRAINT "CALL_LOG_FK4" FOREIGN KEY ("CALL_RESULTS")
	  REFERENCES "CALL_RESULTS" ("ID") ENABLE;
 
  ALTER TABLE "CALL_LOG" ADD CONSTRAINT "CALL_LOG_FK5" FOREIGN KEY ("KONTRAG_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CALL_MEMO
--------------------------------------------------------

  ALTER TABLE "CALL_MEMO" ADD CONSTRAINT "CALL_MEMO_FK1" FOREIGN KEY ("CALL_LOG")
	  REFERENCES "CALL_LOG" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CDR
--------------------------------------------------------

  ALTER TABLE "CDR" ADD CONSTRAINT "CDR_FK1" FOREIGN KEY ("KONTRAGENT_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMPAIGNS_DETAILS
--------------------------------------------------------

  ALTER TABLE "COMPAIGNS_DETAILS" ADD CONSTRAINT "COMPAIGNS_DETAILS_FK1" FOREIGN KEY ("COMPAIGN_ID")
	  REFERENCES "COMPAIGNS" ("ID") ON DELETE SET NULL ENABLE;
 
  ALTER TABLE "COMPAIGNS_DETAILS" ADD CONSTRAINT "COMPAIGNS_DETAILS_FK2" FOREIGN KEY ("KONTRAG_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ON DELETE SET NULL ENABLE;
 
  ALTER TABLE "COMPAIGNS_DETAILS" ADD CONSTRAINT "COMPAIGNS_DETAILS_FK3" FOREIGN KEY ("CONTACT_ID")
	  REFERENCES "CONTACT_DETAILS" ("ID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CONTACT_DETAILS
--------------------------------------------------------

  ALTER TABLE "CONTACT_DETAILS" ADD CONSTRAINT "CONTACT_DETAILS_FK1" FOREIGN KEY ("KONTRAG_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DIVISIONS
--------------------------------------------------------

  ALTER TABLE "DIVISIONS" ADD CONSTRAINT "DIVISIONS_DIVISIONS_FK1" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "DIVISIONS" ("ID") ENABLE;
 
  ALTER TABLE "DIVISIONS" ADD CONSTRAINT "DIVISIONS_FK1" FOREIGN KEY ("MAIN_USER")
	  REFERENCES "USERS" ("ID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DIVISION_SOTR
--------------------------------------------------------

  ALTER TABLE "DIVISION_SOTR" ADD CONSTRAINT "DIVISION_SOTR_FK1" FOREIGN KEY ("DIV_ID")
	  REFERENCES "DIVISIONS" ("ID") ON DELETE SET NULL ENABLE;
 
  ALTER TABLE "DIVISION_SOTR" ADD CONSTRAINT "DIVISION_SOTR_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ENTRY_SETTINGS
--------------------------------------------------------

  ALTER TABLE "ENTRY_SETTINGS" ADD CONSTRAINT "ENTRY_SETTINGS_PLAN_ACC_DEB" FOREIGN KEY ("PLAN_ACC_DEB_ID")
	  REFERENCES "PLAN_ACC" ("ID") ENABLE;
 
  ALTER TABLE "ENTRY_SETTINGS" ADD CONSTRAINT "ENTRY_SETTINGS_PLAN_ACC_KRED" FOREIGN KEY ("PLAN_ACC_KRED_ID")
	  REFERENCES "PLAN_ACC" ("ID") ENABLE;
 
  ALTER TABLE "ENTRY_SETTINGS" ADD CONSTRAINT "ENTRY_SETTINGS_TYPE_DEF_FK1" FOREIGN KEY ("TYPEDEF_ID")
	  REFERENCES "TYPE_DEF" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EX_RATES_SETTINGS
--------------------------------------------------------

  ALTER TABLE "EX_RATES_SETTINGS" ADD CONSTRAINT "EX_RATES_SETTINGS_CURRENC_FK1" FOREIGN KEY ("CURR_ID")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table GROUPMEMBERS
--------------------------------------------------------

  ALTER TABLE "GROUPMEMBERS" ADD CONSTRAINT "GROUPMEMBERS_FK2" FOREIGN KEY ("G_NAME")
	  REFERENCES "GROUPS" ("FULLNAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KASSA
--------------------------------------------------------

  ALTER TABLE "KASSA" ADD CONSTRAINT "KASSA_CURRENCY_FK1" FOREIGN KEY ("CURR_ID")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
 
  ALTER TABLE "KASSA" ADD CONSTRAINT "KASSA_DIVISIONS_FK1" FOREIGN KEY ("DIVISION_ID")
	  REFERENCES "DIVISIONS" ("ID") ENABLE;
 
  ALTER TABLE "KASSA" ADD CONSTRAINT "KASSA_KASSA_FK1" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "KASSA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KASSA_SETTINGS
--------------------------------------------------------

  ALTER TABLE "KASSA_SETTINGS" ADD CONSTRAINT "KASSA_SETTINGS_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "KASSA_SETTINGS" ADD CONSTRAINT "KASSA_SETTINGS_FK2" FOREIGN KEY ("KASSA_ID")
	  REFERENCES "KASSA" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KONTRAGENTS
--------------------------------------------------------

  ALTER TABLE "KONTRAGENTS" ADD CONSTRAINT "KONTRAGENTS_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ON DELETE SET NULL ENABLE;
 
  ALTER TABLE "KONTRAGENTS" ADD CONSTRAINT "KONTRAGENTS_KONTRAGENTS_FK1" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KONTRAG_SETTINGS
--------------------------------------------------------

  ALTER TABLE "KONTRAG_SETTINGS" ADD CONSTRAINT "KONTRAG_SETTINGS_FK1" FOREIGN KEY ("KONTRAG_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "KONTRAG_SETTINGS" ADD CONSTRAINT "KONTRAG_SETTINGS_FK2" FOREIGN KEY ("PAY_ID")
	  REFERENCES "PAY_SETTINGS" ("ID") ENABLE;
 
  ALTER TABLE "KONTRAG_SETTINGS" ADD CONSTRAINT "KONTRAG_SETTINGS_FK3" FOREIGN KEY ("BASE_ID")
	  REFERENCES "BASE_OF_NACHISL" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MOVES
--------------------------------------------------------

  ALTER TABLE "MOVES" ADD CONSTRAINT "MOVES_CURRENCY_FK1" FOREIGN KEY ("CURR_DEB")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
 
  ALTER TABLE "MOVES" ADD CONSTRAINT "MOVES_CURRENCY_FK2" FOREIGN KEY ("CURR_KRED")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
 
  ALTER TABLE "MOVES" ADD CONSTRAINT "MOVES_FK1" FOREIGN KEY ("ACTIVITIES_ID")
	  REFERENCES "TYPE_OF_ACTIVITIES" ("ID") ENABLE;
 
  ALTER TABLE "MOVES" ADD CONSTRAINT "MOVES_FK2" FOREIGN KEY ("DIVISION_ID")
	  REFERENCES "DIVISIONS" ("ID") ENABLE;
 
  ALTER TABLE "MOVES" ADD CONSTRAINT "MOVES_PLAN_ACC_FK1" FOREIGN KEY ("PLAN_ACC_DEB_ID")
	  REFERENCES "PLAN_ACC" ("ID") ENABLE;
 
  ALTER TABLE "MOVES" ADD CONSTRAINT "MOVES_PLAN_ACC_FK2" FOREIGN KEY ("PLAN_ACC_KRED_ID")
	  REFERENCES "PLAN_ACC" ("ID") ENABLE;
 
  ALTER TABLE "MOVES" ADD CONSTRAINT "MOVES_TYPE_DEF_FK1" FOREIGN KEY ("REGISTRATOR_TYPE")
	  REFERENCES "TYPE_DEF" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NACHISL_SETTINGS
--------------------------------------------------------

  ALTER TABLE "NACHISL_SETTINGS" ADD CONSTRAINT "NACHISL_SETTINGS_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "NACHISL_SETTINGS" ADD CONSTRAINT "NACHISL_SETTINGS_FK2" FOREIGN KEY ("PAY_ID")
	  REFERENCES "PAY_SETTINGS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "NACHISL_SETTINGS" ADD CONSTRAINT "NACHISL_SETTINGS_FK3" FOREIGN KEY ("BASE_ID")
	  REFERENCES "BASE_OF_NACHISL" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "NACHISL_SETTINGS" ADD CONSTRAINT "NACHISL_SETTINGS_FK4" FOREIGN KEY ("DIVISION_ID")
	  REFERENCES "DIVISIONS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOMENKLATURA
--------------------------------------------------------

  ALTER TABLE "NOMENKLATURA" ADD CONSTRAINT "NOMENKLATURA_NOMENKLATURA_FK1" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "NOMENKLATURA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOTIFICATION
--------------------------------------------------------

  ALTER TABLE "NOTIFICATION" ADD CONSTRAINT "NOTIFICATION_FK1" FOREIGN KEY ("CONTACT")
	  REFERENCES "CONTACT_DETAILS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NUMERATOR
--------------------------------------------------------

  ALTER TABLE "NUMERATOR" ADD CONSTRAINT "NUMERATOR_TYPE_DEF_FK1" FOREIGN KEY ("TYPEDEF_ID")
	  REFERENCES "TYPE_DEF" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_CURRENCY_FK1" FOREIGN KEY ("CURR_ID")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
 
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_DIVISIONS_FK1" FOREIGN KEY ("DIVISION_ID")
	  REFERENCES "DIVISIONS" ("ID") ENABLE;
 
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_FIRMS_FK1" FOREIGN KEY ("FIRM_ID")
	  REFERENCES "FIRMS" ("ID") ENABLE;
 
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_FK1" FOREIGN KEY ("ACTIVITIES_ID")
	  REFERENCES "TYPE_OF_ACTIVITIES" ("ID") ENABLE;
 
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_FK2" FOREIGN KEY ("ZAMER_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ON DELETE SET NULL ENABLE;
 
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_FK3" FOREIGN KEY ("AGENT_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ENABLE;
 
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_KASSA_FK1" FOREIGN KEY ("KASSA_ID")
	  REFERENCES "KASSA" ("ID") ENABLE;
 
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_KONTRAGENTS_FK1" FOREIGN KEY ("KONTRAG_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ENABLE;
 
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_STATUS_FK" FOREIGN KEY ("STATUS_ID")
	  REFERENCES "ORDER_STATUS" ("ID") ON DELETE SET NULL ENABLE;
 
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_USERS_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS_TP_NACHISL
--------------------------------------------------------

  ALTER TABLE "ORDERS_TP_NACHISL" ADD CONSTRAINT "ORDERS_TP_NACHISL_FK1" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "ORDERS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "ORDERS_TP_NACHISL" ADD CONSTRAINT "ORDERS_TP_NACHISL_FK2" FOREIGN KEY ("KONTR_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "ORDERS_TP_NACHISL" ADD CONSTRAINT "ORDERS_TP_NACHISL_FK3" FOREIGN KEY ("CALC_ID")
	  REFERENCES "BASE_OF_CALC" ("ID") ON DELETE SET NULL ENABLE;
 
  ALTER TABLE "ORDERS_TP_NACHISL" ADD CONSTRAINT "ORDERS_TP_NACHISL_FK4" FOREIGN KEY ("PAY_ID")
	  REFERENCES "PAY_SETTINGS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS_TP_OPLATY
--------------------------------------------------------

  ALTER TABLE "ORDERS_TP_OPLATY" ADD CONSTRAINT "ORDERS_TP_OPLATY_FK1" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "ORDERS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "ORDERS_TP_OPLATY" ADD CONSTRAINT "ORDERS_TP_OPLATY_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ENABLE;
 
  ALTER TABLE "ORDERS_TP_OPLATY" ADD CONSTRAINT "ORDERS_TP_OPLATY_FK3" FOREIGN KEY ("ZAMER_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ON DELETE SET NULL ENABLE;
 
  ALTER TABLE "ORDERS_TP_OPLATY" ADD CONSTRAINT "ORDERS_TP_OPLATY_FK4" FOREIGN KEY ("KASSA_ID")
	  REFERENCES "KASSA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS_TP_RASHODY
--------------------------------------------------------

  ALTER TABLE "ORDERS_TP_RASHODY" ADD CONSTRAINT "ORDERS_TP_RASHODY_FK1" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "ORDERS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "ORDERS_TP_RASHODY" ADD CONSTRAINT "ORDERS_TP_RASHODY_FK2" FOREIGN KEY ("KONTR_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ENABLE;
 
  ALTER TABLE "ORDERS_TP_RASHODY" ADD CONSTRAINT "ORDERS_TP_RASHODY_FK3" FOREIGN KEY ("ZATRATY_ID")
	  REFERENCES "ZATRATY" ("ID") ENABLE;
 
  ALTER TABLE "ORDERS_TP_RASHODY" ADD CONSTRAINT "ORDERS_TP_RASHODY_FK4" FOREIGN KEY ("KASSA_ID")
	  REFERENCES "KASSA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS_TP_USLUGI
--------------------------------------------------------

  ALTER TABLE "ORDERS_TP_USLUGI" ADD CONSTRAINT "ORDERS_TP_USLUGI_FK1" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "ORDERS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "ORDERS_TP_USLUGI" ADD CONSTRAINT "ORDERS_TP_USLUGI_FK2" FOREIGN KEY ("NOM_ID")
	  REFERENCES "NOMENKLATURA" ("ID") ON DELETE SET NULL ENABLE;
 
  ALTER TABLE "ORDERS_TP_USLUGI" ADD CONSTRAINT "ORDERS_TP_USLUGI_FK3" FOREIGN KEY ("SOTR_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ENABLE;
 
  ALTER TABLE "ORDERS_TP_USLUGI" ADD CONSTRAINT "ORDERS_TP_USLUGI_FK4" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "NOMENKLATURA" ("ID") ON DELETE SET NULL ENABLE;
 
  ALTER TABLE "ORDERS_TP_USLUGI" ADD CONSTRAINT "ORDERS_TP_USLUGI_FK5" FOREIGN KEY ("MEASURE_ID")
	  REFERENCES "MEASURE_UNIT" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table OTHER_ZATRATY
--------------------------------------------------------

  ALTER TABLE "OTHER_ZATRATY" ADD CONSTRAINT "OTHER_ZATRATY_FK1" FOREIGN KEY ("DIVISION_ID")
	  REFERENCES "DIVISIONS" ("ID") ENABLE;
 
  ALTER TABLE "OTHER_ZATRATY" ADD CONSTRAINT "OTHER_ZATRATY_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ENABLE;
 
  ALTER TABLE "OTHER_ZATRATY" ADD CONSTRAINT "OTHER_ZATRATY_FK3" FOREIGN KEY ("CURR_ID")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
 
  ALTER TABLE "OTHER_ZATRATY" ADD CONSTRAINT "OTHER_ZATRATY_FK4" FOREIGN KEY ("KASSA_ID")
	  REFERENCES "KASSA" ("ID") ENABLE;
 
  ALTER TABLE "OTHER_ZATRATY" ADD CONSTRAINT "OTHER_ZATRATY_FK5" FOREIGN KEY ("ACTIVITIES_ID")
	  REFERENCES "TYPE_OF_ACTIVITIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table OTHER_ZATRATY_TAB_PART_ZATRATY
--------------------------------------------------------

  ALTER TABLE "OTHER_ZATRATY_TAB_PART_ZATRATY" ADD CONSTRAINT "OTHER_ZATRATY_TAB_PART_ZA_FK1" FOREIGN KEY ("OTH_ID")
	  REFERENCES "OTHER_ZATRATY" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "OTHER_ZATRATY_TAB_PART_ZATRATY" ADD CONSTRAINT "OTHER_ZATRATY_TAB_PART_ZA_FK2" FOREIGN KEY ("ZATR_ID")
	  REFERENCES "ZATRATY" ("ID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PAY_SETTINGS
--------------------------------------------------------

  ALTER TABLE "PAY_SETTINGS" ADD CONSTRAINT "PAY_SETTINGS_FK1" FOREIGN KEY ("BASE_ID")
	  REFERENCES "BASE_OF_CALC" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PKO
--------------------------------------------------------

  ALTER TABLE "PKO" ADD CONSTRAINT "PKO_FK1" FOREIGN KEY ("DIVISION_ID")
	  REFERENCES "DIVISIONS" ("ID") ENABLE;
 
  ALTER TABLE "PKO" ADD CONSTRAINT "PKO_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ENABLE;
 
  ALTER TABLE "PKO" ADD CONSTRAINT "PKO_FK3" FOREIGN KEY ("CURR_ID")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
 
  ALTER TABLE "PKO" ADD CONSTRAINT "PKO_FK4" FOREIGN KEY ("KASSA_ID")
	  REFERENCES "KASSA" ("ID") ENABLE;
 
  ALTER TABLE "PKO" ADD CONSTRAINT "PKO_FK5" FOREIGN KEY ("ACTIVITIES_ID")
	  REFERENCES "TYPE_OF_ACTIVITIES" ("ID") ENABLE;
 
  ALTER TABLE "PKO" ADD CONSTRAINT "PKO_FK6" FOREIGN KEY ("OPERATION_ID")
	  REFERENCES "OPERATION_PKO" ("ID") ENABLE;
 
  ALTER TABLE "PKO" ADD CONSTRAINT "PKO_FK7" FOREIGN KEY ("KONTRAG_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ENABLE;
 
  ALTER TABLE "PKO" ADD CONSTRAINT "PKO_FK8" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "ORDERS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PLAN_ACC
--------------------------------------------------------

  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_FK1" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "PLAN_ACC" ("ID") ENABLE;
 
  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_FK2" FOREIGN KEY ("ACC_TYPE")
	  REFERENCES "ENUM_ACCOUNT_TYPE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PLAN_ACC_SUBCONTO
--------------------------------------------------------

  ALTER TABLE "PLAN_ACC_SUBCONTO" ADD CONSTRAINT "PLAN_ACC_SUBCONTO_FK1" FOREIGN KEY ("PLAN_ACC_ID")
	  REFERENCES "PLAN_ACC" ("ID") ENABLE;
 
  ALTER TABLE "PLAN_ACC_SUBCONTO" ADD CONSTRAINT "PLAN_ACC_SUBCONTO_FK2" FOREIGN KEY ("PLAN_TYPE_SUBC")
	  REFERENCES "PLAN_TYPE_SUBCONTO" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PLAN_TYPE_SUBCONTO
--------------------------------------------------------

  ALTER TABLE "PLAN_TYPE_SUBCONTO" ADD CONSTRAINT "PLAN_TYPE_SUBCONTO_TYPE_D_FK1" FOREIGN KEY ("TYPE_OF_OBJ")
	  REFERENCES "TYPE_DEF" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROFIT_DISTRIB
--------------------------------------------------------

  ALTER TABLE "PROFIT_DISTRIB" ADD CONSTRAINT "PROFIT_DISTRIB_FK1" FOREIGN KEY ("DIVISION_ID")
	  REFERENCES "DIVISIONS" ("ID") ENABLE;
 
  ALTER TABLE "PROFIT_DISTRIB" ADD CONSTRAINT "PROFIT_DISTRIB_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ENABLE;
 
  ALTER TABLE "PROFIT_DISTRIB" ADD CONSTRAINT "PROFIT_DISTRIB_FK3" FOREIGN KEY ("CURR_ID")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
 
  ALTER TABLE "PROFIT_DISTRIB" ADD CONSTRAINT "PROFIT_DISTRIB_FK4" FOREIGN KEY ("ACTIVITIES_ID")
	  REFERENCES "TYPE_OF_ACTIVITIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROFIT_DISTRIB_TP
--------------------------------------------------------

  ALTER TABLE "PROFIT_DISTRIB_TP" ADD CONSTRAINT "PROFIT_DISTRIB_TP_FK1" FOREIGN KEY ("PROFIT_ID")
	  REFERENCES "PROFIT_DISTRIB" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "PROFIT_DISTRIB_TP" ADD CONSTRAINT "PROFIT_DISTRIB_TP_FK2" FOREIGN KEY ("KONTR_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ENABLE;
 
  ALTER TABLE "PROFIT_DISTRIB_TP" ADD CONSTRAINT "PROFIT_DISTRIB_TP_FK3" FOREIGN KEY ("CALC_ID")
	  REFERENCES "BASE_OF_CALC" ("ID") ENABLE;
 
  ALTER TABLE "PROFIT_DISTRIB_TP" ADD CONSTRAINT "PROFIT_DISTRIB_TP_FK4" FOREIGN KEY ("PAY_ID")
	  REFERENCES "PAY_SETTINGS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QRTZ_BLOB_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_BLOB_TRIGGERS" ADD CONSTRAINT "QRTZ_BLOB_TRIG_TO_TRIG_FK" FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
	  REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QRTZ_CRON_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "QRTZ_CRON_TRIG_TO_TRIG_FK" FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
	  REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QRTZ_SIMPLE_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPLE_TRIG_TO_TRIG_FK" FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
	  REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QRTZ_SIMPROP_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPROP_TRIG_TO_TRIG_FK" FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
	  REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QRTZ_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "QRTZ_TRIGGER_TO_JOBS_FK" FOREIGN KEY ("SCHED_NAME", "JOB_NAME", "JOB_GROUP")
	  REFERENCES "QRTZ_JOB_DETAILS" ("SCHED_NAME", "JOB_NAME", "JOB_GROUP") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REG_PRICES
--------------------------------------------------------

  ALTER TABLE "REG_PRICES" ADD CONSTRAINT "REG_PRICES_FK1" FOREIGN KEY ("NOM_ID")
	  REFERENCES "NOMENKLATURA" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "REG_PRICES" ADD CONSTRAINT "REG_PRICES_FK2" FOREIGN KEY ("ED_IZM")
	  REFERENCES "MEASURE_UNIT" ("ID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REG_RATES
--------------------------------------------------------

  ALTER TABLE "REG_RATES" ADD CONSTRAINT "REG_RATES_FK1" FOREIGN KEY ("CURR_ID")
	  REFERENCES "CURRENCY" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RKO
--------------------------------------------------------

  ALTER TABLE "RKO" ADD CONSTRAINT "RKO_FK1" FOREIGN KEY ("DIVISION_ID")
	  REFERENCES "DIVISIONS" ("ID") ENABLE;
 
  ALTER TABLE "RKO" ADD CONSTRAINT "RKO_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ENABLE;
 
  ALTER TABLE "RKO" ADD CONSTRAINT "RKO_FK3" FOREIGN KEY ("CURR_ID")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
 
  ALTER TABLE "RKO" ADD CONSTRAINT "RKO_FK4" FOREIGN KEY ("KASSA_ID")
	  REFERENCES "KASSA" ("ID") ENABLE;
 
  ALTER TABLE "RKO" ADD CONSTRAINT "RKO_FK5" FOREIGN KEY ("ACTIVITIES_ID")
	  REFERENCES "TYPE_OF_ACTIVITIES" ("ID") ENABLE;
 
  ALTER TABLE "RKO" ADD CONSTRAINT "RKO_FK6" FOREIGN KEY ("OPERATION_ID")
	  REFERENCES "OPERATION_RKO" ("ID") ENABLE;
 
  ALTER TABLE "RKO" ADD CONSTRAINT "RKO_FK7" FOREIGN KEY ("KONTRAG_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ENABLE;
 
  ALTER TABLE "RKO" ADD CONSTRAINT "RKO_FK8" FOREIGN KEY ("DEST_KASSA_ID")
	  REFERENCES "KASSA" ("ID") ENABLE;
 
  ALTER TABLE "RKO" ADD CONSTRAINT "RKO_FK9" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "ORDERS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table START_OST
--------------------------------------------------------

  ALTER TABLE "START_OST" ADD CONSTRAINT "START_OST_FK1" FOREIGN KEY ("DIVISION_ID")
	  REFERENCES "DIVISIONS" ("ID") ENABLE;
 
  ALTER TABLE "START_OST" ADD CONSTRAINT "START_OST_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ENABLE;
 
  ALTER TABLE "START_OST" ADD CONSTRAINT "START_OST_FK3" FOREIGN KEY ("CURR_ID")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
 
  ALTER TABLE "START_OST" ADD CONSTRAINT "START_OST_FK4" FOREIGN KEY ("ACTIVITIES_ID")
	  REFERENCES "TYPE_OF_ACTIVITIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table START_OST_TP
--------------------------------------------------------

  ALTER TABLE "START_OST_TP" ADD CONSTRAINT "START_OST_TP_FK1" FOREIGN KEY ("PLAN_ACC_DEB_ID")
	  REFERENCES "PLAN_ACC" ("ID") ENABLE;
 
  ALTER TABLE "START_OST_TP" ADD CONSTRAINT "START_OST_TP_FK2" FOREIGN KEY ("PLAN_ACC_KRED_ID")
	  REFERENCES "PLAN_ACC" ("ID") ENABLE;
 
  ALTER TABLE "START_OST_TP" ADD CONSTRAINT "START_OST_TP_FK3" FOREIGN KEY ("START_OST_ID")
	  REFERENCES "START_OST" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table USER_SETTINGS
--------------------------------------------------------

  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_CURRENCY_FK1" FOREIGN KEY ("CURRENCY_ID")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
 
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_DIVISIONS_FK1" FOREIGN KEY ("DIVISION_ID")
	  REFERENCES "DIVISIONS" ("ID") ENABLE;
 
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_FIRMS_FK1" FOREIGN KEY ("FIRMA_ID")
	  REFERENCES "FIRMS" ("ID") ENABLE;
 
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_FK1" FOREIGN KEY ("ACTIVITIES_ID")
	  REFERENCES "TYPE_OF_ACTIVITIES" ("ID") ENABLE;
 
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_FK2" FOREIGN KEY ("ZAMERKONTRAG_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ENABLE;
 
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_FK3" FOREIGN KEY ("KONTRAG_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ENABLE;
 
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_FK4" FOREIGN KEY ("NET_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ENABLE;
 
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_KASSA_FK1" FOREIGN KEY ("KASSA_ID")
	  REFERENCES "KASSA" ("ID") ENABLE;
 
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_NOMENKLATUR_FK1" FOREIGN KEY ("MAIN_USLUGA")
	  REFERENCES "NOMENKLATURA" ("ID") ENABLE;
 
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_USERS_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZATRATY
--------------------------------------------------------

  ALTER TABLE "ZATRATY" ADD CONSTRAINT "ZATRATY_ZATRATY_FK1" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "ZATRATY" ("ID") ENABLE;
--------------------------------------------------------
--  DDL for Trigger ASTER_SETTINGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ASTER_SETTINGS_TRG" 
  BEFORE INSERT OR UPDATE ON "ASTER_SETTINGS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "ASTER_SETTINGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BASE_OF_CALC_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BASE_OF_CALC_TRG" 
  BEFORE INSERT OR UPDATE ON "BASE_OF_CALC"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "BASE_OF_CALC_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BASE_OF_NACHISL_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BASE_OF_NACHISL_TRG" 
  BEFORE INSERT OR UPDATE ON "BASE_OF_NACHISL"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "BASE_OF_NACHISL_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CALL_LISTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CALL_LISTS_TRG" 
  BEFORE INSERT OR UPDATE ON "CALL_LISTS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "CALL_LISTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CALL_LOG_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CALL_LOG_TRG" 
  BEFORE INSERT OR UPDATE ON "CALL_LOG"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "CALL_LOG_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CALL_MEMO_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CALL_MEMO_TRG" 
  BEFORE INSERT OR UPDATE ON "CALL_MEMO"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "CALL_MEMO_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CALL_RESULTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CALL_RESULTS_TRG" 
  BEFORE INSERT OR UPDATE ON "CALL_RESULTS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "CALL_RESULTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CALL_STATUS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CALL_STATUS_TRG" 
  BEFORE INSERT OR UPDATE ON "CALL_STATUS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "CALL_STATUS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CDR_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CDR_TRG" 
  BEFORE INSERT OR UPDATE ON "CDR"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "CDR_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COMPAIGNS_DETAILS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "COMPAIGNS_DETAILS_TRG" 
  BEFORE INSERT OR UPDATE ON "COMPAIGNS_DETAILS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "COMPAIGNS_DETAILS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COMPAIGNS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "COMPAIGNS_TRG" 
  BEFORE INSERT OR UPDATE ON "COMPAIGNS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "COMPAIGNS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CONTACT_DETAILS_TGR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CONTACT_DETAILS_TGR" 
  BEFORE INSERT OR UPDATE ON "CONTACT_DETAILS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "CONTACT_DETAILS_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CURRENCY_TGR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CURRENCY_TGR" 
  BEFORE INSERT OR UPDATE ON "CURRENCY"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "CURRENCY_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CURRENCY_TRG_AI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CURRENCY_TRG_AI" 
  AFTER INSERT ON "CURRENCY"
  REFERENCING FOR EACH ROW
  begin
  insert into reg_rates (curr_id) values(:new."ID");
end;
/
ALTER TRIGGER "CURRENCY_TRG_AI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DIR_FILE_UPLOAD_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "DIR_FILE_UPLOAD_TRG" 
  BEFORE INSERT OR UPDATE ON "DIR_FILE_UPLOAD"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "DIR_FILE_UPLOAD_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DIVISIONS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "DIVISIONS_TRG" 
  BEFORE INSERT OR UPDATE ON "DIVISIONS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "DIVISIONS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DIVISION_SOTR_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "DIVISION_SOTR_TRG" 
  BEFORE INSERT OR UPDATE ON "DIVISION_SOTR"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "DIVISION_SOTR_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ENTRY_SETTINGS_TGR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENTRY_SETTINGS_TGR" 
  BEFORE INSERT OR UPDATE ON "ENTRY_SETTINGS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "ENTRY_SETTINGS_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ENUM_ACCOUNT_TYPE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENUM_ACCOUNT_TYPE_TRG" 
  BEFORE INSERT OR UPDATE ON "ENUM_ACCOUNT_TYPE"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "ENUM_ACCOUNT_TYPE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger EX_RATES_SETTINGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "EX_RATES_SETTINGS_TRG" 
  BEFORE INSERT OR UPDATE ON "EX_RATES_SETTINGS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "EX_RATES_SETTINGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger FIRMS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FIRMS_TRG" 
  BEFORE INSERT OR UPDATE ON "FIRMS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "FIRMS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger GROUPMEMBERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GROUPMEMBERS_TRG" 
  BEFORE INSERT OR UPDATE ON "GROUPMEMBERS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "GROUPMEMBERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger GROUPS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GROUPS_TRG" 
  BEFORE INSERT OR UPDATE ON "GROUPS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "GROUPS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger IMPORTED_PRICE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "IMPORTED_PRICE_TRG" 
  BEFORE INSERT OR UPDATE ON "IMPORTED_PRICE"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "IMPORTED_PRICE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger JOB_END_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "JOB_END_TRG" 
  BEFORE UPDATE OR DELETE ON "QRTZ_TRIGGERS"
  BEGIN 
 IF DELETING OR UPDATING THEN  
    UPDATE NOTIFICATION
    SET SERVER='1', CLIENT='0'
    WHERE TRG_NAME=(SELECT TRIGGER_NAME FROM (SELECT TRIGGER_NAME FROM QRTZ_TRIGGERS ORDER BY NEXT_FIRE_TIME)  WHERE ROWNUM = 1);
 END IF;
END;
/
ALTER TRIGGER "JOB_END_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger KASSA_SETTINGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "KASSA_SETTINGS_TRG" 
  BEFORE INSERT OR UPDATE ON "KASSA_SETTINGS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "KASSA_SETTINGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger KASSA_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "KASSA_TRG" 
  BEFORE INSERT OR UPDATE ON "KASSA"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "KASSA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger KONTRAGENTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "KONTRAGENTS_TRG" 
  BEFORE INSERT OR UPDATE ON "KONTRAGENTS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
        select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "KONTRAGENTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger KONTRAG_SETTINGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "KONTRAG_SETTINGS_TRG" 
  BEFORE INSERT OR UPDATE ON "KONTRAG_SETTINGS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "KONTRAG_SETTINGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MEASURE_UNIT_TGR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MEASURE_UNIT_TGR" 
  BEFORE INSERT OR UPDATE ON "MEASURE_UNIT"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "MEASURE_UNIT_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MOVES_TGR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MOVES_TGR" 
  BEFORE INSERT OR UPDATE ON "MOVES"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "MOVES_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NACHISL_SETTINGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "NACHISL_SETTINGS_TRG" 
  BEFORE INSERT OR UPDATE ON "NACHISL_SETTINGS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "NACHISL_SETTINGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NOMENKLATURA_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "NOMENKLATURA_TRG" 
  BEFORE INSERT OR UPDATE ON "NOMENKLATURA"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
        select utility.uuid() into :new."ID" from dual; 
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "NOMENKLATURA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NOTIFICATION_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "NOTIFICATION_TRG" 
  BEFORE INSERT OR UPDATE ON "NOTIFICATION"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
        select utility.uuid() into :new."ID" from dual; 
      end if; 
   end if;
    if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;   
end;
/
ALTER TRIGGER "NOTIFICATION_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NUMERATOR_TGR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "NUMERATOR_TGR" 
  BEFORE INSERT OR UPDATE ON "NUMERATOR"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "NUMERATOR_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger OPERATION_PKO_TGR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "OPERATION_PKO_TGR" 
  BEFORE INSERT OR UPDATE ON "OPERATION_PKO"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
end;
/
ALTER TRIGGER "OPERATION_PKO_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger OPERATION_RKO_TGR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "OPERATION_RKO_TGR" 
  BEFORE INSERT OR UPDATE ON "OPERATION_RKO"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
end;
/
ALTER TRIGGER "OPERATION_RKO_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDERS_TP_NACHISL_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ORDERS_TP_NACHISL_TRG" 
  BEFORE INSERT OR UPDATE ON "ORDERS_TP_NACHISL"
  REFERENCING FOR EACH ROW
begin  
   if inserting then      
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
  end if;
end;
/
ALTER TRIGGER "ORDERS_TP_NACHISL_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDERS_TP_OPLATY_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ORDERS_TP_OPLATY_TRG" 
  BEFORE INSERT OR UPDATE ON "ORDERS_TP_OPLATY"
  REFERENCING FOR EACH ROW
begin  
   if inserting then
      
      
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
      end if;
end;
/
ALTER TRIGGER "ORDERS_TP_OPLATY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDERS_TP_RASHODY_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ORDERS_TP_RASHODY_TRG" 
  BEFORE INSERT OR UPDATE ON "ORDERS_TP_RASHODY"
  REFERENCING FOR EACH ROW
begin  
   if inserting then      
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
  end if;
end;
/
ALTER TRIGGER "ORDERS_TP_RASHODY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDERS_TP_USLUGI_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ORDERS_TP_USLUGI_TRG" 
  BEFORE INSERT OR UPDATE ON "ORDERS_TP_USLUGI"
  REFERENCING FOR EACH ROW
begin  
   if inserting then
      
      
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
      end if;
end;
/
ALTER TRIGGER "ORDERS_TP_USLUGI_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ORDERS_TRG" 
  BEFORE INSERT OR UPDATE ON "ORDERS"
  REFERENCING FOR EACH ROW
  declare
  l_rec type_def%rowtype;
  l_num numerator.prefix%type;
begin  
   if inserting then
      select * into l_rec from type_def where upper(table_name) = 'ORDERS';
      if l_rec.id is not null then
          select prefix into l_num from numerator where typedef_id = l_rec.id;
      end if;
      
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
      if :new."NUM" is null then
          if l_num is null then
            select orders_num_seq.nextval into :new."NUM" from dual;
          else
            select l_num||orders_num_seq.nextval into :new."NUM" from dual;
          end if;  
      end if;
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "ORDERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDER_STATUS_TGR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ORDER_STATUS_TGR" 
  BEFORE INSERT OR UPDATE ON "ORDER_STATUS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "ORDER_STATUS_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger OTHER_ZATRATY_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "OTHER_ZATRATY_TRG" 
  BEFORE INSERT OR UPDATE ON "OTHER_ZATRATY"
  REFERENCING FOR EACH ROW
  declare
  l_rec type_def%rowtype;
  l_num numerator.prefix%type;
begin  
   if inserting then
      select * into l_rec from type_def where upper(table_name) = 'OTHER_ZATRATY';
      if l_rec.id is not null then
          select prefix into l_num from numerator where typedef_id = l_rec.id;
      end if;
      
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
      if :new."NUM" is null then
          if l_num is null then
            select other_zatr_num_seq.nextval into :new."NUM" from dual;
          else
            select l_num||other_zatr_num_seq.nextval into :new."NUM" from dual;
          end if;  
      end if;
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "OTHER_ZATRATY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger OTHER_ZATR_TP_ZATRATY_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "OTHER_ZATR_TP_ZATRATY_TRG" 
  BEFORE INSERT OR UPDATE ON "OTHER_ZATRATY_TAB_PART_ZATRATY"
  REFERENCING FOR EACH ROW
begin  
   if inserting then      
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
      end if;
end;
/
ALTER TRIGGER "OTHER_ZATR_TP_ZATRATY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PAY_SETTINGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PAY_SETTINGS_TRG" 
  BEFORE INSERT OR UPDATE ON "PAY_SETTINGS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
        select utility.uuid() into :new."ID" from dual; 
      end if; 
   end if;
    if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;   
end;
/
ALTER TRIGGER "PAY_SETTINGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PKO_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PKO_TRG" 
  BEFORE INSERT OR UPDATE ON "PKO"
  REFERENCING FOR EACH ROW
  declare
  l_rec type_def%rowtype;
  l_num numerator.prefix%type;
begin  
   if inserting then
      select * into l_rec from type_def where upper(table_name) = 'PKO';
      if l_rec.id is not null then
          select prefix into l_num from numerator where typedef_id = l_rec.id;
      end if;
      
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
      if :new."NUM" is null then
          if l_num is null then
            select pko_num_seq.nextval into :new."NUM" from dual;
          else
            select l_num||pko_num_seq.nextval into :new."NUM" from dual;
          end if;  
      end if;
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "PKO_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PLAN_ACC_SUBCONTO_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PLAN_ACC_SUBCONTO_TRG" 
  BEFORE INSERT OR UPDATE ON "PLAN_ACC_SUBCONTO"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "PLAN_ACC_SUBCONTO_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PLAN_ACC_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PLAN_ACC_TRG" 
  BEFORE INSERT OR UPDATE ON "PLAN_ACC"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "PLAN_ACC_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PLAN_TYPE_SUBCONTO_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PLAN_TYPE_SUBCONTO_TRG" 
  BEFORE INSERT OR UPDATE ON "PLAN_TYPE_SUBCONTO"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "PLAN_TYPE_SUBCONTO_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PROFIT_DISTRIB_TP_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PROFIT_DISTRIB_TP_TRG" 
  BEFORE INSERT OR UPDATE ON "PROFIT_DISTRIB_TP"
  REFERENCING FOR EACH ROW
begin  
   if inserting then      
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
  end if;
end;
/
ALTER TRIGGER "PROFIT_DISTRIB_TP_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PROFIT_DISTRIB_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PROFIT_DISTRIB_TRG" 
  BEFORE INSERT OR UPDATE ON "PROFIT_DISTRIB"
  REFERENCING FOR EACH ROW
  declare
  l_rec type_def%rowtype;
  l_num numerator.prefix%type;
begin  
   if inserting then
      select * into l_rec from type_def where upper(table_name) = 'PROFIT_DISTRIB';
      if l_rec.id is not null then
          select prefix into l_num from numerator where typedef_id = l_rec.id;
      end if;
      
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
      if :new."NUM" is null then
          if l_num is null then
            select PROFIT_DISTRIB_NUM_SEQ.nextval into :new."NUM" from dual;
          else
            select l_num||PROFIT_DISTRIB_NUM_SEQ.nextval into :new."NUM" from dual;
          end if;  
      end if;
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "PROFIT_DISTRIB_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PROG_SETTINGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PROG_SETTINGS_TRG" 
  BEFORE INSERT OR UPDATE ON "PROG_SETTINGS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "PROG_SETTINGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger QUARTZ_PROPERTY_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "QUARTZ_PROPERTY_TRG" 
  BEFORE INSERT OR UPDATE ON "QUARTZ_PROPERTY"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "QUARTZ_PROPERTY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RATING_SETTINGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "RATING_SETTINGS_TRG" 
  BEFORE INSERT OR UPDATE ON "RATING_SETTINGS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "RATING_SETTINGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger REG_PRICES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "REG_PRICES_TRG" 
  BEFORE INSERT OR UPDATE ON "REG_PRICES"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if; 
end;
/
ALTER TRIGGER "REG_PRICES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger REG_RATES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "REG_RATES_TRG" 
  BEFORE INSERT OR UPDATE ON "REG_RATES"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "REG_RATES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RKO_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "RKO_TRG" 
  BEFORE INSERT OR UPDATE ON "RKO"
  REFERENCING FOR EACH ROW
  declare
  l_rec type_def%rowtype;
  l_num numerator.prefix%type;
begin  
   if inserting then
      select * into l_rec from type_def where upper(table_name) = 'RKO';
      if l_rec.id is not null then
          select prefix into l_num from numerator where typedef_id = l_rec.id;
      end if;
      
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
      if :new."NUM" is null then
          if l_num is null then
            select rko_num_seq.nextval into :new."NUM" from dual;
          else
            select l_num||rko_num_seq.nextval into :new."NUM" from dual;
          end if;  
      end if;
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "RKO_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger START_OST_TP_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "START_OST_TP_TRG" 
  BEFORE INSERT OR UPDATE ON "START_OST_TP"
  REFERENCING FOR EACH ROW
begin  
   if inserting then            
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
   end if;
end;
/
ALTER TRIGGER "START_OST_TP_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger START_OST_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "START_OST_TRG" 
  BEFORE INSERT OR UPDATE ON "START_OST"
  REFERENCING FOR EACH ROW
  declare
  l_rec type_def%rowtype;
  l_num numerator.prefix%type;
begin  
   if inserting then
      select * into l_rec from type_def where upper(table_name) = 'START_OST';
      if l_rec.id is not null then
          select prefix into l_num from numerator where typedef_id = l_rec.id;
      end if;
      
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
      if :new."NUM" is null then
          if l_num is null then
            select START_OST_NUM_SEQ.nextval into :new."NUM" from dual;
          else
            select l_num||START_OST_NUM_SEQ.nextval into :new."NUM" from dual;
          end if;  
      end if;
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "START_OST_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TYPE_DEF_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TYPE_DEF_TRG" 
  BEFORE INSERT OR UPDATE ON "TYPE_DEF"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "TYPE_DEF_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TYPE_OF_ACTIVITIES_TGR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TYPE_OF_ACTIVITIES_TGR" 
  BEFORE INSERT OR UPDATE ON "TYPE_OF_ACTIVITIES"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "TYPE_OF_ACTIVITIES_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USERS_GROUPS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USERS_GROUPS_TRG" 
  BEFORE INSERT OR UPDATE ON "USERS_GROUPS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "USERS_GROUPS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USERS_TRG" 
  BEFORE INSERT OR UPDATE ON "USERS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :new."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual; 
      end if; 
       if :new."PASS_WD" is null then 
         select utility.md5( '1') into :new."PASS_WD" from dual; 
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
      if :old."DATE_BEFORE" <> :new."DATE_BEFORE" then
        select 0 into :new."DATE_BEFIRE_ACCEPT" from dual;
      end if;
   end if;
end;
/
ALTER TRIGGER "USERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USER_SETTINGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USER_SETTINGS_TRG" 
  BEFORE INSERT ON "USER_SETTINGS"
  REFERENCING FOR EACH ROW
  declare
    a number;   
begin  
   if inserting then
      select count(*) into a from USER_SETTINGS where user_id=:NEW."USER_ID" ;
      if a>=1 then
        raise_application_error(-20100,'Can not insert more than one row');
      end if;
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if; 
end;
/
ALTER TRIGGER "USER_SETTINGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VOUCHER_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "VOUCHER_TRG" 
  BEFORE INSERT OR UPDATE ON "VOUCHER"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "VOUCHER_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger WLS_SETTINGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "WLS_SETTINGS_TRG" 
  BEFORE INSERT OR UPDATE ON "WLS_SETTINGS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "WLS_SETTINGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger XML_T_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "XML_T_TRG" 
  BEFORE INSERT OR UPDATE ON "XML_T"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "XML_T_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ZATRATY_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ZATRATY_TRG" 
  BEFORE INSERT OR UPDATE ON "ZATRATY"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
        select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "ZATRATY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Function ACC_TYPE_CONV
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "ACC_TYPE_CONV" (bl_expr in varchar2) return varchar2 as 
begin
  if upper(bl_expr) = 'ACTIVE' then
    return 'АКТИВНЫЙ';
  end if;
  if upper(bl_expr) = 'PASSIVE' then
    return 'ПАССИВНЫЙ';
  end if;
  return 'АКТИВНЫЙ/ПАССИВНЫЙ';
end acc_type_conv;

/
--------------------------------------------------------
--  DDL for Function BOOL_TO_NUM
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "BOOL_TO_NUM" 
(
  bl_expr in varchar2  
) return number as 
begin
 /* if bl_expr is null Then
    return null;
  end if;*/
  if upper(bl_expr) = 'TRUE' Then
    return 1;
  end if;
  return 0;
end bool_to_num;

/
--------------------------------------------------------
--  DDL for Function GET_DIVISIONS
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_DIVISIONS" (p_u_name in varchar2) 
return divisionTable
is
    l_data divisionTable := divisionTable();
    p_idrole number;
    p_iduser varchar2(50);
    p_counter number := 0;
begin
    select id, is_admin into p_iduser, p_idrole from users where upper(login) like upper(p_u_name);
    
    if p_idrole=1 then
    for i in (select id, upper(fullname) fullname from divisions where parent_id is not null) loop
    p_counter:=p_counter+1;
    l_data.extend;
    l_data(p_counter) := divisionType(i.id, i.fullname );
    end loop;
    return l_data;
    end if;
    
    p_counter:=0;
    for i in
        (select s.id, s.fullname from (select id, upper(fullname) fullname from divisions d
            --where d.deleted = 0
            connect by prior d.id=d.parent_id
            start with d.id = (select id from divisions where main_user = p_iduser and rownum = 1)
            union
            select d.id, upper(d.fullname) from divisions d
            inner join division_sotr s on d.id  = s.div_id
            where s.user_id = p_iduser) s) loop
        p_counter:=p_counter+1;
        l_data.extend;
        l_data(p_counter) := divisionType(i.id, i.fullname );
        end loop;
        return l_data;
end;

/
--------------------------------------------------------
--  DDL for Function GET_USERS
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_USERS" (p_u_name in varchar2) 
return userTable
is
    l_data userTable := userTable();
    p_idrole number;
    p_iduser varchar2(50);
    p_counter number := 0;
begin
    select id, is_admin into p_iduser, p_idrole from users where upper(login) like upper(p_u_name);
    
    if p_idrole=1 then
    for i in (select id, upper(login) login from users) loop
    p_counter:=p_counter+1;
    l_data.extend;
    l_data(p_counter) := userType(i.id, i.login );
    end loop;
    return l_data;
    end if;
    
    p_counter:=0;
    for i in
        (select id, s.use_r from (select (select id from users where id = s.user_id) as id, (select upper(login) from users where id = s.user_id) as use_r from divisions d
        inner join division_sotr s on s.div_id = d.id
        --where d.deleted = 0
        connect by prior d.id=d.parent_id
        start with d.id = (select id from divisions where main_user = p_iduser and rownum = 1)
        union
        select id, upper(login) from users where id = p_iduser) s) loop
        p_counter:=p_counter+1;
        l_data.extend;
        l_data(p_counter) := userType(i.id, i.use_r );
        end loop;
        return l_data;
end;

/
--------------------------------------------------------
--  DDL for Function GET_USERS_FOR_ZAMER
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GET_USERS_FOR_ZAMER" (p_u_name in varchar2) 
return userTable
is
    l_data userTable := userTable();
    p_idrole number;
    p_iduser varchar2(50);
    p_counter number := 0;
begin
    select id, is_admin into p_iduser, p_idrole from users where upper(login) like upper(p_u_name);
    
    if p_idrole=1 then
    for i in (select id, upper(login) login from users) loop
    p_counter:=p_counter+1;
    l_data.extend;
    l_data(p_counter) := userType(i.id, i.login );
    end loop;
    return l_data;
    end if;
    
    select nvl(count(*),0) into p_counter from divisions where main_user = p_iduser;
    if p_counter > 0 then
      p_idrole:=2; --Директор
    else
      p_idrole:=3; --Диспетчер замеров
    end if;
    
    if p_idrole=2 then
    p_counter:=0;
    for i in
        (select id, s.use_r from (select (select id from users where id = s.user_id) as id, (select upper(login) from users where id = s.user_id) as use_r from divisions d
        inner join division_sotr s on s.div_id = d.id
        --where d.deleted = 0
        connect by prior d.id=d.parent_id
        start with d.id = (select id from divisions where main_user = p_iduser and rownum = 1)
        union
        select id, upper(login) from users where id = p_iduser) s) loop
        p_counter:=p_counter+1;
        l_data.extend;
        l_data(p_counter) := userType(i.id, i.use_r );
        end loop;
        return l_data;
     end if; 
     
     p_counter:=0;
    for i in
        (select id, s.use_r from (select (select id from users where id = s.user_id) as id, (select upper(login) from users where id = s.user_id) as use_r from divisions d
        inner join division_sotr s on s.div_id = d.id
        --where d.deleted = 0
        connect by prior d.id=d.parent_id
        start with d.id = (select div_id from division_sotr where user_id = p_iduser and rownum = 1)
        union
        select id, upper(login) from users where id = p_iduser) s) loop
        p_counter:=p_counter+1;
        l_data.extend;
        l_data(p_counter) := userType(i.id, i.use_r );
        end loop;
        return l_data;
end;

/
--------------------------------------------------------
--  DDL for Function PLAN_TYPE_SUBCONTO_CONV
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "PLAN_TYPE_SUBCONTO_CONV" (bl_expr in varchar2) return varchar2 as
p_ref varchar2(50);
begin
  if upper(bl_expr) = 'ЦФО' then
    select id into p_ref from plan_type_subconto
        where type_of_obj = (select id from type_def where table_name = 'DIVISIONS');
    return p_ref;
  end if;
  if upper(bl_expr) = 'НОМЕНКЛАТУРА' then
    select id into p_ref from plan_type_subconto
        where type_of_obj = (select id from type_def where table_name = 'NOMENKLATURA');
    return p_ref;
  end if;
  if upper(bl_expr) = 'КОНТРАГЕНТЫ' then
    select id into p_ref from plan_type_subconto
        where type_of_obj = (select id from type_def where table_name = 'KONTRAGENTS');
    return p_ref;
  end if;
  if upper(bl_expr) = 'КАССА' then
    select id into p_ref from plan_type_subconto
        where type_of_obj = (select id from type_def where table_name = 'KASSA');
    return p_ref;
  end if;
  if upper(bl_expr) = 'СТАТЬЯ ЗАТРАТ' then
    select id into p_ref from plan_type_subconto
        where type_of_obj = (select id from type_def where table_name = 'ZATRATY');
    return p_ref;
  end if;
  return null;
end plan_type_subconto_conv;

/
--------------------------------------------------------
--  DDL for Function RANDOMUUID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "RANDOMUUID" 
    RETURN VARCHAR2
    AS LANGUAGE JAVA
    NAME 'RandomUUID.create() return java.lang.String';

/
--------------------------------------------------------
--  DDL for Package CURRENCY_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "CURRENCY_PKG" as 

  function get_xmlfromurl(p_url varchar2, p_charset varchar2 default 'UTF8') return xmltype;
  procedure getratebydate(p_code in currency.id%type, p_dat in date);
  procedure getratebyShedule;
  function get_lastSectionRates(p_code in currency.id%type, p_dat in date) return varchar2;
  function calculate_from_curr_to_curr(p_curr_from in currency.id%type, p_curr_to in currency.id%type, p_dat in date, p_summ number) return number;

end currency_pkg;

/
--------------------------------------------------------
--  DDL for Package ENTRY
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "ENTRY" as 

  function sign_of_summ(p_acc in plan_acc.id%type, p_summ in number, p_type in number) return number;
  function get_ostatok_by_date(p_acc in plan_acc.code%type, p_dat in date, p_division_id divisions.id%type) return number;

end entry;

/
--------------------------------------------------------
--  DDL for Package FTP
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "FTP" AS
-- --------------------------------------------------------------------------
-- Name         : http://www.oracle-base.com/dba/miscellaneous/ftp.pks
-- Author       : DR Timothy S Hall
-- Description  : Basic FTP API. For usage notes see:
--                  http://www.oracle-base.com/articles/misc/ftp-from-plsql.php
-- Requirements : UTL_TCP
-- Ammedments   :
--   When         Who       What
--   ===========  ========  =================================================
--   14-AUG-2003  Tim Hall  Initial Creation
--   10-MAR-2004  Tim Hall  Add convert_crlf procedure.
--                          Make get_passive function visible.
--                          Added get_direct and put_direct procedures.
--   03-OCT-2006  Tim Hall  Add list, rename, delete, mkdir, rmdir procedures.
--   15-Jan-2008  Tim Hall  login: Include timeout parameter (suggested by Dmitry Bogomolov).
--   12-Jun-2008  Tim Hall  get_reply: Moved to pakage specification.
--   22-Apr-2009  Tim Hall  nlst: Added to return list of file names only (suggested by Julian and John Duncan)
-- --------------------------------------------------------------------------

TYPE t_string_table IS TABLE OF VARCHAR2(32767);

FUNCTION login (p_host    IN  VARCHAR2,
                p_port    IN  VARCHAR2,
                p_user    IN  VARCHAR2,
                p_pass    IN  VARCHAR2,
                p_timeout IN  NUMBER := NULL)
  RETURN UTL_TCP.connection;

FUNCTION get_passive (p_conn  IN OUT NOCOPY  UTL_TCP.connection)
  RETURN UTL_TCP.connection;

PROCEDURE logout (p_conn   IN OUT NOCOPY  UTL_TCP.connection,
                  p_reply  IN             BOOLEAN := TRUE);

PROCEDURE send_command (p_conn     IN OUT NOCOPY  UTL_TCP.connection,
                        p_command  IN             VARCHAR2,
                        p_reply    IN             BOOLEAN := TRUE);

PROCEDURE get_reply (p_conn  IN OUT NOCOPY  UTL_TCP.connection);

FUNCTION get_local_ascii_data (p_dir   IN  VARCHAR2,
                               p_file  IN  VARCHAR2)
  RETURN CLOB;

FUNCTION get_local_binary_data (p_dir   IN  VARCHAR2,
                                p_file  IN  VARCHAR2)
  RETURN BLOB;

FUNCTION get_remote_ascii_data (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                                p_file  IN             VARCHAR2)
  RETURN CLOB;

FUNCTION get_remote_binary_data (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                                 p_file  IN             VARCHAR2)
  RETURN BLOB;

PROCEDURE put_local_ascii_data (p_data  IN  CLOB,
                                p_dir   IN  VARCHAR2,
                                p_file  IN  VARCHAR2);

PROCEDURE put_local_binary_data (p_data  IN  BLOB,
                                 p_dir   IN  VARCHAR2,
                                 p_file  IN  VARCHAR2);

PROCEDURE put_remote_ascii_data (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                                 p_file  IN             VARCHAR2,
                                 p_data  IN             CLOB);

PROCEDURE put_remote_binary_data (p_conn  IN OUT  NOCOPY UTL_TCP.connection,
                                  p_file  IN             VARCHAR2,
                                  p_data  IN             BLOB);

PROCEDURE get (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
               p_from_file  IN             VARCHAR2,
               p_to_dir     IN             VARCHAR2,
               p_to_file    IN             VARCHAR2);

PROCEDURE put (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
               p_from_dir   IN             VARCHAR2,
               p_from_file  IN             VARCHAR2,
               p_to_file    IN             VARCHAR2);

PROCEDURE get_direct (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
                      p_from_file  IN             VARCHAR2,
                      p_to_dir     IN             VARCHAR2,
                      p_to_file    IN             VARCHAR2);

PROCEDURE put_direct (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
                      p_from_dir   IN             VARCHAR2,
                      p_from_file  IN             VARCHAR2,
                      p_to_file    IN             VARCHAR2);

PROCEDURE help (p_conn  IN OUT NOCOPY  UTL_TCP.connection);

PROCEDURE ascii (p_conn  IN OUT NOCOPY  UTL_TCP.connection);

PROCEDURE binary (p_conn  IN OUT NOCOPY  UTL_TCP.connection);

PROCEDURE list (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                p_dir   IN             VARCHAR2,
                p_list  OUT            t_string_table);

PROCEDURE nlst (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                p_dir   IN             VARCHAR2,
                p_list  OUT            t_string_table);

PROCEDURE rename (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                  p_from  IN             VARCHAR2,
                  p_to    IN             VARCHAR2);

PROCEDURE delete (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                  p_file  IN             VARCHAR2);

PROCEDURE mkdir (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                 p_dir   IN             VARCHAR2);

PROCEDURE rmdir (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                 p_dir   IN             VARCHAR2);

PROCEDURE convert_crlf (p_status  IN  BOOLEAN);

END ftp;

/
--------------------------------------------------------
--  DDL for Package KONTRAG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "KONTRAG" AS 

  procedure create_kontrag(p_parent kontragents.parent_id%type, p_fullname kontragents.fullname%type, p_namefull kontragents.namefull%type,
                            p_okpo kontragents.okpo%type, p_inn kontragents.inn%type);

END KONTRAG;

/
--------------------------------------------------------
--  DDL for Package ORDERS_ENTRY
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "ORDERS_ENTRY" as 
   gn$startdatmoves   date:= to_date('01-01-1970 00:00:00','DD-MM-YYYY HH24:MI:SS');
   gn$enddatmoves   date:= systimestamp;
   
  procedure set_startdatmoves (in_dat date);
  function get_startdatmoves return date;
  
  procedure set_enddatmoves (in_dat date);
  function get_enddatmoves return date;
  
  
  procedure orders_move_plan_acc(p_id in varchar2);
  procedure orders_remove_plan_acc(p_id in varchar2, p_del in number default 0);
  procedure orders_move_all;
  procedure orders_remove_all;

end orders_entry;

/
--------------------------------------------------------
--  DDL for Package OTHER_ENTRY
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "OTHER_ENTRY" as 

  procedure other_move_plan_acc(p_id in varchar2);
  procedure other_remove_plan_acc(p_id in varchar2, p_del in number default 0);
  procedure other_move_all;
  procedure other_remove_all;

end other_entry;

/
--------------------------------------------------------
--  DDL for Package PAYCALC
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "PAYCALC" AS 

  function get_kontrag_by_order(p_order in varchar2) return kontragtable;
  function get_kontrag_by_division(p_order in varchar2) return kontragtable;
  function get_kontrag_by_ierarchia(p_order in varchar2) return kontragtable;
  function get_kont_by_division(p_order in varchar2) return kontragtable;
  function get_kont_by_ierarchia(p_order in varchar2) return kontragtable;
  function get_kont_by_net(p_order in varchar2) return kontragtable;
  function get_kont_by_order(p_order in varchar2) return kontragtable;
  procedure calc_money(p_order in varchar2);
  function getSummOrder(p_order in varchar2) return number;
  function getKoeffByLevel(p_order in varchar2, p_level number) return number;
  function getKoeffByLevelKontr(p_order in varchar2, p_level number) return number;
  procedure calc_money_by_kontr(p_order in varchar2);
  procedure profit_money_by_kontr(p_order in varchar2, p_summ in number);

END PAYCALC;

/
--------------------------------------------------------
--  DDL for Package PKO_ENTRY
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "PKO_ENTRY" as 

  procedure pko_move_plan_acc(p_id in varchar2);
  procedure pko_remove_plan_acc(p_id in varchar2, p_del in number default 0);
  procedure pko_move_all;
  procedure pko_remove_all;
  function get_operationname(p_id in varchar2) return varchar2;

end pko_entry;

/
--------------------------------------------------------
--  DDL for Package PRICES
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "PRICES" AS 

 function get_lastSectionPrice(p_code in nomenklatura.id%type, p_dat in date) return varchar2;
 procedure importprice(p_dat in date);

END PRICES;

/
--------------------------------------------------------
--  DDL for Package PROFIT_ENTRY
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "PROFIT_ENTRY" AS 

  procedure profit_move_plan_acc(p_id in varchar2);
  procedure profit_remove_plan_acc(p_id in varchar2, p_del in number default 0);
  procedure profit_move_all;
  procedure profit_remove_all; 

END PROFIT_ENTRY;

/
--------------------------------------------------------
--  DDL for Package P_ENCRYPT
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "P_ENCRYPT" 
AS 
  FUNCTION encrypt_ssn( p_ssn IN VARCHAR2, p_key IN VARCHAR2) RETURN RAW;
  FUNCTION encrypt_pass( p_ssn IN VARCHAR2, p_key IN VARCHAR2 ) RETURN RAW;
  FUNCTION decrypt_ssn( p_ssn IN RAW, p_key IN VARCHAR2 ) RETURN VARCHAR2;
  FUNCTION decrypt_pass( p_ssn IN RAW, p_key IN VARCHAR2 ) RETURN VARCHAR2;
END p_encrypt;

/
--------------------------------------------------------
--  DDL for Package REPORT_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "REPORT_PKG" as

  function getzatraty(f_data date default null, l_data date default null)
      return tbl_zatraty;
  
  function getsales(f_data date default null, l_data date default null)
      return tbl_sales;
      
  function getballans(f_data date default null, l_data date default null)
      return tbl_ballans;
      
  function getrating(f_data date default null, l_data date default null)
      return tbl_rating;
  
  function getreference(p_tablename in varchar2)
      return tbl_reference;    
      
  function getreftable(p_id in varchar2, p_tablename in varchar2)
      return tbl_ref_tab;
      
  function get_deleted_tables
      return tbl_deleted; 
  
  function get_deletedref_tables
      return tbl_deleted_ref;
  
  procedure refresh_ballans(f_data date default null, l_data date default null); 
  procedure delete_table(p_id in varchar2, p_tablename in varchar2);

end report_pkg;

/
--------------------------------------------------------
--  DDL for Package RKO_ENTRY
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "RKO_ENTRY" AS 

  procedure rko_move_plan_acc(p_id in varchar2);
  procedure rko_remove_plan_acc(p_id in varchar2, p_del in number default 0);
  procedure rko_move_all;
  procedure rko_remove_all;
  function get_operationname(p_id in varchar2) return varchar2;

END RKO_ENTRY;

/
--------------------------------------------------------
--  DDL for Package START_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "START_PKG" AS 

  procedure start_move_plan_acc(p_id in varchar2);
  procedure start_remove_plan_acc(p_id in varchar2, p_del in number default 0);
  procedure start_move_all;
  procedure start_remove_all;

END START_PKG;

/
--------------------------------------------------------
--  DDL for Package USR_SETT
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "USR_SETT" as 

  function get_userid(p_u_name in varchar2) return varchar2;
  function get_userfirma(p_id in varchar2) return varchar2;
  function get_currency(p_id in varchar2) return varchar2;
  function get_division(p_id in varchar2) return varchar2;
  function get_kassa(p_id in varchar2) return varchar2;
  function get_mainusluga(p_id in varchar2) return varchar2;
  function get_activities(p_id in varchar2) return varchar2;

end usr_sett;

/
--------------------------------------------------------
--  DDL for Package UTILITY
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "UTILITY" as 

  function  uuid	return varchar2; 
  function  md5(str in varchar2)	return varchar2;
  procedure clear_base;
  procedure  get_acc_plan_xml;
  procedure set_acc_plan;
  procedure first_start;
  procedure enable_constraint;
  procedure disable_constraint;
  function retrieve_customer_parentid return varchar2;
  function retrieve_customer_parentname return varchar2;
  procedure add_kontragent_to_call_list(p_kontrag_id in varchar2, p_compaign_id in varchar2);
  procedure rem_kontragent_from_call_list(p_kontrag_id in varchar2);
  function retrieve_division_parentid return varchar2;
  procedure change_parent_in_division(p_id in varchar2, p_parent_id in varchar2);
  procedure add_user_to_group(p_user in varchar2, p_group in varchar2);
  function retrieve_zamer_parentid return varchar2;
  function retrieve_supplier_parentid return varchar2;
  function retrieve_other_parentid return varchar2;
  function retrieve_name_baseofcalc (p_id in varchar2) return varchar2;
  function retrieve_idfix_baseofcalc return varchar2;
  function retrieve_idfromalgorythm (p_id in varchar2) return varchar2;
  function retrieve_name_basenachisl (p_id in varchar2) return varchar2;
  procedure createKontrag(p_name in varchar2, p_user_id in varchar2,
            p_isSupp in number, p_isMeasr in number , p_isByer in number);
  procedure createZatraty(p_name in varchar2); 
  function enable_edit(p_id in varchar2, p_type in varchar2) return number;
  procedure set_disable_edit_profit(p_date in date);
  function user_exists(p_login in varchar2) return varchar2;
  function access_enabled(p_login in varchar2) return varchar2;
  function generate_code(p_login in varchar2, p_date in date) return varchar2;
  procedure accept_code(p_login in varchar2, p_code in varchar2);
  function order_payed_percent(p_order in varchar2) return varchar2;
  function ballans_by_kontr(p_id in varchar2, p_code in varchar2) return number;

end utility;

/
--------------------------------------------------------
--  DDL for Package Body CURRENCY_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "CURRENCY_PKG" as

function get_xmlFromUrl(p_url varchar2, p_charset varchar2 default 'UTF8') return xmltype as
  req   utl_http.req; 
  resp  utl_http.resp;
  val varchar2(32547);
  a clob;
BEGIN
  dbms_lob.createtemporary(a,true);
  dbms_lob.open(a,dbms_lob.lob_readwrite);
  req := utl_http.begin_request(p_url);
  utl_http.set_body_charset(req, p_charset);
  resp := utl_http.get_response(req);
  LOOP
    a := a||val;
    utl_http.read_text(resp, val, 5000);
  END LOOP;
  utl_http.end_response(resp);
  return xmltype(a);
EXCEPTION
  WHEN utl_http.end_of_body THEN
    utl_http.end_response(resp);
    return xmltype(a);
  WHEN others then
    utl_http.end_response(resp);
    raise;
end;

procedure getratebydate(p_code in currency.id%type, p_dat in date) as
  p_curr_rec currency%rowtype;
  p_rates reg_rates%rowtype;
  p_date_str varchar2(10);
  nominal number(10,0);
  val number (10,6);
  p_count number;
begin
  select count(*) into p_count from reg_rates 
    where curr_id=p_code and to_char(period,'dd-mm-yyyy') = to_char(p_dat,'dd-mm-yyyy');
  if p_count <> 0 then
    return;
  end if;  
  select * into p_curr_rec from currency where id=p_code;
  
  select to_number(extractValue(value(dtl),'item/size'),'9999'),
      to_number(extractValue(value(dtl),'item/rate'),'9999.999999') into nominal, val
  from (select currency_pkg.get_xmlfromurl('http://bank-ua.com/export/currrate.xml','CL8MSWIN1251') xml from dual) s,
    table(XMLSequence(s.xml.extract('chapter/item'))) dtl
  where extractValue(value(dtl),'item/code') = p_curr_rec.code; 
  --select to_char(p_dat,'dd')|| to_char(p_dat,'mm')|| to_char(p_dat,'yyyy') into p_date_str from dual;
  
  --select to_number(t.xml.extract('//ValCurs/Valute[@id='||p_curr_rec.id_xml||']/Nominal/text()'),'9999'),
      --to_number(t.xml.extract('//ValCurs/Valute[@id='||p_curr_rec.id_xml||']/Value/text()'),'9999.999999') into nominal, val
  --from (select currency_pkg.get_xmlfromurl('http://pfsoft.com.ua/service/currency/?date='||p_date_str||'','CL8MSWIN1251') xml from dual) t;
  
  insert into reg_rates(curr_id,period,kurs,kratnost) values (p_code,p_dat,val,nominal);
  
  EXCEPTION 
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error getting rates! '||SQLERRM, TRUE) ;
end;

function get_lastsectionrates(p_code in currency.id%type, p_dat in date) return varchar2 as
res varchar2(50);
begin
  select id into res from reg_rates where period = (select max(period) from reg_rates where curr_id=p_code
                                          and period<=p_dat) and curr_id=p_code
  and rownum = 1;
  
  return res;
end;

procedure getratebyshedule as
p_date_str varchar2(50);
p_date date;
begin
  p_date_str:=to_char(sysdate,'dd-mm-yyyy');
  p_date:=to_date(p_date_str,'DD-MM-YYYY');
  for i in (select * from ex_rates_settings)
  loop
    getratebydate(i.curr_id, p_date);
  end loop;
end;

function calculate_from_curr_to_curr(p_curr_from in currency.id%type,
            p_curr_to in currency.id%type,
            p_dat in date,
            p_summ number) return number as
res number(10,2);
p_rate_from number;
p_rate_to number;
begin
    select kurs/kratnost into p_rate_from from reg_rates where id = get_lastsectionrates(p_curr_from,p_dat); 
    select kurs/kratnost into p_rate_to from reg_rates where id = get_lastsectionrates(p_curr_to,p_dat);
    res:=p_summ*p_rate_from/p_rate_to;
    return res;
end;

end currency_pkg;

/
--------------------------------------------------------
--  DDL for Package Body ENTRY
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "ENTRY" as

  --p_type 1 или 0; 1-сумма дебетуется, 0-сумма кредитуется
  function sign_of_summ(p_acc in plan_acc.id%type, p_summ in number, p_type in number) return number as
  p_out_summ number(10,2);
  p_acc_type enum_account_type.fullname%type;
  begin
    p_out_summ:=p_summ;
    select trim(fullname) into p_acc_type from enum_account_type
      where id=(select acc_type from plan_acc where id = p_acc);
    if (upper(p_acc_type)=upper('Активный')) then
      if (p_type=1) then
        p_out_summ:=p_summ;
      else
        p_out_summ:=-p_summ;
      end if;
      return p_out_summ;
    end if;      
    if (upper(p_acc_type)=upper('Пассивный')) then 
      if (p_type=1) then
        p_out_summ:=-p_summ;
      else
        p_out_summ:=p_summ;
      end if;
      return p_out_summ;
    end if;
    
    if (p_type=1) then
        p_out_summ:=p_summ;
      else
        p_out_summ:=-p_summ;
    end if;
    return p_out_summ;
  end sign_of_summ;
  
  function get_ostatok_by_date(p_acc in plan_acc.code%type, p_dat in date, p_division_id divisions.id%type) return number as
  p_sum_deb number;
  p_sum_kred number;
  begin
  SELECT NVL(SUM(vw_moves.SUM_DEB),0) into p_sum_deb 
  FROM vw_moves
  where deb = p_acc and DIVISION_ID = p_division_id and trunc(period) <= trunc(p_dat);
  
  SELECT NVL(SUM(vw_moves.SUM_KRED),0) into p_sum_kred 
  FROM vw_moves
  where kred = p_acc and DIVISION_ID = p_division_id and trunc(period) <= trunc(p_dat);
  
  return p_sum_deb+p_sum_kred;
  
  end get_ostatok_by_date;

end entry;

/
--------------------------------------------------------
--  DDL for Package Body FTP
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "FTP" AS
-- --------------------------------------------------------------------------
-- Name         : http://www.oracle-base.com/dba/miscellaneous/ftp.pkb
-- Author       : DR Timothy S Hall
-- Description  : Basic FTP API. For usage notes see:
--                  http://www.oracle-base.com/articles/misc/ftp-from-plsql.php
-- Requirements : http://www.oracle-base.com/dba/miscellaneous/ftp.pks
-- Ammedments   :
--   When         Who       What
--   ===========  ========  =================================================
--   14-AUG-2003  Tim Hall  Initial Creation
--   10-MAR-2004  Tim Hall  Add convert_crlf procedure.
--                          Incorporate CRLF conversion functionality into
--                          put_local_ascii_data and put_remote_ascii_data
--                          functions.
--                          Make get_passive function visible.
--                          Added get_direct and put_direct procedures.
--   23-DEC-2004  Tim Hall  The get_reply procedure was altered to deal with
--                          banners starting with 4 white spaces. This fix is
--                          a small variation on the resolution provided by
--                          Gary Mason who spotted the bug.
--   10-NOV-2005  Tim Hall  Addition of get_reply after doing a transfer to
--                          pickup the 226 Transfer complete message. This
--                          allows gets and puts with a single connection.
--                          Issue spotted by Trevor Woolnough.
--   03-OCT-2006  Tim Hall  Add list, rename, delete, mkdir, rmdir procedures.
--   12-JAN-2007  Tim Hall  A final call to get_reply was added to the get_remote%
--                          procedures to allow multiple transfers per connection.
--   15-Jan-2008  Tim Hall  login: Include timeout parameter (suggested by Dmitry Bogomolov).
--   21-Jan-2008  Tim Hall  put_%: "l_pos < l_clob_len" to "l_pos <= l_clob_len" to prevent
--                          potential loss of one character for single-byte files or files
--                          sized 1 byte bigger than a number divisible by the buffer size
--                          (spotted by Michael Surikov).
--   23-Jan-2008  Tim Hall  send_command: Possible solution for ORA-29260 errors included,
--                          but commented out (suggested by Kevin Phillips).
--   12-Feb-2008  Tim Hall  put_local_binary_data and put_direct: Open file with "wb" for
--                          binary writes (spotted by Dwayne Hoban).
--   03-Mar-2008  Tim Hall  list: get_reply call and close of passive connection added
--                          (suggested by Julian, Bavaria).
--   12-Jun-2008  Tim Hall  A final call to get_reply was added to the put_remote%
--                          procedures, but commented out. If uncommented, it may cause the
--                          operation to hang, but it has been reported (morgul) to allow
--                          multiple transfers per connection.
--                          get_reply: Moved to pakage specification.
--   24-Jun-2008  Tim Hall  get_remote% and put_remote%: Exception handler added to close the passive
--                          connection and reraise the error (suggested by Mark Reichman).
--   22-Apr-2009  Tim Hall  get_remote_ascii_data: Remove unnecessary logout (suggested by John Duncan).
--                          get_reply and list: Handle 400 messages as well as 500 messages (suggested by John Duncan).
--                          logout: Added a call to UTL_TCP.close_connection, so not necessary to close
--                          any connections manually (suggested by Victor Munoz).
--                          get_local_*_data: Check for zero length files to prevent exception (suggested by Daniel)
--                          nlst: Added to return list of file names only (suggested by Julian and John Duncan)
--   05-Apr-2011  Tim Hall  put_remote_ascii_data: Added comment on definition of l_amount. Switch to 10000 if you get
--                          ORA-06502 from this line. May give you unexpected result due to conversion. Better to use binary.
-- --------------------------------------------------------------------------

g_reply         t_string_table := t_string_table();
g_binary        BOOLEAN := TRUE;
g_debug         BOOLEAN := TRUE;
g_convert_crlf  BOOLEAN := TRUE;

PROCEDURE debug (p_text  IN  VARCHAR2);

-- --------------------------------------------------------------------------
FUNCTION login (p_host    IN  VARCHAR2,
                p_port    IN  VARCHAR2,
                p_user    IN  VARCHAR2,
                p_pass    IN  VARCHAR2,
                p_timeout IN  NUMBER := NULL)
  RETURN UTL_TCP.connection IS
-- --------------------------------------------------------------------------
  l_conn  UTL_TCP.connection;
BEGIN
  g_reply.delete;

  l_conn := UTL_TCP.open_connection(p_host, p_port, tx_timeout => p_timeout);
  get_reply (l_conn);
  send_command(l_conn, 'USER ' || p_user);
  send_command(l_conn, 'PASS ' || p_pass);
  RETURN l_conn;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
FUNCTION get_passive (p_conn  IN OUT NOCOPY  UTL_TCP.connection)
  RETURN UTL_TCP.connection IS
-- --------------------------------------------------------------------------
  l_conn    UTL_TCP.connection;
  l_reply   VARCHAR2(32767);
  l_host    VARCHAR(100);
  l_port1   NUMBER(10);
  l_port2   NUMBER(10);
BEGIN
  send_command(p_conn, 'PASV');
  l_reply := g_reply(g_reply.last);

  l_reply := REPLACE(SUBSTR(l_reply, INSTR(l_reply, '(') + 1, (INSTR(l_reply, ')')) - (INSTR(l_reply, '('))-1), ',', '.');
  l_host  := SUBSTR(l_reply, 1, INSTR(l_reply, '.', 1, 4)-1);

  l_port1 := TO_NUMBER(SUBSTR(l_reply, INSTR(l_reply, '.', 1, 4)+1, (INSTR(l_reply, '.', 1, 5)-1) - (INSTR(l_reply, '.', 1, 4))));
  l_port2 := TO_NUMBER(SUBSTR(l_reply, INSTR(l_reply, '.', 1, 5)+1));

  l_conn := utl_tcp.open_connection(l_host, 256 * l_port1 + l_port2);
  return l_conn;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE logout(p_conn   IN OUT NOCOPY  UTL_TCP.connection,
                 p_reply  IN             BOOLEAN := TRUE) AS
-- --------------------------------------------------------------------------
BEGIN
  send_command(p_conn, 'QUIT', p_reply);
  UTL_TCP.close_connection(p_conn);
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE send_command (p_conn     IN OUT NOCOPY  UTL_TCP.connection,
                        p_command  IN             VARCHAR2,
                        p_reply    IN             BOOLEAN := TRUE) IS
-- --------------------------------------------------------------------------
  l_result  PLS_INTEGER;
BEGIN
  l_result := UTL_TCP.write_line(p_conn, p_command);
  -- If you get ORA-29260 after the PASV call, replace the above line with the following line.
  -- l_result := UTL_TCP.write_text(p_conn, p_command || utl_tcp.crlf, length(p_command || utl_tcp.crlf));

  IF p_reply THEN
    get_reply(p_conn);
  END IF;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE get_reply (p_conn  IN OUT NOCOPY  UTL_TCP.connection) IS
-- --------------------------------------------------------------------------
  l_reply_code  VARCHAR2(3) := NULL;
BEGIN
  LOOP
    g_reply.extend;
    g_reply(g_reply.last) := UTL_TCP.get_line(p_conn, TRUE);
    debug(g_reply(g_reply.last));
    IF l_reply_code IS NULL THEN
      l_reply_code := SUBSTR(g_reply(g_reply.last), 1, 3);
    END IF;
    IF SUBSTR(l_reply_code, 1, 1) IN ('4', '5') THEN
      RAISE_APPLICATION_ERROR(-20000, g_reply(g_reply.last));
    ELSIF (SUBSTR(g_reply(g_reply.last), 1, 3) = l_reply_code AND
           SUBSTR(g_reply(g_reply.last), 4, 1) = ' ') THEN
      EXIT;
    END IF;
  END LOOP;
EXCEPTION
  WHEN UTL_TCP.END_OF_INPUT THEN
    NULL;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
FUNCTION get_local_ascii_data (p_dir   IN  VARCHAR2,
                               p_file  IN  VARCHAR2)
  RETURN CLOB IS
-- --------------------------------------------------------------------------
  l_bfile   BFILE;
  l_data    CLOB;
BEGIN
  DBMS_LOB.createtemporary (lob_loc => l_data,
                            cache   => TRUE,
                            dur     => DBMS_LOB.call);

  l_bfile := BFILENAME(p_dir, p_file);
  DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);

  IF DBMS_LOB.getlength(l_bfile) > 0 THEN
    DBMS_LOB.loadfromfile(l_data, l_bfile, DBMS_LOB.getlength(l_bfile));
  END IF;

  DBMS_LOB.fileclose(l_bfile);

  RETURN l_data;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
FUNCTION get_local_binary_data (p_dir   IN  VARCHAR2,
                                p_file  IN  VARCHAR2)
  RETURN BLOB IS
-- --------------------------------------------------------------------------
  l_bfile   BFILE;
  l_data    BLOB;
BEGIN
  DBMS_LOB.createtemporary (lob_loc => l_data,
                            cache   => TRUE,
                            dur     => DBMS_LOB.call);

  l_bfile := BFILENAME(p_dir, p_file);
  DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);
  IF DBMS_LOB.getlength(l_bfile) > 0 THEN
    DBMS_LOB.loadfromfile(l_data, l_bfile, DBMS_LOB.getlength(l_bfile));
  END IF;
  DBMS_LOB.fileclose(l_bfile);

  RETURN l_data;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
FUNCTION get_remote_ascii_data (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                                p_file  IN             VARCHAR2)
  RETURN CLOB IS
-- --------------------------------------------------------------------------
  l_conn    UTL_TCP.connection;
  l_amount  PLS_INTEGER;
  l_buffer  VARCHAR2(32767);
  l_data    CLOB;
BEGIN
  DBMS_LOB.createtemporary (lob_loc => l_data,
                            cache   => TRUE,
                            dur     => DBMS_LOB.call);

  l_conn := get_passive(p_conn);
  send_command(p_conn, 'RETR ' || p_file, TRUE);
  --logout(l_conn, FALSE);

  BEGIN
    LOOP
      l_amount := UTL_TCP.read_text (l_conn, l_buffer, 32767);
      DBMS_LOB.writeappend(l_data, l_amount, l_buffer);
    END LOOP;
  EXCEPTION
    WHEN UTL_TCP.END_OF_INPUT THEN
      NULL;
    WHEN OTHERS THEN
      NULL;
  END;
  UTL_TCP.close_connection(l_conn);
  get_reply(p_conn);

  RETURN l_data;

EXCEPTION
  WHEN OTHERS THEN
    UTL_TCP.close_connection(l_conn);
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
FUNCTION get_remote_binary_data (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                                 p_file  IN             VARCHAR2)
  RETURN BLOB IS
-- --------------------------------------------------------------------------
  l_conn    UTL_TCP.connection;
  l_amount  PLS_INTEGER;
  l_buffer  RAW(32767);
  l_data    BLOB;
BEGIN
  DBMS_LOB.createtemporary (lob_loc => l_data,
                            cache   => TRUE,
                            dur     => DBMS_LOB.call);

  l_conn := get_passive(p_conn);
  send_command(p_conn, 'RETR ' || p_file, TRUE);

  BEGIN
    LOOP
      l_amount := UTL_TCP.read_raw (l_conn, l_buffer, 32767);
      DBMS_LOB.writeappend(l_data, l_amount, l_buffer);
    END LOOP;
  EXCEPTION
    WHEN UTL_TCP.END_OF_INPUT THEN
      NULL;
    WHEN OTHERS THEN
      NULL;
  END;
  UTL_TCP.close_connection(l_conn);
  get_reply(p_conn);

  RETURN l_data;

EXCEPTION
  WHEN OTHERS THEN
    UTL_TCP.close_connection(l_conn);
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE put_local_ascii_data (p_data  IN  CLOB,
                                p_dir   IN  VARCHAR2,
                                p_file  IN  VARCHAR2) IS
-- --------------------------------------------------------------------------
  l_out_file  UTL_FILE.file_type;
  l_buffer    VARCHAR2(32767);
  l_amount    BINARY_INTEGER := 32767;
  l_pos       INTEGER := 1;
  l_clob_len  INTEGER;
BEGIN
  l_clob_len := DBMS_LOB.getlength(p_data);

  l_out_file := UTL_FILE.fopen(p_dir, p_file, 'w', 32767);

  WHILE l_pos <= l_clob_len LOOP
    DBMS_LOB.read (p_data, l_amount, l_pos, l_buffer);
    IF g_convert_crlf THEN
      l_buffer := REPLACE(l_buffer, CHR(13), NULL);
    END IF;

    UTL_FILE.put(l_out_file, l_buffer);
    UTL_FILE.fflush(l_out_file);
    l_pos := l_pos + l_amount;
  END LOOP;

  UTL_FILE.fclose(l_out_file);
EXCEPTION
  WHEN OTHERS THEN
    IF UTL_FILE.is_open(l_out_file) THEN
      UTL_FILE.fclose(l_out_file);
    END IF;
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE put_local_binary_data (p_data  IN  BLOB,
                                 p_dir   IN  VARCHAR2,
                                 p_file  IN  VARCHAR2) IS
-- --------------------------------------------------------------------------
  l_out_file  UTL_FILE.file_type;
  l_buffer    RAW(32767);
  l_amount    BINARY_INTEGER := 32767;
  l_pos       INTEGER := 1;
  l_blob_len  INTEGER;
BEGIN
  l_blob_len := DBMS_LOB.getlength(p_data);

  l_out_file := UTL_FILE.fopen(p_dir, p_file, 'wb', 32767);

  WHILE l_pos <= l_blob_len LOOP
    DBMS_LOB.read (p_data, l_amount, l_pos, l_buffer);
    UTL_FILE.put_raw(l_out_file, l_buffer, TRUE);
    UTL_FILE.fflush(l_out_file);
    l_pos := l_pos + l_amount;
  END LOOP;

  UTL_FILE.fclose(l_out_file);
EXCEPTION
  WHEN OTHERS THEN
    IF UTL_FILE.is_open(l_out_file) THEN
      UTL_FILE.fclose(l_out_file);
    END IF;
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE put_remote_ascii_data (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                                 p_file  IN             VARCHAR2,
                                 p_data  IN             CLOB) IS
-- --------------------------------------------------------------------------
  l_conn      UTL_TCP.connection;
  l_result    PLS_INTEGER;
  l_buffer    VARCHAR2(32767);
  l_amount    BINARY_INTEGER := 32767; -- Switch to 10000 (or use binary) if you get ORA-06502 from this line.
  l_pos       INTEGER := 1;
  l_clob_len  INTEGER;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'STOR ' || p_file, TRUE);

  l_clob_len := DBMS_LOB.getlength(p_data);

  WHILE l_pos <= l_clob_len LOOP
    DBMS_LOB.READ (p_data, l_amount, l_pos, l_buffer);
    IF g_convert_crlf THEN
      l_buffer := REPLACE(l_buffer, CHR(13), NULL);
    END IF;
    l_result := UTL_TCP.write_text(l_conn, l_buffer, LENGTH(l_buffer));
    UTL_TCP.flush(l_conn);
    l_pos := l_pos + l_amount;
  END LOOP;

  UTL_TCP.close_connection(l_conn);
  -- The following line allows some people to make multiple calls from one connection.
  -- It causes the operation to hang for me, hence it is commented out by default.
  -- get_reply(p_conn);

EXCEPTION
  WHEN OTHERS THEN
    UTL_TCP.close_connection(l_conn);
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE put_remote_binary_data (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                                  p_file  IN             VARCHAR2,
                                  p_data  IN             BLOB) IS
-- --------------------------------------------------------------------------
  l_conn      UTL_TCP.connection;
  l_result    PLS_INTEGER;
  l_buffer    RAW(32767);
  l_amount    BINARY_INTEGER := 32767;
  l_pos       INTEGER := 1;
  l_blob_len  INTEGER;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'STOR ' || p_file, TRUE);

  l_blob_len := DBMS_LOB.getlength(p_data);

  WHILE l_pos <= l_blob_len LOOP
    DBMS_LOB.READ (p_data, l_amount, l_pos, l_buffer);
    l_result := UTL_TCP.write_raw(l_conn, l_buffer, l_amount);
    UTL_TCP.flush(l_conn);
    l_pos := l_pos + l_amount;
  END LOOP;

  UTL_TCP.close_connection(l_conn);
  -- The following line allows some people to make multiple calls from one connection.
  -- It causes the operation to hang for me, hence it is commented out by default.
  -- get_reply(p_conn);

EXCEPTION
  WHEN OTHERS THEN
    UTL_TCP.close_connection(l_conn);
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE get (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
               p_from_file  IN             VARCHAR2,
               p_to_dir     IN             VARCHAR2,
               p_to_file    IN             VARCHAR2) AS
-- --------------------------------------------------------------------------
BEGIN
  IF g_binary THEN
    put_local_binary_data(p_data  => get_remote_binary_data (p_conn, p_from_file),
                          p_dir   => p_to_dir,
                          p_file  => p_to_file);
  ELSE
    put_local_ascii_data(p_data  => get_remote_ascii_data (p_conn, p_from_file),
                         p_dir   => p_to_dir,
                         p_file  => p_to_file);
  END IF;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE put (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
               p_from_dir   IN             VARCHAR2,
               p_from_file  IN             VARCHAR2,
               p_to_file    IN             VARCHAR2) AS
-- --------------------------------------------------------------------------
BEGIN
  IF g_binary THEN
    put_remote_binary_data(p_conn => p_conn,
                           p_file => p_to_file,
                           p_data => get_local_binary_data(p_from_dir, p_from_file));
  ELSE
    put_remote_ascii_data(p_conn => p_conn,
                          p_file => p_to_file,
                          p_data => get_local_ascii_data(p_from_dir, p_from_file));
  END IF;
  get_reply(p_conn);
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE get_direct (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
                      p_from_file  IN             VARCHAR2,
                      p_to_dir     IN             VARCHAR2,
                      p_to_file    IN             VARCHAR2) IS
-- --------------------------------------------------------------------------
  l_conn        UTL_TCP.connection;
  l_out_file    UTL_FILE.file_type;
  l_amount      PLS_INTEGER;
  l_buffer      VARCHAR2(32767);
  l_raw_buffer  RAW(32767);
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'RETR ' || p_from_file, TRUE);
  IF g_binary THEN
    l_out_file := UTL_FILE.fopen(p_to_dir, p_to_file, 'wb', 32767);
  ELSE
    l_out_file := UTL_FILE.fopen(p_to_dir, p_to_file, 'w', 32767);
  END IF;

  BEGIN
    LOOP
      IF g_binary THEN
        l_amount := UTL_TCP.read_raw (l_conn, l_raw_buffer, 32767);
        UTL_FILE.put_raw(l_out_file, l_raw_buffer, TRUE);
      ELSE
        l_amount := UTL_TCP.read_text (l_conn, l_buffer, 32767);
        IF g_convert_crlf THEN
          l_buffer := REPLACE(l_buffer, CHR(13), NULL);
        END IF;
        UTL_FILE.put(l_out_file, l_buffer);
      END IF;
      UTL_FILE.fflush(l_out_file);
    END LOOP;
  EXCEPTION
    WHEN UTL_TCP.END_OF_INPUT THEN
      NULL;
    WHEN OTHERS THEN
      NULL;
  END;
  UTL_FILE.fclose(l_out_file);
  UTL_TCP.close_connection(l_conn);
EXCEPTION
  WHEN OTHERS THEN
    IF UTL_FILE.is_open(l_out_file) THEN
      UTL_FILE.fclose(l_out_file);
    END IF;
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE put_direct (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
                      p_from_dir   IN             VARCHAR2,
                      p_from_file  IN             VARCHAR2,
                      p_to_file    IN             VARCHAR2) IS
-- --------------------------------------------------------------------------
  l_conn        UTL_TCP.connection;
  l_bfile       BFILE;
  l_result      PLS_INTEGER;
  l_amount      PLS_INTEGER := 32767;
  l_raw_buffer  RAW(32767);
  l_len         NUMBER;
  l_pos         NUMBER := 1;
  ex_ascii      EXCEPTION;
BEGIN
  IF NOT g_binary THEN
    RAISE ex_ascii;
  END IF;

  l_conn := get_passive(p_conn);
  send_command(p_conn, 'STOR ' || p_to_file, TRUE);

  l_bfile := BFILENAME(p_from_dir, p_from_file);

  DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);
  l_len := DBMS_LOB.getlength(l_bfile);

  WHILE l_pos <= l_len LOOP
    DBMS_LOB.READ (l_bfile, l_amount, l_pos, l_raw_buffer);
    debug(l_amount);
    l_result := UTL_TCP.write_raw(l_conn, l_raw_buffer, l_amount);
    l_pos := l_pos + l_amount;
  END LOOP;

  DBMS_LOB.fileclose(l_bfile);
  UTL_TCP.close_connection(l_conn);
EXCEPTION
  WHEN ex_ascii THEN
    RAISE_APPLICATION_ERROR(-20000, 'PUT_DIRECT not available in ASCII mode.');
  WHEN OTHERS THEN
    IF DBMS_LOB.fileisopen(l_bfile) = 1 THEN
      DBMS_LOB.fileclose(l_bfile);
    END IF;
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE help (p_conn  IN OUT NOCOPY  UTL_TCP.connection) AS
-- --------------------------------------------------------------------------
BEGIN
  send_command(p_conn, 'HELP', TRUE);
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE ascii (p_conn  IN OUT NOCOPY  UTL_TCP.connection) AS
-- --------------------------------------------------------------------------
BEGIN
  send_command(p_conn, 'TYPE A', TRUE);
  g_binary := FALSE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE binary (p_conn  IN OUT NOCOPY  UTL_TCP.connection) AS
-- --------------------------------------------------------------------------
BEGIN
  send_command(p_conn, 'TYPE I', TRUE);
  g_binary := TRUE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE list (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                p_dir   IN             VARCHAR2,
                p_list  OUT            t_string_table) AS
-- --------------------------------------------------------------------------
  l_conn        UTL_TCP.connection;
  l_list        t_string_table := t_string_table();
  l_reply_code  VARCHAR2(3) := NULL;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'LIST ' || p_dir, TRUE);

  BEGIN
    LOOP
      l_list.extend;
      l_list(l_list.last) := UTL_TCP.get_line(l_conn, TRUE);
      debug(l_list(l_list.last));
      IF l_reply_code IS NULL THEN
        l_reply_code := SUBSTR(l_list(l_list.last), 1, 3);
      END IF;
      IF SUBSTR(l_reply_code, 1, 1) IN ('4', '5') THEN
        RAISE_APPLICATION_ERROR(-20000, l_list(l_list.last));
      ELSIF (SUBSTR(g_reply(g_reply.last), 1, 3) = l_reply_code AND
             SUBSTR(g_reply(g_reply.last), 4, 1) = ' ') THEN
        EXIT;
      END IF;
    END LOOP;
  EXCEPTION
    WHEN UTL_TCP.END_OF_INPUT THEN
      NULL;
  END;

  l_list.delete(l_list.last);
  p_list := l_list;

  utl_tcp.close_connection(l_conn);
  get_reply (p_conn);
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE nlst (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                p_dir   IN             VARCHAR2,
                 p_list  OUT            t_string_table) AS
-- --------------------------------------------------------------------------
  l_conn        UTL_TCP.connection;
  l_list        t_string_table := t_string_table();
  l_reply_code  VARCHAR2(3) := NULL;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'NLST ' || p_dir, TRUE);

  BEGIN
    LOOP
      l_list.extend;
      l_list(l_list.last) := UTL_TCP.get_line(l_conn, TRUE);
      debug(l_list(l_list.last));
      IF l_reply_code IS NULL THEN
        l_reply_code := SUBSTR(l_list(l_list.last), 1, 3);
      END IF;
      IF SUBSTR(l_reply_code, 1, 1) IN ('4', '5') THEN
        RAISE_APPLICATION_ERROR(-20000, l_list(l_list.last));
      ELSIF (SUBSTR(g_reply(g_reply.last), 1, 3) = l_reply_code AND
             SUBSTR(g_reply(g_reply.last), 4, 1) = ' ') THEN
        EXIT;
      END IF;
    END LOOP;
  EXCEPTION
    WHEN UTL_TCP.END_OF_INPUT THEN
      NULL;
  END;

  l_list.delete(l_list.last);
  p_list := l_list;

  utl_tcp.close_connection(l_conn);
  get_reply (p_conn);
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE rename (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                  p_from  IN             VARCHAR2,
                  p_to    IN             VARCHAR2) AS
-- --------------------------------------------------------------------------
  l_conn  UTL_TCP.connection;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'RNFR ' || p_from, TRUE);
  send_command(p_conn, 'RNTO ' || p_to, TRUE);
  logout(l_conn, FALSE);
END rename;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE delete (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                  p_file  IN             VARCHAR2) AS
-- --------------------------------------------------------------------------
  l_conn  UTL_TCP.connection;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'DELE ' || p_file, TRUE);
  logout(l_conn, FALSE);
END delete;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE mkdir (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                 p_dir   IN             VARCHAR2) AS
-- --------------------------------------------------------------------------
  l_conn  UTL_TCP.connection;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'MKD ' || p_dir, TRUE);
  logout(l_conn, FALSE);
END mkdir;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE rmdir (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                 p_dir   IN             VARCHAR2) AS
-- --------------------------------------------------------------------------
  l_conn  UTL_TCP.connection;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'RMD ' || p_dir, TRUE);
  logout(l_conn, FALSE);
END rmdir;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE convert_crlf (p_status  IN  BOOLEAN) AS
-- --------------------------------------------------------------------------
BEGIN
  g_convert_crlf := p_status;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE debug (p_text  IN  VARCHAR2) IS
-- --------------------------------------------------------------------------
BEGIN
  IF g_debug THEN
    DBMS_OUTPUT.put_line(SUBSTR(p_text, 1, 255));
  END IF;
END;
-- --------------------------------------------------------------------------

END ftp;

/
--------------------------------------------------------
--  DDL for Package Body KONTRAG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "KONTRAG" AS

  procedure create_kontrag(p_parent kontragents.parent_id%type, p_fullname kontragents.fullname%type, p_namefull kontragents.namefull%type,
                            p_okpo kontragents.okpo%type, p_inn kontragents.inn%type) AS
  p_kont_rec kontragents%rowtype;                          
  BEGIN
    p_kont_rec.parent_id:=p_parent;
    p_kont_rec.fullname:=p_fullname;
    p_kont_rec.namefull:=p_namefull;
    p_kont_rec.okpo:=p_okpo;
    p_kont_rec.inn:=p_inn;
    p_kont_rec.is_group:=0;
    p_kont_rec.deleted:=0;
    p_kont_rec.ur_fiz:=0;
    p_kont_rec.predefined:=0;
    p_kont_rec.version:=systimestamp;
    insert into kontragents values p_kont_rec;
    
    exception
        when others then 
        raise;
  END create_kontrag;

END KONTRAG;

/
--------------------------------------------------------
--  DDL for Package Body ORDERS_ENTRY
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "ORDERS_ENTRY" as

  procedure set_startdatmoves (in_dat date) as
  begin
      gn$startdatmoves:=in_dat;
  end set_startdatmoves;
  
  procedure set_enddatmoves (in_dat date) as
  begin
      gn$enddatmoves:=in_dat;
  end set_enddatmoves;
  
  function get_startdatmoves return date as
  begin
      return gn$startdatmoves;
  end get_startdatmoves;
  
  function get_enddatmoves return date as
  begin
      return gn$enddatmoves;
  end get_enddatmoves;
  
  procedure orders_remove_plan_acc(p_id in varchar2, p_del in number default 0) as
    p_orders_rec orders%rowtype;
    p_move_count number;
    p_version varchar2(1000);
    in_use exception;
    pragma exception_init(in_use, -54);
    period_blocked EXCEPTION;
  begin
    select * into p_orders_rec from orders where id = p_id for update nowait;
    if utility.enable_edit(p_orders_rec.id,'orders') = 0 then
      --return;
      raise period_blocked;
    end if ;
    
    select to_char(version,'YYYY-MM-DD HH24:MI:SS.FF') into p_version from orders
      where id = p_id;
    select count(*) into p_move_count from moves where registrator_id = p_id;
    if p_move_count > 0 then
      execute immediate ('select * from moves where registrator_id='''||p_id||''' for update nowait');  
      delete from moves where registrator_id = p_id;
    end if; 
    
    if p_del <> 0 then
      p_orders_rec.deleted:=1;
    end if;
    p_orders_rec.posted:=0;
    update orders set row = p_orders_rec
      where id = p_id and version = to_timestamp(p_version,'YYYY-MM-DD HH24:MI:SS.FF');
  exception
        when period_blocked then
        RAISE_APPLICATION_ERROR (-20003,'Период заблокирован! Редактирование невозможно!', TRUE) ;
        WHEN IN_USE THEN
        RAISE_APPLICATION_ERROR (-20002,'Resource in use! '||SQLERRM, TRUE) ;
        when others then 
        raise_application_error (-20001,'Error order move for plan accounting! '||sqlerrm, true) ;
  end orders_remove_plan_acc;
  
  procedure orders_move_all as
  begin
    for i in (select * from orders) loop
    orders_move_plan_acc(i.id);
    end loop;
     exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error order move  all for plan accounting! '||SQLERRM, TRUE) ;
  end orders_move_all;
  
  procedure orders_remove_all as
  begin
  for i in (select * from orders) loop
    orders_remove_plan_acc(i.id);
    end loop;
     exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error order remove all for plan accounting! '||SQLERRM, TRUE) ;
  end orders_remove_all;
  
  procedure set_subconto_tp_uslugi(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_order orders%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
    p_code_plan plan_acc.code%type;
    p_usluga nomenklatura.usluga%type;
  begin
  select * into p_order from orders where id = p_move_rec.registrator_id;
  select id into p_upr_val from currency where predefined=1;
  
  for i in (select * from ORDERS_TP_USLUGI where order_id = p_order.id) loop
  p_ret_rec:=p_move_rec;
  
  select code into p_code_plan from plan_acc where id = p_ret_rec.plan_acc_deb_id;
  select usluga into p_usluga from nomenklatura where id = i.nom_id;
  if p_usluga=1 and p_code_plan='20351' then
    continue;
  end if;
    
  select code into p_code_plan from plan_acc where id = p_ret_rec.plan_acc_kred_id;
  if p_usluga=1 and p_code_plan='20351' then
    continue;
  end if;
  
  --Субконто дебета
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КОНТРАГЕНТЫ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.kontrag_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.kontrag_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.kontrag_id;
        end if;
        end if;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.division_id;
        end if;
        end if;
        if upper(p_sub_name) = 'НОМЕНКЛАТУРА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=i.nom_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=i.nom_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=i.nom_id;
        end if;
        end if;
    end loop;
  end if;
  
  --Субконто кредита
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.division_id;
        end if;
        end if;
        if upper(p_sub_name) = 'НОМЕНКЛАТУРА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=i.nom_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=i.nom_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=i.nom_id;
        end if;
        end if;
        if upper(p_sub_name) = 'КОНТРАГЕНТЫ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.kontrag_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.kontrag_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.kontrag_id;
        end if;
        end if;
    end loop;
  end if;
  
  select * into p_plan_acc from plan_acc where id = p_ret_rec.plan_acc_deb_id;
  if p_plan_acc.kolishestv = 1 then
    p_ret_rec.quantity_deb := i.quantity;
  end if;
  select * into p_plan_acc from plan_acc where id = p_ret_rec.plan_acc_kred_id;
  if p_plan_acc.kolishestv = 1 then
    p_ret_rec.quantity_kred := i.quantity;
  end if;
  
  p_ret_rec.curr_deb := p_order.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, i.summ + nvl(i.price_add, 0), 1);
  
  p_ret_rec.curr_kred := p_order.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, i.summ + nvl(i.price_add, 0), 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  
  insert into moves values p_ret_rec;
  end loop;
  exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error order move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_tp_uslugi;
  
  procedure set_subconto_tp_oplaty(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_order orders%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
    p_code_plan plan_acc.code%type;
    p_usluga nomenklatura.usluga%type;
  begin
  select * into p_order from orders where id = p_move_rec.registrator_id;
  select id into p_upr_val from currency where predefined=1;
  
  for i in (select * from ORDERS_TP_OPLATY where order_id = p_order.id) loop
  p_ret_rec:=p_move_rec;
  
  select code into p_code_plan from plan_acc where id = p_ret_rec.plan_acc_deb_id;
  
  --Субконто дебета
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
          if i.kassa_id is not null then
            p_ret_rec.subconto1_deb:=i.kassa_id;
          else
            p_ret_rec.subconto1_deb:=p_order.kassa_id;
          end if;
        end if; 
        if p_counter = 2 then
          if i.kassa_id is not null then
            p_ret_rec.subconto2_deb:=i.kassa_id;
          else
            p_ret_rec.subconto2_deb:=p_order.kassa_id;
          end if;
        end if;
        if p_counter = 3 then
          if i.kassa_id is not null then
            p_ret_rec.subconto3_deb:=i.kassa_id;
          else
            p_ret_rec.subconto3_deb:=p_order.kassa_id;
          end if;
        end if;
        end if;
        if upper(p_sub_name) = 'КОНТРАГЕНТЫ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.kontrag_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.kontrag_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.kontrag_id;
        end if;
        end if;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.division_id;
        end if;
        end if;
    end loop;
  end if;
  
  --Субконто кредита
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КОНТРАГЕНТЫ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.kontrag_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.kontrag_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.kontrag_id;
        end if;
        end if;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.division_id;
        end if;
        end if;
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.kassa_id;
        end if;
        end if;
    end loop;
  end if;
  
  p_ret_rec.curr_deb := p_order.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, i.sum, 1);
  
  p_ret_rec.curr_kred := p_order.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, i.sum, 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  p_ret_rec.period:=i.dat;
  
  insert into moves values p_ret_rec;
  end loop;
  exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error order move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_tp_oplaty;
  
  procedure set_subconto_zamer(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_order orders%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
    p_code_plan plan_acc.code%type;
    p_usluga nomenklatura.usluga%type;
  begin
  select * into p_order from orders where id = p_move_rec.registrator_id;
  select id into p_upr_val from currency where predefined=1;
  
  for i in (select * from ORDERS_TP_OPLATY where order_id = p_order.id) loop
  if i.zamer_id is null then
    continue;
  end if;
  p_ret_rec:=p_move_rec;
  
  select code into p_code_plan from plan_acc where id = p_ret_rec.plan_acc_deb_id;
  
  --Субконто дебета
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КОНТРАГЕНТЫ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=i.zamer_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=i.zamer_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=i.zamer_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.kassa_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.division_id;
        end if;
        end if;
    end loop;
  end if;
  
  --Субконто кредита
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
          if i.kassa_id is not null then
            p_ret_rec.subconto1_kred:=i.kassa_id;
          else
            p_ret_rec.subconto1_kred:=p_order.kassa_id;
          end if;
        end if; 
        if p_counter = 2 then
          if i.kassa_id is not null then
            p_ret_rec.subconto2_kred:=i.kassa_id;
          else
            p_ret_rec.subconto2_kred:=p_order.kassa_id;
          end if;
        end if;
        if p_counter = 3 then
          if i.kassa_id is not null then
            p_ret_rec.subconto3_kred:=i.kassa_id;
          else
            p_ret_rec.subconto3_kred:=p_order.kassa_id;
          end if;
        end if;
        end if;
        
        if upper(p_sub_name) = 'КОНТРАГЕНТЫ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.kontrag_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.kontrag_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.kontrag_id;
        end if;
        end if;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.division_id;
        end if;
        end if;
    end loop;
  end if;
  
  p_ret_rec.curr_deb := p_order.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, i.sum, 1);
  
  p_ret_rec.curr_kred := p_order.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, i.sum, 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  
  insert into moves values p_ret_rec;
  end loop;
  exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error order move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_zamer;
  
   procedure set_subconto_rashody_rko(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_order orders%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
    p_code_plan plan_acc.code%type;
    p_usluga nomenklatura.usluga%type;
    p_status order_status.id%type;
  begin
  select * into p_order from orders where id = p_move_rec.registrator_id;
  select id into p_upr_val from currency where predefined=1;
  
  select id into p_status from order_status where upper(name) = upper('Выполнен');
  
  for i in (select * from ORDERS_TP_RASHODY where order_id = p_order.id) loop
  p_ret_rec:=p_move_rec;
  
  select code into p_code_plan from plan_acc where id = p_ret_rec.plan_acc_deb_id;
  
  --Субконто дебета
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'СТАТЬЯ ЗАТРАТ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=i.zatraty_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=i.zatraty_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=i.zatraty_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.kassa_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.division_id;
        end if;
        end if;
    end loop;
  end if;
  
  --Субконто кредита
  if i.kontr_id is not null then
      --if p_order.status_id = p_status then
        select id into p_ret_rec.plan_acc_kred_id from plan_acc where code = '5091';
      --end if;
  end if;
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
          if i.kassa_id is not null then
            p_ret_rec.subconto1_kred:=i.kassa_id;
          else
            p_ret_rec.subconto1_kred:=p_order.kassa_id;
          end if;
        end if; 
        if p_counter = 2 then
          if i.kassa_id is not null then
            p_ret_rec.subconto2_kred:=i.kassa_id;
          else
            p_ret_rec.subconto2_kred:=p_order.kassa_id;
          end if;
        end if;
        if p_counter = 3 then
          if i.kassa_id is not null then
            p_ret_rec.subconto3_kred:=i.kassa_id;
          else
            p_ret_rec.subconto3_kred:=p_order.kassa_id;
          end if;
        end if;
        end if;
        
        if upper(p_sub_name) = 'КОНТРАГЕНТЫ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=i.kontr_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=i.kontr_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=i.kontr_id;
        end if;
        end if;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.division_id;
        end if;
        end if;
    end loop;
  end if;
  
  p_ret_rec.curr_deb := p_order.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, i.summ, 1);
  
  p_ret_rec.curr_kred := p_order.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, i.summ, 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  
  insert into moves values p_ret_rec;
  end loop;
  exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error order move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_rashody_rko;
  
  procedure set_subconto_rashody_sebest(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_order orders%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
    p_code_plan plan_acc.code%type;
    p_usluga nomenklatura.usluga%type;
  begin
  select * into p_order from orders where id = p_move_rec.registrator_id;
  select id into p_upr_val from currency where predefined=1;
  
  for i in (select * from ORDERS_TP_RASHODY where order_id = p_order.id) loop
  p_ret_rec:=p_move_rec;
  
  select code into p_code_plan from plan_acc where id = p_ret_rec.plan_acc_deb_id;
  
  --Субконто дебета
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.division_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.kassa_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.division_id;
        end if;
        end if;
    end loop;
  end if;
  
  --Субконто кредита
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'СТАТЬЯ ЗАТРАТ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=i.zatraty_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=i.zatraty_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=i.zatraty_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'КОНТРАГЕНТЫ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.kontrag_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.kontrag_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.kontrag_id;
        end if;
        end if;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.division_id;
        end if;
        end if;
    end loop;
  end if;
  
  p_ret_rec.curr_deb := p_order.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, i.summ, 1);
  
  p_ret_rec.curr_kred := p_order.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, i.summ, 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  
  insert into moves values p_ret_rec;
  end loop;
  exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error order move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_rashody_sebest;
  
  procedure set_subconto_nachisl(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_order orders%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
    p_code_plan plan_acc.code%type;
    p_usluga nomenklatura.usluga%type;
  begin
  select * into p_order from orders where id = p_move_rec.registrator_id;
  select id into p_upr_val from currency where predefined=1;
  
  for i in (select * from ORDERS_TP_NACHISL where order_id = p_order.id) loop
  p_ret_rec:=p_move_rec;
  
  select code into p_code_plan from plan_acc where id = p_ret_rec.plan_acc_deb_id;
  
  --Субконто дебета
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.division_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.kassa_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.division_id;
        end if;
        end if;
    end loop;
  end if;
  
  --Субконто кредита
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КОНТРАГЕНТЫ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=i.kontr_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=i.kontr_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=i.kontr_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.kassa_id;
        end if;
        end if;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.division_id;
        end if;
        end if;
    end loop;
  end if;
  
  p_ret_rec.curr_deb := p_order.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, i.summ, 1);
  
  p_ret_rec.curr_kred := p_order.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, i.summ, 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  
  insert into moves values p_ret_rec;
  end loop;
  exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error order move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_nachisl;
  
  procedure set_subconto_close_order(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_order orders%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
    p_code_plan plan_acc.code%type;
    p_usluga nomenklatura.usluga%type;
  begin
  select * into p_order from orders where id = p_move_rec.registrator_id;
  select id into p_upr_val from currency where predefined=1;
  
  for i in (select * from vw_moves where registrator_id = p_order.id and deb = '701') loop
  p_ret_rec:=p_move_rec;
  p_ret_rec.period:=p_order.dat_complete_fact;
  
  select code into p_code_plan from plan_acc where id = p_ret_rec.plan_acc_deb_id;
  
  --Субконто дебета
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.division_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.kassa_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.division_id;
        end if;
        end if;
    end loop;
  end if;
  
  --Субконто кредита
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.division_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.kassa_id;
        end if;
        end if;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.division_id;
        end if;
        end if;
    end loop;
  end if;
  
  p_ret_rec.curr_deb := p_order.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, i.SUM_DEB, 1);
  
  p_ret_rec.curr_kred := p_order.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, i.SUM_DEB, 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  
  insert into moves values p_ret_rec;
  end loop;
  exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error order move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_close_order;
  
  procedure set_subconto_finrez_order(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_order orders%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
    --p_code_plan plan_acc.code%type;
    p_usluga nomenklatura.usluga%type;
    p_summ_sales number;
    p_summ_sebest number;
  begin
  select * into p_order from orders where id = p_move_rec.registrator_id;
  select id into p_upr_val from currency where predefined=1;
  
  --for i in (select * from vw_moves where registrator_id = p_order.id and deb = '701') loop
  p_ret_rec:=p_move_rec;
  p_ret_rec.period:=p_order.dat_complete_fact;
  select sum(nvl(summa,0)) into p_summ_sales from VW_SALES_ORDERS where registrator_id = p_move_rec.registrator_id;
  select sum(nvl(summa,0)) into p_summ_sebest from VW_SEBEST_ORDERS where registrator_id = p_move_rec.registrator_id;
  
  if (p_summ_sales = 0) or (p_summ_sales is null) then
    return;
  end if; 
  
  if (p_summ_sebest is null) then
    p_summ_sebest:=0;
  end if;
  --select code into p_code_plan from plan_acc where id = p_ret_rec.plan_acc_deb_id;
  
  --Субконто дебета
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.division_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.kassa_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_order.division_id;
        end if;
        end if;
    end loop;
  end if;
  
  --Субконто кредита
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.division_id;
        end if;
        end if;
        
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.kassa_id;
        end if;
        end if;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_order.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_order.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_order.division_id;
        end if;
        end if;
    end loop;
  end if;
  
  p_ret_rec.curr_deb := p_order.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, (p_summ_sales-p_summ_sebest), 1);
  
  p_ret_rec.curr_kred := p_order.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, (p_summ_sales-p_summ_sebest), 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  
  insert into moves values p_ret_rec;
  --end loop;
  exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error order move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_finrez_order;
  
  procedure set_dat_complete(p_id in varchar2) as
  p_orders_rec orders%rowtype;
  p_status order_status.id%type;
  p_version varchar2(1000);
  begin
    select * into p_orders_rec from orders where id = p_id;
    select to_char(version,'YYYY-MM-DD HH24:MI:SS.FF') into p_version from orders
      where id = p_id;
    select id into p_status from order_status where upper(name) = upper('Выполнен');
    if p_orders_rec.status_id = p_status then
      if p_orders_rec.dat_complete_fact is null then
        p_orders_rec.dat_complete_fact:=sysdate;
        update orders set row = p_orders_rec
        where id = p_id and version = to_timestamp(p_version,'YYYY-MM-DD HH24:MI:SS.FF'); 
      end if;
    end if;
  end set_dat_complete;
  
  procedure orders_move_plan_acc(p_id in varchar2) as
    p_orders_rec orders%rowtype;
    p_move_rec moves%rowtype;
    p_version varchar2(1000);
    in_use exception;
    p_counter number(10);
    p_status order_status.id%type;
    pragma exception_init(in_use, -54);
    period_blocked EXCEPTION;
  begin
    set_dat_complete(p_id);
    
    select * into p_orders_rec from orders where id = p_id for update nowait;
    if utility.enable_edit(p_orders_rec.id,'orders') = 0 then
      --return;
      raise period_blocked;
    end if ;
    
    orders_remove_plan_acc(p_id, p_orders_rec.deleted);
    if p_orders_rec.deleted = 1 then
      return;
    end if;
    
    select id into p_status from order_status where upper(name) = upper('Аннулирован');
    
    if p_status <> p_orders_rec.status_id then
      delete from ORDERS_TP_NACHISL where order_id = p_id and manual = 0;
      --paycalc.calc_money(p_id);
      PAYCALC.CALC_MONEY_BY_KONTR(p_id);
    end if;
    
    
    select to_char(version,'YYYY-MM-DD HH24:MI:SS.FF') into p_version from orders
      where id = p_id;
      
    select id into p_status from order_status where upper(name) = upper('Выполнен');
      
    p_move_rec.period:=p_orders_rec.dat;
    p_counter:=0;
    for i in (select * from entry_settings where typedef_id=(select id from type_def where upper(type_def.table_name)=upper('orders')) order by chain) loop
        p_counter:=p_counter+1;
        p_move_rec.registrator_type:=i.typedef_id;
        p_move_rec.registrator_id:=p_id;
        p_move_rec.plan_acc_deb_id:=i.plan_acc_deb_id;
        p_move_rec.activities_id:=p_orders_rec.activities_id;
        p_move_rec.division_id:=p_orders_rec.division_id;
        
        p_move_rec.plan_acc_kred_id:=i.plan_acc_kred_id;
        
        --Проводка ТЧ Услуги - Выполнили работы
        if p_counter = 1 then
            if p_orders_rec.status_id = p_status then
              p_move_rec.description:='Проводка ТЧ Услуги - Выполнили работы';
              set_subconto_tp_uslugi(p_move_rec);
            end if;
        end if; 
        --Проводка ТЧ Оплаты - Получили предоплату
        if p_counter = 2 then
            p_move_rec.description:='Проводка ТЧ Оплаты - Получили предоплату';
            set_subconto_tp_oplaty(p_move_rec);
        end if;
        --Проводка ТЧ Оплаты - Замерщик взял деньги
        if p_counter = 3 then
            p_move_rec.description:='Проводка ТЧ Оплаты - Замерщик взял деньги';
            set_subconto_zamer(p_move_rec);
        end if;
        
        --	Проводка ТЧ Расходы - РКО на себестоимость
        if p_counter = 4 then
            p_move_rec.description:='Проводка ТЧ Расходы - РКО на себестоимость';
            set_subconto_rashody_rko(p_move_rec);
        end if;
        
        --	Проводка ТЧ Расходы - Закрытие себестоимости заказа после выполнения
        if p_counter = 5 then
            --if p_orders_rec.status_id = p_status then
              p_move_rec.description:='Проводка ТЧ Расходы - Закрытие себестоимости заказа после выполнения';
              set_subconto_rashody_sebest(p_move_rec);
            --end if;  
        end if;
        
        --Проводка ТЧ Начисления - Начисления на себестоимость (комиссия и т.д.)
        if p_counter = 6 then
            if p_orders_rec.status_id = p_status then
              p_move_rec.description:='Проводка ТЧ Начисления - Начисления на себестоимость (комиссия и т.д.)';
              set_subconto_nachisl(p_move_rec);
            end if;  
        end if;
        
        --Закрытие заказа - выполнен!
        if p_counter = 7 then
            if p_orders_rec.status_id = p_status then
              p_move_rec.description:='Закрытие заказа - выполнен!';
              set_subconto_close_order(p_move_rec);
            end if;  
        end if;
        
        --Заказ выполнен - Отнесение маржи на финансовый результат
        if p_counter = 8 then
            if p_orders_rec.status_id = p_status then
              p_move_rec.description:='Заказ выполнен - Отнесение маржи на финансовый результат';
              set_subconto_finrez_order(p_move_rec);
            end if;
        end if;
    end loop;
    
    p_orders_rec.posted:=1;
    update orders set row = p_orders_rec
    where id = p_id and version = to_timestamp(p_version,'YYYY-MM-DD HH24:MI:SS.FF'); 
    
    exception
        when period_blocked then
        RAISE_APPLICATION_ERROR (-20003,'Период заблокирован! Редактирование невозможно!', TRUE) ;
        WHEN IN_USE THEN
        RAISE_APPLICATION_ERROR (-20002,'Resource in use! '||SQLERRM, TRUE) ;
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error order move for plan accounting! '||SQLERRM, TRUE) ;
  end orders_move_plan_acc;

end orders_entry;

/
--------------------------------------------------------
--  DDL for Package Body OTHER_ENTRY
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "OTHER_ENTRY" as

procedure set_subconto_tp_zatraty(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_other other_zatraty%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
  begin
  select * into p_other from OTHER_ZATRATY where id = p_move_rec.registrator_id;
  select id into p_upr_val from currency where predefined=1;
  
  for i in (select * from other_zatraty_tab_part_zatraty where oth_id = p_other.id) loop
  p_ret_rec:=p_move_rec;

  
  --Субконто дебета
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'СТАТЬЯ ЗАТРАТ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=i.zatr_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=i.zatr_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=i.zatr_id;
        end if;
        end if;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_other.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_other.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_other.division_id;
        end if;
        end if;
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_other.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_other.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_other.kassa_id;
        end if;
        end if;
    end loop;
  end if;
  
  --Субконто кредита
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_other.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_other.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_other.kassa_id;
        end if;
        end if;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_other.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_other.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_other.division_id;
        end if;
        end if;
        if upper(p_sub_name) = 'СТАТЬЯ ЗАТРАТ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=i.zatr_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=i.zatr_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=i.zatr_id;
        end if;
        end if;
    end loop;
  end if;
  
  p_ret_rec.curr_deb := p_other.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, i.summa, 1);
  
  p_ret_rec.curr_kred := p_other.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, i.summa, 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  
  insert into moves values p_ret_rec;
  end loop;
  exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error other_zatraty move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_tp_zatraty;
  
  procedure set_subconto_tp_result(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_other other_zatraty%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
  begin
  select * into p_other from OTHER_ZATRATY where id = p_move_rec.registrator_id;
  select id into p_upr_val from currency where predefined=1;
  
  for i in (select * from other_zatraty_tab_part_zatraty where oth_id = p_other.id) loop
  p_ret_rec:=p_move_rec;

  
  --Субконто дебета
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_other.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_other.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_other.division_id;
        end if;
        end if;
        if upper(p_sub_name) = 'СТАТЬЯ ЗАТРАТ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=i.zatr_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=i.zatr_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=i.zatr_id;
        end if;
        end if;
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_other.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_other.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_other.kassa_id;
        end if;
        end if;
    end loop;
  end if;
  
  --Субконто кредита
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'СТАТЬЯ ЗАТРАТ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=i.zatr_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=i.zatr_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=i.zatr_id;
        end if;
        end if;
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_other.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_other.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_other.kassa_id;
        end if;
        end if;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_other.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_other.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_other.division_id;
        end if;
        end if;
        
    end loop;
  end if;
  
  p_ret_rec.curr_deb := p_other.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, i.summa, 1);
  
  p_ret_rec.curr_kred := p_other.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, i.summa, 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  
  insert into moves values p_ret_rec;
  end loop;
  exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error other_zatraty move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_tp_result;

procedure other_move_plan_acc(p_id in varchar2) as
    p_other_rec other_zatraty%rowtype;
    p_move_rec moves%rowtype;
    p_version varchar2(1000);
    in_use exception;
    p_counter number(10);
    pragma exception_init(in_use, -54);
    period_blocked EXCEPTION;
  begin
    select * into p_other_rec from OTHER_ZATRATY where id = p_id for update nowait;
    if utility.enable_edit(p_other_rec.id, 'OTHER_ZATRATY') = 0 then
      --return;
      raise period_blocked;
    end if ;
    
    other_remove_plan_acc(p_id, p_other_rec.deleted);
    if p_other_rec.deleted = 1 then
      return;
    end if;
    
    select to_char(version,'YYYY-MM-DD HH24:MI:SS.FF') into p_version from OTHER_ZATRATY
      where id = p_id;
      
    p_move_rec.period:=p_other_rec.dat;
    p_counter:=0;
    for i in (select * from entry_settings where typedef_id=(select id from type_def where upper(type_def.table_name)=upper('other_zatraty')) order by chain) loop
        p_counter:=p_counter+1;
        p_move_rec.registrator_type:=i.typedef_id;
        p_move_rec.registrator_id:=p_id;
        p_move_rec.plan_acc_deb_id:=i.plan_acc_deb_id;
        p_move_rec.activities_id:=p_other_rec.activities_id;
        p_move_rec.division_id:=p_other_rec.division_id;
        
        p_move_rec.plan_acc_kred_id:=i.plan_acc_kred_id;
        
        --Проводка ТЧ Затраты - Списание на административные затраты
        if p_counter = 1 then
            p_move_rec.description:='Проводка ТЧ Затраты - Списание на административные затраты';
            set_subconto_tp_zatraty(p_move_rec);
        end if;
        
        --Проводка ТЧ Затраты - Списание на затрат на финансовый результат
        if p_counter = 2 then
            p_move_rec.description:='Проводка ТЧ Затраты - Списание на затрат на финансовый результат';
            set_subconto_tp_result(p_move_rec);
        end if; 
    end loop;
    
    p_other_rec.posted:=1;
    update OTHER_ZATRATY set row = p_other_rec
    where id = p_id and version = to_timestamp(p_version,'YYYY-MM-DD HH24:MI:SS.FF'); 
    
    exception
        when period_blocked then
        RAISE_APPLICATION_ERROR (-20003,'Период заблокирован! Редактирование невозможно!', TRUE) ;
        WHEN IN_USE THEN
        RAISE_APPLICATION_ERROR (-20002,'Resource in use! '||SQLERRM, TRUE) ;
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error other_zatraty move for plan accounting! '||SQLERRM, TRUE) ;
end other_move_plan_acc;

procedure other_remove_plan_acc(p_id in varchar2, p_del in number default 0) as
    p_other_rec other_zatraty%rowtype;
    p_move_count number;
    p_version varchar2(1000);
    in_use exception;
    pragma exception_init(in_use, -54);
    period_blocked EXCEPTION;
  begin
    select * into p_other_rec from OTHER_ZATRATY where id = p_id for update nowait;
    if utility.enable_edit(p_other_rec.id, 'OTHER_ZATRATY') = 0 then
      --return;
      raise period_blocked;
    end if ;
    
    select to_char(version,'YYYY-MM-DD HH24:MI:SS.FF') into p_version from OTHER_ZATRATY
      where id = p_id;
    select count(*) into p_move_count from moves where registrator_id = p_id;
    if p_move_count > 0 then
      execute immediate ('select * from moves where registrator_id='''||p_id||''' for update nowait');  
      delete from moves where registrator_id = p_id;
    end if; 
    
    if p_del <> 0 then
      p_other_rec.deleted:=1;
    end if;
    p_other_rec.posted:=0;
    update OTHER_ZATRATY set row = p_other_rec
      where id = p_id and version = to_timestamp(p_version,'YYYY-MM-DD HH24:MI:SS.FF');
  exception
        when period_blocked then
        RAISE_APPLICATION_ERROR (-20003,'Период заблокирован! Редактирование невозможно!', TRUE) ;
        WHEN IN_USE THEN
        RAISE_APPLICATION_ERROR (-20002,'Resource in use! '||SQLERRM, TRUE) ;
        when others then 
        raise_application_error (-20001,'Error order move for plan accounting! '||sqlerrm, true) ;
  end other_remove_plan_acc;

procedure other_move_all as
  begin
    for i in (select * from OTHER_ZATRATY) loop
    other_move_plan_acc(i.id);
    end loop;
     exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error other_zatraty move  all for plan accounting! '||SQLERRM, TRUE) ;
  end other_move_all;

procedure other_remove_all as
  begin
    for i in (select * from OTHER_ZATRATY) loop
    other_remove_plan_acc(i.id);
    end loop;
     exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error other_zatraty remove all for plan accounting! '||SQLERRM, TRUE) ;
  end other_remove_all;

end other_entry;

/
--------------------------------------------------------
--  DDL for Package Body PAYCALC
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "PAYCALC" AS
  
  function get_kontrag_by_order(p_order in varchar2) return kontragtable AS
  l_data kontragTable := kontragTable();
  p_counter number := 0;
  order_rec orders%rowtype;
  p_kontragname kontragents.fullname%type;
  sett_rec user_settings%rowtype;
  BEGIN
    select o.* into order_rec from orders o where upper(o.id) = upper(p_order);
    for i in (select * from nachisl_settings
      where base_id = (select b.id from base_of_nachisl b where b.name = 'ORDER' and rownum = 1)
      and pay_id in (select id from pay_settings where in_profit = 0)) loop
      for y in (select u.* from users u where upper(u.id) = upper(i.user_id)) loop
      select s.* into sett_rec from user_settings s where s.user_id = y.id and rownum = 1;
      p_counter:=p_counter+1;
      if y.id = order_rec.user_id then 
        select fullname into p_kontragname from kontragents where id = sett_rec.kontrag_id;
        l_data.extend;
        l_data(p_counter) := kontragType(nvl(sett_rec.kontrag_id,'none'), nvl(p_kontragname,'none'),1);
      end if;
      if sett_rec.zamerkontrag_id = order_rec.zamer_id then
        select fullname into p_kontragname from kontragents where id = sett_rec.zamerkontrag_id;
        l_data.extend;
        l_data(p_counter) := kontragType(nvl(sett_rec.zamerkontrag_id,'none'), nvl(p_kontragname,'none'),1);
      end if;
      end loop;
    end loop;
    return l_data;
  END get_kontrag_by_order;
  
  function get_kont_by_order(p_order in varchar2) return kontragtable AS
  l_data kontragTable := kontragTable();
  p_counter number := 0;
  order_rec orders%rowtype;
  p_kontragname kontragents.fullname%type;
  sett_rec user_settings%rowtype;
  begin
    select o.* into order_rec from orders o where upper(o.id) = upper(p_order);
     for i in (select * from kontrag_settings
      where base_id = (select b.id from base_of_nachisl b where b.name = 'ORDER' and rownum = 1)
      and pay_id in (select id from pay_settings where in_profit = 0)) loop
      if i.kontrag_id = order_rec.agent_id then
        select fullname into p_kontragname from kontragents where id = i.kontrag_id;
        l_data.extend;
        p_counter:=p_counter+1;
        l_data(p_counter) := kontragType(nvl(i.kontrag_id,'none'), nvl(p_kontragname,'none'),1);
      end if;
      if i.kontrag_id = order_rec.zamer_id then
        select fullname into p_kontragname from kontragents where id = i.kontrag_id;
        l_data.extend;
        p_counter:=p_counter+1;
        l_data(p_counter) := kontragType(nvl(i.kontrag_id,'none'), nvl(p_kontragname,'none'),1);
      end if;
      --for y in (select * from user_settings where user_id = order_rec.user_id and rownum = 1) loop
      select * into sett_rec from user_settings where user_id = order_rec.user_id and rownum = 1;
        if sett_rec.kontrag_id is not null then
          if i.kontrag_id = sett_rec.kontrag_id then
            select fullname into p_kontragname from kontragents where id = i.kontrag_id;
              l_data.extend;
              p_counter:=p_counter+1;
              l_data(p_counter) := kontragType(nvl(i.kontrag_id,'none'), nvl(p_kontragname,'none'),1);
          end if;
        end if;
      --end loop;
     end loop;
     return l_data;
  end get_kont_by_order;

  function get_kontrag_by_division(p_order in varchar2) return kontragtable AS
  l_data kontragTable := kontragTable();
  p_counter number := 0;
  order_rec orders%rowtype;
  p_kontragname kontragents.fullname%type;
  sett_rec user_settings%rowtype;
  BEGIN
     select o.* into order_rec from orders o where upper(o.id) = upper(p_order);
     for i in (select * from nachisl_settings
      where base_id = (select b.id from base_of_nachisl b where b.name = 'DIV' and rownum = 1)
      and pay_id in (select id from pay_settings where in_profit = 0)) loop
      select s.* into sett_rec from user_settings s where s.user_id = i.user_id and rownum = 1;
      p_counter:=p_counter+1;
      if i.division_id = order_rec.division_id then
        select fullname into p_kontragname from kontragents where id = sett_rec.kontrag_id;
        l_data.extend;
        l_data(p_counter) := kontragType(nvl(sett_rec.kontrag_id,'none'), nvl(p_kontragname,'none'),1);
      end if;
     end loop;
     return l_data;
  END get_kontrag_by_division;
  
  function get_kont_by_division(p_order in varchar2) return kontragtable AS
  l_data kontragTable := kontragTable();
  p_counter number := 0;
  order_rec orders%rowtype;
  p_kontragname kontragents.fullname%type;
  BEGIN
     select o.* into order_rec from orders o where upper(o.id) = upper(p_order);
     for i in (select * from kontrag_settings
      where base_id = (select b.id from base_of_nachisl b where b.name = 'DIV' and rownum = 1)
      and pay_id in (select id from pay_settings where in_profit = 0)) loop
      p_counter:=p_counter+1;
      if i.division_id = order_rec.division_id then
        select fullname into p_kontragname from kontragents where id = i.kontrag_id;
        l_data.extend;
        l_data(p_counter) := kontragType(nvl(i.kontrag_id,'none'), nvl(p_kontragname,'none'),1);
      end if;
     end loop;
     return l_data;
  END get_kont_by_division;

  function get_kontrag_by_ierarchia(p_order in varchar2) return kontragtable AS
  l_data kontragTable := kontragTable();
  p_counter number := 0;
  order_rec orders%rowtype;
  p_kontragname kontragents.fullname%type;
  sett_rec user_settings%rowtype;
  BEGIN
    select o.* into order_rec from orders o where upper(o.id) = upper(p_order);
    for i in (select * from nachisl_settings 
      where base_id = (select b.id from base_of_nachisl b where b.name = 'IERARHIA' and rownum = 1)
      and pay_id in (select id from pay_settings where in_profit = 0)) loop
      select s.* into sett_rec from user_settings s where s.user_id = i.user_id and rownum = 1;
      for y in (select root, s.id from (select level root, id from divisions d
            where d.deleted = 0
            connect by prior d.id=d.parent_id
            start with d.id = i.division_id) s) loop    
        if y.id = order_rec.division_id  then  
          p_counter:=p_counter+1;
          select fullname into p_kontragname from kontragents where id = sett_rec.kontrag_id;
          l_data.extend;
          l_data(p_counter) := kontragType(nvl(sett_rec.kontrag_id,'none'), nvl(p_kontragname,'none'), y.root);
        end if;
      end loop;
    end loop; 
    return l_data;
  END get_kontrag_by_ierarchia;
  
  function get_kont_by_ierarchia(p_order in varchar2) return kontragtable AS
  l_data kontragTable := kontragTable();
  p_counter number := 0;
  order_rec orders%rowtype;
  p_kontragname kontragents.fullname%type;
  sett_rec user_settings%rowtype;
  BEGIN
    select o.* into order_rec from orders o where upper(o.id) = upper(p_order);
    select s.* into sett_rec from user_settings s where s.user_id = order_rec.user_id and rownum = 1;
    for i in (select * from kontrag_settings
      where base_id = (select b.id from base_of_nachisl b where b.name = 'IERARHIA' and rownum = 1)
      and pay_id in (select id from pay_settings where in_profit = 0)) loop
      for y in (select root, s.id from (select level root, id from vw_net d
            where d.deleted = 0
            connect by prior d.id=d.parent_id
            start with d.id = i.division_id) s) loop    
        if y.id = sett_rec.kontrag_id  then  
          p_counter:=p_counter+1;
          select fullname into p_kontragname from kontragents where id = i.kontrag_id;
          l_data.extend;
          l_data(p_counter) := kontragType(nvl(i.kontrag_id,'none'), nvl(p_kontragname,'none'), y.root);
        end if;
      end loop;
    end loop; 
    return l_data;
  END get_kont_by_ierarchia;
  
  function get_kont_by_net(p_order in varchar2) return kontragtable AS
  l_data kontragTable := kontragTable();
  p_counter number := 0;
  order_rec orders%rowtype;
  p_kontragname kontragents.fullname%type;
  sett_rec user_settings%rowtype;
  BEGIN
    select o.* into order_rec from orders o where upper(o.id) = upper(p_order);
    select s.* into sett_rec from user_settings s where s.user_id = order_rec.user_id and rownum = 1;
--    for i in (select * from kontrag_settings
--      where kontrag_id = sett_rec.kontrag_id 
--      and base_id = (select b.id from base_of_nachisl b where b.name = 'IERARHIA' and rownum = 1)
--      and pay_id in (select id from pay_settings where in_profit = 0)) loop
      for y in (select root, s.id from (select level root, id from vw_net d
            where d.deleted = 0
            connect by prior d.parent_id=d.id
            start with d.id = (case 
                              when sett_rec.net_id is null then sett_rec.kontrag_id
                                else sett_rec.net_id 
                              end)) s order by root) loop    
        --if y.id = sett_rec.kontrag_id  then  
          p_counter:=p_counter+1;
          select fullname into p_kontragname from kontragents where id = y.id;
          l_data.extend;
          l_data(p_counter) := kontragType(nvl(y.id,'none'), nvl(p_kontragname,'none'), y.root);
        --end if;
      end loop;
   -- end loop; 
    return l_data;
  END get_kont_by_net;
  
  function getSummOrder(p_order in varchar2) return number as
  res number;
  addwork number;
  begin
  select sum(summ) into res from orders_tp_uslugi where order_id = p_order;
  select sum(price_add) into addwork from orders_tp_uslugi where order_id = p_order;
  return nvl(res,0)+nvl(addwork,0);
  end getSummOrder;
  
  function getBaseName(p_id in varchar2) return varchar as
  nachisl_rec nachisl_settings%rowtype;
  base_rec base_of_nachisl%rowtype;
  begin
    select * into nachisl_rec from nachisl_settings
        where id = p_id;
    select * into base_rec from base_of_nachisl where id = nachisl_rec.base_id;
    return base_rec.name;
  end getBaseName;
  
  function getBaseNameKontr(p_id in varchar2) return varchar as
  nachisl_rec kontrag_settings%rowtype;
  base_rec base_of_nachisl%rowtype;
  begin
    select * into nachisl_rec from kontrag_settings
        where id = p_id;
    select * into base_rec from base_of_nachisl where id = nachisl_rec.base_id;
    return base_rec.name;
  end getBaseNameKontr;
  
  function summkoeff(p_n in number) return number as
  sm number:=0;
  begin
    FOR i IN 1..p_n LOOP
      sm:=sm+(1/power(2,i));
    END LOOP;
    return sm;
  end summkoeff;
  
  function getKoeffByLevel(p_order in varchar2, p_level number) return number as
  cnt number:=0;
  p_counter number := 0;
  res number:=0;
  begin
    if p_level = 1 then
      return res;
    end if;  
    SELECT count(*) into cnt
      FROM TABLE(CAST(get_kontrag_by_ierarchia(p_order) AS kontragTable)) where root > 1;
    for i in (SELECT n,u_name,root
        FROM TABLE(CAST(get_kontrag_by_ierarchia(p_order) AS kontragTable))
        where root > 1
        order by root) loop
    p_counter:=p_counter+1;
    if i.root = p_level then
      res:=1/power(2,p_counter);
      if p_counter = cnt then
        res:=(1-summkoeff(p_counter-1));
      end if;
    end if;
    end loop;
    return res;
  end getKoeffByLevel;
  
  function getKoeffByLevelKontr(p_order in varchar2, p_level number) return number as
  cnt number:=0;
  p_counter number := 0;
  res number:=0;
  begin
    if p_level = 1 then
      return res;
    end if;  
    SELECT count(*) into cnt
      FROM TABLE(CAST(get_kont_by_net(p_order) AS kontragTable)) where root > 1;
    for i in (SELECT n,u_name,root
        FROM TABLE(CAST(get_kont_by_net(p_order) AS kontragTable))
        where root > 1
        order by root) loop
    p_counter:=p_counter+1;
    if i.root = p_level then
      res:=1/power(2,p_counter);
      if p_counter = cnt then
        res:=(1-summkoeff(p_counter-1));
      end if;
    end if;
    end loop;
    return res;
  end getKoeffByLevelKontr;
  
  procedure calc_money(p_order in varchar2) as
  nachisl_rec orders_tp_nachisl%rowtype;
  sum_order number(10,2):=0;
  begin
  sum_order:= getSummOrder(p_order);
  if sum_order = 0 then return;
  end if;
  --delete from ORDERS_TP_NACHISL where order_id = p_order and manual = 0;
  
  for i in (select * from pay_settings where in_profit = 0) loop
    for y in (select u.id, 
          nvl((select s.kontrag_id from user_settings s where s.user_id = u.id and rownum = 1),
          (select s.zamerkontrag_id from user_settings s where s.user_id = u.id and rownum = 1)) kon_id 
          from users u where u.id in (select n.user_id from nachisl_settings n where n.pay_id = i.id)) loop
      for x in (select * from nachisl_settings where user_id = y.id and pay_id = i.id) loop
        if getBaseName(x.id) = 'ORDER' then
          for g in (select * from table(cast(get_kontrag_by_order(p_order) as kontragTable)) where n = y.kon_id and rownum = 1) loop
            nachisl_rec.order_id:= p_order;
            nachisl_rec.dat_nach:=sysdate;
            nachisl_rec.kontr_id:= g.n;
            nachisl_rec.pay_id:= i.id;
            nachisl_rec.calc_id:= i.base_id;
            nachisl_rec.percent:= i.stavka;
            nachisl_rec.manual:= 0;
            if x.summa is not null then
              nachisl_rec.summ:= x.summa;
            else
              nachisl_rec.summ:= (i.stavka/100)*sum_order;
            end if;
            insert into orders_tp_nachisl values nachisl_rec;
          end loop;
        else if getBaseName(x.id) = 'DIV' then
                for g in (select * from table(cast(get_kontrag_by_division(p_order) as kontragTable)) where n = y.kon_id and rownum = 1) loop
                  nachisl_rec.order_id:= p_order;
                  nachisl_rec.dat_nach:=sysdate;
                  nachisl_rec.kontr_id:= g.n;
                  nachisl_rec.pay_id:= i.id;
                  nachisl_rec.calc_id:= i.base_id;
                  nachisl_rec.percent:= i.stavka;
                  nachisl_rec.manual:= 0;
                  if x.summa is not null then
                    nachisl_rec.summ:= x.summa;
                  else
                    nachisl_rec.summ:= (i.stavka/100)*sum_order;
                  end if;
                  insert into orders_tp_nachisl values nachisl_rec;
                end loop;
             --else 
             --   for g in (select n, root,
             --     getKoeffByLevel(p_order,root) koef
             --     from table(cast(get_kontrag_by_ierarchia(p_order) as kontragTable))
             --           where n = y.kon_id and root > 1) loop
             --     nachisl_rec.order_id:= p_order;
             --     nachisl_rec.dat_nach:=sysdate;
             --     nachisl_rec.kontr_id:= g.n;
             --     nachisl_rec.pay_id:= i.id;
             --     nachisl_rec.calc_id:= i.base_id;
             --     nachisl_rec.percent:= i.stavka*g.koef;
             --     nachisl_rec.manual:= 0;
             --     if x.summa is not null then
             --       nachisl_rec.summ:= x.summa;
             --     else
             --       nachisl_rec.summ:= (i.stavka*g.koef/100)*sum_order;
             --     end if;
             --     insert into orders_tp_nachisl values nachisl_rec;
             --   end loop;  
             end if;   
        end if;
      end loop;  
    end loop;
  end loop;
  end calc_money;
  
  procedure calc_money_by_kontr(p_order in varchar2) as
  nachisl_rec orders_tp_nachisl%rowtype;
  order_rec orders%rowtype;
  sum_order number(10,2):=0;
  p_dat date;
  begin
  sum_order:= getSummOrder(p_order);
  if sum_order = 0 then return;
  end if;
  --delete from ORDERS_TP_NACHISL where order_id = p_order and manual = 0;
  select * into order_rec from orders where id = p_order and rownum = 1;
  if order_rec.dat_complete_fact is null then
    p_dat:=order_rec.dat_complete;
  else
    p_dat:= order_rec.dat_complete_fact;
  end if;  
  
  for i in (select * from pay_settings where in_profit = 0) loop
    for y in (select u.id
          from kontragents u where u.id in (select n.kontrag_id from kontrag_settings n where n.pay_id = i.id)) loop
      for x in (select * from kontrag_settings where kontrag_id = y.id and pay_id = i.id) loop
      
        if getBaseNameKontr(x.id) = 'DIV' then
                for g in (select distinct * from table(cast(get_kont_by_division(p_order) as kontragTable)) where n = y.id and rownum = 1) loop
                  nachisl_rec.order_id:= p_order;
                  nachisl_rec.dat_nach:=p_dat;
                  nachisl_rec.kontr_id:= g.n;
                  nachisl_rec.pay_id:= i.id;
                  nachisl_rec.calc_id:= i.base_id;
                  nachisl_rec.percent:= i.stavka;
                  nachisl_rec.manual:= 0;
                  if x.summa is not null then
                    nachisl_rec.summ:= x.summa;
                  else
                    nachisl_rec.summ:= (i.stavka/100)*sum_order;
                  end if;
                  insert into orders_tp_nachisl values nachisl_rec;
                end loop;
        else if getBaseNameKontr(x.id) = 'IERARHIA' then
                for g in (select distinct n, root,
                  getKoeffByLevelKontr(p_order,root) koef
                  from table(cast(get_kont_by_net(p_order) as kontragTable))
                        where n = y.id and root > 1) loop
                  nachisl_rec.order_id:= p_order;
                  nachisl_rec.dat_nach:=p_dat;
                  nachisl_rec.kontr_id:= g.n;
                  nachisl_rec.pay_id:= i.id;
                  nachisl_rec.calc_id:= i.base_id;
                  nachisl_rec.percent:= i.stavka*g.koef;
                  nachisl_rec.manual:= 0;
                  if x.summa is not null then
                    nachisl_rec.summ:= x.summa;
                  else
                    nachisl_rec.summ:= (i.stavka*g.koef/100)*sum_order;
                  end if;
                  insert into orders_tp_nachisl values nachisl_rec;
                end loop; 
          else if getBaseNameKontr(x.id) = 'ORDER' then
                for g in (select * from table(cast(get_kont_by_order(p_order) as kontragTable)) where n = y.id and rownum = 1) loop
                  nachisl_rec.order_id:= p_order;
                  nachisl_rec.dat_nach:=p_dat;
                  nachisl_rec.kontr_id:= g.n;
                  nachisl_rec.pay_id:= i.id;
                  nachisl_rec.calc_id:= i.base_id;
                  nachisl_rec.percent:= i.stavka;
                  nachisl_rec.manual:= 0;
                  if x.summa is not null then
                    nachisl_rec.summ:= x.summa;
                  else
                    nachisl_rec.summ:= (i.stavka/100)*sum_order;
                  end if;
                  insert into orders_tp_nachisl values nachisl_rec;
                end loop; 
               end if;   
             end if;
        end if;   
      end loop;  
    end loop;
  end loop;
  end calc_money_by_kontr;

  procedure profit_money_by_kontr(p_order in varchar2, p_summ in number) as
  nachisl_rec profit_distrib_tp%rowtype;
  sum_to_profit number(10,2):=0;
  ex_custom       EXCEPTION;
  begin
    if p_summ = 0 then return;
    end if;
    sum_to_profit:=p_summ;
    
    for i in (select * from pay_settings where in_profit = 1 and base_id in (select id from BASE_OF_CALC where name like 'ФиксированнойСуммой')) loop
      for y in (select u.id
          from kontragents u where u.id in (select n.kontrag_id from kontrag_settings n where n.pay_id = i.id)) loop
        for x in (select * from kontrag_settings where kontrag_id = y.id and pay_id = i.id) loop
          nachisl_rec.profit_id:= p_order;
          nachisl_rec.dat_nach:=sysdate;
          nachisl_rec.kontr_id:= x.kontrag_id;
          nachisl_rec.pay_id:= i.id;
          nachisl_rec.calc_id:= i.base_id;
          nachisl_rec.percent:= i.stavka;
          nachisl_rec.manual:= 0;
          nachisl_rec.summ:= x.summa;
          --if nachisl_rec.summ > sum_to_profit then
            --RAISE ex_custom;
          --end if;
          sum_to_profit:=sum_to_profit-nachisl_rec.summ;
          
          insert into profit_distrib_tp values nachisl_rec;
        end loop;
      end loop;  
    end loop;
    
    --if sum_to_profit <=0 then
        --RAISE ex_custom;
    --end if;
    
    for i in (select * from pay_settings where in_profit = 1 and base_id in (select id from BASE_OF_CALC where name like 'Процент')) loop
      for y in (select u.id
          from kontragents u where u.id in (select n.kontrag_id from kontrag_settings n where n.pay_id = i.id)) loop
        for x in (select * from kontrag_settings where kontrag_id = y.id and pay_id = i.id) loop
          nachisl_rec.profit_id:= p_order;
          nachisl_rec.dat_nach:=sysdate;
          nachisl_rec.kontr_id:= x.kontrag_id;
          nachisl_rec.pay_id:= i.id;
          nachisl_rec.calc_id:= i.base_id;
          nachisl_rec.percent:= i.stavka;
          nachisl_rec.manual:= 0;
          nachisl_rec.summ:= (i.stavka/100)*sum_to_profit;
          
          insert into profit_distrib_tp values nachisl_rec;
        end loop;
      end loop;  
    end loop;
    
    EXCEPTION
    WHEN ex_custom THEN
        RAISE_APPLICATION_ERROR(-20001,'Сумма начисления больше чем распределяемая!');
    when others then 
        raise;    
  end profit_money_by_kontr;
  
END PAYCALC;

/
--------------------------------------------------------
--  DDL for Package Body PKO_ENTRY
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "PKO_ENTRY" as

procedure set_subconto_other(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_pko pko%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
  begin
  select * into p_pko from PKO where id = p_move_rec.registrator_id;
  select id into p_upr_val from currency where predefined=1;
  
  p_ret_rec:=p_move_rec;
  
  --Субконто дебета
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_pko.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_pko.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_pko.kassa_id;
        end if;
        end if;
    end loop;
  end if;
  
  p_ret_rec.curr_deb := p_pko.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, p_pko.summa, 1);
  
  p_ret_rec.curr_kred := p_pko.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, p_pko.summa, 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  
  insert into moves values p_ret_rec;

  exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error pko move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_other;
  
  procedure set_subconto_buyer(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_pko pko%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
  begin
  select * into p_pko from PKO where id = p_move_rec.registrator_id;
  select id into p_upr_val from currency where predefined=1;
  
  p_ret_rec:=p_move_rec;
  
  --Субконто дебета
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_pko.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_pko.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_pko.kassa_id;
        end if;
        end if;
    end loop;
  end if;
  
  --Субконто кредита
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КОНТРАГЕНТЫ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_pko.kontrag_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_pko.kontrag_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_pko.kontrag_id;
        end if;
        end if;
    end loop;
  end if;
  
  p_ret_rec.curr_deb := p_pko.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, p_pko.summa, 1);
  
  p_ret_rec.curr_kred := p_pko.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, p_pko.summa, 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  
  insert into moves values p_ret_rec;

  exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error pko move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_buyer;

procedure pko_move_plan_acc(p_id in varchar2) as
    p_pko_rec pko%rowtype;
    p_move_rec moves%rowtype;
    p_version varchar2(1000);
    in_use exception;
    p_id_other_operation operation_pko.id%type;
    p_id_buyer_operation operation_pko.id%type;
    p_id_supplier_operation operation_pko.id%type;
    p_counter number(10);
    pragma exception_init(in_use, -54);
    period_blocked EXCEPTION;
  begin
    select * into p_pko_rec from PKO where id = p_id for update nowait;
    if utility.enable_edit(p_pko_rec.id,'PKO') = 0 then
      --return;
      raise period_blocked;
    end if ;
    pko_remove_plan_acc(p_id, p_pko_rec.deleted);
    
    if p_pko_rec.deleted = 1 then
      return;
    end if;
    
    select to_char(version,'YYYY-MM-DD HH24:MI:SS.FF') into p_version from PKO
      where id = p_id;
    
    select id into p_id_other_operation from operation_pko 
        where upper(name)=upper('OTHER_PAYMENT')
        and rownum = 1;
    select id into p_id_buyer_operation from operation_pko 
        where upper(name)=upper('FROM_BUYER')
        and rownum = 1;   
    select id into p_id_supplier_operation from operation_pko 
        where upper(name)=upper('RETURN_SUPPLIER')
        and rownum = 1;    
    p_move_rec.period:=p_pko_rec.dat;
    p_counter:=0;
    for i in (select * from entry_settings where typedef_id=(select id from type_def where upper(type_def.table_name)=upper('pko')) order by chain) loop
        p_counter:=p_counter+1;
        p_move_rec.registrator_type:=i.typedef_id;
        p_move_rec.registrator_id:=p_id;
        p_move_rec.plan_acc_deb_id:=i.plan_acc_deb_id;
        p_move_rec.activities_id:=p_pko_rec.activities_id;
        p_move_rec.division_id:=p_pko_rec.division_id;
        
        p_move_rec.plan_acc_kred_id:=i.plan_acc_kred_id;
        p_move_rec.description:=i.description;
        
        --ПКО - Прочие приходы денежных средств
        if p_counter = 1 then 
          if p_pko_rec.operation_id = p_id_other_operation then
            set_subconto_other(p_move_rec);
          end if;  
        end if;
        
        --ПКО - Оплата от покупателя
        if p_counter = 2 then
          if p_pko_rec.operation_id = p_id_buyer_operation then
            set_subconto_buyer(p_move_rec);
          end if; 
        end if; 
        
        --ПКО - Возврат от поставщика
        if p_counter = 3 then
          if p_pko_rec.operation_id = p_id_supplier_operation then
            set_subconto_buyer(p_move_rec);
          end if; 
        end if; 
    end loop;
    
    p_pko_rec.posted:=1;
    update PKO set row = p_pko_rec
    where id = p_id and version = to_timestamp(p_version,'YYYY-MM-DD HH24:MI:SS.FF'); 
    
    exception
        when period_blocked then
        RAISE_APPLICATION_ERROR (-20003,'Период заблокирован! Редактирование невозможно!', TRUE) ;
        WHEN IN_USE THEN
        RAISE_APPLICATION_ERROR (-20002,'Resource in use! '||SQLERRM, TRUE) ;
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error PKO move for plan accounting! '||SQLERRM, TRUE) ;
  end pko_move_plan_acc;

procedure pko_remove_plan_acc(p_id in varchar2, p_del in number default 0) as
    p_pko_rec pko%rowtype;
    p_move_count number;
    p_version varchar2(1000);
    in_use exception;
    pragma exception_init(in_use, -54);
    period_blocked EXCEPTION;
  begin
    select * into p_pko_rec from PKO where id = p_id for update nowait;
    if utility.enable_edit(p_pko_rec.id, 'PKO') = 0 then
      --return;
      raise period_blocked;
    end if ;
    select to_char(version,'YYYY-MM-DD HH24:MI:SS.FF') into p_version from PKO
      where id = p_id;
    select count(*) into p_move_count from moves where registrator_id = p_id;
    if p_move_count > 0 then
      execute immediate ('select * from moves where registrator_id='''||p_id||''' for update nowait');  
      delete from moves where registrator_id = p_id;
    end if; 
    
    if p_del <> 0 then
      p_pko_rec.deleted:=1;
    end if;
    p_pko_rec.posted:=0;
    update PKO set row = p_pko_rec
      where id = p_id and version = to_timestamp(p_version,'YYYY-MM-DD HH24:MI:SS.FF');
  exception
        when period_blocked then
        RAISE_APPLICATION_ERROR (-20003,'Период заблокирован! Редактирование невозможно!', TRUE) ;
        WHEN IN_USE THEN
        RAISE_APPLICATION_ERROR (-20002,'Resource in use! '||SQLERRM, TRUE) ;
        when others then 
        raise_application_error (-20001,'Error PKO move for plan accounting! '||sqlerrm, true) ;
  end pko_remove_plan_acc;

procedure pko_move_all as
  begin
    for i in (select * from PKO) loop
    pko_move_plan_acc(i.id);
    end loop;
     exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error pko move  all for plan accounting! '||SQLERRM, TRUE) ;
  end pko_move_all;

procedure pko_remove_all as
  begin
    for i in (select * from PKO) loop
    pko_remove_plan_acc(i.id);
    end loop;
     exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error pko remove all for plan accounting! '||SQLERRM, TRUE) ;
  end pko_remove_all;

function get_operationname(p_id in varchar2) return varchar2 as
  pp_id varchar2(60);
  begin
    select r.name into pp_id from operation_pko r where upper(r.id) = upper(p_id);
    return pp_id;
    
    exception
        when no_data_found then 
        return 'none';
  end get_operationname;

end pko_entry;

/
--------------------------------------------------------
--  DDL for Package Body PRICES
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "PRICES" AS

  function get_lastSectionPrice(p_code in nomenklatura.id%type, p_dat in date) return varchar2 AS
    res varchar2(50);
  BEGIN
    select id into res from reg_prices where period = (select max(period) from reg_prices where nom_id=p_code
                                          and period<=p_dat) and nom_id=p_code and rownum = 1;
  return res;
  END get_lastSectionPrice;
  
  procedure importprice(p_dat in date) as
    p_nom nomenklatura.id%type;
    p_group nomenklatura.id%type;
    p_group_parent nomenklatura.id%type;
    p_price_id reg_prices.id%type;
    p_ed_izm measure_unit.id%type;
    record_found EXCEPTION;
  begin
    select id into p_group_parent from nomenklatura n where upper(n.fullname) = upper('Услуги') and n.IS_GROUP = 1;
    for i in (select * from imported_price) loop
    
      begin --Ищем группу, если нет - создаем
      select id into p_group from nomenklatura n where upper(n.fullname) = upper(i.groups) and n.IS_GROUP = 1 and rownum = 1;
      EXCEPTION 
        WHEN OTHERS THEN
        select UTILITY.UUID() into p_group from dual;
        insert into nomenklatura (id, fullname, is_group, parent_id, usluga)
          values(p_group, i.groups, 1, p_group_parent, 0);
      end;
      
      begin  --Ищем номенклатуру, если нет - создаем
      select id into p_nom from nomenklatura n where n.IS_GROUP = 0 
            and (upper(n.ARTIKUL) = upper(i.artikul) or upper(n.fullname) = upper(i.nom_name)) and rownum = 1; 
      exception
        when others then
        select UTILITY.UUID() into p_nom from dual;
        insert into nomenklatura (id, fullname, is_group, parent_id, usluga, artikul)
          values(p_nom, i.nom_name, 0, p_group, 1, i.artikul);
      end;
      
      begin --Ищем единицу измерения, если нет - создаем
        select id into p_ed_izm from measure_unit m where upper(m.fullname) = upper(i.ed_izm) and rownum = 1;
        exception
          when others then
          select UTILITY.UUID() into p_ed_izm from dual;
          insert into measure_unit (id, fullname) values (p_ed_izm, i.ed_izm);
      end;
      
      begin --Ищем цену за текущую дату, если не находим - создаем
      select id into p_price_id from reg_prices where period = (select max(period) from reg_prices where nom_id=p_nom
                                          and period=p_dat) and nom_id=p_nom and rownum = 1;
      if p_price_id is null then
        raise no_data_found;
      end if;  
      exception
        when others then
          insert into reg_prices (nom_id, period, ed_izm, price_usl, price_goods)
            values(p_nom, p_dat, p_ed_izm, i.price_usl, i.price_goods);
      end;      
    end loop;
    
  EXCEPTION
        WHEN record_found THEN 
        RAISE_APPLICATION_ERROR (-20002,'REG_PRICES record found in this date! ', TRUE) ;
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR (-20001,'Error importing price! ', TRUE) ;  
  end importprice;

END PRICES;

/
--------------------------------------------------------
--  DDL for Package Body PROFIT_ENTRY
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "PROFIT_ENTRY" AS
  
  procedure set_subconto_profit(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_profit profit_distrib%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
  begin
    select * into p_profit from profit_distrib where id = p_move_rec.registrator_id;
    select id into p_upr_val from currency where predefined=1;
  
    for i in (select * from profit_distrib_tp where profit_id = p_profit.id) loop
    p_ret_rec:=p_move_rec;
    
    --Субконто дебета
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'ЦФО' then
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_profit.division_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_profit.division_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_profit.division_id;
        end if;
        end if;
    end loop;
  end if;
  
  --Субконто кредита
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КОНТРАГЕНТЫ' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=i.kontr_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=i.kontr_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=i.kontr_id;
        end if;
        end if;
    end loop;
  end if;
  
  p_ret_rec.curr_deb := p_profit.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, i.summ, 1);
  
  p_ret_rec.curr_kred := p_profit.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, i.summ, 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  insert into moves values p_ret_rec;
  end loop;
  
  exception
    when others then 
    RAISE_APPLICATION_ERROR (-20001,'Error profit_distrib move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_profit;
  
  procedure set_subconto_division(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_counter number(10);
    p_profit profit_distrib%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
    p_summ number:=0;
    p_code_service plan_acc.id%type;
  begin
    select * into p_profit from profit_distrib where id = p_move_rec.registrator_id;
    select id into p_upr_val from currency where predefined=1;
    select id into p_code_service from PLAN_ACC where code like '000';
    
    ORDERS_ENTRY.set_enddatmoves(p_profit.dat); 
    p_summ:=p_profit.summ;
    for i in (select * from vw_ballans where code like '900'
                order by end_ost asc) loop
     -- p_summ:=p_summ - i.end_ost;
      if i.DIVISION_ID = p_profit.division_id then
        continue;
      end if;
      p_ret_rec:=p_move_rec;
      --p_ret_rec.id := utility.uuid();
      
      
      p_ret_rec.subconto1_deb:=i.division_id;
      p_ret_rec.plan_acc_kred_id:=p_code_service;
      p_ret_rec.subconto1_kred:=null;
      p_summ:=i.end_ost;
      
      p_ret_rec.division_id:=i.division_id;
      
      p_ret_rec.curr_deb := p_profit.curr_id;
      p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, p_summ, 1);
  
      p_ret_rec.curr_kred := p_profit.curr_id;
      p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, p_summ, 0);
      
      p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
      p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
      p_ret_rec.version:=systimestamp;
      insert into moves values p_ret_rec;
      
      --for y in (select * from moves where id = p_ret_rec.id) loop
        p_ret_rec:=p_move_rec;
        p_ret_rec.plan_acc_deb_id:=p_code_service;
        p_ret_rec.subconto1_deb:=null;
        p_ret_rec.subconto1_kred:=p_profit.division_id;
        p_summ:=i.end_ost;
      
        p_ret_rec.division_id:=p_profit.division_id;
      
        p_ret_rec.curr_deb := p_profit.curr_id;
        p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, p_summ, 1);
  
        p_ret_rec.curr_kred := p_profit.curr_id;
        p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, p_summ, 0);
      
        p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
        p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
        p_ret_rec.version:=systimestamp;
        insert into moves values p_ret_rec;
      --end loop;
      
    end loop;
  end set_subconto_division;
  
  procedure profit_move_plan_acc(p_id in varchar2) AS
    p_profit_rec profit_distrib%rowtype;
    p_move_rec moves%rowtype;
    p_version varchar2(1000);
    in_use exception;
    p_counter number(10);
    pragma exception_init(in_use, -54);
    period_blocked EXCEPTION;
  BEGIN
    select * into p_profit_rec from profit_distrib where id = p_id for update nowait;
    if utility.enable_edit(p_profit_rec.id, 'profit_distrib') = 0 then
      --return;
      raise period_blocked;
    end if ;
    
    profit_remove_plan_acc(p_id, p_profit_rec.deleted);
    if p_profit_rec.deleted = 1 then
      return;
    end if;
    
    delete from profit_distrib_tp where profit_id = p_id and manual = 0;
    paycalc.profit_money_by_kontr(p_id, p_profit_rec.summ);
    
    select to_char(version,'YYYY-MM-DD HH24:MI:SS.FF') into p_version from profit_distrib
      where id = p_id;
    
    p_move_rec.period:=p_profit_rec.dat;
    p_counter:=0;
    
    for i in (select * from entry_settings where typedef_id=(select id from type_def where upper(type_def.table_name)=upper('profit_distrib')) order by chain) loop
        p_counter:=p_counter+1;
        p_move_rec.registrator_type:=i.typedef_id;
        p_move_rec.registrator_id:=p_id;
        p_move_rec.plan_acc_deb_id:=i.plan_acc_deb_id;
        p_move_rec.activities_id:=p_profit_rec.activities_id;
        p_move_rec.division_id:=p_profit_rec.division_id;
        
        p_move_rec.plan_acc_kred_id:=i.plan_acc_kred_id;
        p_move_rec.description:=i.description;
        
        --Распределение прибыли
        if p_counter = 1 then
          --null;
          set_subconto_profit(p_move_rec); 
        end if;
        
        --Переброс прибыли на головное подразделение
        if p_counter = 2 then
          --null;
          set_subconto_division(p_move_rec); 
        end if;
        
        --Переброс прибыли на головное подразделение
        --if p_counter = 3 then
         -- null;
          --set_subconto_division_back(p_move_rec); 
      --  end if;
    end loop;
    
    p_profit_rec.posted:=1;
    update profit_distrib set row = p_profit_rec
    where id = p_id and version = to_timestamp(p_version,'YYYY-MM-DD HH24:MI:SS.FF'); 
    
    utility.set_disable_edit_profit(p_profit_rec.dat);
    
    exception
        when period_blocked then
        RAISE_APPLICATION_ERROR (-20003,'Период заблокирован! Редактирование невозможно!', TRUE) ;
        WHEN IN_USE THEN
        RAISE_APPLICATION_ERROR (-20002,'Resource in use! '||SQLERRM, TRUE) ;
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error profit_distrib move for plan accounting! '||SQLERRM, TRUE) ;
  END profit_move_plan_acc;

  procedure profit_remove_plan_acc(p_id in varchar2, p_del in number default 0) AS
    p_profit_rec profit_distrib%rowtype;
    p_move_count number;
    p_version varchar2(1000);
    in_use exception;
    pragma exception_init(in_use, -54);
    period_blocked EXCEPTION;
  BEGIN
    select * into p_profit_rec from profit_distrib where id = p_id for update nowait;
    if utility.enable_edit(p_profit_rec.id, 'profit_distrib') = 0 then
      --return;
      raise period_blocked;
    end if ;
    select to_char(version,'YYYY-MM-DD HH24:MI:SS.FF') into p_version from profit_distrib
      where id = p_id;
    select count(*) into p_move_count from moves where registrator_id = p_id;
    if p_move_count > 0 then
      execute immediate ('select * from moves where registrator_id='''||p_id||''' for update nowait');  
      delete from moves where registrator_id = p_id;
    end if; 
    
    if p_del <> 0 then
      p_profit_rec.deleted:=1;
    end if;
    p_profit_rec.posted:=0;
    update profit_distrib set row = p_profit_rec
      where id = p_id and version = to_timestamp(p_version,'YYYY-MM-DD HH24:MI:SS.FF');
      
    exception
        when period_blocked then
        RAISE_APPLICATION_ERROR (-20003,'Период заблокирован! Редактирование невозможно!', TRUE) ;
        WHEN IN_USE THEN
        RAISE_APPLICATION_ERROR (-20002,'Resource in use! '||SQLERRM, TRUE) ;
        when others then 
        raise_application_error (-20001,'Error profit_distrib move for plan accounting! '||sqlerrm, true) ;
  END profit_remove_plan_acc;

  procedure profit_move_all AS
  BEGIN
    for i in (select * from profit_distrib) loop
    profit_move_plan_acc(i.id);
    end loop;
    
    exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error profit_distrib move  all for plan accounting! '||SQLERRM, TRUE) ;
  END profit_move_all;

  procedure profit_remove_all AS
  BEGIN
    for i in (select * from profit_distrib) loop
    profit_remove_plan_acc(i.id);
    end loop;
    
    exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error profit_distrib remove all for plan accounting! '||SQLERRM, TRUE) ;
  END profit_remove_all;

END PROFIT_ENTRY;

/
--------------------------------------------------------
--  DDL for Package Body P_ENCRYPT
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "P_ENCRYPT" 
AS
--DO NOT FORGET TO WRAP THIS BEFORE LOADING INTO DATABASE
--IF IT IS NOT WRAPPED, THE KEY WILL BE EXPOSED
--THE WRAP UTILITY IS LOCATED IN THE \BIN DIRECTORY (WRAP.EXE)
  G_DATE TIMESTAMP;
  G_CHARACTER_SET VARCHAR2(10) := 'AL32UTF8';
  G_STRING VARCHAR2(16);
  G_KEY RAW(250);
  G_ENCRYPTION_TYPE PLS_INTEGER := dbms_crypto.encrypt_aes128 
                                    + dbms_crypto.chain_cbc 
                                    + dbms_crypto.pad_pkcs5;
  
  PROCEDURE setg_date(p_dat timestamp) IS
  BEGIN
    G_DATE:=p_dat;
    G_STRING:= rtrim(TO_CHAR(G_DATE,'DDMMYYYYHH24miSS')||'70');
    G_KEY:= utl_i18n.string_to_raw
                      ( data => G_STRING,
                        dst_charset => G_CHARACTER_SET );
  END setg_date;
  
  FUNCTION encrypt_ssn( p_ssn IN VARCHAR2, p_key IN VARCHAR2 ) RETURN RAW
  IS
    l_ssn RAW(64) := UTL_I18N.STRING_TO_RAW( p_ssn, G_CHARACTER_SET );
    l_encrypted RAW(64);
  BEGIN
    setg_date(to_timestamp(p_key,'DD/MM/YYYY HH24:MI:SS'));
    l_ssn := utl_i18n.string_to_raw
              ( data => p_ssn,
                dst_charset => G_CHARACTER_SET );

    l_encrypted := dbms_crypto.encrypt
                   ( src => l_ssn,
                     typ => G_ENCRYPTION_TYPE,
                     key => G_KEY );
                     
    RETURN l_encrypted;
  END encrypt_ssn;

  FUNCTION encrypt_pass( p_ssn IN VARCHAR2, p_key IN VARCHAR2 ) RETURN RAW
  IS
    l_ssn RAW(64) := UTL_I18N.STRING_TO_RAW( p_ssn, G_CHARACTER_SET );
    l_encrypted RAW(64);
  BEGIN
    --setg_date(to_timestamp(p_key,'DD/MM/YYYY HH24:MI:SS'));
    G_STRING:= rtrim(p_key);
    G_KEY:= utl_i18n.string_to_raw
                      ( data => G_STRING,
                        dst_charset => G_CHARACTER_SET );
    l_ssn := utl_i18n.string_to_raw
              ( data => p_ssn,
                dst_charset => G_CHARACTER_SET );

    l_encrypted := dbms_crypto.encrypt
                   ( src => l_ssn,
                     typ => G_ENCRYPTION_TYPE,
                     key => G_KEY );
                     
    RETURN l_encrypted;
  END encrypt_pass;
  
  FUNCTION decrypt_ssn( p_ssn IN RAW, p_key IN VARCHAR2 ) RETURN VARCHAR2
  IS
    l_decrypted RAW(64);
    l_decrypted_string VARCHAR2(64);
  BEGIN
    setg_date(to_date(p_key,'DD/MM/YYYY'));
    l_decrypted := dbms_crypto.decrypt
                    ( src => p_ssn,
                      typ => G_ENCRYPTION_TYPE,
                      key => G_KEY );

    l_decrypted_string := utl_i18n.raw_to_char
                            ( data => l_decrypted,
                              src_charset => G_CHARACTER_SET );
    RETURN l_decrypted_string;
  END decrypt_ssn;

  FUNCTION decrypt_pass( p_ssn IN RAW, p_key IN VARCHAR2 ) RETURN VARCHAR2
  IS
    l_decrypted RAW(64);
    l_decrypted_string VARCHAR2(64);
  BEGIN
    --setg_date(to_date(p_key,'DD/MM/YYYY'));
    G_STRING:= rtrim(p_key);
    G_KEY:= utl_i18n.string_to_raw
                      ( data => G_STRING,
                        dst_charset => G_CHARACTER_SET );
    l_decrypted := dbms_crypto.decrypt
                    ( src => p_ssn,
                      typ => G_ENCRYPTION_TYPE,
                      key => G_KEY );

    l_decrypted_string := utl_i18n.raw_to_char
                            ( data => l_decrypted,
                              src_charset => G_CHARACTER_SET );
    RETURN l_decrypted_string;
  END decrypt_pass;
  
END p_encrypt;

/
--------------------------------------------------------
--  DDL for Package Body REPORT_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "REPORT_PKG" as

function getzatraty(f_data date default null, l_data date default null)
      return tbl_zatraty as
  l_datatbl tbl_zatraty := tbl_zatraty();
  p_counter number := 0;    
  begin
    if f_data is not null then
      ORDERS_ENTRY.set_startdatmoves(f_data);
    end if;
    if l_data is not null then
      ORDERS_ENTRY.set_enddatmoves(l_data);
    end if;
    
    for i in (select * from vw_zatraty) loop
      p_counter:=p_counter+1;
      l_datatbl.extend;
      l_datatbl(p_counter) := row_zatraty(i.REGISTRATOR_ID, 
          i.TABLE_NAME, i.CODE, i.SUMMA, i.ZATRATY_ID, i.ZATRATY_NAME, i.DIVISION_ID, i.PERIOD);
    end loop;
    return l_datatbl;
  end getzatraty;
  
function getsales(f_data date default null, l_data date default null)
      return tbl_sales as
  l_datatbl tbl_sales := tbl_sales();
  p_counter number := 0;    
  begin
    if f_data is not null then
      ORDERS_ENTRY.set_startdatmoves(f_data);
    end if;
    if l_data is not null then
      ORDERS_ENTRY.set_enddatmoves(l_data);
    end if;
    
    for i in (select * from vw_sales) loop
      p_counter:=p_counter+1;
      l_datatbl.extend;
      l_datatbl(p_counter) := row_sales(i.ORDER_ID, 
          i.KONTRAG_ID, i.PERIOD, i.DIVISION_ID, i.SALES_SUMMA, i.FACT_SEBEST_SUMMA, i.PLAN_SEBEST_SUMMA);
    end loop;
    return l_datatbl;
  end getsales;  
  
function getballans(f_data date default null, l_data date default null)
      return tbl_ballans as
  l_datatbl tbl_ballans := tbl_ballans();
  p_counter number := 0;    
  begin
    if f_data is not null then
      ORDERS_ENTRY.set_startdatmoves(f_data);
    end if;
    if l_data is not null then
      ORDERS_ENTRY.set_enddatmoves(l_data);
    end if;
    
    for i in (select * from vw_ballans_ap) loop
      p_counter:=p_counter+1;
      l_datatbl.extend;
      l_datatbl(p_counter) := row_ballans(i.ID, 
          i.CODE, i.FULLNAME, i.ACTIVE_START, i.ACTIVE_DEB, i.ACTIVE_KRED, i.ACTIVE_OBOROT,
          i.ACTIVE_END, i.PASSIVE_START, i.PASSIVE_DEB, i.PASSIVE_KRED, i.PASSIVE_OBOROT, i.PASSIVE_END, i.DIVISION_ID);
    end loop;
    return l_datatbl;
  end getballans;   
  
  function getrating(f_data date default null, l_data date default null)
      return tbl_rating as
  l_datatbl tbl_rating := tbl_rating();
  p_counter number := 0;    
  begin
    if f_data is not null then
      ORDERS_ENTRY.set_startdatmoves(f_data);
    end if;
    if l_data is not null then
      ORDERS_ENTRY.set_enddatmoves(l_data);
    end if;
    
    for i in (select * from vw_rating) loop
      p_counter:=p_counter+1;
      l_datatbl.extend;
      l_datatbl(p_counter) := row_rating(i.PLACE, 
          i.DIVISION_ID, i.CNT, i.TOTAL, i.BALL_SUM, i.BALL_CNT, i.BALL_TOTAL);
    end loop;
    return l_datatbl;
  end getrating;
  
  function getreference(p_tablename in varchar2)
      return tbl_reference as
  l_datatbl tbl_reference := tbl_reference();
  p_counter number := 0;    
  begin
    for i in (SELECT DISTINCT table_name, 
                constraint_name, 
                column_name, 
                r_table_name, 
                position, 
                constraint_type 
        FROM   (SELECT uc.table_name, 
               uc.constraint_name, 
               cols.column_name, 
               (SELECT table_name 
                FROM   user_constraints 
                WHERE  constraint_name = uc.r_constraint_name) r_table_name, 
               (SELECT column_name 
                FROM   user_cons_columns 
                WHERE  constraint_name = uc.r_constraint_name 
                       AND position = cols.position)           r_column_name, 
               cols.position, 
               uc.constraint_type 
        FROM   user_constraints uc 
               inner join user_cons_columns cols 
                       ON uc.constraint_name = cols.constraint_name 
        WHERE  constraint_type != 'C')
        START WITH table_name = upper(p_tablename)
           AND column_name = 'ID' 
        CONNECT BY NOCYCLE PRIOR table_name = r_table_name 
                         AND PRIOR column_name = r_column_name
        
        union
        select 'KONTRAG_SETTINGS', null, 'DIVISION_ID', null, null, 'R'
        from dual
        
        union
        select 'START_OST_TP', null, 'SUBCONTO1_DEB', null, null, 'R'
        from dual
        
        union
        select 'START_OST_TP', null, 'SUBCONTO2_DEB', null, null, 'R'
        from dual
        
        union
        select 'START_OST_TP', null, 'SUBCONTO1_KRED', null, null, 'R'
        from dual
        
        union
        select 'START_OST_TP', null, 'SUBCONTO2_KRED', null, null, 'R'
        from dual) loop
      p_counter:=p_counter+1;
      l_datatbl.extend;
      l_datatbl(p_counter) := row_table_reference(i.TABLE_NAME, 
          i.CONSTRAINT_NAME, i.COLUMN_NAME, i.R_TABLE_NAME, i.POSITION, i.CONSTRAINT_TYPE);
    end loop;
    return l_datatbl;
  end getreference;
  
  function getreftable(p_id in varchar2, p_tablename in varchar2)
      return tbl_ref_tab as
  l_datatbl tbl_ref_tab := tbl_ref_tab();
  p_counter number := 0;
  query_str VARCHAR2(2000);
  TYPE cur_typ IS REF CURSOR;
  cur cur_typ;
  id_rel VARCHAR2(50);
  begin
    for i in (select * from table(cast(REPORT_PKG.GETREFERENCE(p_tablename) as tbl_reference))
              where constraint_type != 'P') loop
                         
      query_str := 'SELECT id FROM ' || i.table_name ||' WHERE ' ||i.column_name||' = :id';
      OPEN cur FOR query_str USING p_id;
      LOOP
        FETCH cur INTO id_rel;
        EXIT WHEN cur%NOTFOUND;
        p_counter:=p_counter+1;
        l_datatbl.extend;
        l_datatbl(p_counter) := ROW_REFERENCE(id_rel, p_id,
          i.TABLE_NAME, i.COLUMN_NAME, i.CONSTRAINT_TYPE);
      END LOOP;
      CLOSE cur;
    end loop;
    return l_datatbl;
  end getreftable;
  
  function get_deleted_tables return tbl_deleted as
  l_datatbl tbl_deleted := tbl_deleted();
  p_counter number := 0;
  query_str VARCHAR2(2000);
  p_num varchar(50);
  p_dat date;
  p_ref_str varchar(4000):='';
  TYPE cur_typ IS REF CURSOR;
  cur cur_typ;
  id_rel VARCHAR2(50);
  begin
    for i in (select ut.table_name, UTC.COMMENTS from USER_TAB_COLUMNS ut, user_tab_comments utc
          where ut.table_name = utc.table_name and COLUMN_NAME = 'DELETED') loop
    query_str := 'SELECT id FROM ' || i.table_name ||' WHERE deleted = 1' ;
    OPEN cur FOR query_str;
      LOOP
        FETCH cur INTO id_rel;
        EXIT WHEN cur%NOTFOUND;
        p_ref_str:='';
        if i.table_name = 'ORDERS' then
          select dat, num into p_dat, p_num from orders where id = id_rel;
          p_ref_str:='Заказ №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY');
        elsif i.table_name = 'OTHER_ZATRATY' then
          select dat, num into p_dat, p_num from OTHER_ZATRATY where id = id_rel;
          p_ref_str:='Админ.затраты №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY');
        elsif i.table_name = 'PKO' then
          select dat, num into p_dat, p_num from PKO where id = id_rel;
          p_ref_str:='ПКО №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY'); 
        elsif i.table_name = 'RKO' then
          select dat, num into p_dat, p_num from RKO where id = id_rel;
          p_ref_str:='РКО №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY'); 
        elsif i.table_name = 'PROFIT_DISTRIB' then
          select dat, num into p_dat, p_num from PROFIT_DISTRIB where id = id_rel;
          p_ref_str:='Распределение прибыли №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY'); 
        elsif i.table_name = 'START_OST' then
          select dat, num into p_dat, p_num from START_OST where id = id_rel;
          p_ref_str:='Нач. остатки №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY');
        elsif i.table_name = 'KONTRAGENTS' then
          select fullname into query_str from KONTRAGENTS where id = id_rel;
          p_ref_str:='Контрагенты - '||query_str; 
        elsif i.table_name = 'ZATRATY' then
          select fullname into query_str from ZATRATY where id = id_rel;
          p_ref_str:='Статья затрат - '||query_str;
        elsif i.table_name = 'DIVISIONS' then
          select fullname into query_str from DIVISIONS where id = id_rel;
          p_ref_str:='Филиал - '||query_str;  
        end if;  
        p_counter:=p_counter+1;
        l_datatbl.extend;
        l_datatbl(p_counter) := ROW_TABLE_DELETED(id_rel, null,
          i.TABLE_NAME, i.comments, null, p_ref_str);
      END LOOP;
      CLOSE cur;
    end loop;
    return l_datatbl;
  end get_deleted_tables;
  
  function get_deletedref_tables return tbl_deleted_ref as
  l_datatbl tbl_deleted_ref := tbl_deleted_ref();
  p_counter number := 0;
  p_num varchar(50);
  p_dat date;
  p_ref_str varchar(4000):='';
  query_str VARCHAR2(200):='';
  begin
      for i in (select * from vw_tbl_deleted) loop
        for y in (select * from
            table(cast(REPORT_PKG.getreftable(i.table_id,i.table_name) as tbl_ref_tab))
              where table_name not in (
                  select ut.table_name from user_tables ut, user_tab_comments utc
                    where ut.table_name = UTC.TABLE_NAME and UTC.COMMENTS like '%'||i.objname||'%')) loop
              p_ref_str:='';
              if y.table_name = 'ORDERS' then
                 select dat, num into p_dat, p_num from orders where id = y.TABLE_ID;
                 p_ref_str:='Заказ №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY');
              elsif y.table_name = 'ORDERS_TP_NACHISL' then
                 select dat, num into p_dat, p_num from orders 
                  where id = (select Order_id FROM ORDERS_TP_NACHISL where id = y.TABLE_ID AND ROWNUM=1);
                 p_ref_str:='Заказ №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY');
              elsif y.table_name = 'ORDERS_TP_OPLATY' then
                 select dat, num into p_dat, p_num from orders 
                  where id = (select Order_id FROM ORDERS_TP_OPLATY where id = y.TABLE_ID AND ROWNUM=1);
                 p_ref_str:='Заказ №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY');
              elsif y.table_name = 'ORDERS_TP_RASHODY' then
                 select dat, num into p_dat, p_num from orders 
                  where id = (select Order_id FROM ORDERS_TP_RASHODY where id = y.TABLE_ID AND ROWNUM=1);
                 p_ref_str:='Заказ №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY');
              elsif y.table_name = 'ORDERS_TP_USLUGI' then
                 select dat, num into p_dat, p_num from orders 
                  where id = (select Order_id FROM ORDERS_TP_USLUGI where id = y.TABLE_ID AND ROWNUM=1);
                 p_ref_str:='Заказ №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY');
              elsif y.table_name = 'OTHER_ZATRATY' then
                 select dat, num into p_dat, p_num from OTHER_ZATRATY where id = y.TABLE_ID;
                p_ref_str:='Админ.затраты №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY');
              elsif y.table_name = 'OTHER_ZATRATY_TAB_PART_ZATRATY' then
                 select dat, num into p_dat, p_num from OTHER_ZATRATY 
                  where id = (select oth_id FROM OTHER_ZATRATY_TAB_PART_ZATRATY where id = y.TABLE_ID AND ROWNUM=1);
                p_ref_str:='Админ.затраты №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY');
              elsif y.table_name = 'PKO' then
                select dat, num into p_dat, p_num from PKO where id = y.TABLE_ID;
                p_ref_str:='ПКО №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY'); 
              elsif y.table_name = 'RKO' then
                select dat, num into p_dat, p_num from RKO where id = y.TABLE_ID;
                p_ref_str:='РКО №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY'); 
              elsif y.table_name = 'PROFIT_DISTRIB' then
                select dat, num into p_dat, p_num from PROFIT_DISTRIB where id = y.TABLE_ID;
                p_ref_str:='Распределение прибыли №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY'); 
              elsif y.table_name = 'PROFIT_DISTRIB_TP' then
                select dat, num into p_dat, p_num from PROFIT_DISTRIB
                  where id = (select profit_ID FROM PROFIT_DISTRIB_TP  where id = y.TABLE_ID AND ROWNUM=1);
                p_ref_str:='Распределение прибыли №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY');   
              elsif y.table_name = 'START_OST' then
                select dat, num into p_dat, p_num from START_OST where id = y.TABLE_ID;
                p_ref_str:='Нач. остатки №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY');
              elsif y.table_name = 'START_OST_TP' then
                select dat, num into p_dat, p_num from START_OST
                  where id = (select start_ost_ID FROM START_OST_TP WHERE id =y.TABLE_ID AND ROWNUM=1);
                p_ref_str:='Нач. остатки №'||p_num||' от '||to_char(p_dat,'DD-MM-YYYY');
              elsif y.table_name = 'KONTRAGENTS' then
                select fullname into query_str from KONTRAGENTS where id = y.TABLE_ID;
                p_ref_str:='Контрагенты - '||query_str; 
              elsif y.table_name = 'ZATRATY' then
                select fullname into query_str from ZATRATY where id = y.TABLE_ID;
                p_ref_str:='Статья затрат - '||query_str; 
              elsif y.table_name = 'USER_SETTINGS' then
                select LOGIN into query_str from users 
                  where id = (select user_ID FROM USER_SETTINGS WHERE id = y.TABLE_ID AND ROWNUM=1);
                p_ref_str:='Настройки пользователя - '||query_str;
              elsif y.table_name = 'KONTRAG_SETTINGS' then
                select fullname into query_str from KONTRAGENTS 
                  where id = (select KONTRAG_ID FROM KONTRAG_SETTINGS WHERE id = y.TABLE_ID AND ROWNUM=1);
                p_ref_str:='Настройки контрагента - '||query_str;  
              elsif y.table_name = 'KASSA' then
                select fullname into query_str from KASSA 
                  where id = y.TABLE_ID AND ROWNUM=1;
                p_ref_str:='Касса - '||query_str; 
              elsif y.table_name = 'MOVES' then
                continue;
              end if;        
              p_counter:=p_counter+1;
              l_datatbl.extend;
              l_datatbl(p_counter) := ROW_TABLE_DELETED(y.TABLE_ID, i.table_id,
                  y.TABLE_NAME, y.COLUMN_NAME, y.CONSTRAINT_TYPE, p_ref_str);
            end loop;
      end loop;
      return l_datatbl;
  end get_deletedref_tables;

  procedure refresh_ballans(f_data date default null, l_data date default null) AS
    p_f_dat Date;
    p_l_dat DATE;
  BEGIN
    if f_data is not null then
      p_f_dat:=f_data;
    ELSE 
      p_f_dat:=ORDERS_ENTRY.get_startdatmoves;
    end if;

    if l_data is not null then
      p_l_dat:=l_data;
    ELSE
      p_l_dat:=ORDERS_ENTRY.get_enddatmoves;
    end if;
    DELETE FROM BALLANS;
    INSERT INTO BALLANS (ID, CODE, FULLNAME, ACTIVE_START, ACTIVE_DEB, ACTIVE_KRED, ACTIVE_OBOROT,
  ACTIVE_END, PASSIVE_START, PASSIVE_DEB, PASSIVE_KRED, PASSIVE_OBOROT, PASSIVE_END, DIVISION_ID, F_DAT, l_DAT)
  SELECT ID, CODE, FULLNAME, ACTIVE_START, ACTIVE_DEB, ACTIVE_KRED, ACTIVE_OBOROT,
  ACTIVE_END, PASSIVE_START, PASSIVE_DEB, PASSIVE_KRED, PASSIVE_OBOROT, PASSIVE_END, DIVISION_ID,
    (SELECT p_f_dat FROM dual), (SELECT p_l_dat FROM dual) 
    FROM table(cast(REPORT_PKG.GETBALLANS(f_data,l_data) as tbl_ballans));
  END refresh_ballans;
  
  procedure delete_table(p_id in varchar2, p_tablename in varchar2) as
  in_use exception;
  pragma exception_init(in_use, -54);
  query_str VARCHAR2(2000):='';
  begin
    query_str:= 'select * from '||p_tablename||' where id = :1 for update nowait';
    execute immediate  query_str USING ''||p_id||'';
    query_str:= 'delete from '||p_tablename||' where id = :1';
    execute immediate  query_str USING ''||p_id||'';
    
    exception
        WHEN IN_USE THEN
        RAISE_APPLICATION_ERROR (-20002,'Запись с Ид='||p_id||' таблицы '||p_tablename||' заблокирована!', TRUE) ;
        when others then 
        raise_application_error (-20001,'Ошибка удаления записи Ид='||p_id||' таблицы '||p_tablename, true) ;
  end delete_table;

end report_pkg;

/
--------------------------------------------------------
--  DDL for Package Body RKO_ENTRY
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "RKO_ENTRY" AS

procedure set_subconto_other(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_rko rko%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
  begin
  select * into p_rko from RKO where id = p_move_rec.registrator_id;
  select id into p_upr_val from currency where predefined=1;
  
  p_ret_rec:=p_move_rec;
  
  --Субконто кредита
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_rko.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto1_kred:=p_rko.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto1_kred:=p_rko.kassa_id;
        end if;
        end if;
    end loop;
  end if;
  
  p_ret_rec.curr_deb := p_rko.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, p_rko.summa, 1);
  
  p_ret_rec.curr_kred := p_rko.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, p_rko.summa, 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  
  insert into moves values p_ret_rec;

  exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error rko move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_other;
  
  procedure set_subconto_buyer(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_rko rko%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
  begin
  select * into p_rko from RKO where id = p_move_rec.registrator_id;
  select id into p_upr_val from currency where predefined=1;
  
  p_ret_rec:=p_move_rec;
  
  --Субконто дебета
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КОНТРАГЕНТЫ' then 
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_rko.kontrag_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_rko.kontrag_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_rko.kontrag_id;
        end if;
        end if;
    end loop;
  end if;
  
  --Субконто кредита
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_rko.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_rko.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_rko.kassa_id;
        end if;
        end if;
    end loop;
  end if;
  
  p_ret_rec.curr_deb := p_rko.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, p_rko.summa, 1);
  
  p_ret_rec.curr_kred := p_rko.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, p_rko.summa, 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  
  insert into moves values p_ret_rec;

  exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error rko move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_buyer;
  
  procedure set_subconto_kassa(p_move_rec moves%rowtype) as
    p_ret_rec moves%rowtype;
    p_sub_count number(10);
    p_counter number(10);
    p_sub_name plan_type_subconto.fullname%type;
    p_rko rko%rowtype;
    p_plan_acc plan_acc%rowtype;
    p_upr_val currency.id%type;
  begin
  select * into p_rko from RKO where id = p_move_rec.registrator_id;
  select id into p_upr_val from currency where predefined=1;
  
  p_ret_rec:=p_move_rec;
  
  --Субконто дебета
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_deb_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КАССА' then 
        if p_counter = 1 then
            p_ret_rec.subconto1_deb:=p_rko.dest_kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_deb:=p_rko.dest_kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_deb:=p_rko.dest_kassa_id;
        end if;
        end if;
    end loop;
  end if;
  
  --Субконто кредита
  select count(*) into p_sub_count from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id;
  if p_sub_count > 0 then
  p_counter:=0;
    for x in (select * from plan_acc_subconto where plan_acc_id = p_ret_rec.plan_acc_kred_id) loop
        p_counter:=p_counter+1;
        select fullname into p_sub_name from plan_type_subconto where id = x.plan_type_subc;
        if upper(p_sub_name) = 'КАССА' then
        if p_counter = 1 then
            p_ret_rec.subconto1_kred:=p_rko.kassa_id;
        end if; 
        if p_counter = 2 then
            p_ret_rec.subconto2_kred:=p_rko.kassa_id;
        end if;
        if p_counter = 3 then
            p_ret_rec.subconto3_kred:=p_rko.kassa_id;
        end if;
        end if;
    end loop;
  end if;
  
  p_ret_rec.curr_deb := p_rko.curr_id;
  p_ret_rec.summ_val_deb:=entry.sign_of_summ(p_ret_rec.plan_acc_deb_id, p_rko.summa, 1);
  
  p_ret_rec.curr_kred := p_rko.curr_id;
  p_ret_rec.summ_val_kredit:=entry.sign_of_summ(p_ret_rec.plan_acc_kred_id, p_rko.summa, 0);
  
  p_ret_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_deb, p_upr_val, p_ret_rec.period, p_ret_rec.summ_val_deb);
  p_ret_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_ret_rec.curr_kred, p_upr_val, p_ret_rec.period,p_ret_rec.summ_val_kredit);
  
  p_ret_rec.version:=systimestamp;
  
  insert into moves values p_ret_rec;

  exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error rko move for plan accounting! '||SQLERRM, TRUE) ;
  end set_subconto_kassa;

  procedure rko_move_plan_acc(p_id in varchar2) AS
    p_rko_rec rko%rowtype;
    p_move_rec moves%rowtype;
    p_version varchar2(1000);
    in_use exception;
    p_id_other_operation operation_rko.id%type;
    p_id_buyer_operation operation_rko.id%type;
    p_id_supplier_operation operation_rko.id%type;
    p_id_kassa_operation operation_rko.id%type;
    p_counter number(10);
    pragma exception_init(in_use, -54);
    period_blocked EXCEPTION;
  begin
    select * into p_rko_rec from RKO where id = p_id for update nowait;
    if utility.enable_edit(p_rko_rec.id, 'RKO') = 0 then
      --return;
      raise period_blocked;
    end if ;
    
    rko_remove_plan_acc(p_id, p_rko_rec.deleted);
    if p_rko_rec.deleted = 1 then
      return;
    end if;
    
    select to_char(version,'YYYY-MM-DD HH24:MI:SS.FF') into p_version from RKO
      where id = p_id;
    
    select id into p_id_other_operation from operation_rko 
        where upper(name)=upper('OTHER_PAYMENT')
        and rownum = 1;
    select id into p_id_supplier_operation from operation_rko 
        where upper(name)=upper('PAYMENT_SUPPLIER')
        and rownum = 1;   
    select id into p_id_buyer_operation from operation_rko 
        where upper(name)=upper('RETURN_BUYER')
        and rownum = 1;
    select id into p_id_kassa_operation from operation_rko 
        where upper(name)=upper('MOVE_KASSA')
        and rownum = 1;    
    p_move_rec.period:=p_rko_rec.dat;
    p_counter:=0;
    for i in (select * from entry_settings where typedef_id=(select id from type_def where upper(type_def.table_name)=upper('rko')) order by chain) loop
        p_counter:=p_counter+1;
        p_move_rec.registrator_type:=i.typedef_id;
        p_move_rec.registrator_id:=p_id;
        p_move_rec.plan_acc_deb_id:=i.plan_acc_deb_id;
        p_move_rec.activities_id:=p_rko_rec.activities_id;
        p_move_rec.division_id:=p_rko_rec.division_id;
        
        p_move_rec.plan_acc_kred_id:=i.plan_acc_kred_id;
        p_move_rec.description:=i.description;
        
        --РКО - Прочий расход денежных средств
        if p_counter = 1 then 
          if p_rko_rec.operation_id = p_id_other_operation then
            set_subconto_other(p_move_rec);
          end if;  
        end if;
        
        --РКО - Оплата поставщику
        if p_counter = 2 then
          if p_rko_rec.operation_id = p_id_supplier_operation then
            set_subconto_buyer(p_move_rec);
          end if; 
        end if; 
        
        --РКО - Возврат покупателю
        if p_counter = 3 then
          if p_rko_rec.operation_id = p_id_buyer_operation then
            set_subconto_buyer(p_move_rec);
          end if; 
        end if; 
        
        --РКО - Перемещение между кассами
        if p_counter = 4 then
          if p_rko_rec.operation_id = p_id_kassa_operation then
              null;
            set_subconto_kassa(p_move_rec);
          end if; 
        end if; 
    end loop;
    
    p_rko_rec.posted:=1;
    update RKO set row = p_rko_rec
    where id = p_id and version = to_timestamp(p_version,'YYYY-MM-DD HH24:MI:SS.FF'); 
    
    exception
        when period_blocked then
        RAISE_APPLICATION_ERROR (-20003,'Период заблокирован! Редактирование невозможно!', TRUE) ;
        WHEN IN_USE THEN
        RAISE_APPLICATION_ERROR (-20002,'Resource in use! '||SQLERRM, TRUE) ;
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error RKO move for plan accounting! '||SQLERRM, TRUE) ;
  END rko_move_plan_acc;

  procedure rko_remove_plan_acc(p_id in varchar2, p_del in number default 0) AS
    p_rko_rec rko%rowtype;
    p_move_count number;
    p_version varchar2(1000);
    in_use exception;
    pragma exception_init(in_use, -54);
    period_blocked EXCEPTION;
  begin
    select * into p_rko_rec from RKO where id = p_id for update nowait;
    if utility.enable_edit(p_rko_rec.id, 'RKO') = 0 then
      --return;
      raise period_blocked;
    end if ;
    select to_char(version,'YYYY-MM-DD HH24:MI:SS.FF') into p_version from RKO
      where id = p_id;
    select count(*) into p_move_count from moves where registrator_id = p_id;
    if p_move_count > 0 then
      execute immediate ('select * from moves where registrator_id='''||p_id||''' for update nowait');  
      delete from moves where registrator_id = p_id;
    end if; 
    
    if p_del <> 0 then
      p_rko_rec.deleted:=1;
    end if;
    p_rko_rec.posted:=0;
    update RKO set row = p_rko_rec
      where id = p_id and version = to_timestamp(p_version,'YYYY-MM-DD HH24:MI:SS.FF');
  exception
        when period_blocked then
        RAISE_APPLICATION_ERROR (-20003,'Период заблокирован! Редактирование невозможно!', TRUE) ;
        WHEN IN_USE THEN
        RAISE_APPLICATION_ERROR (-20002,'Resource in use! '||SQLERRM, TRUE) ;
        when others then 
        raise_application_error (-20001,'Error RKO move for plan accounting! '||sqlerrm, true) ;
  END rko_remove_plan_acc;

  procedure rko_move_all AS
  begin
    for i in (select * from RKO) loop
    rko_move_plan_acc(i.id);
    end loop;
     exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error rko move  all for plan accounting! '||SQLERRM, TRUE) ;
  END rko_move_all;

  procedure rko_remove_all AS
  begin
    for i in (select * from RKO) loop
    rko_remove_plan_acc(i.id);
    end loop;
     exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error rko remove all for plan accounting! '||SQLERRM, TRUE) ;
  END rko_remove_all;
  
  function get_operationname(p_id in varchar2) return varchar2 as
  pp_id varchar2(60);
  begin
    select r.name into pp_id from operation_rko r where upper(r.id) = upper(p_id);
    return pp_id;
    
    exception
        when no_data_found then 
        return 'none';
  end get_operationname;

END RKO_ENTRY;

/
--------------------------------------------------------
--  DDL for Package Body START_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "START_PKG" AS

  procedure start_move_plan_acc(p_id in varchar2) AS
    p_start_rec start_ost%rowtype;
    p_move_rec moves%rowtype;
    p_version varchar2(1000);
    p_typedef_id varchar2(100);
    in_use exception;
    p_upr_val currency.id%type;
    pragma exception_init(in_use, -54);
    period_blocked EXCEPTION;
  BEGIN
    select * into p_start_rec from START_OST where id = p_id for update nowait;
    if utility.enable_edit(p_start_rec.id, 'START_OST') = 0 then
      --return;
      raise period_blocked;
    end if ;
    start_remove_plan_acc(p_id, p_start_rec.deleted);
    if p_start_rec.deleted = 1 then
      return;
    end if;
    
    select to_char(version,'YYYY-MM-DD HH24:MI:SS.FF') into p_version from START_OST
      where id = p_id;
    
    select id into p_upr_val from currency where predefined=1;  
    select id into p_typedef_id from type_def where upper(type_def.table_name)=upper('start_ost');
    for i in (select * from start_ost_tp where start_ost_id = p_id) loop
      p_move_rec.period:=p_start_rec.dat;
      p_move_rec.registrator_type:=p_typedef_id;
      p_move_rec.registrator_id:=p_id;
      p_move_rec.plan_acc_deb_id:=i.plan_acc_deb_id;
      p_move_rec.activities_id:=p_start_rec.activities_id;
      p_move_rec.division_id:=p_start_rec.division_id;
      
      p_move_rec.subconto1_deb:=i.subconto1_deb;
      p_move_rec.subconto2_deb:=i.subconto2_deb;
        
      p_move_rec.plan_acc_kred_id:=i.plan_acc_kred_id;
      
      p_move_rec.subconto1_kred:=i.subconto1_kred;
      p_move_rec.subconto2_kred:=i.subconto2_kred;
      
      p_move_rec.description:=i.description;
      
      p_move_rec.curr_deb := p_start_rec.curr_id;
      p_move_rec.summ_val_deb:=entry.sign_of_summ(p_move_rec.plan_acc_deb_id, i.summ, 1);
  
      p_move_rec.curr_kred := p_start_rec.curr_id;
      p_move_rec.summ_val_kredit:=entry.sign_of_summ(p_move_rec.plan_acc_kred_id, i.summ, 0);
  
      p_move_rec.summ_upr_deb:=currency_pkg.calculate_from_curr_to_curr(p_move_rec.curr_deb, p_upr_val, p_move_rec.period, p_move_rec.summ_val_deb);
      p_move_rec.summ_upr_kred:=currency_pkg.calculate_from_curr_to_curr(p_move_rec.curr_kred, p_upr_val, p_move_rec.period,p_move_rec.summ_val_kredit);
  
      p_move_rec.version:=systimestamp;
      
      insert into moves values p_move_rec;
    end loop;
    
    p_start_rec.posted:=1;
    update START_OST set row = p_start_rec
      where id = p_id and version = to_timestamp(p_version,'YYYY-MM-DD HH24:MI:SS.FF'); 
    
    exception
        when period_blocked then
        RAISE_APPLICATION_ERROR (-20003,'Период заблокирован! Редактирование невозможно!', TRUE) ;
        WHEN IN_USE THEN
        RAISE_APPLICATION_ERROR (-20002,'Resource in use! '||SQLERRM, TRUE) ;
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error start_ost move for plan accounting! '||SQLERRM, TRUE) ;
  END start_move_plan_acc;

  procedure start_remove_plan_acc(p_id in varchar2, p_del in number default 0) AS
    p_start_rec start_ost%rowtype;
    p_move_count number;
    p_version varchar2(1000);
    in_use exception;
    pragma exception_init(in_use, -54);
    period_blocked EXCEPTION;
  BEGIN
    select * into p_start_rec from START_OST where id = p_id for update nowait;
    if utility.enable_edit(p_start_rec.id,'START_OST') = 0 then
      --return;
      raise period_blocked;
    end if ;
    
    select to_char(version,'YYYY-MM-DD HH24:MI:SS.FF') into p_version from START_OST
      where id = p_id;
    select count(*) into p_move_count from moves where registrator_id = p_id;
    if p_move_count > 0 then
      execute immediate ('select * from moves where registrator_id='''||p_id||''' for update nowait');  
      delete from moves where registrator_id = p_id;
    end if;
    
    if p_del <> 0 then
      p_start_rec.deleted:=1;
    end if;
    p_start_rec.posted:=0;
    update START_OST set row = p_start_rec
      where id = p_id and version = to_timestamp(p_version,'YYYY-MM-DD HH24:MI:SS.FF');
  exception
        when period_blocked then
        RAISE_APPLICATION_ERROR (-20003,'Период заблокирован! Редактирование невозможно!', TRUE) ;
        WHEN IN_USE THEN
        RAISE_APPLICATION_ERROR (-20002,'Resource in use! '||SQLERRM, TRUE) ;
        when others then 
        raise_application_error (-20001,'Error start_ost move for plan accounting! '||sqlerrm, true) ;
  END start_remove_plan_acc;

  procedure start_move_all AS
  BEGIN
    for i in (select * from START_OST) loop
    start_move_plan_acc(i.id);
    end loop;
     exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error start_ost move  all for plan accounting! '||SQLERRM, TRUE) ;
  END start_move_all;

  procedure start_remove_all AS
  BEGIN
    for i in (select * from START_OST) loop
    start_remove_plan_acc(i.id);
    end loop;
     exception
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error start_ost remove all for plan accounting! '||SQLERRM, TRUE) ;
  END start_remove_all;

END START_PKG;

/
--------------------------------------------------------
--  DDL for Package Body USR_SETT
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "USR_SETT" as

  function get_userid(p_u_name in varchar2) return varchar2 as
  p_id varchar2(60);
  begin
    select id into p_id from users where upper(trim(login)) = upper(trim(p_u_name));
    return p_id;
    
    exception
        when no_data_found then 
        return '00000000-0000-0000-0000-000000000000';
  end get_userid;
  
  function get_userfirma(p_id in varchar2) return varchar2 as
  p_ret varchar2(60);
  begin
    select firma_id into p_ret from user_settings where user_id = p_id;
    return p_ret;
    
    exception
        when no_data_found then 
        return '00000000-0000-0000-0000-000000000000';
  end get_userfirma;
  
  function get_currency(p_id in varchar2) return varchar2 as
  p_ret varchar2(60);
  begin
    select currency_id into p_ret from user_settings where user_id = p_id;
    return p_ret;
    
    exception
        when no_data_found then 
        return '00000000-0000-0000-0000-000000000000';
  end get_currency;
  
  function get_division(p_id in varchar2) return varchar2 as
  p_ret varchar2(60);
  begin
    select division_id into p_ret from user_settings where user_id = p_id;
    return p_ret;
    
    exception
        when no_data_found then 
        return '00000000-0000-0000-0000-000000000000';
  end get_division;
  
  function get_kassa(p_id in varchar2) return varchar2 as
  p_ret varchar2(60);
  begin
    select kassa_id into p_ret from user_settings where user_id = p_id;
    return p_ret;
    
    exception
        when no_data_found then 
        return '00000000-0000-0000-0000-000000000000';
  end get_kassa;
  
  function get_mainusluga(p_id in varchar2) return varchar2 as
  p_ret varchar2(60);
  begin
    select main_usluga into p_ret from user_settings where user_id = p_id;
    return p_ret;
    
    exception
        when no_data_found then 
        return '00000000-0000-0000-0000-000000000000';
  end get_mainusluga;
  
  function get_activities(p_id in varchar2) return varchar2 as
  p_ret varchar2(60);
  begin
    select activities_id into p_ret from user_settings where user_id = p_id;
    return p_ret;
    
    exception
        when no_data_found then 
        return '00000000-0000-0000-0000-000000000000';
  end get_activities;

end usr_sett;

/
--------------------------------------------------------
--  DDL for Package Body UTILITY
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "UTILITY" as

  function  uuid	return varchar2 as
  LANGUAGE JAVA
    NAME 'RandomUUID.create() return java.lang.String';
  --end uuid;
  
  FUNCTION              md5(str IN VARCHAR2)
	RETURN VARCHAR2
	as v_checksum VARCHAR2(36);
 
	BEGIN
		v_checksum := LOWER( RAWTOHEX( UTL_RAW.CAST_TO_RAW( sys.dbms_obfuscation_toolkit.md5(input_string => str) ) ) );
		RETURN v_checksum;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
			NULL;
		when others then
			-- Consider logging the error and then re-raise
			raise;
	end md5;
  
  procedure clear_base as --Очистка базы
  begin
    
    for c1 in (select y.table_name, y.constraint_name from user_constraints y, user_tables x 
      where x.table_name = y.TABLE_NAME AND y.CONSTRAINT_TYPE = 'R') loop
    begin
        execute immediate  ('alter table '||c1.table_name||' disable constraint '||c1.constraint_name||' cascade');
    end;
    end loop;

    for t1 in (select table_name from user_tables) loop
    begin
        execute immediate ('truncate table '||t1.table_name);
    end;
    end loop;

    for c2 in (select y.table_name, y.constraint_name from user_constraints y, user_tables x 
      where x.table_name = y.TABLE_NAME AND y.CONSTRAINT_TYPE = 'R') loop
    begin
        execute immediate ('alter table '||c2.table_name||' enable constraint '||c2.constraint_name);
    end;
    end loop;
    
    EXCEPTION
    WHEN OTHERS THEN
			-- Consider logging the error and then re-raise
			RAISE;
  end; 
  
  procedure  get_acc_plan_xml as
  host varchar2(100 char) :='bmexp.com';
  port varchar2(2 char) :=21;
  user_f varchar2(100 char) :='toftpconnect';
  pass varchar2(100 char) :='vjqangghjcnjzlkjdsqcwerj';
  l_conn  UTL_TCP.connection;
  clobdata clob;
  count_xml number;
  begin
    select count(*) into count_xml from XML_T;
    l_conn := ftp.login(host, port, user_f, pass, 60);
    ftp.ascii(p_conn => l_conn);
    clobdata:=ftp.get_remote_ascii_data(p_conn      => l_conn,
          p_file => '/acc_plan/acc_plan_bud.xml');
    if CLOBDATA is not null then
    if count_xml = 0 then
      insert into XML_T (ONE) values (xmltype(CLOBDATA));
    else
      update XML_T set ONE = xmltype(CLOBDATA)
      where id = (select max(id) from xml_t);
    end if;  
    end if;        
    ftp.logout(l_conn);
    
    EXCEPTION
    WHEN OTHERS THEN
			-- Consider logging the error and then re-raise
			RAISE;
  end;
  
  procedure set_acc_plan as
  begin
    get_acc_plan_xml();
    --План счетов
    insert into plan_acc(id,acc_type,parent_id,fullname,zabalansov,valutn,kolishestv,code) 
        select t.ref,
        (select id from enum_account_type where upper(fullname)=upper(acc_type_conv(t.type))),
        case when t.parent = '00000000-0000-0000-0000-000000000000' then null
        else t.parent end,
        t.disc,
        bool_to_num(t.offbalance),
        bool_to_num(t.valunt),
        bool_to_num(t.kolich),
        t.code
        from (select extract(one, '/V8Exch:_1CV8DtUD/V8Exch:Data/ChartOfAccountsObject.Бюджетирование','xmlns:V8Exch="http://www.1c.ru/V8/1CV8DtUD/" xmlns:v8="http://v8.1c.ru/data" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"') one
              from xml_t where id=(select max(id) from xml_t)) p,
              xmltable('/ChartOfAccountsObject.Бюджетирование' passing p.one
                      columns Ref VARCHAR2(100) PATH 'Ref',
                          disc varchar2(1000) path 'Description',
                          code varchar2(100) path 'Code',
                          type varchar2(100) path 'Type',
                          parent varchar2(100) path 'Parent',
                          offbalance varchar2(100) path 'OffBalance',
                          valunt varchar2(100) path 'Валютный',
                          kolich varchar2(100) path 'Количественный'
                          ) t
        order by t.code;
     --Субконто плана счетов   
     insert into plan_acc_subconto (plan_acc_id,plan_type_subc,oborot_only,summovoy)
     select * from (select t.id, 
     plan_type_subconto_conv((select disc
     from (select extract(one, '/V8Exch:_1CV8DtUD/V8Exch:Data/ChartOfCharacteristicTypesObject.ВидыСубконтоБюджетирования','xmlns:V8Exch="http://www.1c.ru/V8/1CV8DtUD/" xmlns:v8="http://v8.1c.ru/data" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"') one
              from xml_t where id=(select max(id) from xml_t)) p,
              xmltable('/ChartOfCharacteristicTypesObject.ВидыСубконтоБюджетирования' passing p.one
                      columns Ref VARCHAR2(100) PATH 'Ref',
                          disc varchar2(100) path 'Description'
                          ) t where ref = li.dimensiontype)) subconto,
    bool_to_num(li.turnovers), bool_to_num(li.summovoy) from
    (select extract(one, '/V8Exch:_1CV8DtUD/V8Exch:Data/ChartOfAccountsObject.Бюджетирование','xmlns:V8Exch="http://www.1c.ru/V8/1CV8DtUD/" xmlns:v8="http://v8.1c.ru/data" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"') one
                           FROM xml_t where id=(select max(id) from xml_t)) p,
       XMLTable('/ChartOfAccountsObject.Бюджетирование' PASSING p.one
                COLUMNS id VARCHAR2(100) PATH 'Ref',
                        lineitem  xmltype      path 'ExtDimensionTypes') t ,
       xmltable('/ExtDimensionTypes/Row' passing t.lineitem
                columns dimensiontype varchar2(100) path 'ExtDimensionType',
                        turnovers varchar2(100) path 'TurnoversOnly',
                        summovoy varchar2(100) path 'Суммовой',
                        kolishestv varchar2(100) path 'Количественный',
                        valutn varchar2(100) path 'Валютный') li)
      where subconto is not null;
  
  EXCEPTION
    WHEN OTHERS THEN
			-- Consider logging the error and then re-raise
			RAISE;      
  end;
  
  procedure first_start as --Первый запуск базы
  p_uid varchar2(50);
  fs number(5);
  begin
    select nvl(count(*),0) into fs from users;
    if fs<>0 then
      return;
    end if;
    --Заполнение типов данных
    insert into type_def(table_name) select table_name from user_tables;
    --Заполнение справочника субконто
    insert into plan_type_subconto(type_of_obj,fullname) select id,
      case when upper(table_name) = upper('kontragents')
      then 'Контрагенты'
      when upper(table_name) = upper('kassa')
      then 'Касса'
      when upper(table_name) = upper('zatraty')
      then 'Статья затрат'
      when upper(table_name) = upper('nomenklatura')
      then 'Номенклатура'
      when upper(table_name) = upper('divisions')
      then 'ЦФО'
      end fullname
      from type_def where
        upper(table_name) = upper('kontragents') or
        upper(table_name) = upper('nomenklatura') or
        upper(table_name) = upper('kassa') or
        upper(table_name) = upper('zatraty') or
        upper(table_name) = upper('divisions');
    
    --Заполнение типов счетов    
    insert into enum_account_type(fullname)
        values('Активный');
    insert into enum_account_type(fullname)
        values('Пассивный');  
    insert into enum_account_type(fullname)
        values('Активный/Пассивный');
    --Заполнение плана счетов    
    set_acc_plan();
    
    --Инициализация нумератора документов
    insert into numerator(typedef_id,prefix)
        values((select id from type_def where upper(table_name)=upper('orders')),'OR-');
    insert into numerator(typedef_id,prefix)
        values((select id from type_def where upper(table_name)=upper('other_zatraty')),'OR-'); 
    insert into numerator(typedef_id,prefix)
        values((select id from type_def where upper(table_name)=upper('pko')),'OR-');
    insert into numerator(typedef_id,prefix)
        values((select id from type_def where upper(table_name)=upper('rko')),'OR-'); 
    insert into numerator(typedef_id,prefix)
        values((select id from type_def where upper(table_name)=upper('start_ost')),'OR-');
    insert into numerator(typedef_id,prefix)
        values((select id from type_def where upper(table_name)=upper('profit_distrib')),'OR-');    
    
    --Справочник единиц измерений
    insert into measure_unit(fullname,code) 
        values('шт','796');
    insert into measure_unit(fullname,code) 
        values('кг','166');
    insert into measure_unit(fullname,code) 
        values('услуга','808');
    insert into measure_unit(fullname,code) 
        values('м','006');    
    
    --Справочник пользователей, пользователь-администратор
    insert into users(first_name,last_name,email,is_admin,login,pass_wd,predefined) 
      values('Viacheslav','Bakum','bakum@bmexp.com',1,'sysdba','1',1);
    
    --Справочник валют  
    insert into currency(code,fullname,namefull,predefined,id_xml)
      values('980','грн','Гривна',1,'0');
      
    select uuid() into p_uid from dual;  
    insert into currency(id, code,fullname,namefull,predefined,id_xml)
      values(p_uid,'840','usd','USD',0,'6');
    insert into ex_rates_settings(curr_id) values (p_uid);
    
    select uuid() into p_uid from dual;  
    insert into currency(id,code,fullname,namefull,predefined,id_xml)
      values(p_uid,'978','EUR','Евро',0,'8'); 
    insert into ex_rates_settings(curr_id) values (p_uid);
    
    select uuid() into p_uid from dual;  
    insert into currency(id,code,fullname,namefull,predefined,id_xml)
      values(p_uid,'643','RUB','Рубль',0,'17');   
    insert into ex_rates_settings(curr_id) values (p_uid); 
    
    --Справочник подразделений
    insert into divisions(fullname,is_group,predefined)
      values('Филиалы',1,1);
    insert into divisions(fullname,parent_id,is_group)
      values('Украина',(select id from divisions where fullname = 'Филиалы'),1);  
    
    --Справочник номенклатуры  
    insert into nomenklatura(fullname,is_group,usluga,predefined)
      values('Номенклатура',1,0,1);
    insert into nomenklatura(fullname,is_group,parent_id,usluga,predefined)
      values('Услуги',1,(select id from nomenklatura where fullname = 'Номенклатура'),0,0); 
    
    --Справочник организаций  
    insert into firms(fullname,printname,ur_fiz)
      values('Организация','Моя организация',1);
    
    --Справочник контрагентов
    insert into kontragents(fullname,is_group,predefined)
      values('Контрагенты',1,1);
    insert into kontragents(fullname,is_group,parent_id,predefined)
      values('Поставщики',1,(select id from kontragents where fullname = 'Контрагенты'),1);
    insert into kontragents(fullname,is_group,parent_id,predefined)
      values('Покупатели',1,(select id from kontragents where fullname = 'Контрагенты'),1);
    insert into kontragents(fullname,is_group,parent_id,predefined)
      values('Замерщики',1,(select id from kontragents where fullname = 'Контрагенты'),1); 
    insert into kontragents(fullname,is_group,parent_id,predefined)
      values('Прорабы',1,(select id from kontragents where fullname = 'Контрагенты'),1);
    insert into kontragents(fullname,is_group,parent_id,predefined)
      values('Прочие',1,(select id from kontragents where fullname = 'Контрагенты'),1);  
    
    --Перечисление базы расчетов  
    insert into BASE_OF_CALC(name, fullname)
      values('Процент','Процент');
    insert into BASE_OF_CALC(name, fullname)
      values('ФиксированнойСуммой','Фиксированной суммой');  
    
    --Виды деятельности
    insert into type_of_activities(fullname)
        values('Юриспруденция');
    insert into type_of_activities(fullname)
        values('Окна');
    insert into type_of_activities(fullname)
        values('Мебель');
    
    --Статусы заказа
    insert into ORDER_STATUS(name, fullname)
        values('ВРаботе','В работе');
    insert into ORDER_STATUS(name, fullname)
        values('ВРасчете','В расчёте');
    insert into ORDER_STATUS(name, fullname)
        values('Выполнен','Выполнен'); 
    insert into ORDER_STATUS(name, fullname)
        values('Замер','Замер');
    insert into ORDER_STATUS(name, fullname)
        values('Новый','Новый');
    insert into ORDER_STATUS(name, fullname)
        values('Закрыт','Закрыт'); 
    insert into ORDER_STATUS(name, fullname)
        values('Аннулирован','Аннулирован');
    insert into ORDER_STATUS(name, fullname)
        values('НеОплачен','Не оплачен'); 
    insert into ORDER_STATUS(name, fullname)
        values('Отказ','Отказ'); 
    insert into ORDER_STATUS(name, fullname)
        values('Контроль','Контроль');     
    
    --Статусы звонков 
    insert into CALL_STATUS(name, fullname)
        values('New','Новый'); 
    insert into CALL_STATUS(name, fullname)
        values('Pending','В ожидании'); 
    insert into CALL_STATUS(name, fullname)
        values('FailedSubmit','Неудачный');
    
    --Статусы результата звонков
    insert into CALL_RESULTS(name, fullname)
        values('Sales','Продажа');
    insert into CALL_RESULTS(name, fullname)
        values('WrongNumber','Неверный номер');
    insert into CALL_RESULTS(name, fullname)
        values('InvalidNumber','Недействительный номер');
    insert into CALL_RESULTS(name, fullname)
        values('Voicemail','Голосовая почта');
    insert into CALL_RESULTS(name, fullname)
        values('PowerOff','Номер отключен');    
    insert into CALL_RESULTS(name, fullname)
        values('NoAnswer','Нет ответа');
    insert into CALL_RESULTS(name, fullname)
        values('SendFax','Отправить факс');
    insert into CALL_RESULTS(name, fullname)
        values('SendMail','Отправить почту');    
    insert into CALL_RESULTS(name, fullname)
        values('Success','Успешно');    
    insert into CALL_RESULTS(name, fullname)
        values('Fail','Неудача');    
    insert into CALL_RESULTS(name, fullname)
        values('AnswerMachine','Автоответчик');    
    insert into CALL_RESULTS(name, fullname)
        values('DontCallAgain','Больше не звонить');    
    insert into CALL_RESULTS(name, fullname)
        values('NotInterested','Не интересует');    
    insert into CALL_RESULTS(name, fullname)
        values('CallLater','Перезвонить позже');
    insert into CALL_RESULTS(name, fullname)
        values('Measuring','Вызов на замер'); 
        
    --Виды операций ПКО    
    Insert into OPERATION_PKO (NAME,FULLNAME)
      values ('OTHER_PAYMENT','Прочие приходы денежных средств');
    Insert into OPERATION_PKO (NAME,FULLNAME)
      values ('FROM_BUYER','Оплата от покупателя');
      Insert into OPERATION_PKO (NAME,FULLNAME)
    values ('RETURN_SUPPLIER','Возврат от поставщика');
    
    --Виды операций РКО    
    Insert into OPERATION_RKO (NAME,FULLNAME)
      values ('OTHER_PAYMENT','Прочий расход денежных средств');
    Insert into OPERATION_RKO (NAME,FULLNAME)
      values ('PAYMENT_SUPPLIER','Оплата поставщику');
    Insert into OPERATION_RKO (NAME,FULLNAME)
      values ('RETURN_BUYER','Возврат покупателю');
    Insert into OPERATION_RKO (NAME,FULLNAME)
      values ('MOVE_KASSA','Перемещение между кассами');  
        
        
     --Кампании (колл-листы) по-умолчанию
     insert into COMPAIGNS(name, PREDEFINED)
        values('hot',1);
     insert into COMPAIGNS(name, PREDEFINED)
        values('cold',1);
     
     --Настройки начислений по-умолчанию   
     insert into PAY_SETTINGS (name,fullname,stavka,base_id) 
      values ('NET','Сетевые',2.68,(select id from BASE_OF_CALC where upper(name) like upper('Процент')));
     insert into PAY_SETTINGS (name,fullname,stavka,base_id) 
      values ('ZAMER','Комиссия земерщику',3,(select id from BASE_OF_CALC where upper(name) like upper('Процент')));
     insert into PAY_SETTINGS (name,fullname,stavka,base_id) 
      values ('OFFICE','Офисные',14,(select id from BASE_OF_CALC where upper(name) like upper('Процент')));
     
     --База расчетов для начислений 
     Insert into DBA_DIVAS.BASE_OF_NACHISL (NAME,FULLNAME)
      values ('IERARHIA','В иерархии');
     Insert into DBA_DIVAS.BASE_OF_NACHISL (NAME,FULLNAME)
      values ('ORDER','По заказу');
     Insert into DBA_DIVAS.BASE_OF_NACHISL (NAME,FULLNAME)
      values ('DIV','По подразделению'); 
    
    --Проводки для заказа
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('orders')),
               (select id from plan_acc where code = '20711'),
               (select id from plan_acc where code = '600'),1,
               'Проводка ТЧ Услуги - Выполнили работы');
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('orders')),
               (select id from plan_acc where code = '2081'),
               (select id from plan_acc where code = '20711'),2,
               'Проводка ТЧ Оплаты - Получили предоплату');
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('orders')),
               (select id from plan_acc where code = '5091'),
               (select id from plan_acc where code = '2081'),3,
               'Проводка ТЧ Оплаты - Замерщик взял деньги'); 
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('orders')),
               (select id from plan_acc where code = '80213'),
               (select id from plan_acc where code = '2081'),4,
               'Проводка ТЧ Расходы - РКО на себестоимость');
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('orders')),
               (select id from plan_acc where code = '701'),
               (select id from plan_acc where code = '80213'),5,
               'Проводка ТЧ Расходы - Закрытие себестоимости заказа после выполнения'); 
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('orders')),
               (select id from plan_acc where code = '701'),
               (select id from plan_acc where code = '5091'),6,
               'Проводка ТЧ Начисления - Начисления на себестоимость (комиссия и т.д.)'); 
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('orders')),
               (select id from plan_acc where code = '600'),
               (select id from plan_acc where code = '701'),7,
               'Закрытие заказа - выполнен!'); 
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('orders')),
               (select id from plan_acc where code = '600'),
               (select id from plan_acc where code = '900'),8,
               'Заказ выполнен - Отнесение маржи на финансовый результат');           
               
    --Проводки для Прочих затрат           
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('OTHER_ZATRATY')),
               (select id from plan_acc where code = '80212'),
               (select id from plan_acc where code = '2081'),1,
               'Проводка ТЧ Затраты - Списание на административные затраты');
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('OTHER_ZATRATY')),
               (select id from plan_acc where code = '900'),
               (select id from plan_acc where code = '80212'),2,
               'Проводка ТЧ Затраты - Списание на затрат на финансовый результат');
   
    --Проводки для ПКО             
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('PKO')),
               (select id from plan_acc where code = '2081'),
               (select id from plan_acc where code = '000'),1,
               'ПКО - Прочие приходы денежных средств'); 
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('PKO')),
               (select id from plan_acc where code = '2081'),
               (select id from plan_acc where code = '20711'),2,
               'ПКО - Оплата от покупателя'); 
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('PKO')),
               (select id from plan_acc where code = '2081'),
               (select id from plan_acc where code = '5091'),3,
               'ПКО - Возврат от поставщика'); 
               
    --Проводки для РКО             
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('RKO')),
               (select id from plan_acc where code = '000'),
               (select id from plan_acc where code = '2081'),1,
               'РКО - Прочий расход денежных средств'); 
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('RKO')),
               (select id from plan_acc where code = '5091'),
               (select id from plan_acc where code = '2081'),2,
               'РКО - Оплата поставщику'); 
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('RKO')),
               (select id from plan_acc where code = '20711'),
               (select id from plan_acc where code = '2081'),3,
               'РКО - Возврат покупателю');
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('RKO')),
               (select id from plan_acc where code = '2081'),
               (select id from plan_acc where code = '2081'),4,
               'РКО - Перемещение между кассами');
    
    --Проводки для PROFIT_DISTRIB (распределение прибыли)
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('PROFIT_DISTRIB')),
               (select id from plan_acc where code = '900'),
               (select id from plan_acc where code = '5091'),1,
               'PROFIT - Распределение прибыли');
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id,chain,description)
        values((select id from type_def where upper(type_def.table_name)=upper('PROFIT_DISTRIB')),
               (select id from plan_acc where code = '900'),
               (select id from plan_acc where code = '900'),2,
               'PROFIT - Переброс прибыли на головное подразделение');           
      
    
    EXCEPTION
    WHEN OTHERS THEN
    -- Consider logging the error and then re-raise
        RAISE;
  end;
  
  procedure enable_constraint as
  begin
  for c2 in (select y.table_name, y.constraint_name from user_constraints y, user_tables x where x.table_name = y.table_name) loop
    begin
        execute immediate ('alter table '||c2.table_name||' enable constraint '||c2.constraint_name);
    end;
    end loop;
    
    EXCEPTION
    WHEN OTHERS THEN
			-- Consider logging the error and then re-raise
			RAISE;
  end;
  
  procedure disable_constraint as
  begin
  for c2 in (select y.table_name, y.constraint_name from user_constraints y, user_tables x where x.table_name = y.table_name) loop
    begin
        execute immediate ('alter table '||c2.table_name||' disable constraint '||c2.constraint_name);
    end;
    end loop;
    
    EXCEPTION
    WHEN OTHERS THEN
			-- Consider logging the error and then re-raise
			RAISE;
  end;
  
  function retrieve_customer_parentid return varchar2
  as v_return VARCHAR2(36);
  begin
    select id into v_return from kontragents where upper(fullname) = upper('Покупатели');
    return v_return;
  exception
  when others then
    return null;
  end;
  
  function retrieve_customer_parentname return varchar2
  as v_return VARCHAR2(150);
  begin
    select fullname into v_return from kontragents where upper(fullname) = upper('Покупатели');
    return v_return;
  exception
  when others then
    return null;
  end;
  
  procedure add_kontragent_to_call_list(p_kontrag_id in varchar2, p_compaign_id in varchar2)
  as
  begin
  for i in (select * from contact_details where kontrag_id = p_kontrag_id) loop
    insert into COMPAIGNS_DETAILS (compaign_id,kontrag_id,contact_id) 
      values(p_compaign_id,p_kontrag_id,i.id);
  end loop;
  exception
  when others then
    raise;
  end;
  
  procedure rem_kontragent_from_call_list(p_kontrag_id in varchar2)
  as
  cl_rec compaigns_details%rowtype;
  begin
  select * into cl_rec from compaigns_details where id = p_kontrag_id for update;
  delete from compaigns_details where id = p_kontrag_id;
  exception
  when others then
    raise;
  end;
  
  function retrieve_division_parentid return varchar2
  as v_return VARCHAR2(36);
  begin
    select id into v_return from DIVISIONS where parent_id is null and is_group = 1;
    return v_return;
  exception
  when others then
    return null;
  end;
  
  procedure change_parent_in_division(p_id in varchar2, p_parent_id in varchar2)
  as
  div_rec divisions%rowtype;
  begin
  select * into div_rec from divisions where id = p_id for update;
  div_rec.parent_id:=p_parent_id;
  update divisions
    set row = div_rec
  where id = p_id;
  exception
  when others then
    raise;
  end;
  
  procedure add_user_to_group(p_user in varchar2, p_group in varchar2)
  as
  begin
    insert into groupmembers (g_name, g_member) values (p_group,p_user);
    exception
    when others then
    raise;
  end;
  
  function retrieve_zamer_parentid return varchar2
  as v_return VARCHAR2(36);
  begin
    select id into v_return from kontragents where upper(fullname) = upper('Замерщики');
    return v_return;
  exception
  when others then
    return null;
  end;
  
  function retrieve_supplier_parentid return varchar2
  as v_return VARCHAR2(36);
  begin
    select id into v_return from kontragents where upper(fullname) = upper('Прорабы');
    return v_return;
  exception
  when others then
    return null;
  end;
  
  function retrieve_other_parentid return varchar2
  as v_return VARCHAR2(36);
  begin
    select id into v_return from kontragents where upper(fullname) = upper('Прочие');
    return v_return;
  exception
  when others then
    return null;
  end;
  
  function retrieve_name_baseofcalc(p_id in varchar2) return varchar2
  as v_return VARCHAR2(100);
  begin
    select b.name into v_return from BASE_OF_CALC b where upper(b.id) = upper(p_id);
    return v_return;
  exception
  when others then
    return null;
  end;
  
  function retrieve_idfix_baseofcalc return varchar2
  as v_return VARCHAR2(50);
  begin
    select b.id into v_return from BASE_OF_CALC b where upper(b.name) like upper('ФиксированнойСуммой');
    return v_return;
  exception
  when others then
    return null;
  end;
  
  function retrieve_idfromalgorythm(p_id in varchar2) return varchar2
  as v_return VARCHAR2(100);
  begin
    select b.base_id into v_return from PAY_SETTINGS b where upper(b.id) = upper(p_id);
    return v_return;
  exception
  when others then
    return null;
  end;
  
  function retrieve_name_basenachisl(p_id in varchar2) return varchar2
  as v_return VARCHAR2(100);
  begin
    select b.name into v_return from BASE_OF_NACHISL b where upper(b.id) = upper(p_id);
    return upper(v_return);
  exception
  when others then
    return null;
  end;
  
  procedure createKontrag(p_name in varchar2, p_user_id in varchar2,
            p_isSupp in number, p_isMeasr in number , p_isByer in number) as
  p_parent varchar2(100);
  begin
    if p_isSupp = 1 then
      p_parent:=retrieve_supplier_parentid();
    end if;
    if p_isMeasr = 1 then
      p_parent:=retrieve_zamer_parentid();
    end if;
    if p_isByer = 1 then
      p_parent:=retrieve_customer_parentid();
    else
      p_parent:=retrieve_other_parentid();
    end if;
    insert into kontragents(is_group,parent_id,fullname,deleted,is_supplier,
      is_buyer,is_measurer, user_id) values
      (0,p_parent,p_name,0,p_isSupp,p_isByer,p_isMeasr,p_user_id); 
  end;

  procedure createZatraty(p_name in varchar2) as
  p_zrecord zatraty%rowtype;
  begin
   p_zrecord.is_Group:=0;
   p_zrecord.deleted:=0;
   p_zrecord.fullname:=p_name;
   p_zrecord.version:=systimestamp;
   p_zrecord.predefined:=0;
   insert into zatraty values p_zrecord;
  end;
  
  --'1' - разрешено редактирование; '0' - не разрешено
  function enable_edit_all(p_date in date) return number as
  p_dat_sett date;
  begin
    select DATE_AFTER into p_dat_sett from PROG_SETTINGS where rownum=1;
    if trunc(p_dat_sett) >= trunc(p_date) then
      return 0;
    else
      return 1;
    end if;
    
    exception
    when others then
      return 1;
  end enable_edit_all;
  
  --'1' - разрешено редактирование; '0' - не разрешено
  function enable_edit_profit(p_date in date) return number as
  p_dat_sett date;
  begin
    select DATE_AFTER_PROFIT into p_dat_sett from PROG_SETTINGS where rownum=1;
    if trunc(p_dat_sett) >= trunc(p_date) then
      return 0;
    else
      return 1;
    end if;
    
    exception
    when others then
      return 1;
  end enable_edit_profit;
  
  function get_date_profit return date as
  p_dat_sett date;
  begin
   select DATE_AFTER_PROFIT into p_dat_sett from PROG_SETTINGS where rownum=1;
    return p_dat_sett;
    
    exception
    when others then
      return to_date('01-01-1970 00:00:00','DD-MM-YYYY HH24:MI:SS');
  end;

  --'1' - разрешено редактирование; '0' - не разрешено
  function enable_edit(p_id in varchar2, p_type in varchar2) return number as
  p_dat_sett date;
  p_dat_after date;
  p_flag number:=1;
  begin
    execute immediate ('select dat from '||p_type||' where id='''||p_id||'''') into p_dat_sett; 
    if enable_edit_all(p_dat_sett) = 0 then
      return 0;
    end if;
    
    if upper(p_type) = 'ORDERS' or upper(p_type) = 'OTHER_ZATRATY' or upper(p_type) = 'START_OST' then
      if enable_edit_profit(p_dat_sett) = 0 then
        if upper(p_type) = 'ORDERS' then
        p_dat_after:=get_date_profit();
          for i in (select * from orders where id = p_id and status_id in (select id from order_status where name in (
              'Аннулирован','Закрыт', 'Выполнен','Отказ')) and trunc(dat_complete_fact) < trunc(p_dat_after)) loop
              p_flag:=0;
          end loop;
          return p_flag;
        else
          return 0;
        end if;
      end if;
    end if;
    
    return 1;
    
    exception
    when others then
      return 1;
  end enable_edit;
  
  procedure set_disable_edit_profit(p_date in date) as
  p_prog_sett prog_settings%rowtype; 
  begin
    for i in (select * from prog_settings where rownum = 1) loop
      i.date_after_profit:=p_date;
      update prog_settings
      set row = i where id = i.id;
      return;
    end loop;
    
    p_prog_sett.date_after_profit:=p_date;
    insert into prog_settings values p_prog_sett;
  end set_disable_edit_profit;
  
  function user_exists(p_login in varchar2) return varchar2 as
  begin
  for i in (select * from users 
        where upper(login) = upper(p_login) and is_active = 1
        and rownum = 1) loop
    return '1';
  end loop;
  return '0';
  end user_exists;
  
  function access_enabled(p_login in varchar2) return varchar2 as
  user_rec users%rowtype;
  begin
    select * into user_rec from users where upper(login) = upper(p_login) and rownum = 1;
    if user_rec.is_admin = 1 then
      return '1';
    end if; 
    
    if user_rec.DATE_BEFORE is null then
      return '0';
    elsif user_rec.DATE_BEFIRE_ACCEPT = 0 then
      return '0';
    end if;
    
    if trunc(user_rec.DATE_BEFORE) >= trunc(sysdate) then
      return '1';
    else 
      return '0';
    end if;  
    
  end access_enabled;
  
  function generate_code(p_login in varchar2, p_date in date) return varchar2 as
  p_code varchar2(100);
  begin
    select ora_hash(to_number(to_char(p_date, 'ddMMYYYY'))||p_login) into p_code from dual;
    return p_code;
  end generate_code;
  
  procedure accept_code(p_login in varchar2, p_code in varchar2) as
  code_corrupted EXCEPTION;
  date_is_empty EXCEPTION;
  code_allreadyuse EXCEPTION;
  user_rec users%rowtype;
  pp_code varchar2(100);
  begin
    select * into user_rec from users where upper(login) = upper(p_login) and rownum = 1
                                      for update nowait;
    if user_rec.date_before is null then
      raise date_is_empty;
    end if;
    pp_code:= generate_code(p_login,user_rec.date_before);
    if p_code != pp_code then
      raise code_corrupted;
    end if;
    
    if user_rec.DATE_BEFIRE_ACCEPT = 1 then
      raise code_allreadyuse;
    end if;
    
    user_rec.DATE_BEFIRE_ACCEPT:=1;
    update users set row = user_rec
    where id = user_rec.id;
    
    exception
        when code_corrupted then
        RAISE_APPLICATION_ERROR (-20002,'Ошибка валидации кода!', TRUE) ;
        when code_allreadyuse then
        RAISE_APPLICATION_ERROR (-20004,'Код уже используется Валидация не возможна!', TRUE) ;
        when date_is_empty then
        RAISE_APPLICATION_ERROR (-20003,'Код не может быть подтвержден! Проверьте дату валидации', TRUE) ;
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Неожиданная ошибка! '||SQLERRM, TRUE) ;
  end accept_code;
  
  function getSummOrder(p_order in varchar2) return number as
  res number;
  addwork number;
  begin
  select sum(summ) into res from orders_tp_uslugi where order_id = p_order;
  select sum(price_add) into addwork from orders_tp_uslugi where order_id = p_order;
  return nvl(res,0)+nvl(addwork,0);
  end getSummOrder;
  
  function getSummOplata(p_order in varchar2) return number as
  res number;
  begin
  select sum(otp.sum) into res from orders_tp_oplaty otp where order_id = p_order;
  return nvl(res,0);
  end getSummOplata;
  
  function order_payed_percent(p_order in varchar2) return varchar2
  as
  summ number:=0;
  summ_opl number:=0;
  begin
    summ:= getSummOrder(p_order);
    summ_opl:= getSummOplata(p_order);
    If (summ = 0 or summ_opl = 0) then
      return 'Не оплачен';
    end if;
    return TO_CHAR(100*summ_opl/summ, '9990.99')||'%';
    
    exception
      when others then 
        return 'Не оплачен';
  end order_payed_percent;
  
  function ballans_by_kontr(p_id in varchar2, p_code in varchar2) return number as
  res number;
  begin
    select ballans into res from ballans_by_kontrag where code like p_code and upper(id) = upper(p_id);
    return res;
    
    exception
      when others then
        return null;
  end ballans_by_kontr;
  
end utility;

/
