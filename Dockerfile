# You can change this to a newer version of MySQL available at
# https://hub.docker.com/r/mysql/mysql-server/tags/
# FROM mysql/mysql-server:8.0.24

# COPY config/user.cnf /etc/mysql/my.cnf

FROM mysql/mysql-server:8.0.24
#
# MySQL reads configuration from different include dirs depending on the image
# packaging. To make this robust (and avoid "config not loaded" surprises on
# Render), install our overrides into the two most common include locations.
#
RUN mkdir -p /etc/mysql/conf.d /etc/my.cnf.d
COPY config/user.cnf /etc/mysql/conf.d/zzz-user.cnf
COPY config/user.cnf /etc/my.cnf.d/zzz-user.cnf