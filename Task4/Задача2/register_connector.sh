#!/bin/bash

# Wait for Debezium to be ready (optional check in real usage)

curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" http://localhost:8083/connectors/ -d '{
  "name": "crm-connector",
  "config": {
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "database.hostname": "source_db",
    "database.port": "5432",
    "database.user": "user",
    "database.password": "password",
    "database.dbname": "source_db",
    "database.server.name": "crmserver",
    "table.include.list": "public.crm_users",
    "plugin.name": "pgoutput",
    "topic.prefix": "crmserver"
  }
}'
