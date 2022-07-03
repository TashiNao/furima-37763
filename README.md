# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth              | string | null: false |

### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| image              | string | null: false |
| title              | string | null: false |
| detail             | string | null: false |
| category           | string | null: false |
| condition          | string | null: false |
| charge             | string | null: false |
| area               | string | null: false |
| delivery_day       | string | null: false |
| price              | string | null: false |
| seller             | string | null: false |

### Association

- belongs_to :users
- has_one :purchases
- has_one :deliveries

## purchases テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| credit_number      | string | null: false |
| expiration         | string | null: false |
| security_code      | string | null: false |
| buyer              | string | null: false |


### Association

- belongs_to :products

## deliveries テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal             | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| address            | string | null: false |
| building           | string | null: false |
| telephone          | string | null: false |

### Association

- belongs_to :products
