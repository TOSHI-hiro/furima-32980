# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

<<<<<<< HEAD
### Assosiation
- has_one:purchasers_infomations
- has_many:items
=======
* System dependencies
>>>>>>> parent of f131950... テーブル設計

* Configuration

<<<<<<< HEAD
## purchasers_infomationsテーブル
=======
* Database creation
>>>>>>> parent of f131950... テーブル設計

* Database initialization

* How to run the test suite

<<<<<<< HEAD
### Assosiation
- belongs_to : users
- belongs_to: items




## itemsテーブル

| Column       | Type       | Options     |
| --------     | ------     | ----------- |
| image        | references | null: false |　　　　　　    [商品の画像]
| subscription | text       | null: false |　             [商品の説明]
| category     | references | null: false |　　[商品の詳細/商品のカテゴリー]
| status       | references | null: false |　　　　　       [商品の状態]
| shipping     | references | null: false |  　[発送について/配送料の負担]
| shipping_area| references | null: false |  　　　　　　 　[発送元の地域]
| deadline     | references | null: false |　　　　　　　　　[発送までの日数]
| price        | integer    | null: false |　　　　　　　　　[販売価格]
| users        | references | null: false |


### Assosiation
- belongs_to :users
- has_one :purchasers_infomations
=======
* Services (job queues, cache servers, search engines, etc.)
>>>>>>> parent of f131950... テーブル設計

* Deployment instructions

* ...
