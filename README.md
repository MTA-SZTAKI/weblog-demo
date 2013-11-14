README for the Longneck Demo Application

For more detailed information, please visit:
http://longneck.sztaki.hu/

Prerequisites
=============

Before proceeding Longneck, make sure you have all of the following installed:

*    Java Development Kit SE (at least version 6)
*    PostgreSQL is used in the demo application.
*    The Longneck demo application from the Downloads section.


Running the Longneck demo application
=====================================

This demo application processes Apache HTTP server logs and stores them in an
SQL database. It can also do user tracking by looking at cookies. The demo
application writes the results into an SQL database.

Note: The examples detailed here assume you are using PostgreSQL, but the
application also works with MySQL. Just substitute the "-pgsql" part in each
mentioned file name with "-mysql".

First example
-------------

The first example processes Apache HTTP server logfiles in the common log
format. In order to store the process results, Longneck must have access to the
SQL database. The required tables can be created with the database script
ddl_scripts/weblog_event_tables_pgsql.sql. Before the application can be run,
you should also review the config/weblog_demo.properties configuration file,
and adjust JDBC settings to suite your setup.

Note: Some PostgreSQL setups are configured in pg_hba.conf to use "peer"
authentication for clients connecting from localhost, which is not supported by
JDBC. We recommend switching to "md5" authentication, and use a user/password
combination to connect to the database. An example database creation script is
provided in the ddl_scripts/ folder, which must be executed as a database user
with superuser privileges. MySQL uses user/password authentication by default,
so it is unaffected by this problem.

The application is now ready to be run. To be able to run it, you will need
data to work on. It's best to use your own log files, but if you don't have any
available, you can download a sample log file in the downloads section. To run
the application, type the following command, and replace <LOG_FILE> with the
path to the log file:

> $ bin/weblog-demo -T -E -p processes/weblog-common-pgsql.xml \
>           -Dweblog.source.cli.sourcePath=<LOG_FILE>

Note: You might want to use the -t <NUMBER> switch to set the number of worker
threads (the default is 1). This is especially handy here, since the process
involves DNS lookups, which add significant delay to the process. Increasing
the number of workers parallelizes DNS queries and reduces overall processing
time in most cases.

This will run the application on the specified log file. You can also specify a
folder instead of a file to process all log files found in the folder. The
application can also read gzipped log files with the ".gz" extension, so there
is no need to decompress them. An explanation for the command line switches can
be found by running the application with the --help switch.

The application processes the specified logs, standardizes or computes field
values, assigns events and writes them into the weblog_events_incoming database
table. Using this table, various statistical reports can be created. The log
processor uses the notion of events to create metrics. For each log line a
number of events are created, each contributing to a certain metric. For
example, to get the number of visits to a certain page, one must count the
pageview events associated with the URL of the page. The events can be
customized or extended by editing the determine.basic-events block in the
repository/weblog-events.block.xml block package.

If anything goes wrong, you can review the process by looking at the logs found
in the log directory. Data errors with detailed trace information are written
into the weblog_events_incoming_err database table.

Processing more detailed logs
-----------------------------

The common log format is supported by many tools, unfortunately it is rather
poor in information. The web server can be configured to write more information
about each request. To do that, you must update both the web server and the log
processor configuration with a new log format. For the log processor this
format is specified in the config/weblog-config.xml file. It uses the same pattern as
the Apache HTTP server. We provide a sample format, which we call "detailed".
The simplest way to use it is to copy over a configuration file for the
"detailed" format from the templates folder:

> $ cp templates/logformat/weblog-config-detailed.xml config/weblog-config.xml.xml

This will overwrite the current log format with the "detailed" format. You must
also configure this in the web server to produce compatible logs. Add this line
to the main web server configuration:

> LogFormat "%v %h %u %l %t \"%r\" %s %b \"%{Referer}i\" \"%{User-agent}i\"
>         \"%{Cookie}i\" \"%{Cookie}n\"" detailed

This creates a new log format in the web server configuration with the name
"detailed". To actually write logs in this format, you must also add another
log directive inside a VirtualHost or main web server configuration:

> CustomLog <PATH_TO_LOG_FILE> detailed

To see the results, reload the web server configuration, and visit the
configured website and do a few clicks to produce data. Now you both have logs
and a log processor to work on it. To process the newly recorded logs, type:

> $ bin/weblog-demo -T -E -p processes/weblog-detailed-pgsql.xml \
>           -Dweblog.source.cli.sourcePath=${YOUR_TEST_LOG_FILE}

This process produces more information, allows cookie tracking and various
other features.

Creating your own application
=============================

The demo application is just one example how Longneck can be used. It aims to
be a versatile tool to process data available in multiple formats. It can
process data from SQL, CSV and structured log data, and it can be extended to
use just about any data source that can be used to produce or consume records.
To create your own application, you can either modify the demo, or you can use
the App Seed project to start from scratch. Longneck uses Apache Maven 3, so
you probably also need to download it.

The processes for the application are stored in the processes/ folder. The
documentation for the process language is available on the XML API page.
Longneck supports sharing of code by using packages of blocks or entities, that
are stored in the repository/ folder. To add new blocks, just copy the package
files into the folder and they are ready to use. We have published some blocks
in the Content Repository section.


