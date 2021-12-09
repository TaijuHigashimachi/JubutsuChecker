![ogp_jubutsuchecker](https://user-images.githubusercontent.com/46441090/144726415-30c239f7-b060-4d8c-a6a7-b4b3895ae0b2.png)

# 1．URL
https://jubutsuchecker.herokuapp.com/

# 2．サービス概要
『呪物確認』は、身の回りのものを写真に撮ると、それが呪われたモノ（呪物）かどうか確認できるサービスです。  
マンガ『呪術廻戦』に登場する呪物かどうかも確認できます。  

### 詳細
[身の回りにある「呪いのアイテム」を検出するサービスを未経験エンジニアが作ってみた【個人開発】](https://qiita.com/taiju365/items/f7c5387ade42bfb5d3cf)

# 3．主な機能

## トップページ
![db5ef52b4571c67da83decba6922491a](https://user-images.githubusercontent.com/46441090/144726647-f0f67b9f-5ddf-4cf4-acad-0bca2880c8b3.gif)  
トップページでは、写真の撮影・選択ができます。  
パソコンからアクセスした場合は「写真を選択する」のボタンが、スマートフォンからアクセスした場合は「写真を撮影する」のボタンが表示されます。  

## リザルトページ
![bccbcc43-2676-4c71-4374-24776957c7ea](https://user-images.githubusercontent.com/46441090/144726700-abc84fbe-3d10-4e24-a966-eb1d28706663.gif)  
リザルトページでは、写真の中に呪物の可能性が検知されたかを確認できます。  

検知された場合は、検知した箇所に四角い枠が表示され、さらに呪物の名前と呪物を説明しているYouTubeの動画が表示されます。

## 呪物一覧ページ
![77d63769-21da-6bf7-e307-df634fa4e0e9](https://user-images.githubusercontent.com/46441090/144726749-17d7f4f4-5ba2-428c-bd6a-f8033e2d60b2.gif)  

呪物一覧ページでは、写真から検知できる呪物の一覧が確認できます。

# 4．ER図
![68747470733a2f2f71696974612d696d6167652d73746f72652e73332e61702d6e6f727468656173742d312e616d617a6f6e6177732e636f6d2f302f3634313031322f31393534613831662d616230612d333062332d393938652d6630666162623761306634642e706e67](https://user-images.githubusercontent.com/46441090/144726794-572a191c-bbeb-40e5-b6fc-23fc83741446.png)  

## cursed_itemsテーブル
呪物の名前とYouTubeの動画IDを保存するテーブルです。  

## label_namesテーブル、labelingsテーブル
呪物とラベルの対応関係を保存するテーブルです。  

本サービスでは物体検出にGoogle Cloud PlatformのVision APIを使用しています。  
Vision API側の物体名をラベル名としてデータベースに登録し呪物と関連付けておくことで、Vision APIからのレスポンスに応じて関連のある呪物を表示しています。  

## accessesテーブル
アクセス数に応じてビューの内容を切り替えたかったため、アクセス数をデータベースに保存しています。

# 5．主な使用技術

## バックエンド
- Ruby 3.0.2
- Rails 6.1.4

## フロントエンド
- HTML
- CSS（SCSS）
- JavaScript（jQuery）
- Bootstrap5
- Font Awesome

## Gem
- High Voltage
  - 静的ページの作成
- Pagy
  - ページネーション
  - Kaminariよりもパフォーマンスが優れているということで選定
- jpmobile
  - PCとスマホで、一部表示わけをしたかったので導入

## プラグイン
- Infinite Scroll
- Swiper

## インフラ
- Heroku

## API
- Vision API
