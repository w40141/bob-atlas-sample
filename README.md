# bob-sample

このリポジトリは、bobとatlasを使ったサンプルプロジェクトです。

[bob](https://github.com/stephenafamo/bob)はSQLを操作するためのGo言語のパッケージです。
[atlas](https://atlasgo.io/)はデータベーススキーマを管理、マイグレーションするフレームワークです。

## セットアップ

### bobをインストール

```bash
go mod tidy
```

### atlasをインストール

こちらの[公式ドキュメント](https://atlasgo.io/docs#installation)を参照してください。

## コマンド

docker composeでデータベースを起動させておく必要があります。

```bash
docker compose up
```

atlasの設定ファイルを作成することで、コマンド実行時に毎回URLを指定する必要がなくなります。
本リポジトリでは`./config/atlas.hcl`にあります。

```bash
atlas migrate diff -c file://./config/atlas.hcl ---env local
```

### マイグレーション用SQLの生成

- `-to`
  - スキーマファイルを指定
- `-dir`
  - マイグレーションファイルを出力するディレクトリを指定
- `--dev-url`
  - 接続する検証用データベースのURLを指定

```bash
atlas migrate diff \
    --dev-url docker://mysql/8/dev \
    --to file://db/schema.hcl \
    --dir file://db/migrations
```

### バージョニングによるマイグレーション

- `--url`
  - 接続するデータベースのURLを指定
- `--dir`
  - マイグレーションファイルが保存されているディレクトリを指定
- `--dry-run`
  - 実際には実行せず、実行されるSQLを表示する

```bash
atlas migrate apply \
    --url mysql://user:password@localhost:13306/sample \
    --dir file://db/migrations
```

### 宣言的マイグレーション

- `--url`
  - 接続するデータベースのURLを指定
- `-to`
  - スキーマファイルを指定
- `--dry-run`
  - 実際には実行せず、実行されるSQLを表示する

```bash
atlas schema apply \
    --url mysql://user:password@localhost:13306/sample \
    --to file://db/schema.hcl
```

### bobのコード生成

- `-c`
  - bobの設定ファイルを指定(デフォルトは`./bobgen.yaml`)

```bash
go run github.com/stephenafamo/bob/gen/bobgen-mysql@latest -c ./config/bobgen.yaml
```
