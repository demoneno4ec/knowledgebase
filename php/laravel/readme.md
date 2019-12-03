# [laravel](https://laravel.com/docs)

### Установка ide-helper

1. Устанавливаем пакет ide-helper composer
```bash
composer require barryvdh/laravel-ide-helper
```
2. Установка пакет ide-helper composer (необходим для описания в уже созданных моделях)
```bash
composer require doctrine/dbal
```
3. Зарегестрировать пакет в laravel config/app.php
```php
Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider::class,
```
4. Очищаем кэш
```bash
php artisan clear-compiled
```
5. Создаем ide-helper
```bash
php artisan ide-helper:generate
```
6. Документируем уже созданные модели
```bash
php artisan ide-helper:models
```
7. Оптимизируем 
```bash
php artisan optimize
```


#### [Навигация](../../)