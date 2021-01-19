class Item < ApplicationRecord

  with_options presence: true do
    validates :product_name, length: { maximum: 6 }
    validates :subscription
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :prefecture_id
    validates :deadline_id
    validates :price,
  end
  belongs_to :user
  has_one :purchaser 
  
end
