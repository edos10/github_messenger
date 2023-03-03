<h1 align="center">Github Messenger</h1>

Проект представляет собой утилиту в командной строке, которая даст возможность пользователям Github общаться друг с другом посредством коммитов как сообщений.

Предполагается создавать с помощью конкретной команды приватный репозиторий, куда будут добавляться участники диалога, то есть будет своеобразная комната, а затем там можно будет общаться или получать все сообщения из диалога.

Хочется сделать так, чтобы по стилю вводимых команд было похоже на утилитку kks.

<h1 align="center">Функционал проекта следующий:</h2>

<b>ghm log</b> - авторизация на Github

<b>ghm create $name_repo</b> - создать диалог 

<b>ghm send $user_name</b> - отправить сообщение 

<b>ghm read $repo_name</b> - просмотреть непрочитанные сообщения 

***Возможны изменения в следующих функциях, но пока мы видим их так:***

<b>ghm update $name_repo</b> - обновить данные и диалоги

<b>ghm chatall $name_repo</b> - просмотреть весь чат со всеми сообщениями  

***по ходу проекта данный раздел будет дополняться как и остальные***

<h1 align="center">Описание проекта и хода работы.</h1>


Непосредственно вся работа будет осуществляться через написание .sh файлов, т.е. скриптов, и использования Github API, которое поможет упростить написание кода. По началу проект будет разбит на куски по скриптам, затем можно будет некоторые объединить, если будет много файлов.
  
  Для начала, чтобы работать с утилитой, нам потребуется залогиниться в Github через cmd. Для этого будет создан отдельный скрипт github_login, описание которой и других скриптов будет в файлах .sh или здесь. Пользователь сможет создать приватный репозиторий для обмена сообщениями с другими пользователями. Каждый диалог должен иметь свой собственный репозиторий, который будет обеспечивать доступ к сообщениям и данным.
  
  Затем можно или отправить сообщение, или прочитать новые - для этого есть функции read и send.
  send работает просто - принимает параметры имя и текст в соответствующем порядке и пишет в файл текст, затем коммитит с текстом по образцу: "username: text"
  read будет посложнеее - пока первая идея хранить файл, где будет храниться хэш последнего прочитанного коммита и если этот хэш не совпадает с хжшом последнего коммита, значит, есть новые сообщения и их иожно узнать благодаря git log --since.
  
  create нужна для того, чтобы как раз создавать эти самые диалоги, но нужно учитывать, что комнаты уникальны, а одной комнате соответствует один репозиторий.
  update нужен для обновления данных и получения новых сообщений - мы еще подумаем над реализацией автообновления и уведомлений, но на данный момент задача является трудно выполнимой.
  chatall позволит посмотреть все коммиты и, соответственно, весь чат с сообщениями.

<h2 align="center">Распределение обязонностей</h2>

<b>Эдуард:</b> log, create, send
<b>Антон:</b> read, update, chatall

<h2 align="center">Источники</h2>

Bash документация: https://www.gnu.org/software/bash/manual/bash.html
