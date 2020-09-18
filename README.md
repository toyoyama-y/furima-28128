# README

# テーブル設計

## users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | string  | null: false |
| nickname | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| birthday | integer | null: false |

### Association

- has_many :listings
- has_many :purchases

## listings テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| name         | string  | null: false |
| price        | integer | null: false |
| product_name | string  | null: false |
| product_data | text    | null: false |

### Association

- belongs_to :users
- has_one :purchases

## parchases テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| price  | references | null: false |

### Association

- belongs_to :users
- belongs_to :listings
