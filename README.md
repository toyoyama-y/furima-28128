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

## items テーブル

| Column       | Type    | Options                       |
| ------------ | ------- | ----------------------------- |
| user_id      | integer | null: false,foreign_key: true |
| name         | string  | null: false                   |
| text         | text    | null: false                   |
| category     | string  | null: false                   |
| status       | integer | null: false                   |
| shipping_fee | integer | null: false                   |
| area         | integer | null: false                   |
| days         | integer | null: false                   |
| price        | integer | null: false                   |

### Association

- belongs_to :user
- has_one :wallet

## wallets テーブル

| Column   | Type    | Options                       |
| -------- | ------- | ----------------------------- |
| user_id  | integer | null: false,foreign_key: true |
| item_id  | integer | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| user_id      | integer    | null: false,foreign_key: true |
| postal_code  | string     | null: false                   |
| prefecture   | string     | null: false                   |
| city         | string     | null: false                   |
| address      | string     | null: false                   |
| building     | string     | null: true                    |
| telephone    | string     | null: false                   |

### Association

- belongs_to :wallet
