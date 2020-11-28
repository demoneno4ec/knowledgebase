function createProjectBitrix --description "create nginx config and apache config with template "
	if test (count $argv) -ne 1
		echo -e 'Имя проекта обязательно'
		return;
	end

	set name $argv[1]
	set confName $name'.conf'
    set apacheFolder '/etc/apache2'
    set nginxFolder '/etc/nginx'
    set availableConfig '/sites-available'
    set enabledConfig '/sites-enabled'
    set -l checkConfigErrors
    set error 0

    set -p checkConfigErrors (checkConfig $apacheFolder$availableConfig $confName)
    set -p checkConfigErrors (checkConfig $apacheFolder$enabledConfig $confName)
    set -p checkConfigErrors (checkConfig $nginxFolder$availableConfig $confName)
    set -p checkConfigErrors (checkConfig $nginxFolder$enabledConfig $confName)

    if test (count $checkConfigErrors) -ne 0
        for checkConfigError in $checkConfigErrors
            if test (string length checkConfigError) -ne 0
                echo -e "$checkConfigError";
            end
        end
        return
    end

    echo $error
    set error (sudo fish -c "printf \"%s\n\" (getApacheConfig $confName) > $apacheFolder$availableConfig/$confName" 2>| echo 1);

    echo $error
    if test $error -gt 0
        echo "error"
        return
    end

    return
end