#!/bin/bash

# Запрос имени пользователя и пароля

echo "Введите имя пользователя:"

read username

echo "Введите пароль:"

read -s password

# Отправка запроса на авторизацию и получение токена доступа

response=$(curl -s -u "$username:$password" -X POST https://api.github.com/authorizations \-d "{\"scopes\":[\"repo\"],\"note\":\"github-messenger\"}")

token=$(echo $response | grep -oP '"token": "\K[^"]+')

# Сохранение токена в файл

echo $token > ~/.github_token

# Вывод сообщения об успешной авторизации

echo "Вы успешно вошли на GitHub. Токен доступа сохранен в ~/.github_token"
