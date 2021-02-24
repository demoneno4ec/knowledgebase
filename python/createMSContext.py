import sys
import os
from termcolor import colored, cprint

error = lambda x: cprint(x, 'white', 'on_red')
info = lambda x: cprint(x, 'green')

try:
    project = sys.argv[1]
    info(project + ' - название проекта')
except IndexError:
    error("Название проекта обязательно передайте по шаблону:")
    print("python3 createMicroserviceContext.py project")
    exit()



dockerLines = []



# Parse the file into lines
with open('./docker-compose.yml', 'r') as file:
    for line in file:
        if ('#PLACE_NGINX_VOLUME#' in line):
            with open('./templates/docker-compose/volumes/nginx_volume', 'r') as file:
                for line in file:
                    dockerLines.append(line)
        elif('#PLACE_NEW_MICROSERVICE#' in line):
            with open('./templates/docker-compose/container', 'r') as file:
                for line in file:
                    dockerLines.append(line)
        else:
            dockerLines.append(line)

# Write them back to the file
with open('./templates/docker-compose/docker-compose.yml', 'w') as file:
    file.writelines(dockerLines)

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
        lines = []

        # Parse the file into lines
        with open(config['from'], 'r') as file:
            for line in file:
                lines.append(line.replace('#PROJECT_NAME#', project))

        # Write them back to the file
        with open(config['to'], 'w') as file:
            file.writelines(lines)
