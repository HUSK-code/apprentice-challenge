#!/bin/bash

PASSWORD_FILE="$PWD/.passwords.txt"

echo "パスワードマネージャーへようこそ！"

read -p "サービス名を入力してください：" service
read -p "ユーザー名を入力してください：" username
read -s -p "パスワードを入力してください：" password
echo

#入力情報を保存
echo "$service:$username:$password" >> "$PASSWORD_FILE"

echo "Thank you!"
