#!/bin/bash
set -e

# Wait for WordPress to be ready
echo "Waiting for WordPress files to be ready..."
while [ ! -f "${WORDPRESS_PATH}/wp-config.php" ]; do
  sleep 5
done
sleep 10  # Give a bit more time for WordPress to initialize

# Download and install Redis Object Cache plugin
echo "Installing Redis Object Cache Plugin..."
mkdir -p "${WORDPRESS_PATH}/wp-content/plugins"
curl -L https://downloads.wordpress.org/plugin/redis-cache.zip -o /tmp/redis-cache.zip
unzip -o /tmp/redis-cache.zip -d "${WORDPRESS_PATH}/wp-content/plugins/"
rm /tmp/redis-cache.zip

echo "Redis Object Cache plugin has been installed"
echo "To activate it, log in to WordPress admin and activate the plugin"