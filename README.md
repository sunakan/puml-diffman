## PUML DiffMan -PlantUML Diff Manager-

[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

<details>
<summary>これは何？</summary>

- PlantUMLのコードの画像の比較を自動化した仕組み？リポジトリ

</details>


<details>
<summary>なぜ作ったか？</summary>

- PlantUMLがもっと広まってほしいため、以下のことを容易にし、PlantUMLを使う動機の1つになってほしい
  - 改修前と改修後の図の比較のレビュー
- 思いついたはいいが、似たようなOSSを探せなかったため
- 自分の勉強にもなるため

</details>

<details>
<summary>何を自動化したか？</summary>

- feature/\*ブランチのMasterブランチへのプルリクエスト
- 画像のURL生成
- 画像の比較(Before/After)をプルリクIssueへコメント

</details>

<details>
<summary>こんなところで使えるよ(ポートフォリオ編)</summary>

- UMLを導入することで
  - REAMDEにアーキテクチャ図、ER図をつけると華やかになる
  - チームでの開発や誰かとコミュニケーションをとる時、図も使いますよというアピールになる
    - 非エンジニアとのコミュニケーションは図があるととてもスムーズ(もちろんエンジニア同士も)
- PlantUMLを使うことで
  - 図のバージョン管理もできます( ｰ`дｰ´)ｷﾘｯというアピールになる
- このプログラムを導入することで
  - CircleCIで画像の比較が容易になる => 楽しい!!
  - CircleCIで自動プルリク＆コメント => あふれる全能感!!

</details>

<details>
<summary>こんなところで使えるよ(実務編)</summary>

- PlantUMLとGitを組み合わせることで
  - 配置図/ER図/シーケンス図/フローチャート等のバージョン管理ができる(もちろん対応している図も！！)
    - マーケターの人とかもER図のバージョン管理は嬉しい（らしい）
    - PlantUML単体でやっているとこはあっても、バージョン管理をしっかりしてなければ、とてももったいない
- このプログラムを導入することで
  - プルリクのコメントに画像比較が自動で出るためコードレビューならぬ図のレビューがGitHubの中だけで完結 => 嬉しい!!

</details>

<details>
<summary>主なプログラムはどこ？</summary>

- .circleci/config.yml
- puml\_compressor.rb

</details>

<details>
<summary>CircleCIでの流れ</summary>

![alt](https://www.plantuml.com/plantuml/png/UDfpA2v9B2efpStXqj3IL53GrRLJK4egIinBpb38IynDLKZBp2b9BLBYyanJK4fBJImfBKhLrr9IACb8pUC2AOwEJ2sELL1wqRxgQVVKnytJ7pUlVjoywd7JUYMmj1Aoa6TnSMdguyRLJzVlUzmu_N7ZifYyP-kdlDZJ_7pAYkTJTZzjxd_SjFbnyyB7pK2out7Jf6TTKv-ls0yn2UWyhjISubGunpKl9JEDoo4rBmNaUW3mLbXQ)

- [upseart_pullrequest](https://circleci.com/gh/sunakan/puml-diffman/19)
- [update_pullrequested_issues](https://circleci.com/gh/sunakan/puml-diffman/20)


</details>

<details>
<summary>使った小技群</summary>

- プルリクがなければhubコマンドによるCicleCIから自動プルリク
  - PULL_REQUEST_TEMPLATE.mdを使ってIssueTitleのTemplateも編集可能
- CircleCIで\*.pumlだけdiffがあれば、画像URLを作成
  - コメントや空白行はdiffとして見ていない
- Github APIを利用したプルリクIssueへ画像URLを自動コメント
- 自分でPlantUMLコードの圧縮文字列の作成
  - [PlantUMLのサーバをrubyから使ってみた](https://kray.jp/blog/plantuml-server-from-ruby/)

</details>

<details>
<summary>必要なTOKEN</summary>

- GITHUB\_TOKEN
  - プルリクやコメント追加に必要

</details>

<details>
<summary>実際のプルリクの様子</summary>

- [https://github.com/sunakan/puml-diffman/pull/1](https://github.com/sunakan/puml-diffman/pull/1)
- [https://github.com/sunakan/puml-diffman/pull/3](https://github.com/sunakan/puml-diffman/pull/3)

</details>
