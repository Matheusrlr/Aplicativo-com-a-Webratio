CREATE TABLE ${QTABLE_PREFIX}blob_triggers (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME varchar(80) NOT NULL,
TRIGGER_GROUP varchar(80) NOT NULL,
BLOB_DATA byte in table
);

ALTER TABLE ${QTABLE_PREFIX}blob_triggers
ADD CONSTRAINT PRIMARY KEY (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP);


CREATE TABLE ${QTABLE_PREFIX}calendars (
SCHED_NAME VARCHAR(120) NOT NULL,
CALENDAR_NAME varchar(80) NOT NULL,
CALENDAR byte in table NOT NULL
);

ALTER TABLE ${QTABLE_PREFIX}calendars
ADD CONSTRAINT PRIMARY KEY (SCHED_NAME,CALENDAR_NAME);


CREATE TABLE ${QTABLE_PREFIX}cron_triggers (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME varchar(80) NOT NULL,
TRIGGER_GROUP varchar(80) NOT NULL,
CRON_EXPRESSION varchar(120) NOT NULL,
TIME_ZONE_ID varchar(80)
);

ALTER TABLE ${QTABLE_PREFIX}cron_triggers
ADD CONSTRAINT PRIMARY KEY (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP);


CREATE TABLE ${QTABLE_PREFIX}fired_triggers (
SCHED_NAME VARCHAR(120) NOT NULL,
ENTRY_ID varchar(95) NOT NULL,
TRIGGER_NAME varchar(80) NOT NULL,
TRIGGER_GROUP varchar(80) NOT NULL,
INSTANCE_NAME varchar(80) NOT NULL,
FIRED_TIME numeric(13) NOT NULL,
PRIORITY integer NOT NULL,
STATE varchar(16) NOT NULL,
JOB_NAME varchar(80),
JOB_GROUP varchar(80),
IS_NONCONCURRENT varchar(1),
REQUESTS_RECOVERY varchar(1) 
);

ALTER TABLE ${QTABLE_PREFIX}fired_triggers
ADD CONSTRAINT PRIMARY KEY (SCHED_NAME,ENTRY_ID);


CREATE TABLE ${QTABLE_PREFIX}paused_trigger_grps (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_GROUP  varchar(80) NOT NULL
);

ALTER TABLE ${QTABLE_PREFIX}paused_trigger_grps
ADD CONSTRAINT PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP);


CREATE TABLE ${QTABLE_PREFIX}scheduler_state (
SCHED_NAME VARCHAR(120) NOT NULL,
INSTANCE_NAME varchar(80) NOT NULL,
LAST_CHECKIN_TIME numeric(13) NOT NULL,
CHECKIN_INTERVAL numeric(13) NOT NULL
);

ALTER TABLE ${QTABLE_PREFIX}scheduler_state
ADD CONSTRAINT PRIMARY KEY (SCHED_NAME,INSTANCE_NAME);


CREATE TABLE ${QTABLE_PREFIX}locks (
SCHED_NAME VARCHAR(120) NOT NULL,
LOCK_NAME  varchar(40) NOT NULL
);

ALTER TABLE ${QTABLE_PREFIX}locks
ADD CONSTRAINT PRIMARY KEY (SCHED_NAME,LOCK_NAME);


CREATE TABLE ${QTABLE_PREFIX}job_details (
SCHED_NAME VARCHAR(120) NOT NULL,
JOB_NAME varchar(80) NOT NULL,
JOB_GROUP varchar(80) NOT NULL,
DESCRIPTION varchar(120),
JOB_CLASS_NAME varchar(128) NOT NULL,
IS_DURABLE varchar(1) NOT NULL,
IS_NONCONCURRENT varchar(1) NOT NULL,
IS_UPDATE_DATA varchar(1) NOT NULL,
REQUESTS_RECOVERY varchar(1) NOT NULL,
JOB_DATA byte in table
);

ALTER TABLE ${QTABLE_PREFIX}job_details
ADD CONSTRAINT PRIMARY KEY (SCHED_NAME,JOB_NAME, JOB_GROUP);


CREATE TABLE ${QTABLE_PREFIX}simple_triggers (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME varchar(80) NOT NULL,
TRIGGER_GROUP varchar(80) NOT NULL,
REPEAT_COUNT numeric(7) NOT NULL,
REPEAT_INTERVAL numeric(12) NOT NULL,
TIMES_TRIGGERED numeric(10) NOT NULL
);

ALTER TABLE ${QTABLE_PREFIX}simple_triggers
ADD CONSTRAINT PRIMARY KEY (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP);


CREATE TABLE ${QTABLE_PREFIX}simprop_triggers
  (          
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(80) NOT NULL,
    TRIGGER_GROUP VARCHAR(80) NOT NULL,
    STR_PROP_1 VARCHAR(255),
    STR_PROP_2 VARCHAR(255),
    STR_PROP_3 VARCHAR(255),
    INT_PROP_1 NUMERIC(9),
    INT_PROP_2 NUMERIC(9),
    LONG_PROP_1 NUMERIC(13),
    LONG_PROP_2 NUMERIC(13),
    DEC_PROP_1 NUMERIC(13,4),
    DEC_PROP_2 NUMERIC(13,4),
    BOOL_PROP_1 VARCHAR(1),
    BOOL_PROP_2 VARCHAR(1)
);

ALTER TABLE ${QTABLE_PREFIX}simprop_triggers
ADD CONSTRAINT PRIMARY KEY (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP);


CREATE TABLE ${QTABLE_PREFIX}triggers (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME varchar(80) NOT NULL,
TRIGGER_GROUP varchar(80) NOT NULL,
JOB_NAME varchar(80) NOT NULL,
JOB_GROUP varchar(80) NOT NULL,
DESCRIPTION varchar(120),
NEXT_FIRE_TIME numeric(13),
PREV_FIRE_TIME numeric(13),
PRIORITY integer,
TRIGGER_STATE varchar(16) NOT NULL,
TRIGGER_TYPE varchar(8) NOT NULL,
START_TIME numeric(13) NOT NULL,
END_TIME numeric(13),
CALENDAR_NAME varchar(80),
MISFIRE_INSTR numeric(2),
JOB_DATA byte in table
);

ALTER TABLE ${QTABLE_PREFIX}triggers
ADD CONSTRAINT PRIMARY KEY (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP);


ALTER TABLE ${QTABLE_PREFIX}blob_triggers
ADD CONSTRAINT FOREIGN KEY (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP)
REFERENCES ${QTABLE_PREFIX}triggers;


ALTER TABLE ${QTABLE_PREFIX}cron_triggers
ADD CONSTRAINT FOREIGN KEY (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP)
REFERENCES ${QTABLE_PREFIX}triggers;


ALTER TABLE ${QTABLE_PREFIX}simple_triggers
ADD CONSTRAINT FOREIGN KEY (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP)
REFERENCES ${QTABLE_PREFIX}triggers;

ALTER TABLE ${QTABLE_PREFIX}simprop_triggers
ADD CONSTRAINT FOREIGN KEY (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP)
REFERENCES ${QTABLE_PREFIX}triggers;

ALTER TABLE ${QTABLE_PREFIX}triggers
ADD CONSTRAINT FOREIGN KEY (SCHED_NAME,JOB_NAME, JOB_GROUP)
REFERENCES ${QTABLE_PREFIX}job_details; 

