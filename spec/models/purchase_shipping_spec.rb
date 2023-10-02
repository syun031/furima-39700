require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, item_id: @item.id, user_id: @user.id)
end

  describe '購入内容の保存' do
   context '商品購入できるとき' do
it '全ての情報が正しく入力されていれば購入できること' do
  expect(@purchase_shipping).to be_valid
end
  
it '建物名が空でも購入できること' do
  @purchase_shipping.building_name = nil
  expect(@purchase_shipping).to be_valid
  end
end

   context '商品購入できないとき' do
it "tokenが空では登録できないこと" do
  @purchase_shipping.token = nil
  @purchase_shipping.valid?
  expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
end

it 'クレジットカード情報が必須であること' do
  @purchase_shipping.token = nil
  @purchase_shipping.valid?
  expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
end

it '郵便番号が必須であること' do
  @purchase_shipping.post_code = nil
  @purchase_shipping.valid?
  expect(@purchase_shipping.errors.full_messages).to include("Post code can't be blank")
end

it '郵便番号は「3桁ハイフン4桁」の半角文字列のみ保存可能であること' do
  @purchase_shipping.post_code = '1234567'
  @purchase_shipping.valid?
  expect(@purchase_shipping.errors.full_messages).to include('Post code is invalid')
end

it '都道府県が必須であること' do
  @purchase_shipping.prefecture_id = nil
  @purchase_shipping.valid?
  expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
end

it '市区町村が必須であること' do
  @purchase_shipping.city_town_village = nil
  @purchase_shipping.valid?
  expect(@purchase_shipping.errors.full_messages).to include("City town village can't be blank")
end

it '番地が必須であること' do
  @purchase_shipping.address = nil
  @purchase_shipping.valid?
  expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
end

it '電話番号が必須であること' do
  @purchase_shipping.phone_number = nil
  @purchase_shipping.valid?
  expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
end

it '電話番号が9桁以下では購入できない' do
  @purchase_shipping.phone_number = '123456789'
  @purchase_shipping.valid?
  expect(@purchase_shipping).not_to be_valid

  @purchase_shipping.phone_number = '12345678'
  @purchase_shipping.valid?
  expect(@purchase_shipping).not_to be_valid
end

it '電話番号が12桁以上では購入できない' do
  @purchase_shipping.phone_number = '123456789012'
  @purchase_shipping.valid?
  expect(@purchase_shipping).not_to be_valid

  @purchase_shipping.phone_number = '1234567890123'
  @purchase_shipping.valid?
  expect(@purchase_shipping).not_to be_valid
end

it '電話番号に半角数字以外が含まれている場合は購入できない' do
  @purchase_shipping.phone_number = '0901234abcd'
  @purchase_shipping.valid?
  expect(@purchase_shipping).not_to be_valid
end

it 'userが紐付いていなければ購入できない' do
  @purchase_shipping.user_id = nil
  @purchase_shipping.valid?
  expect(@purchase_shipping).not_to be_valid
end

it 'itemが紐付いていなければ購入できない' do
  @purchase_shipping.item_id = nil
  @purchase_shipping.valid?
  expect(@purchase_shipping).not_to be_valid
end
    end
  end
end