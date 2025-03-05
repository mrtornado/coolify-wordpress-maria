FROM redis:alpine

# Configure Redis with memory settings
CMD ["redis-server", "--maxmemory", "256mb", "--maxmemory-policy", "allkeys-lru"]

# Define healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD redis-cli ping