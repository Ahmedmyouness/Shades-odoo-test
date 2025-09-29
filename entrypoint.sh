#!/bin/bash
set -e

echo "➡ Starting Odoo server using odoo.conf..."
exec odoo -c /etc/odoo/odoo.conf
