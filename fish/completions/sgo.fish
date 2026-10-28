# Отключить стандартное автодополнение файлов для команды sgo
complete -c sgo -f

# Функция, которая безопасно ищет доступные версии Go
function __fish_sgo_get_versions
    # Находим только папки, начинающиеся на go, исключая сам симлинк 'go'
    find /usr/local -maxdepth 1 -type d -name "go[0-9]*" 2>/dev/null | string replace -r '^.*/go' ''
end

# Привязываем результат функции к автодополнению аргументов команды sgo
complete -c sgo -a "(__fish_sgo_get_versions)" -d "Версия Go"

