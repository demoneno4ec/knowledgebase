function getApacheConfig --description ""
    if test (count $argv) -lt 1
        echo 'Имя конфига обязательно'
        return;
    end

    set name $argv[1]

    printf "%s\n" \
"<VirtualHost $name.test:81>" \
"   DocumentRoot \"/home/pestovmv/projects/$name\"" \
"   ServerName $name.test" \
"   ErrorLog \"/var/log/apache2/$name/error.log\"" \
"   CustomLog \"/var/log/apache2/$name/access.log\" common" \
"   <Directory \"/home/pestovmv/projects/$name>\"" \
"      AllowOverride All" \
"      Require all granted" \
"   </Directory>" \
"</VirtualHost>" \

end