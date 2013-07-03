--------------------------------------------------------
-- weblog_event_incoming
--------------------------------------------------------
-- Table: weblog_event_incoming
--------------------------------------------------------
-- DROP TABLE weblog_event_incoming;
CREATE TABLE weblog_event_incoming
(
  virtual_host varchar(1000) not null,
  request_timestamp timestamp,
  event_group varchar(2000),
  event varchar(2000),
  visitor_ip varchar(15),
  visitor_hostname varchar(2048),
  visitor_ip_resolv_time timestamp,
  visitor_ip_resolv_expire timestamp,
  http_request varchar(4000),
  inet_protocol varchar(128),
  http_method varchar(128),
  http_status_code integer,
  http_request_cookie varchar(4000),
  http_response_cookie varchar(4000),
  request_url varchar(4000),
  request_url_parameter varchar(3000),
  request_url_extension varchar(128),
  referer_url varchar(4000),
  referer_url_parameter varchar(3000),
  referer_url_extension varchar(128),
  agent_string varchar(2000),
  agent_resolv_time timestamp,
  agent_type varchar(256),
  agent_device varchar(256),
  agent_processor varchar(512),
  agent_sw_platform varchar(512),
  agent_name varchar(512),
  agent_version varchar(512),
  agent_language varchar(512),
  agent_os varchar(512),
  agent_os_version varchar(512),
  agent_os_distro varchar(512),
  agent_layout_engine varchar(512),
  agent_layout_resolution varchar(512),
  auth_user varchar(512),
  bytes_sent integer
) character set 'utf8' collate 'utf8_general_ci';

--------------------------------------------------------
--  weblog_event_incoming_err
--------------------------------------------------------
-- DROP TABLE weblog_event_incoming_err;
CREATE TABLE weblog_event_incoming_err
(
  error_time timestamp,
  server_host varchar(1000),
  request_timestamp timestamp,
  class_name varchar(256),
  field varchar(500),
  field_value varchar(2000),
  details varchar(2000),
  document_url varchar(2000),
  document_line varchar(100),
  document_column varchar(2000)
) character set 'utf8' collate 'utf8_general_ci';

--------------------------------------------------------
-- Table: weblog_event_incoming_host
--------------------------------------------------------
-- DROP TABLE weblog_event_incoming_host;
CREATE TABLE weblog_event_incoming_host
(
  host_name varchar(4000),
  hier_type varchar(100),
  level0 varchar(4000),
  level1 varchar(4000),
  level2 varchar(4000),
  level3 varchar(4000),
  level4 varchar(4000),
  level5 varchar(4000),
  level6 varchar(4000),
  level7 varchar(4000),
  level8 varchar(4000),
  level9 varchar(4000),
  level10 varchar(4000),
  level11 varchar(4000),
  level12 varchar(4000),
  level13 varchar(4000),
  level14 varchar(4000),
  level15 varchar(4000)
) character set 'utf8' collate 'utf8_general_ci';

--------------------------------------------------------
--  weblog_event_incoming_host_err
--------------------------------------------------------
-- DROP TABLE weblog_event_incoming_host_err;
CREATE TABLE weblog_event_incoming_host_err
(
  error_time timestamp,
  server_host varchar(1000),
  request_timestamp timestamp,
  class_name varchar(256),
  field varchar(500),
  field_value varchar(2000),
  details varchar(2000),
  document_url varchar(2000),
  document_line varchar(100),
  document_column varchar(2000)
) character set 'utf8' collate 'utf8_general_ci';
