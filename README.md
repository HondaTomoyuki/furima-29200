# README

## usersテーブル

| Column               | Type       | Options                        |
| ---------------------| ---------- | ------------------------------ |
| last_name            | string     | null: false                    |
| first_name           | string     | null: false                    |
| email                | string     | null: false                    |
| password             | string     | null: false                    |
| nick_name            | string     | null: false                    |
| last_name_kanji      | string     | null: false                    |
| first_name _kanji    | string     | null: false                    |
| last_name_furigana   | string     | null: false                    |
| first_name _furigana | string     | null: false                    |

### Association
- has_many :items
- has_many :comments
- has_many :purchases


## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| image            | text       | null: false                    |
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| details          | text       | null: false                    |
| shipping_charges | string     | null: false                    |
| delivery_time    | string     | null: false                    |
| price            | integer    | null: false                    |

### Association
- has_many :comments
- belongs_to :user
- has_one :purchase
 

## commentsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| text             | text       |                                |

### Association
- belongs_to :user
- belongs_to :item


## purchasesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addressesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| purchase         | references | null: false, foreign_key: true |
| postal_code      | integer    | null: false                    |
| city             | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | integer    | null: false                    |

### Association
- belongs_to :purchase