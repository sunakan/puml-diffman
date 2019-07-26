# make testでLocalでCircleCIの挙動をある程度テスト(Workflowが未対応なため2.0にしてからjob毎に実行)
# https://circleci.com/docs/ja/2.0/local-cli/
# のワークフロー項目
convert-2:
	circleci config process .circleci/config.yml > .circleci/config-2.0.yml

# 必要なものはGITHUB_TOKEN(repo)
# プルリクのIssueの更新
update-pullrequested-issues: convert-2
	circleci local execute -c .circleci/config-2.0.yml -e GITHUB_TOKEN=`cat GITHUB_TOKEN.secret` --job update_pullrequested_issues

puml:
	docker run -d -p 8080:8080 plantuml/plantuml-server:jetty
