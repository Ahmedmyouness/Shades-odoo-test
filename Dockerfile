FROM odoo:17

# Locale fix
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Database ENV
ENV DB_HOST=dpg-d3827qtgdl3ps73aulk9g-a.oregon-postgres.render.com
ENV DB_PORT=5432
ENV DB_USER=odoo_db_8syn_user
ENV DB_PASSWORD=6RGJt0JxT2BVA69HuLyML9RWwauTkvet
ENV DB_NAME=odoo_db_8syn

COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
