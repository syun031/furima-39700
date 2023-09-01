require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

describe 'ユーザー新規登録' do
  context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmation、お名前(全角)とお名前カナ(全角)、birth_dateが存在し、passwordに英字と数字が含まれていれば登録できる' do
      @user.password = 'Password123'
      @user.password_confirmation = 'Password123'
      expect(@user).to be_valid
    end
end

context '新規登録できないとき' do

  it 'パスワードとパスワード（確認用）が一致しない場合、無効であること' do
    @user.password = 'Password123'
    @user.password_confirmation = 'Password456'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'パスワードが英字のみの場合、無効であること' do
    @user.password = 'password'
    @user.password_confirmation = 'password'
    expect(@user).not_to be_valid
  end

  it 'パスワードが数字のみの場合、無効であること' do
    @user.password = '123456'
    @user.password_confirmation = '123456'
    expect(@user).not_to be_valid
  end

  it 'パスワードが全角文字を含む場合、無効であること' do
    @user.password = 'パスワード123' 
    @user.password_confirmation = 'パスワード123'
    expect(@user).not_to be_valid
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
    @another_user = FactoryBot.build(:user, email: @user.email)
    expect(@another_user).not_to be_valid
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
  @user = User.new(password: '00000', password_confirmation: '00000')
  @user.valid?
  expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
end

it 'お名前(全角)の名字（姓）は必須であること' do
  @user = User.new(last_name: '山田', first_name: '太郎')
  @user.valid?
  expect(@user.errors.full_messages).to_not include("Last name can't be blank")
end

it 'お名前(全角)の名前（名）は必須であること' do
  @user = User.new(last_name: '山田', first_name: '太郎')
  @user.valid?
  expect(@user.errors.full_messages).to_not include("First name can't be blank")
end

it 'お名前(全角)の名字（姓）は漢字での入力が必須であること' do
  @user.last_name = '山田'
  @user.first_name = '太郎'
  @user.valid?
  expect(@user.errors.full_messages).to_not include('Last name 全角文字を使用してください')
end

it 'お名前(全角)の名前（名）は漢字での入力が必須であること' do
  @user.last_name = '山田'
  @user.first_name = '太郎'
  @user.valid?
  expect(@user.errors.full_messages).to_not include('First name 全角文字を使用してください')
end

it 'お名前(全角)の名字（姓）はカタカナでの入力が必須であること' do
  @user.last_name_kana = 'ヤマダ'
  @user.first_name_kana = 'タロウ'
  @user.valid?
  expect(@user.errors.full_messages).to_not include('Last name kana 全角カタカナで入力してください')
end

it 'お名前(全角)の名前（名）はカタカナでの入力が必須であること' do
  @user.last_name_kana = 'ヤマダ'
  @user.first_name_kana = 'タロウ'
  @user.valid?
  expect(@user.errors.full_messages).to_not include('First name kana 全角カタカナで入力してください')
end

it 'お名前カナ(全角)の名字（姓）は全角カタカナでの入力が必須であること' do
  @user.last_name_kana = 'ヤマダ'
  @user.first_name_kana = 'タロウ'
  @user.valid?
  expect(@user.errors.full_messages).to_not include('Last name kana は全角カタカナで入力してください')
end

it 'お名前カナ(全角)の名前（名）は全角カタカナでの入力が必須であること' do
  @user.last_name_kana = 'ヤマダ'
  @user.first_name_kana = 'タロウ'
  @user.valid?
  expect(@user.errors.full_messages).to_not include('First name kana は全角カタカナで入力してください')
end

it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
  @user = User.new(last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
  @user.valid?
  expect(@user.errors.full_messages).to_not include("Last name kana is invalid", "First name kana is invalid")
end

it "birth_dateが空では登録できない" do
  @user = build(:user, birth_date: nil)
  expect(@user).not_to be_valid
  expect(@user.errors.full_messages).to include("Birth date can't be blank")
  end
end
end
end