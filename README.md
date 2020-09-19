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
| birth_day        | date    | null: false |

### Association

- has_many :items
- has_many :wallets
- has_many :shipping_addresses

## items テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| user_id      | integer | null: false |
| name         | string  | null: false |
| text         | text    | null: false |
| category     | string  | null: false |
| status       | integer | null: false |
| shipping_fee | integer | null: false |
| area         | integer | null: false |
| days         | integer | null: false |
| price        | integer | null: false |

### Association

- belongs_to :users
- has_one :wallets

## wallets テーブル

| Column   | Type    | Options                |
| -------- | ------- | ---------------------- |
| user_id  | integer | null: false            |
| item_id  | integer | null: false, FK: false |

### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping_addresses

## shipping_addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | integer    | null: false |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     | null: true                     |
| telephone    | string     | null: false                    |

### Association

- belongs_to :users
- belongs_to :wallets
	
