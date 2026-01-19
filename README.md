# Zenn CLI

- [📘 How to use](https://zenn.dev/zenn/articles/zenn-cli-guide)

## よく使うコマンド

### プレビュー

```bash
make preview
```

ローカルでリアルタイムプレビュー（<http://localhost:8000）>

### 記事の作成

```bash
make create-article
```

`articles/`ディレクトリにマークダウンファイルを生成

### 本の作成

```bash
make create-book
```

`books/`ディレクトリに本の雛形を生成

## デプロイ

GitHub連携により、`main`ブランチへのプッシュで自動的にZennに反映されます。
