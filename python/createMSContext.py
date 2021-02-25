import sys
import os
from functools import partial
from termcolor import cprint

error = partial(cprint, color='white', on_color='on_red')
info = partial(cprint, color='green')

def docker_compose_preparation(line):
    conformity_table = {
        '#PLACE_NGINX_VOLUME#': './templates/docker-compose/volumes/nginx_volume',
        '#PLACE_NEW_MICROSERVICE#': './templates/docker-compose/container',
    }

    lines = []
    clean_line = line.strip()

    if clean_line in conformity_table:
        with open(conformity_table[clean_line], 'r') as f:
            for x in f.readlines():
                lines.append(x)
    else:
        lines.append(line)

    return lines

def file_change_and_move_with_callback_change(from_path, to_path, callback):
    lines = []

    with open(from_path,  'r') as f:
       for x in f.readlines():
           if callable(callback):
               lines += callback(x)
           else:
               lines.append(x)

    with open(to_path, 'w') as f:
        f.writelines([x for x in lines])

def main():
    try:
        project = sys.argv[1]
        info(project + ' - название проекта')
    except IndexError:
        error("Название проекта обязательно передайте по шаблону:")
        print("python3 createMicroserviceContext.py project")
        exit()
        return

    project = str(project)

    def file_change_project_mark(line):
        return [line.replace('#PROJECT_NAME#', project)]

    file_change_and_move_with_callback_change(
        './docker-compose.yml',
        './templates/docker-compose/docker-compose.yml',
        docker_compose_preparation,
    )

    configs = filter(lambda x: os.path.isfile(x[0]), (
        ('./templates/php-fpm/Dockerfile', './php-fpm-' + project + '/Dockerfile'),
        ('./templates/nginx/project.conf', './nginx/' + project + '.conf'),
        ('./templates/docker-compose/docker-compose.yml', './docker-compose.yml'),
    ))

    for from_path, to_path in configs:
        file_change_and_move_with_callback_change(
            from_path,
            to_path,
            file_change_project_mark,
        )

if __name__ == '__main__':
    main()