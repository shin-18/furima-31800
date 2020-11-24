# テーブル設計

   users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| birthday | date   | null: false |

   Association

- has_many :items
- has_many :purchases

   items テーブル

| Column       | Type       | Options                        |
| -------------| -----------| ------------------------------ |
| product_name | string     | null: false                    |
| explanation  | text       | null: false                    |
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| area         | string     | null: false                    |
| days         | string     | null: false                    |
| price        | integer    | null: false                    | 
| user         | references | null: false, foreign_key: true |

   Association

- belongs_to :user
- has_many :purchases


   purchases テーブル

| Column          | Type       | Options                        |
| ----------------| -----------| ------------------------------ |
| card            | integer    | null: false                    |
| validity_period | integer    | null: false                    |
| security        | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

   Association

- has_one :delivery
- belongs_to :user
- belongs_to :item

   deliverys テーブル

| Column          | Type       | Options                        |
| ----------------| -----------| ------------------------------ |
| postal_code     | integer    | null: false                    |
| prefectures     | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     | null: false                    |
| phone           | integer    | null: false                    |
| purchase        | references | null: false, foreign_key: true |

   Association

- belongs_to :purchase