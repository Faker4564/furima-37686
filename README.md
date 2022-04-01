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
| birthday           | integer | null: false               |

### Association
- has_many :items
- has_many :buys

## items table

| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| product_name        | string     | null: false, unique: true     |
| product_description | string     | null: false                   |
| category            | string     | null: false                   |
| product_condition   | string     | null: false                   |
| delivery_charge     | string     | null: false                   |
| shipping_area       | string     | null: false                   |
| days_to_ship        | string     | null: false                   |
| price               | integer    | null: false                   |
| user                | references | null: false,foreign_key: true |

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
- has_one :shipping

## shippings table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| tel           | integer    | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association
- belongs_to :buy