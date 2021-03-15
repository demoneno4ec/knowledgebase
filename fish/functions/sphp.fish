function sphp --description "dismod another version php, and start version php on $argvs"
    # validation
	if test (count $argv) -ne 1 
		echo 'Количество аргументов не равно 1'
		return;
	end

	set phpVersion $argv[1]

	if test (ls -la /etc/php/ | grep -c "$phpVersion") -lt 1
		echo -e "Указанная версия php не установлена. \n сначала установите sudo apt install php$phpVersion"
		return;
	end

    # php switch
	sudo update-alternatives --set php /usr/bin/php"$phpVersion"

    # apache modes
    set -l apache (which a2dismod)

    if test -n "$apache"
        for dir in (ls /etc/php)
            sudo a2dismod php"$dir"
        end

        sudo a2enmod php"$phpVersion"
        sudo systemctl restart apache2.service
	end
end
