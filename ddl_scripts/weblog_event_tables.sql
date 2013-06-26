--------------------------------------------------------
-- weblog_event_incoming
--------------------------------------------------------
-- Table: weblog_event_incoming

-- DROP TABLE weblog_event_incoming;

CREATE TABLE weblog_event_incoming
(
  virtual_host character varying(1000) not null,
  request_timestamp timestamp(6) without time zone not null,

  event_group character varying(2000),
  -- events: page view, displaying an email, making a contract etc.
  event character varying(2000),

  -- visitor ids: a local id valid for the given host, and a global, host-independent id
  visitor_ip character varying(15),
  visitor_hostname character varying(2048),
  visitor_ip_resolv_time timestamp(6) without time zone,
  visitor_ip_resolv_expire timestamp(6) without time zone,

  http_request character varying(4000),
  inet_protocol character varying(128),
  http_method character varying(128),
  http_status_code integer,
  http_request_cookie character varying(4000),
  http_response_cookie character varying(4000),

  -- full normalized url, then the parts
  request_url character varying(4000),
  request_url_parameter character varying(3000),
  request_url_extension character varying(128),
  referer_url character varying(4000),
  referer_url_parameter character varying(3000),
  referer_url_extension character varying(128),
  agent_string character varying(2000),
  agent_resolv_time timestamp(6) without time zone,
  agent_type character varying(256),
  agent_device character varying(256),
  agent_processor character varying(512),
  agent_sw_platform character varying(512),
  agent_name character varying(512),
  agent_version character varying(512),
  agent_language character varying(512),
  agent_os character varying(512),
  agent_os_version character varying(512),
  agent_os_distro character varying(512),
  agent_layout_engine character varying(512),
  agent_layout_resolution character varying(512),
  auth_user character varying(512),
  bytes_sent integer
)
WITH (
  OIDS=FALSE
);
ALTER TABLE weblog_event_incoming
  OWNER TO longneck;

--------------------------------------------------------
--  weblog_event_incoming_err
--------------------------------------------------------
-- DROP TABLE weblog_event_incoming_err;

CREATE TABLE weblog_event_incoming_err
(
  error_time timestamp without time zone,
  server_host character varying(1000),
  request_timestamp timestamp without time zone,
  class_name character varying(256),
  field character varying(500),
  field_value character varying(2000),
  details character varying(2000),
  document_url character varying(2000),
  document_line character varying(100),
  document_column character varying(2000)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE weblog_event_incoming_err
  OWNER TO longneck;


--------------------------------------------------------
-- Table: weblog_event_incoming_host
--------------------------------------------------------

-- DROP TABLE weblog_event_incoming_host;

CREATE TABLE weblog_event_incoming_host
(
  host_name character varying(4000),
  hier_type character varying(100),
  level0 character varying(4000),
  level1 character varying(4000),
  level2 character varying(4000),
  level3 character varying(4000),
  level4 character varying(4000),
  level5 character varying(4000),
  level6 character varying(4000),
  level7 character varying(4000),
  level8 character varying(4000),
  level9 character varying(4000),
  level10 character varying(4000),
  level11 character varying(4000),
  level12 character varying(4000),
  level13 character varying(4000),
  level14 character varying(4000),
  level15 character varying(4000)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE weblog_event_incoming_host
  OWNER TO longneck;

--------------------------------------------------------
--  weblog_event_incoming_host_err
--------------------------------------------------------
-- DROP TABLE weblog_event_incoming_host_err;

CREATE TABLE weblog_event_incoming_host_err
(
  error_time timestamp without time zone,
  server_host character varying(1000),
  request_timestamp timestamp without time zone,
  class_name character varying(256),
  field character varying(500),
  field_value character varying(2000),
  details character varying(2000),
  document_url character varying(2000),
  document_line character varying(100),
  document_column character varying(2000)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE weblog_event_incoming_host_err
  OWNER TO longneck;
