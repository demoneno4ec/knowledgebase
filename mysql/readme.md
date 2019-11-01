# mysql

### Команды

### Создание базы данных
```mysql 
CREATE DATABASE `db_name` CHARACTER SET utf8 COLLATE utf8_general_ci;
```
1. ***db_name*** - Имя базы данных
2. ***utf-8*** - кодировка базы данных
3. ***utf8_general_ci*** - локаль базы данных

### Назначить права пользователя, для базы данных
```mysql 
GRANT ALL PRIVILEGES ON `db_name`.`table_name` TO 'user_name'@'localhost' IDENTIFIED BY 'password';
```
1. ***db_name*** - Имя базы данных, если необходимо назначить для всех существующих, тогда ***`*`***
1. ***table_name*** - Имя таблицы, если необходимо назначить для всех существующих, тогда ***`*`***
1. ***user_name*** - Имя пользователя
1. ***localhost*** - Место расположения базы данных
1. ***password*** - пароль пользователя, указывается, только если пользователь не ыбыл создан ранее


mysql -u username -p database_name < file.sql
mysqldump -u username -p databasename tableName > path/example.sql

#### Навигация
1. [git](../git/)
2. mysql
3. [php](../php/)
    1. [laravel](../php/laravel/)
        1. [artisan](../php/laravel/artisan/)
