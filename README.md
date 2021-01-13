
## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| name             | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | text   | null: false |
| last_name        | text   | null: false |
| first_name_kana  | text   | null: false |
| last_name_kana   | text   | null: false |
| year             | integer| null: false |  　　　　　　　 [生年月日]
| month            | integer| null: false |
| day              | integer| null: false |


### Assosiation
- belongs_to:purchase_functions
- has_many:selling_functions


## purchase_functionsテーブル

| Column        | Type      | Options     |
| --------      | ------    | ----------- |
| card_numbers  | integer   | null: false |　　　[カード番号]
| card_month    | integer   | null: false |　　　　[有効期限]
| card_year     | integer   | null: false |
| security_code | integer   | null: false |  　[セキュリティコード]
|post_numbers   | integer   | null: false |　　　[発送先の情報/郵便番号]
| prefecture    | text      | null: false |　　　　　　　[都道府県]
| city          | text      | null: false |　　　　　　　[市区町村]
|address        | text      | null: false |　　　　　　　[番地]
| building      | text      | null: false |　　　　　  [建物]
| phone_numbers | integer   | null: false |　　　     [電話番号]


### Assosiation
- belongs_to : users
- belongs_to: selling_functions




## selling_functions テーブル
| Column       | Type       | Options     |　　
| --------     | ------     | ----------- |
| image        |　references|　null: false |　　　　　　    [商品の画像]
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
- belongs_to:purchase_functions


