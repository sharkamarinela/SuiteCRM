FROM php:7.4-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    unzip git curl \
    libpng-dev libjpeg-dev libfreetype6-dev libzip-dev \
    # OIDC + templating
    libapache2-mod-auth-openidc gettext-base ca-certificates \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli zip \
    && rm -rf /var/lib/apt/lists/*

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable Apache modules
RUN a2enmod rewrite headers auth_openidc

# Set Apache document root  (fix the double slash)
ARG APACHE_DOCUMENT_ROOT=/var/www/html/SuiteCRM
RUN sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/sites-available/*.conf \
    && sed -ri -e "s!/var/www/!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

WORKDIR /var/www/html/SuiteCRM

# Copy entire source code first to ensure all files are present
COPY . /var/www/html/SuiteCRM

# Custom PHP settings (if you have it)
COPY php.ini /usr/local/etc/php/

# --- OIDC Apache config (template) + entrypoint ---
#   We'll render this template using env vars at container start.
COPY .docker/oidc.conf.template /etc/apache2/conf-available/oidc.conf.template
COPY .docker/entrypoint-oidc.sh /usr/local/bin/entrypoint-oidc.sh
RUN chmod +x /usr/local/bin/entrypoint-oidc.sh

# Run composer install
RUN composer install --no-interaction --no-dev --optimize-autoloader --ignore-platform-reqs

# Use our entrypoint to render OIDC config, then start Apache
ENTRYPOINT ["/usr/local/bin/entrypoint-oidc.sh"]
CMD ["apache2-foreground"]

