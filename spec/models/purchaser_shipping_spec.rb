require 'rails_helper'

RSpec.describe PurchaserShipping, type: :model do


    before do
      @purchaser_shipping = FactoryBot.build(:purchaser_shipping)
    end
    describe '商品が購入ができた時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect( @purchaser_shipping ).to be_valid
      end
    end

    it "priceとtokenがあれば保存ができること" do
      expect(@purchaser_shipping).to be_valid
    end

    describe '商品が購入ができなかった時' do

    it 'post_numberが空だと保存できないこと' do
      @purchaser_shipping.post_numbers = ""
      @purchaser_shipping.valid?
      expect(@purchaser_shipping.errors.full_messages).to include("Post numbers can't be blank", "Post numbers ハイフンを入れてください")
    end

    it 'Prefecture_idが空だと保存できないこと' do
      @purchaser_shipping.prefecture_id = ""
      @purchaser_shipping.valid?
      expect(@purchaser_shipping.errors.full_messages).to include("Prefecture can't be blank", "Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @purchaser_shipping.city = ""
      @purchaser_shipping.valid?
      expect(@purchaser_shipping.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @purchaser_shipping.address = ""
      @purchaser_shipping.valid?
      expect(@purchaser_shipping.errors.full_messages).to include("Address can't be blank")
    end
    it 'phonenumberが空だと保存できないこと' do
      @purchaser_shipping.phone_numbers = ""
      @purchaser_shipping.valid?
      expect(@purchaser_shipping.errors.full_messages).to include("Phone numbers can't be blank", "Phone numbers 電話番号はハイフンなしの数字11桁です")
    end
    it 'phone_numbersが全角文字だと保存できないこと' do
      @purchaser_shipping.phone_numbers = "あああああああああああ"
      @purchaser_shipping.valid?
      expect(@purchaser_shipping.errors.full_messages).to include("Phone numbers 電話番号はハイフンなしの数字11桁です")
    end

    it "tokenが空では登録できないこと" do
      @purchaser_shipping.token = nil
      @purchaser_shipping.valid?
      expect(@purchaser_shipping.errors.full_messages).to include("Token can't be blank")
    end
  end
end