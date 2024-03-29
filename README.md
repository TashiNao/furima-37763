# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth              | date   | null: false               |

### Association

- has_many :products
- has_many :purchases

## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | -------------------------------|
| title              | string      | null: false                    |
| description        | text        | null: false                    |
| category_id        | integer     | null: false                    |
| condition_id       | integer     | null: false                    |
| charge_id          | integer     | null: false                    |
| area_id            | integer     | null: false                    |
| deliveryday_id     | integer     | null: false                    |
| price              | integer     | null: false                    |
| user               | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column          | Type   | Options                        |
| --------------- | ------ | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| product         | references | null: false, foreign_key: true |



### Association

- belongs_to :product
- belongs_to :user
- has_one :address

## address テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| postal             | string      | null: false                    |
| prefecture_id      | integer     | null: false                    |
| city               | string      | null: false                    |
| street             | string      | null: false                    |
| building           | string      |                                |
| telephone          | string      | null: false                    |
| purchase           | references  | null: false, foreign_key: true |
### Association

- belongs_to :purchase
