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
| birth_date1     | integer  | null: false |
| birth_date2     | integer  | null: false |
| birth_date3     | integer  | null: false |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

|   Column        |   Type      |   Option                       |
| --------------- | ----------- | ------------------------------ |
| name            | string      | null: false                    |
| detail          | text        | null: false                    |
| price           | integer     | null: false                    |
| user_id         | references  | null: false, foreign_key: true |
| prefecture_id   | references  | null: false, foreign_key: true |
| category_id     | references  | null: false, foreign_key: true |
| status_id       | references  | null: false, foreign_key: true |
| burden_id       | references  | null: false, foreign_key: true |
| day_id          | references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :burden
- belongs_to_active_hash :day
- has_one_attached :image

## purchasesテーブル

|   Column        |   Type   |   Option                           |
| --------------- | -------- | ---------------------------------- |
| card_number     | integer   | null: false                       |
| card_exp_month  | integer   | null: false                       |
| card_exp_year   | integer   | null: false                       |
| card_cvc        | integer   | null: false                       |
| user_id         | references| null: false, foreign_key: true    |
| item_id         | references| null: false, foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery
