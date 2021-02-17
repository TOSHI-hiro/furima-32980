class Purchaser < ApplicationRecord
  attr_accessor :token

  belongs_to:user
  belongs_to:item
  has_one:shipping_addresss
end


