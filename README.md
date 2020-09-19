# README

# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nick_name        | string  | null: false |
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

| Column          | Type    | Options                       |
| --------------- | ------- | ----------------------------- |
| user_id         | integer | null: false,foreign_key: true |
| name            | string  | null: false                   |
| text            | text    | null: false                   |
| category_id     | integer | null: false                   |
| status_id       | integer | null: false                   |
| shipping_fee_id | integer | null: false                   |
| area_id         | integer | null: false                   |
| days_id         | integer | null: false                   |
| price           | integer | null: false                   |

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

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| wallet_id     | integer    | null: false,foreign_key: true |
| postal_code   | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| city          | string     | null: false                   |
| address       | string     | null: false                   |
| building      | string     | null: true                    |
| telephone     | string     | null: false                   |

### Association

- belongs_to :wallet
