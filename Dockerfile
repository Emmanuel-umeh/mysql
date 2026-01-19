# You can change this to a newer version of MySQL available at
# https://hub.docker.com/r/mysql/mysql-server/tags/
FROM mysql/mysql-server:8.0.24

# Install our overrides and force-load them (image builds can differ in which
# default include paths are active).
RUN mkdir -p /etc/mysql/conf.d
COPY config/user.cnf /etc/mysql/conf.d/zzz-user.cnf

# Ensure mysqld always reads the file above.
CMD ["mysqld","--defaults-extra-file=/etc/mysql/conf.d/zzz-user.cnf"]
