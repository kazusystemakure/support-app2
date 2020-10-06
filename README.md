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
| prefecture            | integer     | null: false                                 |
| city                  | string      | null: false                                 |
| address               | string      | null: false                                 |
| phone_number          | string      | null: false                                 |
| birth_date            | date        | null: false                                 |
| category_id           | integer     | null: false                                 |
| skill                 | string      |                                             |

### Association
- has_many :lessons
- has_many :orders


## lessons テーブル

| Column                | Type        | Options                                     |
| --------------------- | ------------| --------------------------------------------|
| name                  | string      | null: false                                 |
| text                  | string      | null: false                                 |
| category_id           | integer     | null: false                                 |
| price                 | string      | null: false                                 |
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