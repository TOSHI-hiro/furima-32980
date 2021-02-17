class UserPurchaser
  include ActiveModel::Model
  attr_accessor :post_numbers,:prefecture_id,:city ,:address ,:building,:phone_numbers

  with_options presence: true do
    validates :postal_numbers, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :address
    validates :building
    validates :phone_numbers

  end
  # 「住所」の都道府県に関するバリデーション
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  # 「寄付金」の金額範囲に関するバリデーション
  #  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is out of setting range" }
 # def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    #user = User.create(name: name, name_reading: name_reading, nickname: nickname)
    # 住所の情報を保存
    #Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name,user_id: user.id)
    # 寄付金の情報を保存
   # Donation.create(price: price, user_id: user.id)
  #end

end