# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| last_name  | string  | null: false |
| first_name | string  | null: false |
| birthyear  | integer | null: false |
| birthmonth | integer | null: false |
| birthday   | integer | null: false |

### Association

- has_many :items
- has_many :addresses

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       | -          | null: false, ActiveStorage     |
| name        | string     | null: false, index: true       |
| description | text       | null: false                    |
| category    | integer    | null: false, ActiveHash        |
| condition   | integer    | null: false, ActiveHash        |
| payment     | integer    | null: false, ActiveHash        |
| prefecture  | integer    | null: false, ActiveHash        |
| period      | integer    | null: false, ActiveHash        |
| price       | integer    | null: false, index: true       |
| sold_status | boolean    | default: false                 |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false, ActiveHash        |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | default: ""                    |
| phone_number  | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item