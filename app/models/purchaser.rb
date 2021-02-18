class Purchaser < ApplicationRecord
  belongs_to:user
  belongs_to:item
  has_one:shipping_addresss
end

