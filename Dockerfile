FROM odoo:17

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Install PostgreSQL client (for pg_isready)
USER root
RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
