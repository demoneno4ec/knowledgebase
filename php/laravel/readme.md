# laravel

[manual](https://laravel.com/docs)

### Установка ide-helper

1. Устанавливаем пакет ide-helper composer
```composer
composer require barryvdh/laravel-ide-helper
```
2. Установка пакет ide-helper composer (необходим для описания в уже созданных моделях)
```composer
composer require doctrine/dbal
```
3. Зарегестрировать пакет в laravel config/app.php (laravel < 5.5)
```php
Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider::class,
```
4. Очищаем кэш
```console
php artisan clear-compiled
```
5. Создаем ide-helper
```console
php artisan ide-helper:generate
```
6. Документируем уже созданные модели
```console
php artisan ide-helper:models
```
7. Оптимизируем 
```console
php artisan optimize
```

#### Навигация
1. [git](../../git/)
2. [mysql](../../mysql/)
3. [php](../)
    1. laravel
        1. [artisan](artisan/)
