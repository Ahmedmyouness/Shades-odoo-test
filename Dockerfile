FROM odoo:17

# Locale fix
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
