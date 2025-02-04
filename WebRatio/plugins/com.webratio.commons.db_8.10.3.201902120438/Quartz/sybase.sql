create table  ${QTABLE_PREFIX}CALENDARS (
	SCHED_NAME varchar(120) not null,
	CALENDAR_NAME varchar(80) not null,
	CALENDAR image not null
)
go;

create table  ${QTABLE_PREFIX}CRON_TRIGGERS (
	SCHED_NAME varchar(120) not null,
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	CRON_EXPRESSION varchar(120) not null,
	TIME_ZONE_ID varchar(80) null
)
go;

create table  ${QTABLE_PREFIX}PAUSED_TRIGGER_GRPS (
	SCHED_NAME varchar(120) not null,
	TRIGGER_GROUP  varchar(80) not null
)
go;

create table  ${QTABLE_PREFIX}FIRED_TRIGGERS(
	SCHED_NAME varchar(120) not null,
	ENTRY_ID varchar(95) not null,
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	INSTANCE_NAME varchar(80) not null,
	FIRED_TIME numeric(13,0) not null,
	PRIORITY int not null,
	STATE varchar(16) not null,
	JOB_NAME varchar(80) null,
	JOB_GROUP varchar(80) null,
	IS_NONCONCURRENT bit not null,
	REQUESTS_RECOVERY bit not null
)
go;

create table  ${QTABLE_PREFIX}SCHEDULER_STATE (
	SCHED_NAME varchar(120) not null,
	INSTANCE_NAME varchar(80) not null,
	LAST_CHECKIN_TIME numeric(13,0) not null,
	CHECKIN_INTERVAL numeric(13,0) not null
)
go;

create table  ${QTABLE_PREFIX}LOCKS (
	SCHED_NAME varchar(120) not null,
	LOCK_NAME  varchar(40) not null 
)
go;


create table  ${QTABLE_PREFIX}JOB_DETAILS (
	SCHED_NAME varchar(120) not null,
	JOB_NAME varchar(80) not null,
	JOB_GROUP varchar(80) not null,
	DESCRIPTION varchar(120) null,
	JOB_CLASS_NAME varchar(128) not null,
	IS_DURABLE bit not null,
	IS_NONCONCURRENT bit not null,
	IS_UPDATE_DATA bit not null,
	REQUESTS_RECOVERY bit not null,
	JOB_DATA image null
)
go;

create table  ${QTABLE_PREFIX}SIMPLE_TRIGGERS (
	SCHED_NAME varchar(120) not null,
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	REPEAT_COUNT numeric(13,0) not null,
	REPEAT_INTERVAL numeric(13,0) not null,
	TIMES_TRIGGERED numeric(13,0) not null
)
go;

CREATE TABLE  ${QTABLE_PREFIX}SIMPROP_TRIGGERS
  (          
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    STR_PROP_1 VARCHAR(512) NULL,
    STR_PROP_2 VARCHAR(512) NULL,
    STR_PROP_3 VARCHAR(512) NULL,
    INT_PROP_1 INT NULL,
    INT_PROP_2 INT NULL,
    LONG_PROP_1 NUMERIC(13,0) NULL,
    LONG_PROP_2 NUMERIC(13,0) NULL,
    DEC_PROP_1 NUMERIC(13,4) NULL,
    DEC_PROP_2 NUMERIC(13,4) NULL,
    BOOL_PROP_1 bit NOT NULL,
    BOOL_PROP_2 bit NOT NULL
)
go;

create table  ${QTABLE_PREFIX}BLOB_TRIGGERS (
	SCHED_NAME varchar(120) not null,
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	BLOB_DATA image null
)
go;

create table  ${QTABLE_PREFIX}TRIGGERS (
	SCHED_NAME varchar(120) not null,
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	JOB_NAME varchar(80) not null,
	JOB_GROUP varchar(80) not null,
	DESCRIPTION varchar(120) null,
	NEXT_FIRE_TIME numeric(13,0) null,
	PREV_FIRE_TIME numeric(13,0) null,
	PRIORITY int null,
	TRIGGER_STATE varchar(16) not null,
	TRIGGER_TYPE varchar(8) not null,
	START_TIME numeric(13,0) not null,
	END_TIME numeric(13,0) null,
	CALENDAR_NAME varchar(80) null,
	MISFIRE_INSTR smallint null,
	JOB_DATA image null
)
go;


alter table  ${QTABLE_PREFIX}CALENDARS
	add constraint PK_${TABLE_PREFIX}calendars primary key clustered (SCHED_NAME,CALENDAR_NAME)
go;

alter table  ${QTABLE_PREFIX}CRON_TRIGGERS
	add constraint PK_${TABLE_PREFIX}cron_triggers primary key clustered (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP)
go;

alter table  ${QTABLE_PREFIX}FIRED_TRIGGERS
	add constraint PK_${TABLE_PREFIX}fired_triggers primary key clustered (SCHED_NAME,ENTRY_ID)
go;

alter table  ${QTABLE_PREFIX}PAUSED_TRIGGER_GRPS
	add constraint PK_${TABLE_PREFIX}paused_trigger_grps primary key clustered (SCHED_NAME,TRIGGER_GROUP)
go;

alter table  ${QTABLE_PREFIX}SCHEDULER_STATE
	add constraint PK_${TABLE_PREFIX}scheduler_state primary key clustered (SCHED_NAME,INSTANCE_NAME)
go;

alter table  ${QTABLE_PREFIX}LOCKS
	add constraint PK_${TABLE_PREFIX}locks primary key clustered (SCHED_NAME,LOCK_NAME)
go;

alter table  ${QTABLE_PREFIX}JOB_DETAILS
	add constraint PK_${TABLE_PREFIX}job_details primary key clustered (SCHED_NAME,JOB_NAME, JOB_GROUP)
go;

alter table  ${QTABLE_PREFIX}SIMPLE_TRIGGERS
	add constraint PK_${TABLE_PREFIX}simple_triggers primary key clustered (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP)
go;

alter table  ${QTABLE_PREFIX}SIMPROP_TRIGGERS
	add constraint PK_${TABLE_PREFIX}simprop_triggers primary key clustered (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP)
go;

alter table  ${QTABLE_PREFIX}TRIGGERS
	add constraint PK_${TABLE_PREFIX}triggers primary key clustered (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP)
go;

alter table  ${QTABLE_PREFIX}BLOB_TRIGGERS
	add constraint PK_${TABLE_PREFIX}blob_triggers primary key clustered (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP)
go;

alter table  ${QTABLE_PREFIX}CRON_TRIGGERS
	add constraint FK_cron_triggers_triggers foreign key (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
references  ${QTABLE_PREFIX}TRIGGERS (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
go;

alter table  ${QTABLE_PREFIX}SIMPLE_TRIGGERS
	add constraint FK_simple_triggers_triggers foreign key (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
	references  ${QTABLE_PREFIX}TRIGGERS (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
go;

alter table  ${QTABLE_PREFIX}SIMPROP_TRIGGERS
	add constraint FK_simprop_triggers_triggers foreign key (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
	references  ${QTABLE_PREFIX}TRIGGERS (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
go;

alter table  ${QTABLE_PREFIX}TRIGGERS
	add constraint FK_triggers_job_details foreign key (SCHED_NAME,JOB_NAME,JOB_GROUP)
	references  ${QTABLE_PREFIX}JOB_DETAILS (SCHED_NAME,JOB_NAME,JOB_GROUP)
go;

alter table  ${QTABLE_PREFIX}BLOB_TRIGGERS
	add constraint FK_blob_triggers_triggers foreign key (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
	references  ${QTABLE_PREFIX}TRIGGERS (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
go;
