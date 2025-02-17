# bash

### Команды

countInclusionsStringOntheFolder.sh ищет вхождения слова, в папке рекурсивно
findBitrix.sh ищет рекурсивно проекты на битрикс и путь до проекта.

### Пока не оформил

#### Bash
Поиск самых тяжелых файлов.
```shell script
find . -maxdepth 1 -mindepth 1 -type d -exec du -hs '{}' ';'
```

Вывод количества файлов и занимаемое место в директории
```shell script
targetDirectory="/_ftp/traffic_light_images/2020/8";
for dir in $(ls -A $targetDirectory); 
do 
  targetSubDirectory=$targetDirectory"/"$dir;
  for countFiles in $(ls -A $targetSubDirectory | wc -l);
  do
    echo $countFiles" "$(du -sh $targetSubDirectory); 
  done
done
```

Создание симлинка куда, откуда
```shell
ln -s $from $to
```
- $from - откуда
- $to - куда по умолчанию ./

guide
https://tldp.org/

Поиск файлов с размером больше заданого в байтах
```shell
find . -type f -size +1000000c ! -path "./.git*" ! -path "./vendor*"
```

Поиск файлов с размером больше заданого в байтах и вывод размера файла
```shell
find . -type f -size +1000000c ! -path "./.git*" ! -path "./vendor*" -exec du -sch {} +
```


#### [Навигация](../)
