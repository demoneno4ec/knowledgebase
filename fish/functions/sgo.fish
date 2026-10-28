function sgo --description "Switch Golang versions via symlink"
    # Валидация: проверяем, что передан ровно 1 аргумент
    if test (count $argv) -ne 1 
        echo (set_color red)"Ошибка: Передайте только один аргумент (например: 1.25.0)"(set_color normal)
        return 1
    end

    set -l goVersion $argv[1]
    set -l targetDir "/usr/local/go$goVersion"

    # Проверяем, существует ли директория с этой версией Go
    if not test -d $targetDir
        echo (set_color yellow)"Версия Go $goVersion не найдена в /usr/local/"(set_color normal)
        echo "Доступные версии:"
        # Выводим список всех папок go*, кроме основного симлинка go
        ls -d /usr/local/go* | string match -r 'go\d+\.\d+\.\d+' | string replace '/usr/local/go' ''
        return 1
    end

    # Переключаем симлинк
    echo "Переключаюсь на Go $goVersion..."
    sudo ln -sfn $targetDir /usr/local/go

    # Выводим новую активную версию для проверки
    if type -q go
        go version
    else
        echo (set_color red)"Внимание: команда 'go' не найдена в $PATH. Убедитесь, что /usr/local/bin добавлен в пути."(set_color normal)
    end
end

