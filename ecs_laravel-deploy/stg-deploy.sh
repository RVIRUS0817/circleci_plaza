#!/bin/bash

BRANCHNAME=$1

url="https://hooks.slack.com/services/xxxxxxxxxxxxxx"
username='Stg'
to="bot_xxxxxx"
subject='Stgデプロイを開始しました:docker2:'
color="#0000FF"
message="ブランチ名: \`"${BRANCHNAME}"\` https://app.circleci.com/pipelines/github/xxxxxxx/xxxxx"

help() {
echo "
  下記のようにブランチを指定して実行してください。
  (例) ~/www/adachin/docker/stg/deploy.sh ブランチ名
    "
}

if [ $# -ne 1 ];then
 help
exit
fi

curl -u xxxxxxxxxxxxxxx: -X POST --header "Content-Type: application/json" -d '{
  "branch": "'"${BRANCHNAME}"'",
  "parameters": {
    "build_and_push_docker_image_app_devops_stg": true
  }
}' https://circleci.com/api/v2/project/github/xxxxxxxx/xxxx/pipeline

echo "
  ブランチ名/ "${BRANCHNAME}" のStgデプロイを開始しました。
  #bot_xxxxxxにて確認しましょう。
"

payload="payload={
  \"channel\":    \"${to}\",
  \"username\":   \"${username}\",
  \"text\":       \"${subject}\",
  \"attachments\": [
    {
      \"color\" : \"${color}\",
      \"text\"  : \"${message}\",
    }
  ]
}"

curl -m 5 --data-urlencode "${payload}" ${url}
