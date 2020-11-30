#!/bin/bash
cd /var/www
echo "============> Iniciando instalação $APP"

declare -A REP

if [ "$(ls -A /var/www/$APP)" ]; then
    # Sistema já existe
    echo "------> Sistema pronto $APP"
else
    # Sistema não existe
    echo "------> Clonando $APP -> $REP"

    git clone ${REP} /var/www/${APP}
fi

echo "------> Composer install $APP"
cd /var/www/${APP}
composer install --no-suggest --quiet

echo "============> Instalação concluída $APP"

php-fpm -R