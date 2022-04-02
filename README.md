# DB設計

## users table

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_kana_name    | string  | null: false               |
| last_kana_name     | string  | null: false               |
| birthday           | date    | null: false               |

### Association
- has_many :items
- has_many :buys

## items table

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| product_name         | string     | null: false                   |
| product_description  | text       | null: false                   |
| category_id          | date       | null: false                   |
| product_condition_id | date       | null: false                   |
| delivery_charge_id   | date       | null: false                   |
| prefecture_id        | date       | null: false                   |
| shipping_date_id     | date       | null: false                   |
| price                | integer    | null: false                   |
| user                 | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- has_one :buy

## buys table

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- has_many :users
- belongs_to :item
- has_one :delivery

## deliverys table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postcode      | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| tel           | integer    | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association
- belongs_to :buy