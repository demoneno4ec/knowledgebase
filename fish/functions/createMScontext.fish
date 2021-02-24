function createMScontext --description ""
    if test (count $argv) -lt 1
        echo 'Имя проекта обязательно'
        return;
    end

    set name $argv[1]

    python3 createMSContext.py $name
end