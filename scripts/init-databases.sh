#!/bin/bash
set -e

psql -v --username "$POSTGRES_USER" <<-EOSQL
  CREATE DATABASE osis_local;
  CREATE USER osis WITH PASSWORD 'osis';
  GRANT ALL PRIVILEGES ON DATABASE osis_local TO osis;
  REVOKE CONNECT ON DATABASE osis_local FROM public;
  ALTER USER osis CREATEDB;

  CREATE DATABASE osis_portal_local;
  CREATE USER osis_portal WITH PASSWORD 'osis';
  GRANT ALL PRIVILEGES ON DATABASE osis_portal_local TO osis_portal;
  REVOKE CONNECT ON DATABASE osis_portal_local FROM public;
  ALTER USER osis_portal CREATEDB;
EOSQL
