# README

## usersテーブル

| Column               | Type       | Options                        |
| ---------------------| ---------- | ------------------------------ |
| last_name            | string     | null: false                    |
| first_name           | string     | null: false                    |
| email                | string     | null: false                    |
| password             | string     | null: false                    |
| nick_name            | string     | null: false                    |
| last_name_furigana   | string     | null: false                    |
| first_name _furigana | string     | null: false                    |
| birthday             | datetime   | null: false                    |

### Association
- has_many :items
- has_many :comments
- has_many :purchases


## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| details          | text       | null: false                    |
| category         | string     | null: false                    |
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
| postal_code      | string     | null: false                    |
| prefectures      | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |

### Association
- belongs_to :purchase