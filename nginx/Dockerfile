FROM nginx:alpine

# Copy the Nginx configuration
COPY default.conf /etc/nginx/conf.d/default.conf

# Define healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD nginx -t