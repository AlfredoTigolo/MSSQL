/*
     file: e7_ssrv2_db_mirring
     author: alfredo tigolo iiI
     description: This is the sql script helps by trying to figure out the status of the databases during
     mirroring and recovery phase.  View the sql server logs to get a better understanding of what is going
     on with each database.

There is a nice utility on the web called Process Explorer which you can download from www.sysinternals.com.
source: http://searchsystemschannel.techtarget.com/generic/0,295582,sid99_gci1247520,00.html
*/
--Contains one row for each database in the instance of SQL Server. 
--If the database is not ONLINE or database mirroring is not enabled, 
--the values of all columns except database_id will be NULL. 
--source: http://msdn.microsoft.com/en-us/library/ms178655.aspx
--SELECT * FROM SYS.DATABASE_MIRRORING;

--Contains one row per database in the instance of Microsoft SQL Server.
--If a database is not ONLINE or AUTO_CLOSE is set to ON, the values of some 
--columns may be NULL. If a database is OFFLINE, the corresponding row is not 
--visible to low-privileged users. To see the corresponding row if the database is 
--OFFLINE, a user must have at least the ALTER ANY DATABASE server-level permission 
--or the CREATE DATABASE permission in the master database.
--source: http://msdn.microsoft.com/en-us/library/ms178534.aspx

--SELECT * FROM SYS.DATABASES;
--SELECT NAME, DATABASE_ID, STATE_DESC, RECOVERY_MODEL_DESC, SERVICE_BROKER_GUID, IS_BROKER_ENABLED FROM SYS.DATABASES;

-- COMBINING SYS.DATABASE_MIRRIORING and SYS.DATABASES WITH A WHERE CLAUSE THAT COMPARES THE DATABASE_ID
SELECT
     sysdbm.database_id, 
     name, -- database name
     state_desc, 
     mirroring_state_desc, 
     mirroring_role_desc, 
     mirroring_partner_name,
     recovery_model_desc
FROM SYS.DATABASE_MIRRORING AS SYSDBM, SYS.DATABASES AS SYSDB WHERE SYSDBM.DATABASE_ID = SYSDB.DATABASE_ID;

-- the fields for database_mirroring and databases
SELECT * FROM SYS.DATABASE_MIRRORING AS SYSDBM, SYS.DATABASES AS SYSDB WHERE SYSDBM.DATABASE_ID = SYSDB.DATABASE_ID;

