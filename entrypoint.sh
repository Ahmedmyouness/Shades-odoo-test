#!/bin/bash
set -e

echo "➡ Checking PostgreSQL connection..."
echo "   Using host=$DB_HOST port=$DB_PORT user=$DB_USER db=$DB_NAME"

until pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER"; do
  echo "⏳ Waiting for PostgreSQL at $DB_HOST:$DB_PORT..."
  sleep 2
done

echo "✅ PostgreSQL is up and running!"

echo "➡ Initializing Odoo DB..."
odoo -i base \
  -d "$DB_NAME" \
  --db_host="$DB_HOST" \
  --db_port="$DB_PORT" \
  --db_user="$DB_USER" \
  --db_password="$DB_PASSWORD" \
  --without-demo=all \
  --stop-after-init || true

echo "➡ Starting Odoo server..."
exec odoo \
  -d "$DB_NAME" \
  --db_host="$DB_HOST" \
  --db_port="$DB_PORT" \
  --db_user="$DB_USER" \
  --db_password="$DB_PASSWORD" \
  -c /etc/odoo/odoo.conf
