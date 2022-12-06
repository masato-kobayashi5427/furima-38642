# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| birth_year            | string | null: false |
| birth_month           | string | null: false |
| birth_day             | string | null: false |
| terms_of_service      | string | null: false |

### Association

- has_many :products
- has_many :purchases
- has_one :delivery_address

## products テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| put_up_date        | string | null: false |
| price              | string | null: false |
| category           | string | null: false |
| image              | string | null: false |
| explain            | string | null: false |
| detail             | string | null: false |
| state              | string | null: false |
| brand              | string | null: false |
| ship_form          | string | null: false |
| sold_out           | string | null: false |

### Association

- belongs_to :users
- has_one :purchase

## delivery_address テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id            | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| telephone          | string | null: false |
| zipcode            | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| address1           | string | null: false |
| address2           | string | null: false |

### Association

- has_one :users
- has_one :purchases

## purchaces テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| buyer_id            | string | null: false |
| seller_id           | string | null: false |
| product_id          | string | null: false |
| delivery_address_id | string | null: false |
| ship_form | string  | null: false |
| delivery_method     | string | null: false |
| delivery_fee        | string | null: false |
| delivery_date       | string | null: false |

### Association

- belongs_to :users
- has_one :delivery_adderess
- has_one :products
