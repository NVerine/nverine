#!/bin/bash
cd /var/www
echo "============> Iniciando instalação $APP"

declare -A REP

if [ "$(ls -A /var/www/$APP)" ]; then
    # Sistema já existe
    echo "------> Criando .env"
    echo "DATABASE_URL='mysql://$DB_USER:$DB_PASS@$DB_HOST:3306/$DB_NAME'" > /var/www/${APP}/.env

    echo "------> Sistema pronto $APP"
else
    # Sistema não existe
    echo "------> Clonando $APP -> $REP"

    git clone ${REP} /var/www/${APP}
fi

chmod a+rw -R /var/www/${APP}

echo "------> Composer install $APP"
cd /var/www/${APP}
composer install --no-suggest --quiet

echo "============> Instalação concluída $APP"

echo "------> Doctrine migrations $APP"
php bin/console doctrine:database:create --if-not-exists
php bin/console --no-interaction doctrine:migrations:migrate

php-fpm -R