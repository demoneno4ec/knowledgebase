#! /bin/bash

findDirName="bitrix"

#line="/test/dump/bitrix/set/dev/bitrix"

matches=()
index=0

#mapfile -d '' array < <(find . -name "bitrix" -print0)
#echo ${readarray[@]}

for line in $(find . -type d -name "$findDirName");
do
	index=$(($index+1))
	matches+=("${line%%/$findDirName*}")
done

for uniqueMatch in $(echo "${matches[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' ');
do
    printf "   %s\n" $uniqueMatch
done

