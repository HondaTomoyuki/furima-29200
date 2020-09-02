# README

## usersテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| email            | string     | null: false                    |
| password         | string     | null: false                    |
| nick_name        | string     | null: false                    |
| name_kanji       | string     | null: false                    |
| name_katakana    | string     | null: false                    |
| birthday         | integer    | null: false                    |

### Association
- has_many :items
- has_many :comments
- has_many :purchases


## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| item_image       | text       | null: false                    |
| item_name        | string     | null: false                    |
| item_text        | text       | null: false                    |
| details          | text       | null: false                    |

### Association
- has_many :comments
- belongs_to :users
- has_one :purchases


## commentsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |
| text             | text       |                                |

### Association
- belongs_to :users
- belongs_to :items 


## purchasesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |
| shipping_charges | string     | null: false                    |
| delivery_time    | string     | null: false                    |
| price            | integer    | null: false                    |
| fee              | integer    | null: false                    |
| profit           | integer    | null: false                    |

### Association
- belongs_to :users
- belongs_to :items 
- has_one :shipping_addresses


## shipping_addressesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| purchase_id      | references | null: false, foreign_key: true |
| postal_code      | integer    | null: false                    |
| city             | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | integer    | null: false                    |

### Association
- belongs_to :purchase