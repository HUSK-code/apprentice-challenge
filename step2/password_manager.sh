#!/bin/bash

PASSWORD_FILE="$PWD/.passwords.txt"

#メイン処理
main() {
	clear
	echo "パスワードマネージャーへようこそ！"

	while true; do
		echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
		read choice

		case "$choice" in
			"Add Password")
				add_password
				;;
			"Get Password")
				get_password
				;;
			"Exit")
				echo "Thank you!"
				exit 0
				;;
			*)
				echo "入力が間違えています。"
				echo "Add Password/Get Password/Exit から入力してください。"
				;;
		esac
	done
}

#パスワード追加処理
add_password() {
	read -p "サービス名を入力してください：" service
	read -p "ユーザー名を入力してください：" username
	read -s -p "パスワードを入力してください：" password
	echo ""

	#パスワードを保存
	echo "$service:$username:$password" >> "$PASSWORD_FILE"

	echo "パスワードの追加は成功しました。"
}

#パスワード取得処理
get_password() {
	echo "サービス名を入力してください："
	read service

	#サービス名を検索
	result=$(grep "^$service:" "$PASSWORD_FILE")

	if [ -z "$result" ]; then
		echo "そのサービスは登録されていません。"
	else
		IFS=':' read -r service username password <<< "$result"

		echo "サービス名:$service"
		echo "ユーザー名:$username"
		echo "パスワード:$password"
	fi
}

main
