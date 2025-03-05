# Base image: Ubuntu with Nginx and PHP-FPM
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    nginx \
    mariadb-server \
    redis-server \
    wget \
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

# Set up PHP-FPM pool configuration
RUN mkdir -p /etc/php/7.4/fpm/pool.d
COPY wordpress_pool.conf /etc/php/7.4/fpm/pool.d/

# Configure Nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

# Ensure the web root exists
RUN mkdir -p /var/www/html

# Download and set up WordPress
WORKDIR /var/www/html
RUN wget -O wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz --strip-components=1 && \
    rm wordpress.tar.gz

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html && \
    find . -type d -exec chmod 755 {} \; && \
    find . -type f -exec chmod 644 {} \;

# Expose required ports
EXPOSE 80 443

# Start services
CMD service mariadb start && \
    service redis-server start && \
    service php7.4-fpm start && \
    nginx -g "daemon off;"