FROM odoo:17

COPY ./odoo.conf /etc/odoo/odoo.conf



COPY --chmod=755 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]



