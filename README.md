
## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

* has_many :items
* has_many :orders

## itemsテーブル

| Column              | Type          | Options           |
| ------------------- | --------------| ----------------- |
| title               | string        | null: false       |
| explanation         | text          | null: false       |
| category_id         | integer       | null: false       |
| state_id            | integer       | null: false       |
| delivery_fee_id     | integer       | null: false       |
| prefecture_id       | integer       | null: false       |
| days_to_delivery_id | integer       | null: false       |
| price               | integer       | null: false       |
| user                | references    | foreign_key: true |

### Association

* belongs_to :user
* has_one :order

## addressesテーブル

| Column               | Type       | Options           |
| -------------------- | ---------- | ----------------- |
| postal_code          | string     | null: false       |
| prefecture_id        | integer    | null: false       |
| city                 | string     | null: false       |
| address              | string     | null: false       |
| building_name        | string     |                   |
| tel_number           | string     | null: false       |
| order                | references | foreign_key: true |


### Association

* belongs_to :order

## ordersテーブル

| Column               | Type       | Options           |
| -------------------- | ---------- | ----------------- |
| item                 | references | foreign_key: true |
| user                 | references | foreign_key: true |

### Association


* belongs_to :user
* belongs_to :item
* has_one :address

