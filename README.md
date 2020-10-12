# furima_28772

フリマーケットを行うためのアプリケーションです。  
サインインまたはログインをすると、商品の出品や購入を行うことができます。

# URL

http://18.177.167.132 
トップページからログインページへ遷移してください。

# 使用技術一覧

- ruby 2.6.5  
- rails 6.0.0
- MySql 5.6.47
- Nginx
- AWS
  - EC2
  - S3
- Capistrano3
- RSpec

# AWS構成図
<img width="540" alt="スクリーンショット 2020-09-27 15 28 12" src="https://user-images.githubusercontent.com/69130053/95648368-762de180-0b11-11eb-90c5-5d12b95c2d59.png">

# 機能一覧

- ユーザー登録、ログイン機能(devise)
- 商品出品機能
  - 画像投稿(ActiveStorage, mini_magick, image_processing)
- 商品一覧表示機能
- 商品詳細表示機能
- 商品情報編集機能
- 商品削除機能 
- 商品購入機能(API:PAY.JP)

# テスト
- RSpec
  - 単体テスト(model)
  - 結合テスト(system)  