function sphp --description "dismod another version php, and start version php on $argvs"
    # validation
	if test (count $argv) -ne 3
		echo 'Количество аргументов не равно 2'
		return;
	end

	set tag $argv[1]
	set repository $argv[2]
	set comment $argv[3]

    # remove tag
	if test (git tag -l | grep -c "$tag") -eq 1
		echo -e "Указанный тег установлен.Он будет удален."
        git tag -d "$tag"; git push origin --delete "$tag";
	end

    # add tag
	git tag -a "$tag" -m "$comment"; git push "$repository" "$tag";
end
