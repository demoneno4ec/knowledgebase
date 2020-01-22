#!/bin/bash
matchesFile=0
matchesString=0
while read match
do
if [ $match -ne 0 ]
then
matchesString=$(($matchesString+$match))
matchesFile=$(($matchesFile+1))
fi
done < <(grep -nirshc "find string" ./)
echo "Найдено $matchesString совпадений в $matchesFile файлах"