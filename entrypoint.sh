#!/bin/bash
set -e

echo "➡️ Initializing Odoo DB..."
odoo -i base \
  -d $DB_NAME \
  --db_host=$DB_HOST \
  --db_port=$DB_PORT \
  --db_user=$DB_USER \
  --db_password=$DB_PASSWORD \
  --without-demo=all \
  --stop-after-init || true

echo "➡️ Starting Odoo server..."
exec odoo \
  -d $DB_NAME \
  --db_host=$DB_HOST \
  --db_port=$DB_PORT \
  --db_user=$DB_USER \
  --db_password=$DB_PASSWORD \
  -c /etc/odoo/odoo.conf
