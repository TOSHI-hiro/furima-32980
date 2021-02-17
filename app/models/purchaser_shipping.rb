class PurchaserShipping
  include ActiveModel::Model

  attr_accessor :post_numbers, :city ,:address, :building, :phone_numbers, :item_id, :purchaser_id, :user_id , :prefecture_id,:token

  with_options presence:true do
    validates  :post_numbers     ,format: { with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフンを入れてください' }
    validates  :prefecture_id, numericality: { other_than: 1 }
    validates  :city
    validates  :address
    validates  :phone_numbers   ,format: { with: /\A\d{11}\z/ ,message: '電話番号はハイフンなしの数字11桁です' }
    validates  :token
    validates  :user_id 
    validates  :item_id
  end
  def save
   purchaser = Purchaser.create(item_id: item_id,user_id: user_id)
   ShippingAddress.create(post_numbers: post_numbers, city: city ,address: address, building: building, phone_numbers: phone_numbers,purchaser_id: purchaser.id,prefecture_id: prefecture_id)
  end 
end