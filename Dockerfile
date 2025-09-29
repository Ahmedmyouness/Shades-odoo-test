FROM odoo:17

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
