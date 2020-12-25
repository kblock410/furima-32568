## usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | string | null: false |

## itemsテーブル

| Column           | Type          | Options     |
| ---------------- | --------------| ----------- |
| image            | ActiveStorage | null: false |
| title            | string        | null: false |
| explanation      | text          | null: false |
| category         | string        | null: false |
| state            | string        | null: false |
| delivery_fee     | string        | null: false |
| delivery_area    | string        | null: false |
| days_to_delivery | string        | null: false |
| price            | string        | null: false |
| user             | references     |             |

## items to buyテーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| card_number          | string     | null: false |
| card_expiration_date | string     | null: false |
| card_cvc             | string     | null: false |
| delivery_destination | string     | null: false |
| postal_code          | string     | null: false |
| prefectures          | string     | null: false |
| city                 | string     | null: false |
| address              | string     | null: false |
| building_name        | string     | null: false |
| tel_number           | string     | null: false |
| user                 | user       |             |
| item                 | references |             |
