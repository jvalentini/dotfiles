-- $Id: //ext/sqlplus/login.sql#8 $
--   HOWTO: change ~ to your home directory

-- quiet init
SET TERMOUT OFF

DEFINE user_name='justin'

-- edit buffer file
SET EDITFILE /home/&&user_name/.sqlplus/edit.buffer
-- convenience: SQL>@SQL_ENV will return us to login.sql settings
DEFINE SQL_ENV='/home/&&user_name/.sqlplus/login.sql'

SET FEEDBACK OFF
-- enable resumable space allocation and resumable statements; see dbms_resumable
ALTER SESSION ENABLE RESUMABLE TIMEOUT 172800;
-- informative date format
ALTER SESSION SET NLS_DATE_FORMAT = 'mm-dd-yyyy HH24:mi:ss';
--ALTER SESSION SET NLS_DATE_FORMAT = 'fxYYYY-MM-DD HH24:MI:SS' ;
-- set time zone
ALTER SESSION SET TIME_ZONE = 'US/EASTERN';
-- show number of records returned
SET FEEDBACK ON
-- trim spooled data
SET TRIMSPOOL ON
-- do not flag deviations from ANSI/ISO SQL92
SET FLAGGER OFF
-- do not echo SET
SET SHOWMODE OFF
-- don't show elapsed time after commands
SET TIMING OFF
-- let ora9i know what commands files we're running
SET APPINFO ON
-- enable variable substitution
SET DEFINE ON
-- echo variable substitutions
SET VERIFY OFF
-- how many characters on a line? how wide is terminal ?
--SET LINESIZE 239 use stty
SET LINESIZE 184 use stty
-- how many lines per page? how high is terminal ?
SET PAGESIZE 10000
-- how many characters to return from LONG columns; e.g., dba_views.text
SET LONG 32000
-- what to display when a column is NULL
SET NULL '--'
-- show column headings
SET HEADING ON
-- separator between column headings
SET COLSEP '| '
-- char that can be printed between records
SET RECSEPCHAR '-'
-- don't print separator between records
SET RECSEP OFF
-- wrap long lines
SET WRAP OFF
-- what to echo when PAUSE appears in script
SET PAUSE 'press ENTER to continue...'
-- print output from DBMS_OUTPUT.PUT_LINE()
SET SERVEROUTPUT ON SIZE 1000000 FORMAT TRUNCATED
-- don't autocommit, unless you get rocks in ur head
SET AUTOCOMMIT OFF
-- top title for reports
TTITLE OFF
-- bottom title for reports
BTITLE OFF
-- get rid of left over settings
CLEAR COLUMNS
CLEAR BREAKS
-- use spaces instead of tabs
SET TAB OFF

-- for SHOW ERRORS
COLUMN "LINE/COL" FORMAT A8
COLUMN "ERROR"    FORMAT A65 WORD_WRAPPED

--SET AUTOTRACE ON TRACEONLY EXPLAIN
--SET AUTOTRACE ON EXPLAIN
--SET AUTOTRACE ON STATISTICS

-- for AUTOTRACE
COLUMN id_plus_exp FORMAT 990 HEADING i
COLUMN parent_id_plus_exp FORMAT 990 HEADING p
COLUMN plan_plus_exp FORMAT A100
COLUMN object_node_plus_exp FORMAT A8
COLUMN other_tag_plus_exp FORMAT A29
COLUMN other_plus_exp FORMAT A44

COLUMN name FORMAT A30
COLUMN description FORMAT A30
COLUMN collection_name FORMAT A30
COLUMN collection_description FORMAT A30
COLUMN text FORMAT A30
COLUMN patch FORMAT A20
COLUMN start_date FORMAT A25
COLUMN end_date FORMAT A25
COLUMN status FORMAT a15
COLUMN option_value FORMAT A20
COLUMN option_name FORMAT A30
COLUMN document_name FORMAT A15
COLUMN document_description FORMAT A10
COLUMN start_bates FORMAT A15
COLUMN document_path FORMAT A30
COLUMN aliasids FORMAT A10
COLUMN email FORMAT A30
COLUMN topicname FORMAT A30
COLUMN group_title FORMAT A30
COLUMN email_address FORMAT A40
COLUMN app_username FORMAT A40
COLUMN real_email_address FORMAT A40
COLUMN db_username FORMAT A40
COLUMN username FORMAT A40
COLUMN finish_time FORMAT a22
COLUMN start_time FORMAT a22
COLUMN occurred_on FORMAT a22
COLUMN action_type FORMAT a15
COLUMN insertion_time FORMAT a22
COLUMN varname FORMAT a35
COLUMN expiration FORMAT a25
COLUMN option_varname FORMAT a30
COLUMN option_display_name FORMAT a50
COLUMN document_grouping FORMAT a10
COLUMN priority_type FORMAT a10
COLUMN document_grouping FORMAT a10
COLUMN priority_type FORMAT a10
COLUMN select_optionids FORMAT a50
COLUMN name_prefix FORMAT a30
COLUMN briefcasename FORMAT a40
COLUMN range FORMAT a40
COLUMN patch FORMAT a60
COLUMN created_at FORMAT a22
COLUMN started_at FORMAT a22
COLUMN finished_at FORMAT a22
COLUMN last_modified FORMAT a22
COLUMN matter_name FORMAT a9
COLUMN url FORMAT a20
COLUMN transcript_schema FORMAT a5
COLUMN matter_schema FORMAT a9
COLUMN file_cabinet FORMAT a15
COLUMN fulltext_server FORMAT a15
COLUMN highlight_server FORMAT a15

SET TERMOUT ON

DEFINE me='AMICISYS'
DEFINE matter_tablespace='mdata'
DEFINE index_tablespace='indx'
DEFINE dedup_link='NDDB'
DEFINE usr='Justin Valentini'
DEFINE tim=CURRENT_TIMESTAMP
DEFINE near_dupe_on=FALSE
DEFINE dps_schema='DPS_PROD'
DEFINE dps_branch_schema='DPS_PROD'
DEFINE dps_database_link='DEVINTDB.AMICILLC.COM'
DEFINE dedup_time=''
DEFINE upload_user_dps_dblink='DEVINTDB.AMICILLC.COM'
DEFINE amicisys_tablespace='AMICI_SYSTEM'
DEFINE urdb_dblink='URDB.AMICILLC.COM'

-- escape $ in filename
SET ESCCHAR $