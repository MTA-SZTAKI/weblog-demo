DROP TABLE IF EXISTS weblog_event_incoming;
CREATE TABLE weblog_event_incoming
(
  virtual_host varchar(256) not null,
  request_timestamp timestamp,
  event_group varchar(32),
  event varchar(32),
  visitor_ip varchar(16),
  visitor_hostname varchar(512),
  visitor_ip_resolv_time timestamp,
  visitor_ip_resolv_expire timestamp,
  http_request varchar(4096),
  inet_protocol varchar(64),
  http_method varchar(16),
  http_status_code integer,
  http_request_cookie varchar(2048),
  http_response_cookie varchar(2048),
  request_url varchar(2048),
  request_url_parameter varchar(2048),
  request_url_extension varchar(128),
  referer_url varchar(2048),
  referer_url_parameter varchar(2048),
  referer_url_extension varchar(64),
  agent_string varchar(2048),
  agent_resolv_time timestamp,
  agent_type varchar(128),
  agent_device varchar(128),
  agent_processor varchar(128),
  agent_sw_platform varchar(128),
  agent_name varchar(128),
  agent_version varchar(128),
  agent_language varchar(128),
  agent_os varchar(128),
  agent_os_version varchar(128),
  agent_os_distro varchar(128),
  agent_layout_engine varchar(128),
  agent_layout_resolution varchar(128),
  auth_user varchar(256),
  bytes_sent integer
) character set 'utf8' collate 'utf8_general_ci';

DROP TABLE IF EXISTS weblog_event_incoming_err;
CREATE TABLE weblog_event_incoming_err
(
  error_time timestamp,
  server_host varchar(256),
  request_timestamp timestamp,
  class_name varchar(256),
  field varchar(128),
  field_value varchar(4096),
  details varchar(2048),
  document_url varchar(128),
  document_line varchar(8),
  document_column varchar(8),
  check_id        bigint,
  check_parent_id bigint,
  check_tree_id   bigint,
  check_level     smallint
) character set 'utf8' collate 'utf8_general_ci';

DROP TABLE IF EXISTS weblog_event_incoming_host;
CREATE TABLE weblog_event_incoming_host
(
  host_name varchar(256),
  hier_type varchar(100),
  level0 varchar(256),
  level1 varchar(256),
  level2 varchar(256),
  level3 varchar(256),
  level4 varchar(256),
  level5 varchar(256),
  level6 varchar(256),
  level7 varchar(256),
  level8 varchar(256),
  level9 varchar(256),
  level10 varchar(256),
  level11 varchar(256),
  level12 varchar(256),
  level13 varchar(256),
  level14 varchar(256),
  level15 varchar(256)
) character set 'utf8' collate 'utf8_general_ci';

DROP TABLE IF EXISTS weblog_event_incoming_host_err;
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
  document_column varchar(2000),
  check_id        bigint,
  check_parent_id bigint,
  check_tree_id   bigint,
  check_level     smallint
) character set 'utf8' collate 'utf8_general_ci';
