# README

# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
| birthday         | integer | null: false |

### Association

- has_many :items
- has_many :wallets
- has_many :shipping_addresses

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| image_url    | string     | null: false                    |
| name         | string     | null: false                    |
| text         | text       | null: false                    |
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| shipping_fee | integer    | null: false                    |
| area         | string     | null: false                    |
| days         | integer    | null: false                    |
| price        | integer    | null: false                    |

### Association

- belongs_to :users

## wallets テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| money   | integer    | null: false                    |

### Association

- belongs_to :users

## shipping_addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| postal_code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | integer    | null: false                    |
| building     | string     | null: true                     |
| telephone    | integer    | null: false                    |

### Association

- belongs_to :users
