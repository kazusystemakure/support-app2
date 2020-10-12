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
- has_one :order


## orders テーブル

| Column                | Type        | Options                                     |
| --------------------- | ------------| --------------------------------------------|
| user_id               | references  | null: false, null: false, foreign_key: true |
| lesson_id             | references  | null: false, null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :lesson