require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

it 'nicknameが空では登録できない' do
  @user.nickname = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Nickname can't be blank")
end

it 'emailが空では登録できない' do
  @user.email = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Email can't be blank")
end

it '重複したemailが存在する場合は登録できない' do
  @user.save
  another_user = FactoryBot.build(:user, email: @user.email)
  another_user.valid?
  expect(another_user.errors.full_messages).to include("Email has already been taken")
end

it 'emailは@を含まないと登録できない' do
  @user.email = 'testmail'
  @user.valid?
  expect(@user.errors.full_messages).to include('Email is invalid')
end

it 'passwordが空では登録できない' do
  @user.password = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Password can't be blank")
end

it 'passwordは6文字以上の入力が必要であること' do
  user = User.new(password: '00000', password_confirmation: '00000')
  user.valid?
  expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
end

it 'パスワードは、半角英数字混合での入力が必須であること' do
  user = User.new(password: 'password123', password_confirmation: 'password123')
  user.valid?
  expect(user.errors.full_messages).to_not include('Password must include both letters and numbers')
end

it 'passwordとpassword_confirmationが不一致では登録できない' do
  @user.password = '123456'
  @user.password_confirmation = '1234567'
  @user.valid?
  expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
end

it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
  user = User.new(last_name: '山田', first_name: '太郎')
  user.valid?
  expect(user.errors.full_messages).to_not include("Last name can't be blank", "First name can't be blank")
end

it "お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
  user = FactoryBot.build(:user, last_name: "山田", first_name: "太郎")

  expect(user).to be_valid
end

it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
  user = User.new(last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
  user.valid?
  expect(user.errors.full_messages).to_not include("Last name kana can't be blank", "First name kana can't be blank")
end

it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
  user = User.new(last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
  user.valid?
  expect(user.errors.full_messages).to_not include("Last name kana is invalid", "First name kana is invalid")
end

it "birth_dateが空では登録できない" do
user = build(:user, birth_date: nil)
expect(user).not_to be_valid
expect(user.errors.full_messages).to include("Birth date can't be blank")
  end
end
