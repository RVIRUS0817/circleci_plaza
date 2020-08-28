#!/bin/bash
 
BRANCHNAME=$1
 
help() {
echo "
  下記のようにブランチを指定して実行してください。
  (例) sh stg-deploy.sh ブランチ名
    "
}
 
if [ $# -ne 1 ];then
 help
exit
fi
 
curl -u API: -X POST --header "Content-Type: application/json" -d '{
  "branch": "'"${BRANCHNAME}"'",
  "parameters": {
    "deploy_wordpress_stg": true
  }
}' https://circleci.com/api/v2/project/github/プロジェクト名/リポジトリ名/pipeline
 
echo "
  ブランチ名/ "${BRANCHNAME}" のStgデプロイを開始しました!
"
