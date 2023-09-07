require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    context '商品出品できるとき' do
      it 'imageとproduct、product_descriptionとcategory_id、product_condition_idとshipping_charge_id、prefecture_idとdays_to_ship_idが含まれていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it '価格が空では出品できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors[:price]).to include("can't be blank")
      end
  
      it '価格に半角数字以外が含まれている場合は出品できない' do
          @item.price = '1000円'
          @item.valid?
          expect(@item.errors[:price]).to include('is not a number')
      end
  
      it '価格が300円未満では出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors[:price]).to include('must be greater than or equal to 300')
      end
  
      it '価格が9,999,999円を超えると出品できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors[:price]).to include('must be less than or equal to 9999999')
      end

      it '商品画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること' do
        @item.product = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end

      it '商品説明が必須であること' do
        @item.product_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end

      it 'カテゴリーが1以外の値であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が1以外の値であること' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end

      it '配送料の負担が1以外の値であること' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it '配送元の地域が1以外の値であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が1以外の値であること' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
    end
  end
end