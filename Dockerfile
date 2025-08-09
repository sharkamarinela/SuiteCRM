FROM php:7.4-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli zip

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set Apache document root
ARG APACHE_DOCUMENT_ROOT=//var/www/html/SuiteCRM
RUN sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/sites-available/*.conf \
    && sed -ri -e "s!/var/www/!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

WORKDIR /var/www/html/SuiteCRM

# Copy entire source code first to ensure all files are present
COPY . /var/www/html/SuiteCRM
# Copy custom php.ini
COPY php.ini /usr/local/etc/php/

# Run composer install with optimized autoloader
RUN composer install --no-interaction --no-dev --optimize-autoloader --ignore-platform-reqs
