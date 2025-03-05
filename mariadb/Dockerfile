FROM mariadb:10.6

# MariaDB will use environment variables provided by Coolify
# for database name, user, password, and root password

# Define healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD mysqladmin ping -h localhost