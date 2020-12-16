FROM php:7.4-fpm
ARG TIMEZONE
ARG DB_HOST
ARG DB_USER
ARG DB_PASS
ARG DB_NAME
ARG APP
ARG REP
ARG ENVIRONMENT
ENV DB_HOST $DB_HOST
ENV DB_USER $DB_USER
ENV DB_PASS $DB_PASS
ENV DB_NAME $DB_NAME
ENV APP $APP
ENV REP $REP
ENV ENVIRONMENT $ENVIRONMENT

COPY docker/php/php.ini /usr/local/etc/php/conf.d/docker-php-config.ini

RUN apt-get update && apt-get install -y --no-install-recommends\
    gnupg \
    g++ \
    procps \
    openssl \
    git \
    unzip \
    zlib1g-dev \
    libzip-dev \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    libicu-dev  \
    libonig-dev \
    libxslt1-dev \
    acl \
    git \
    libxml2-dev \
    && echo 'alias sf="php bin/console"' >> ~/.bashrc

RUN docker-php-ext-configure gd --with-jpeg --with-freetype 

RUN docker-php-ext-install \
    pdo pdo_mysql zip xsl gd soap intl opcache exif mbstring

COPY ./docker/php/start.sh /usr/local/bin/start
RUN chmod +x /usr/local/bin/start

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD ["start"]