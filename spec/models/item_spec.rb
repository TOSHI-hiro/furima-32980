require 'rails_helper'

RSpec.describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it "productとproduct_imageがある場合は保存できること" do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it "imageがない場合は保存できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
    end

      it "product_nameがない場合は保存できないこと" do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      
      it "subscription がない場合は保存できないこと" do
        @item.subscription = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Subscription can't be blank")
      end
      
      it "category_idがない場合は保存できないこと" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "status_idがない場合は保存できないこと" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end

      it "shipping_idがない場合は保存できないこと" do
        @item.shipping_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping is not a number")

      end
      it "prefecture_idがない場合は保存できないこと" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end

      it "deadline_idがない場合は保存できないこと" do
        @item.deadline_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Deadline is not a number")
      end

      it "category_idが1の場合は保存できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "status_idが1の場合は保存できないこと" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "shipping_idが１の場合は保存できないこと" do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 1")

      end
      it "prefecture_idが１の場合は保存できないこと" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "deadline_idが１の場合は保存できないこと" do
        @item.deadline_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deadline must be other than 1")
      end
      
      it "priceがない場合は保存できないこと" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが300以下の場合は保存できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceが9,999,999以上の場合は保存できないこと" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end

      it "priceが全角文字では登録できない" do
        @item.price= "ああああああ"
        @item.valid?
        @item.errors.full_messages
        expect(@item.errors.full_messages).to include("Price is not a number") 
      end

      it "priceが半角英数混合" do
        @item.price = "111aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが半角英語だと登録できない" do
        @item.price = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    end
 end
end
