class Item < ApplicationRecord

    extend ActiveHash::Associations::ActiveRecordExtensions
    
    belongs_to :status
    belongs_to :prefecture
    belongs_to :category
    belongs_to :shipping
    belongs_to :deadline
    
    validates :category_id,numericality: { other_than: 1 }
    validates :status_id,numericality: { other_than: 1 } 
    validates :shipping_id,numericality: { other_than: 1 }
    validates :prefecture_id,numericality: { other_than: 1 } 
    validates :deadline_id,numericality: { other_than: 1 }
  
end
