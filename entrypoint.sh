#!/bin/bash
set -e

echo "➡ First-time DB initialization..."
odoo -c /etc/odoo/odoo.conf -i base --without-demo=all

echo "➡ Starting Odoo server..."
exec odoo -c /etc/odoo/odoo.conf
