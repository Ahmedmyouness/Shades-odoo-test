FROM odoo:17

COPY ./odoo.conf /etc/odoo/odoo.conf

CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
