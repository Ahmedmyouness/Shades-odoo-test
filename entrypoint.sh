#!/bin/bash
set -e

echo "➡ Waiting for PostgreSQL..."
until pg_isready -h $DB_HOST -p $DB_PORT -U $DB_USER >/dev/null 2>&1; do
  sleep 2
done

echo "➡ PostgreSQL is up."

echo "➡ Checking if Odoo database is initialized..."
if ! PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c '\dt' | grep -q ir_module_module; then
    echo "➡ Database is empty, initializing Odoo..."
    odoo -c /etc/odoo/odoo.conf -i base --without-demo=all --stop-after-init
fi

echo "➡ Starting Odoo..."
exec odoo -c /etc/odoo/odoo.conf
