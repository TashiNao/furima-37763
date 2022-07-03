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

## products テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | -------------------------------|
| title              | text    | null: false                    |
| description        | string  | null: false                    |
| category_id        | integer | null: false                    |
| condition_id       | integer | null: false                    |
| charge_id          | integer | null: false                    |
| area_id            | integer | null: false                    |
| delivery_day_id    | integer | null: false                    |
| price              | string  | null: false                    |
| seller             | string  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column          | Type   | Options                        |
| --------------- | ------ | ------------------------------ |
| user            | string | null: false, foreign_key: true |
| product         | string | null: false, foreign_key: true |



### Association

- belongs_to :product
- has_one :delivery

## deliveries テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| postal             | string | null: false                    |
| area_id            | string | null: false                    |
| city               | string | null: false                    |
| address            | string | null: false                    |
| building           | string |                                |
| telephone          | string | null: false                    |
| purchase           | string | null: false, foreign_key: true |
### Association

- belongs_to :purchase
