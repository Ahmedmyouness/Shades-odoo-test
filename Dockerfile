FROM odoo:17

COPY ./odoo.conf /etc/odoo/odoo.conf

CMD ["odoo", "-i", "base", "-d", "odoo_db_8syn", "--db_host=${DB_HOST}", "--db_port=${DB_PORT}", "--db_user=${DB_USER}", "--db_password=${DB_PASSWORD}", "--without-demo=all", "--stop-after-init"]

