# Stage 1: Base Nginx + PHP Image
FROM nginx:latest AS base

# Install required dependencies
RUN apt-get update && apt-get install -y \
    mariadb-server \
    redis-server \
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
    wget \
    unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Ensure necessary directories exist
RUN mkdir -p /var/www/html /var/log/nginx /run/php && \
    chown -R www-data:www-data /var/www/html

# Download and place Nginx config
RUN wget -O /etc/nginx/nginx.conf \
    https://raw.githubusercontent.com/mrtornado/coolify-wordpress-maria/main/test/nginx.conf

# Set permissions
RUN chmod 644 /etc/nginx/nginx.conf

# Stage 2: WordPress Installation
FROM base AS wordpress

WORKDIR /var/www/html

# Download and setup WordPress
RUN wget -O latest.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz

# Set file permissions
RUN chown -R www-data:www-data /var/www/html && \
    find . -type d -exec chmod 755 {} \; && \
    find . -type f -exec chmod 644 {} \;

# Start all necessary services
CMD service mariadb start && \
    service redis-server start && \
    php-fpm -D && \
    nginx -g "daemon off;"