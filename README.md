# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| last_name           | string | null: false               |
| first_name          | string | null: false               |
| last_name_kana      | string | null: false               |
| first_name_kana     | string | null: false               |
| birth_day           | date   | null: false               |

### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explain            | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## delivery_address テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| zip_code           | string      | null: false                    |
| prefecture         | string      | null: false                    |
| city               | string      | null: false                    |
| region             | string      | null: false                    |
| building           | string      | null: false                    |
| telephone          | integer     | null: false                    |
| purchase           | references  | null: false, foreign_key: true |

### Association

- belongs_to :purchase

## purchase テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| product           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :delivery_address
- belongs_to :product
