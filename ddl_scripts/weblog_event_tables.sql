--------------------------------------------------------
-- weblog_event_incoming
--------------------------------------------------------
-- see ensyme/aegon-weblog project for details and definition

--------------------------------------------------------
--  weblog_event_incoming_err
--------------------------------------------------------
create table weblog_event_incoming_err (
    error_time timestamp, 
    server_host varchar2(1000 char), 
    request_timestamp timestamp (6), 
    class_name varchar2(256 byte),
    field varchar2(500 char), 
    field_value varchar2(2000 char), 
    details varchar2(2000 char), 
    document_url varchar2(2000 char), 
    document_line varchar2(100 char), 
    document_column varchar2(2000 char)
)
nologging compress for oltp
tablespace log_stg ;

--------------------------------------------------------
--  weblog_event_incoming_p2
--------------------------------------------------------

create table weblog_event_incoming_p2 (
    virtual_host            varchar2(1000 char), 
    request_time            timestamp, 
    event_group             varchar2(2000 char), 
    event                   varchar2(2000 char),
    event_subject           varchar2(2000 char),
    visitor_referer_id      number, 
    visitor_cookie_id       number, 
    visitor_ip_agent_hash   varchar2(2000 char),
    visitor_ip              varchar2(15 char),
    inet_protocol           varchar2(128 char), 
    http_method             varchar2(128 char), 
    http_status_code        number,     
    http_request            varchar2(4000 char), 
    http_request_cookie     varchar2(2000 char),
    http_response_cookie    varchar2(2000 char),
    request_url             varchar2(4000 char), 
    request_url_parameter   varchar2(4000 char), 
    request_url_extension   varchar2(128 char), 
    referer_url             varchar2(4000 char), 
    referer_url_parameter   varchar2(4000 char), 
    referer_url_extension   varchar2(128 char), 
    agent_string            varchar2(4000 char), 
    auth_user               varchar2(512 byte), 
    bytes_sent              number
)
nologging compress for oltp
tablespace log_stg ;



create table weblog_event_incoming_p2_err (
    error_time timestamp, 
    server_host varchar2(1000 char), 
    request_timestamp timestamp (6), 
    class_name varchar2(256 byte),
    field varchar2(500 char), 
    field_value varchar2(2000 char), 
    details varchar2(2000 char), 
    document_url varchar2(2000 char), 
    document_line varchar2(100 char), 
    document_column varchar2(2000 char)
)
nologging compress for oltp
tablespace log_stg ;
