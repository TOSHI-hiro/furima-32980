# README
## users テーブル

| Column            | Type   | Options     |
| ----------------  | ------ | ----------- |
| name              | string | null: false |
| email             | string | null: false ,unique:true|
| encrypted_password| string | null: false |
| first_name        | string | null: false |
| last_name         | string | null: false |
| first_name_kana   | string | null: false |
| last_name_kana    | string | null: false |
| date　of birth    | date   | null: false |  　　　　　　　 [生年月日]



### Assosiation
- has_one:purchasers
- has_one:items


## purchasersテーブル
| Column            | Type      | Options     |
| --------          | ------    | ----------- |
|items_id           |references | null:false ,foreign_key:true| 
|shipping_address_id|references | null:false ,foreign_key:true| 
|user_id            |references | null:false ,foreign_key:true| 


### Assosiation
- belongs_to : users
- belongs_to: items
- has_one:shipping_addresss


## shipping_addresssテーブル
| Column        | Type      | Options     |
| --------      | ------    | ----------- |
|post_numbers   | integer   | null: false |　　　[郵便番号]
| prefecture_id | integer   | null: false |　　　　　　　[都道府県]
| city          | text      | null: false |　　　　　　　[市区町村]
|address        | text      | null: false |　　　　　　　[番地]
| building      | text      | null: false |　　　　　  [建物]
| phone_numbers | integer   | null: false |　　　     [電話番号]


### Assosiation
- belongs_to : purchasers




## itemsテーブル

| Column          | Type       | Options     |
| --------        | ------     | ----------- |
| subscription    | text       | null: false |　             [商品の説明]
| category_id     | integer    | null: false |　　[商品の詳細/商品のカテゴリー]
| status_id       | integer    | null: false |　　　　　       [商品の状態]
| shipping_id     | integer    | null: false |  　[発送について/配送料の負担]
| shipping_area_id| integer    | null: false |  　　　　　　 　[発送元の地域]
| deadline_id     | integer    | null: false |　　　　　　　　　[発送までの日数]
| price           | integer    | null: false |　　　　　　　　　[販売価格]
| user_id         | references | null: false ,foreign_key :true|


### Assosiation
- belongs_to :users
- has_one :purchasers

