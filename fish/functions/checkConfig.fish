function checkConfig --description "helper function for check config by name with folder path"
    if test (count $argv) -lt 1
        echo 'Папка с конфигами обязательна'
        return;
    end

    if test (count $argv) -ne 2
		echo 'Имя конфига обязательно'
		return;
	end

	set folder $argv[1]
	set name $argv[2]

	if test (ls -la $folder | grep -c '\<'$name'\>') -gt 0
        echo $name' конфиг уже есть в папке '$folder
        return;
    end

    return 1;
end