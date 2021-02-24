import sys
import os
import types
from termcolor import colored, cprint

##calbacks
def fileChangeProjectMark(line):
    return [line.replace('#PROJECT_NAME#', project)]

def dockerComposePreparation(line):
    lines = []

    if ('#PLACE_NGINX_VOLUME#' in line):
        with open('./templates/docker-compose/volumes/nginx_volume', 'r') as file:
            for line in file:
                lines.append(line)
    elif('#PLACE_NEW_MICROSERVICE#' in line):
        with open('./templates/docker-compose/container', 'r') as file:
            for line in file:
                lines.append(line)
    else:
        lines.append(line)
    return lines

## functions
def fileChangeAndMoveWithCallbackChange(fromPath, toPath, callback):
    lines = []
    # Parse the file into lines
    with open(fromPath, 'r') as file:
        for line in file:
            if(callable(callback)):
                lines += callback(line)

    # Write them back to the file
    with open(toPath, 'w') as file:
        file.writelines(lines)

error = lambda x: cprint(x, 'white', 'on_red')
info = lambda x: cprint(x, 'green')

try:
    project = sys.argv[1]
    info(project + ' - название проекта')
except IndexError:
    error("Название проекта обязательно передайте по шаблону:")
    print("python3 createMicroserviceContext.py project")
    exit()

fileChangeAndMoveWithCallbackChange('./docker-compose.yml', './templates/docker-compose/docker-compose.yml', dockerComposePreparation)

configs = [
    {
        'from': './templates/php-fpm/Dockerfile',
        'to' : './php-fpm-' + project + '/Dockerfile'
    },
    {
        'from': './templates/nginx/project.conf',
        'to' : './nginx/' + project + '.conf'
    },
    {
        'from': './templates/docker-compose/docker-compose.yml',
        'to' : './docker-compose.yml'
    },
]

for config in configs:
    if (os.path.isfile(config['from'])):
        fileChangeAndMoveWithCallbackChange(config['from'], config['to'], fileChangeProjectMark)