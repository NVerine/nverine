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


# NverineAPI - Symfony

Api de geração de dados para o NverineVue.
Também pode ser usada por outras interfaces.

Esta projeto teve início como um desafio para dominar o uso do 
framework symfony, junto com isto senti a necessidade de que o
backend tenha um escopo bem definido e que possa ser consumido
por qualquer outra tecnologia atraves do JSON.

Pretendo continuar trabalhando neste projeto estendendo e criando rotinas. 

## Caso de Uso

Esta Api foi construida específicamente para ser usada em 
conjunto com a interface NverineVue, mas pode ser usada
com qualquer outra interface desde sejam respeitadas
as regras de login e segurança com Token.

Ao acessar a url /login com o metodo POST enviando username e senha
será retornado um token em caso de sucesso. Esse token deve ser usado
em todas os requests subsequentes da interface.

## Como usar
### Dev

Este Projeto pode ser usado via maneiras tradicionais de desenvolvimento PHP,
mas neste caso é recomendado a utilização do Docker,
pois a configuração do docker ja está pronta e o ambiente pode ser executado
em poucos minutos.
* use o comando: **docker-compose up -d --build**

Este comando criará tres containers:
* mysql: container com o banco de dados
* php: container com a aplicação
* phpmyadmin: container com a visualização rápida do banco de dados

### Prod

Também recomendado o uso do docker, mas dessa vez somente o Dockerfile
com os comandos:
* docker build --tag nverineapi .
* docker build --build-arg DB_HOST=localhost --build-arg DB_USER=root --build-arg DB_PASS=admin --build-arg DB_NAME=demo

Neste caso será criado apenas o container com a aplicação. 
Os argumentos do DB devem ser ajustados de acordo com o seu caso.

### Exemplos
API: https://nverine-demo-api.azurewebsites.net/
Completo (interface+api): https://nverine-demo.azurewebsites.net/

