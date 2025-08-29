#!/usr/bin/env bash
set -euo pipefail

# Required variables
: "${OIDC_ISSUER:?Set OIDC_ISSUER, e.g. http://keycloak:8080/realms/suitecrm/.well-known/openid-configuration}"
: "${OIDC_CLIENT_ID:?Set OIDC_CLIENT_ID}"
: "${OIDC_CLIENT_SECRET:?Set OIDC_CLIENT_SECRET}"

# Sensible defaults
: "${OIDC_REDIRECT_URI:=http://localhost:8080/oidc/callback}"
: "${OIDC_CRYPTO_PASSPHRASE:=change-this-random-string}"
: "${OIDC_REMOTE_USER_CLAIM:=preferred_username}"

# Render template
envsubst < /etc/apache2/conf-available/oidc.conf.template > /etc/apache2/conf-available/oidc.conf

# Enable the conf (idempotent)
a2enconf oidc >/dev/null 2>&1 || true

# Hand off to Apache
exec "$@"
