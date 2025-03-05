# Stage 1: Base LiteSpeed + PHP Image
FROM litespeedtech/openlitespeed:latest AS base

# Install required dependencies
RUN apt-get update && apt-get install -y \
    mariadb-server \
    redis-server \
    wget \
    php \
    php-fpm \
    php-cli \
    php-curl \
    php-mbstring \
    php-xml \
    php-zip \
    php-mysql \
    php-bcmath \
    php-tokenizer \
    php-intl \
    php-soap \
    php-gd \
    php-redis \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Download `litespeed.conf` from GitHub
RUN wget -O /usr/local/lsws/conf/httpd_config.conf \
    https://raw.githubusercontent.com/mrtornado/coolify-wordpress-maria/main/test/litespeed.conf

# Set permissions (if necessary)
RUN chmod 644 /usr/local/lsws/conf/httpd_config.conf

# Start LiteSpeed service
CMD ["/usr/local/lsws/bin/lswsctrl", "start"]

# Create directories and set permissions
RUN mkdir -p /var/www/html && \
    chown -R nobody:nogroup /var/www/html

# Expose necessary ports
EXPOSE 80 443

# Stage 2: WordPress Installation
FROM base AS wordpress

WORKDIR /var/www/html

# Download and setup WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz

# Set file permissions
RUN chown -R nobody:nogroup /var/www/html && \
    find . -type d -exec chmod 755 {} \; && \
    find . -type f -exec chmod 644 {} \;

# Copy LiteSpeed configurations
COPY /config/litespeed.conf /usr/local/lsws/conf/httpd_config.conf

# Start all necessary services
CMD service mariadb start && \
    service redis-server start && \
    service lsws start && \
    tail -f /usr/local/lsws/logs/error.log