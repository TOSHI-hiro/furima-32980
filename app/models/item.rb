class Item < ApplicationRecord

    extend ActiveHash::Associations::ActiveRecordExtensions
    
    belongs_to :status
    belongs_to :prefecture
    belongs_to :category
    belongs_to :shipping
    belongs_to :deadline

    has_one_attached :image
 
    validates :product_name, presence:true
    validates :subscription, presence:true
    validates :category_id,numericality: { other_than: 1 }
    validates :status_id,numericality: { other_than: 1 } 
    validates :shipping_id,numericality: { other_than: 1 }
    validates :prefecture_id,numericality: { other_than: 1 } 
    validates :deadline_id,numericality: { other_than: 1 }
    validates :price, numericality:{ greater_than_or_equal_to:300 }
    validates :price, numericality:{ less_than:10000000 }
    validates :image, presence:true
    # validates :price, format: { with: /\A[A-Za-z]\w*\z/ }
    
  
end
