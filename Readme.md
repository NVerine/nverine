# 🐳 Docker + PHP 7.4 + MySQL + Nginx + Symfony 5

## Description

This is a complete stack for running Symfony 5 into Docker containers using docker-compose tool.

It is composed by 3 containers:

- `nginx`, acting as the webserver.
- `php`, the PHP-FPM container with the 7.4 PHPversion.
- `db` which is the MySQL database container with a **MySQL 5.7** image.

## Installation

1. 😀 Clone this rep.

2. Run `docker-compose up -d`

3. Update data in `docker-compose.yml`
