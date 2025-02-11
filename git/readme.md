**tools** - всякий инструментарий
git clone <url> --branch <branch> --single-branch [<folder>]
### Внешние источники
1. [Заполняем README.md](https://github.com/adam-p/Markdown-here/wiki/Markdown-Cheatsheet#links)
2. [Оптимизация Git](https://docs.gitlab.com/ee/user/project/repository/repository_size.html)
3. [Удаление старых веток](https://medium.com/@FlorentDestrema/a-simple-way-to-clean-up-your-git-project-branches-283b87478fbc)



Удаление старых веток, которые слиты
```sh
git branch -d $(git branch --merged=master | grep -v master)
```

Удаление ссылок локальных на неиспользуемые ветки
```sh
git fetch --prune
```
#### [Навигация](../)
