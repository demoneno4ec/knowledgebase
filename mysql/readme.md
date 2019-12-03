# mysql

### Команды

### Создание бд и назначение прав для пользователя

```bash
mysql -u root -p -ve "create database `{{db_name}}` character set utf8mb4 collate utf8mb4_general_ci"
mysql -u root -p -ve "grant all privileges on `{{db_name}}`.* to '{{user_name}}'@'localhost' identified by '{{password}}'"
```

### Создание базы данных
```mysql 
CREATE DATABASE `db_name` CHARACTER SET utf8 COLLATE utf8_general_ci;
```
1. ***db_name*** - Имя базы данных
2. ***utf-8*** - кодировка базы данных
3. ***utf8_general_ci*** - локаль базы данных

### Назначить права пользователя, для базы данных
```mysql 
grant all privileges on `{{db_name}}`.`{{table_name}}` to '{{user_name}}'@'localhost' identified by '{{password}}';
```
1. ***db_name*** - Имя базы данных, если необходимо назначить для всех существующих, тогда ***`*`***
2. ***table_name*** - Имя таблицы, если необходимо назначить для всех существующих, тогда ***`*`***
3. ***user_name*** - Имя пользователя
4. ***localhost*** - Место расположения базы данных
5. ***password*** - пароль пользователя, указывается, только если пользователь не ыбыл создан ранее

### Сделать бэкап базы данных

```bash
mysqldump -u {{user_name}} -p {{db_name}} {{table_name}} > {{path}}/{{example.sql}}
```
Сначала необходимо проверить что есть утилита mysqldump
```bash
which mysqldump
```
|variable            | description                                                                               |
| :--------------    | -----:                                                                                    |
| ***db_name***      | **Имя базы данных**                                                                       |
| ***table_name***   | **Имя таблицы**, <br/> если необходимо назначить для всех существующих, тогда не указывать|
| ***path***         | **Желаемая папка**, <br/> для бэкапа бд                                                   |
| ***example.sql***  | **наименование файла дампа**                                                              |

### Залить бэкап базы данных

```bash
mysql -u {{user_name}} -p {{db_name}} < {{example.sql}}
```

#### [Навигация](../)