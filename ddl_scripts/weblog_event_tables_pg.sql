--------------------------------------------------------
-- weblog_event_incoming
--------------------------------------------------------

-- DROP TABLE weblog_event;

CREATE TABLE weblog_event
(
  job_id integer NOT NULL,

  server_host character varying(1000) NOT NULL,
  server_owner character varying(2048),
  request_timestamp timestamp without time zone NOT NULL,

  -- events: page view, displaying an email, making a contract etc.
  event character varying(2000),
  -- event steps: if event covers more requests, then each request, eg. first form of a contract or final
  -- confirmation of a contract
  event_step character varying(2000),

  -- visitor ids: a local id valid for the given host, and a global, host-independent id
  visitor_referrer_id character varying(2000),
  visitor_cookie_id character varying(2000),
  visitor_user_id character varying(2000),

  client_ip character varying(15),
  client_hostname character varying(2048),
  client_resolv_time timestamp without time zone,
  client_resolv_expiration timestamp without time zone,
  -- if request is generated by an internal client (Y/N):
  client_internal character(1),

  client_asn_code character varying(2048),
  client_asn_name character varying(2048),
  client_country_code character varying(2048),
  client_country_name character varying(2048),
  client_region character varying(2048),
  client_city character varying(2048),
  client_postal_code character varying(2048),
  client_area_code character varying(2048),

  protocol character varying(128),
  http_method character varying(128),
  http_status_code integer,
  http_request character varying(4000),

  -- full normalized url, then the parts
  request_url character varying(4000),
  request_url_parameter character varying(3000),
  request_url_extension character varying(128),

  referrer_url character varying(4000),
  referrer_url_parameter character varying(3000),
  referrer_url_extension character varying(128),

  agent_string character varying(2000),
  agent_resolv_time timestamp without time zone,
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

  -- source marketing campaigns
  campaign_name character varying(512),
  campaign_source character varying(512),
  campaign_medium character varying(512),
  campaign_term character varying(512),
  campaign_content character varying(512),

  auth_user character varying(512),
  bytes_sent integer
)
WITH (
  OIDS=FALSE
);
ALTER TABLE weblog_event
  OWNER TO longneck;

--------------------------------------------------------
-- Table: weblog_event_incoming
--------------------------------------------------------

-- DROP TABLE weblog_event_incoming;

CREATE TABLE weblog_event_incoming
(
  job_id integer NOT NULL,

  server_host character varying(1000) NOT NULL,
  server_owner character varying(2048),

  request_timestamp timestamp without time zone NOT NULL,

  -- events: page view, displaying an email, making a contract etc.
  event character varying(2000),
  -- event steps: if event covers more requests, then each request, eg. first form of a contract or final
  -- confirmation of a contract
  event_step character varying(2000),

  -- visitor ids: a local id valid for the given host, and a global, host-independent id
  visitor_referrer_id character varying(2000),
  visitor_cookie_id character varying(2000),
  visitor_user_id character varying(2000),

  client_ip character varying(15),
  client_hostname character varying(2048),
  client_resolv_time timestamp without time zone,
  client_resolv_expiration timestamp without time zone,
  -- if request is generated by an internal client (Y/N):
  client_internal character(1),

  client_asn_code character varying(2048),
  client_asn_name character varying(2048),
  client_country_code character varying(2048),
  client_country_name character varying(2048),
  client_region character varying(2048),
  client_city character varying(2048),
  client_postal_code character varying(2048),
  client_area_code character varying(2048),

  protocol character varying(128),
  http_method character varying(128),
  http_status_code integer,
  http_request character varying(4000),

  -- full normalized url, then the parts
  request_url character varying(4000),
  --request_url_normalized   varchar (4000),
  request_url_parameter character varying(3000),
  request_url_extension character varying(128),

  referrer_url character varying(4000),
  referrer_url_parameter character varying(3000),
  referrer_url_extension character varying(128),

  agent_string character varying(2000),
  agent_resolv_time timestamp without time zone,
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

  -- source marketing campaigns
  campaign_name character varying(512),
  campaign_source character varying(512),
  campaign_medium character varying(512),
  campaign_term character varying(512),
  campaign_content character varying(512),

  auth_user character varying(512),
  bytes_sent integer
)
WITH (
  OIDS=FALSE
);
ALTER TABLE weblog_event_incoming
  OWNER TO longneck;

--------------------------------------------------------
-- Table: weblog_event_incoming_rsc
--------------------------------------------------------

-- DROP TABLE weblog_event_incoming_rsc;

CREATE TABLE weblog_event_incoming_rsc
(
  job_id integer NOT NULL,
  resource_url character varying(4000),
  url_scheme character varying(500),
  url_host character varying(4000),
  url_port character varying(50),
  url_path character varying(4000),
  url_is_directory character(1),
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
ALTER TABLE weblog_event_incoming_rsc
  OWNER TO longneck;

--------------------------------------------------------
-- Table: weblog_event_incoming_rsc_tmp
--------------------------------------------------------

-- DROP TABLE weblog_event_incoming_rsc_tmp;

CREATE TABLE weblog_event_incoming_rsc_tmp
(
  resource_url character varying(4000),
  freq integer
)
WITH (
  OIDS=FALSE
);
ALTER TABLE weblog_event_incoming_rsc_tmp
  OWNER TO longneck;


--------------------------------------------------------
-- Table: weblog_event_incoming_host
--------------------------------------------------------

-- DROP TABLE weblog_event_incoming_host;

CREATE TABLE weblog_event_incoming_host
(
  job_id integer NOT NULL,
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
-- Table: weblog_event_incoming_host_tmp
--------------------------------------------------------

-- DROP TABLE weblog_event_incoming_host_tmp;

CREATE TABLE weblog_event_incoming_host_tmp
(
  job_id integer NOT NULL,
  host_name character varying(4000),
  freq integer
)
WITH (
  OIDS=FALSE
);
ALTER TABLE weblog_event_incoming_host_tmp
  OWNER TO longneck;


--------------------------------------------------------
--  weblog_event_incoming_err
--------------------------------------------------------
-- DROP TABLE weblog_event_incoming_err;

CREATE TABLE weblog_event_incoming_err
(
  error_time timestamp without time zone,
  server_host character varying(1000),
  request_timestamp timestamp(6) without time zone,
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
--  weblog_event_incoming_p2
--------------------------------------------------------

-- DROP TABLE weblog_event_incoming_p2;

CREATE TABLE weblog_event_incoming_p2
(
  virtual_host character varying(1000),
  request_time timestamp without time zone,
  event_group character varying(2000),
  event character varying(2000),
  event_subject character varying(2000),
  visitor_referer_id integer,
  visitor_cookie_id integer,
  visitor_ip_agent_hash character varying(2000),
  visitor_ip character varying(15),
  inet_protocol character varying(128),
  http_method character varying(128),
  http_status_code integer,
  http_request character varying(4000),
  http_request_cookie character varying(2000),
  http_response_cookie character varying(2000),
  request_url character varying(4000),
  request_url_parameter character varying(4000),
  request_url_extension character varying(128),
  referer_url character varying(4000),
  referer_url_parameter character varying(4000),
  referer_url_extension character varying(128),
  agent_string character varying(4000),
  auth_user character varying(512),
  bytes_sent integer
)
WITH (
  OIDS=FALSE
);
ALTER TABLE weblog_event_incoming_p2
  OWNER TO longneck;

--------------------------------------------------------
--  weblog_event_incoming_p2_err
--------------------------------------------------------

-- DROP TABLE weblog_event_incoming_p2_err;

CREATE TABLE weblog_event_incoming_p2_err
(
  error_time timestamp without time zone,
  server_host character varying(1000),
  request_timestamp timestamp(6) without time zone,
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
ALTER TABLE weblog_event_incoming_p2_err
  OWNER TO longneck;
