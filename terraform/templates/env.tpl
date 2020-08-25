# We'll use this in all variables in docker-compose.yml
DOMAIN=${DOMAIN}
VERSION=${VERSION}

# Database connection
DB_DSN=${DB_DSN}

# Secret to use for JWT token
# Make sure you change it (>30 random characters) if
# you expose your deployment to outside traffic
AUTH_JWT_SECRET=${JWT_SECRET}

CORREDOR_ADDR=corredor:80

# Corredor local testing without certificate checks
#CORREDOR_SERVER_CERTIFICATES_ENABLED=false
#CORREDOR_CLIENT_CERTIFICATES_ENABLED=false
#CORREDOR_SERVER_CERTIFICATES_PATH=/server-certs
#CORREDOR_CLIENT_CERTIFICATES_PATH=/client-certs

# Corredor Logging
CORREDOR_LOG_ENABLED=true
CORREDOR_LOG_LEVEL=debug

# SMTP settings
# Point this to your local or external SMTP server
SMTP_HOST=${SMTP_HOST}
SMTP_USER=${SMTP_USER}
SMTP_PASS=${SMTP_PASS}
SMTP_FROM="Corteza Webmail" <corteza@${DOMAIN}>

# Corteza Server Logging
LOG_LEVEL=debug
LOG_DEBUG=true

# Corteza Server File Storage Path
STORAGE_PATH=/data
