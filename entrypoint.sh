#!/bin/bash
set -e

echo "➡ Checking PostgreSQL connection..."
until pg_isready -h $(grep -Po '(?<=^db_host = ).*' /etc/odoo/odoo.conf) \
                 -p $(grep -Po '(?<=^db_port = ).*' /etc/odoo/odoo.conf) \
                 -U $(grep -Po '(?<=^db_user = ).*' /etc/odoo/odoo.conf); do
  echo "⏳ Waiting for PostgreSQL..."
  sleep 2
done

echo "✅ PostgreSQL is up and running!"

echo "➡ Initializing Odoo DB (if not exists)..."
odoo -c /etc/odoo/odoo.conf -i base --without-demo=all --stop-after-init || true

echo "➡ Starting Odoo server..."
exec odoo -c /etc/odoo/odoo.conf
