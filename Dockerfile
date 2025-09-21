FROM odoo:16
USER root
RUN pip3 install psycopg2-binary
USER odoo

