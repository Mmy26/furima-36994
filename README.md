# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_kana         | string | null: false               |
| last_kana          | string | null: false               |
| birth              | string | null: false               |

### Association
- has_many :items

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: false                    |
| title              | string     | null: false                    |
| explanation        | text       | null: false                    |
| category           | text       | null: false                    |
| state              | text       | null: false                    |
| fee                | string     | null: false                    |
| region             | string     | null: false                    |
| shipped_days       | string     | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one    :information
- has_one    :addresses


## information テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :items
- has_one    :addresses

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| zip_code           | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | text       | null: false                    |
| street             | text       | null: false                    |
| building           | text       | null: false                    |
| phone_number       | string     | null: false                    |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :items
- belongs_to :information
