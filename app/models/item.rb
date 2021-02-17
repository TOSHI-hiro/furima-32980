class Item < ApplicationRecord
    attr_accessor :token

    extend ActiveHash::Associations::ActiveRecordExtensions
    
    belongs_to :status
    belongs_to :prefecture
    belongs_to :category
    belongs_to :shipping
    belongs_to :deadline

    has_one_attached :image

    with_options presence:true do
    validates :product_name
    validates :subscription
    validates :image
    end
    
    with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :prefecture_id
    validates :deadline_id
    end

    validates :price, numericality:{ greater_than_or_equal_to:300, less_than:10000000 } ,format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }



     belongs_to :user
     has_one :purchaser
    
  
end
