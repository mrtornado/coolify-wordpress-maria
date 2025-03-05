# WordPress with Nginx, MariaDB, and Redis Object Cache
None
This is a complete WordPress deployment setup using:

- WordPress (PHP-FPM Alpine)
- Nginx web server
- MariaDB database
- Redis cache server
- Redis Object Cache Plugin (auto-installed)

## Deployment Instructions

This repository is set up for deployment with Coolify. Simply point Coolify to this Git repository and deploy.

## Features

- PHP-FPM based WordPress (more efficient than Apache)
- Nginx configuration optimized for WordPress
- Redis caching for improved performance
- Health checks for all services
- Resource limits and reservations
