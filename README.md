# README

## 必要なもの

* Docker
* Docker Compose

## 環境構築

```
# config/master.key を作成する(中身は別でお渡しします)

docker-compose build
docker-compose run --rm rails bin/rails db:setup
docker-compose up
```

http://localhost:3000 にアクセスしてログイン画面が表示されれば完了です。

## 動作確認

以下のユーザーを用意しています。
```
ユーザーID: user1, パスワード: pw1
ユーザーID: user2, パスワード: pw2
```

## コードについて補足

* テストコードはかいていません
* 画像は png, jpg のみ許可しています
  * 画像以外をアップロードできないようにしたかったためです
  * 全ての画像を許可できると良いですが、ひとまずこの2つとしました
