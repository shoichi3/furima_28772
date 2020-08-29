# テーブル設計

## usersテーブル

|   Column        |   Type   |   Option    |
| --------------- | -------- | ----------- |
| nickname        | string   | null: false |
| email           | string   | null: false |
| password        | string   | null: false |
| first_name      | string   | null: false |
| last_name       | string   | null: false |
| first_name_kana | string   | null: false |
| last_name_kana  | string   | null: false |
| birth_date      | date     | null: false |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

|   Column        |   Type      |   Option                       |
| --------------- | ----------- | ------------------------------ |
| name            | string      | null: false                    |
| detail          | text        | null: false                    |
| category_id     | integer     | null: false                    |
| status_id       | integer     | null: false                    |
| burden_id       | integer     | null: false                    |
| prefecture_id   | integer     | null: false                    |
| delivery_date_id| integer     | null: false                    |
| price           | integer     | null: false                    |
| user            | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :burden
- belongs_to_active_hash :delivery_date
- has_one_attached :image
- has_one :order

## purchasesテーブル

|   Column             |   Type    |   Option                          |
| -------------------- | --------- | --------------------------------- |
| postal_code          | string    | null: false                       |
| prefecture_id        | integer   | null: false                       |
| city                 | string    | null: false                       |
| address              | string    | null: false                       |
| building             | string    |                                   |
| phone_number         | string    | null: false                       |
| order                | references| null: false, foreign_key: true    |

### Association
- belongs_to_active_hash :prefecture
- belongs_to :order

## orderテーブル
|   Column        |   Type    |   Option                          |
| --------------- | --------- | --------------------------------- |
| user            | references| null: false, foreign_key: true    |
| item            | references| null: false, foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase