# テーブル設計

   users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| encrypted_password | string | null: false |
| email              | string | null: false |
| nickname           | string | null: false |
| surname            | string | null: false |
| name               | string | null: false |
| surname_kana       | string | null: false |
| name_kana          | string | null: false |
| birthday           | date   | null: false |

   Association

- has_many :items
- has_many :purchases

   items テーブル

| Column       | Type       | Options                        |
| -------------| -----------| ------------------------------ |
| product_name    | string      | null: false                    |
| explanation     | string      | null: false                    |
| category_id     | integer     | null: false                    |
| status_id       | integer     | null: false                    |
| delivery_fee_id | integer     | null: false                    |
| area_id         | integer     | null: false                    |
| days_id         | integer     | null: false                    |
| price           | integer     | null: false                    | 
| user         | references | null: false, foreign_key: true |

   Association

- belongs_to :user
- has_one :purchase


   purchases テーブル

| Column          | Type       | Options                        |
| ----------------| -----------| ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

   Association

- has_one :delivery
- belongs_to :user
- belongs_to :item

   deliverys テーブル

| Column          | Type       | Options                        |
| ----------------| -----------| ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures_id  | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                     |
| phone           | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |

   Association

- belongs_to :purchase