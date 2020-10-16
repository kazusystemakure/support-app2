# アプリケーション名
## 健康で支援

# 概要
### 目的はスキマ時間を健康で埋める。結果的に支援となる。
### (講師)オンラインレッスンを開催する。申込者に対してZoomで開催。→ 運動や健康の知識/スキルが、支援という別の形へ。
### （参加者）オンラインの運動レッスンを購入（クレジット決済）して、Zoomより参加する。→ 自身の運動や健康に支払った費用が支援となる。

# URL
### http://52.193.45.139/

# テスト用アカウント
### Basic認証 
#### ID: supportadmin  Password: 123123123
### テストアカウント
#### 講師(山田太郎)         メールアドレス: yamada@gmail.com   Password: yamada123
#### 講師兼参加者(田中よし子) メールアドレス: tanaka@gmail.com   Password: tanaka123
#### 参加者(鈴木二郎)       メールアドレス: suzuki@gmail.com    Password: suzuki123
### 購入カード情報
#### 番号: 4242424242424242(16桁) 期限; MM/YY 11/23  CVC: 123

# 利用方法
### WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
### ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
### 接続先およびログイン情報については、上記の通りです。
### 同時に複数の方がログインしている場合に、ログインできない可能性があります。
### レッスン追加方法
#### 講師テストアカウントでログイン→トップページ→新規レッスン追加ボタン押→レッスン追加情報入力→レッスン追加ボタン押
### 購入方法
#### 参加者テストアカウントでログイン→トップページのレッスン一覧からレッスンを選択→レッスン詳細確認→レッスン購入→マイページに購入したレッスンが表示→レッスン詳細にZoom IDとパスワード表示
### 確認後、ログアウト処理をお願いします。

# 目指した課題解決
















# テーブル設計

## users テーブル

| Column                | Type        | Options                                     |
| --------------------- | ------------| --------------------------------------------|
| name                  | string      | null: false                                 |
| name_kane             | string      | null: false                                 |
| introduction          | string      |                                             |
| email                 | string      | null: false                                 |
| encrypted_password    | string      | null: false                                 |
| postal_code           | string      | null: false                                 |
| prefecture            | string      | null: false                                 |
| city                  | string      | null: false                                 |
| address               | string      | null: false                                 |
| phone_number          | string      | null: false                                 |
| birth_date            | date        | null: false                                 |
| skill                 | string      |                                             |
| publish_id            | integer     |                                             |

### Association
- has_many :lessons
- has_many :orders


## lessons テーブル

| Column                | Type        | Options                                     |
| --------------------- | ------------| --------------------------------------------|
| name                  | string      | null: false                                 |
| text                  | string      | null: false                                 |
| level_id              | integer     | null: false                                 |
| lesson_date           | date        | null: false                                 |
| bigin_at              | time        | null: false                                 |
| closed_at             | time        | null: false                                 |
| price                 | string      | null: false                                 |
| zoom_url              | string      | null: false                                 |
| zoom_password         | string      | null: false                                 |
| user_id               | references  | null: false, null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :orders


## orders テーブル

| Column                | Type        | Options                                     |
| --------------------- | ------------| --------------------------------------------|
| user_id               | references  | null: false, null: false, foreign_key: true |
| lesson_id             | references  | null: false, null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :lesson