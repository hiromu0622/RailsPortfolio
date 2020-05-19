# 日本全国踏破

これは『日本全国踏破』というタイトルの旅系 SNS です。

旅行に行った際の綺麗な風景や思い出の写真を、行った県とともに記録してきます。

このサービスを思い立った背景には日本は４７つの都道府県がありますが、意外と行ったことない県が多いなと思いました。

またどこに行ったとか記録せずぼんやり写真を見て思い出す程度の人が多いと思います。

そんな中で自分の日記がわり、ゲーム感覚で４７つの都道府県を制覇し、旅好きの人とも情報を共有してしまおう！と言う趣旨のサービスです。

# 実装機能・技術

CRUD 機能  
プラットフォーム（AWS ElasticBeanstalk）  
データベース（SQLite3）  
CSS フレームワーク（Bootstrap4）  
ユーザー登録＆ログイン  
画像アップロード（carrierwave、mini_magick）  
レビュー（jquery.raty）  
いいね機能  
コメント機能（Ajax）  
日本地図の描写（JapanMap 　 jQuery)  
レスポンシブデザイン  
円グラフ（chartkick）  
フェードインフェードアウト（jQuery)

# 開発環境

ruby 2.7.0p0  
Rails 5.2.4.1

# ページサンプル画像

### TOP ページ

<img width="1280" alt="スクリーンショット 2020-05-18 22 23 58" src="https://user-images.githubusercontent.com/57628172/82218823-6e4d8500-9957-11ea-9e03-1ea2d7f56a7f.png">
<img width="1280" alt="スクリーンショット 2020-05-18 22 24 28" src="https://user-images.githubusercontent.com/57628172/82218913-90df9e00-9957-11ea-9a63-2086bccf37d6.png">
<img width="1280" alt="スクリーンショット 2020-05-18 22 24 41" src="https://user-images.githubusercontent.com/57628172/82219279-03e91480-9958-11ea-9f27-92b41088b9c4.png">
<img width="1280" alt="スクリーンショット 2020-05-18 22 24 51" src="https://user-images.githubusercontent.com/57628172/82219329-16634e00-9958-11ea-9292-71699cd5f08b.png">
<img width="1280" alt="スクリーンショット 2020-05-18 22 25 03" src="https://user-images.githubusercontent.com/57628172/82219371-27ac5a80-9958-11ea-8709-8d6c74955f62.png">
<img width="1279" alt="スクリーンショット 2020-05-18 22 25 36" src="https://user-images.githubusercontent.com/57628172/82219418-3a269400-9958-11ea-9cb6-7f9693a5643c.png">
<img width="1279" alt="スクリーンショット 2020-05-18 22 25 49" src="https://user-images.githubusercontent.com/57628172/82219475-490d4680-9958-11ea-849d-4293e1471b52.png">

### 投稿一覧画面

<img width="318" alt="スクリーンショット 2020-05-18 22 27 05" src="https://user-images.githubusercontent.com/57628172/82219514-562a3580-9958-11ea-94d5-dceec09ffed4.png">

### マイページ

<img width="1225" alt="スクリーンショット 2020-05-18 22 27 39" src="https://user-images.githubusercontent.com/57628172/82219592-7823b800-9958-11ea-9602-453c2a2dc12f.png">
<img width="1278" alt="スクリーンショット 2020-05-18 22 27 56" src="https://user-images.githubusercontent.com/57628172/82219612-81ad2000-9958-11ea-9003-44bb6224f722.png">

## 苦労した点

初めてのポートフォリオ作りということで一つ一つの機能を作るのにとても大変ではありました。

しかし技術的には他の初学者の方と大差ないかと思います。

その中でオリジナリティを出すため日本地図を描写し、ユーザーの状況により色が変わるという機能を作りました。

こちらの機能をつけるのに新たに JavaScript を勉強し、rails と連携させるところが非常に苦労しました。

このようなサービスを作ることで、日常で何気なく使っているサービスは非常に多くの技術が使われていることを気づかされました。

こちらのポートフォリオにもなるべく普段使っているサービスの機能をつけてユーザーがわかりやすいように制作しました。

## テストユーザー

こちらのポートフォリオを使っていただくにあたり忙しい方は登録が面倒かと思います。

テストユーザーとしてこちらでお試しください

#### Email test

#### Password test

## あとがき

拙いポートフォリではありますが今の私の技術であります。

これから新しい技術をどんどん取り込んでいきますのでよろしくお願いします。
