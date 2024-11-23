# Fluentbidを入門する

- 基本的な標準ログ出力
- PARSERを使った ltsvをjson形式へ変換
- MULTILINE_PARSERを使って stacktrace を連結する

## 検証

https://docs.fluentbit.io/manual/pipeline/parsers/ltsv

- このリポジトリをクローンする
- 動いているDockerの停止/削除 イメージの削除

```bash
export imagename=customfluentbit:0.1
export containername=fluentbid-01

docker stop $containername
docker rm $containername
docker rmi $imagename
```

- DockerImageを作成

```bash
docker build .  -t $imagename
```

- Dockerを起動する ローカルのtmpディレクトリをマウントする

```bash
docker run --name $containername -v ./tmp:/tmp  $imagename
```

- それぞれに紐づいたログファイルの中身を編集して結果を確認する
  - すでに記載してあるログが検証ログなので、コピーしてペーストする 

## 備忘録

### エラー : pasaerは外部ファイルとして定義せよ

```text
Sections 'multiline_parser' and 'parser' are not valid in the main configuration file. It belongs to 
the 'parsers_file' configuration files.
[2024/11/23 00:55:10] [error] configuration file contains errors, aborting.
```

### Parser
- Parser設定は 以下を合わせる必要がある (設定しないと適用されない)
  - [PARSER] の Name
  - [INPUT] の parser
- MultiLineParserの時は `Multiline.parser` を使う 