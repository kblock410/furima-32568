require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録/ユーザー情報' do
    it 'ニックネームが空欄の場合' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'メールアドレスが空欄の場合' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'メールアドレスが一意性でない場合' do
      @user.save
      @another_user = FactoryBot.build(:user, email: @user.email)
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include 'Email has already been taken'
    end
    it 'メールアドレスに@が含まれていない場合' do
      @user.email = 'abcabc'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it 'パスワードが空白の場合' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードが６文字以上でない場合' do
      @user.password = 'a0a0a'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'パスワードが半角数字のみで、半角英数字混合でない場合' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password Please type using half-width characters'
    end
    it 'パスワードが半角アルファベットのみで、半角英数字混合でない場合' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password Please type using half-width characters'
    end
    it 'パスワードに全角英数字が用いられている場合' do
      @user.password = '１２３ＡＢＣ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password Please type using half-width characters'
    end
    it 'パスワードが２回入力されていない場合' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'パスワードと確認用のパスワードが一致しない場合' do
      @user.password_confirmation = 'abcd1234'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end
  describe 'ユーザー新規登録/本人情報確認' do
    it 'ユーザー本名に名字がない場合' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'ユーザー本名に名前がない場合' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'ユーザー本名の名字に全角（漢字・ひらがな・カタカナ）以外が使用されている場合' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name is invalid'
    end
    it 'ユーザー本名の名前に全角（漢字・ひらがな・カタカナ）以外が使用されている場合' do
      @user.first_name = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid'
    end
    it 'ユーザー本名に名字フリガナがない場合' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name kana is invalid'
    end
    it 'ユーザー本名に名前フリガナがない場合' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana is invalid'
    end
    it 'ユーザー本名の名字フリガナに全角カタカナ以外が用いられた場合' do
      @user.last_name_kana = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name kana is invalid'
    end
    it 'ユーザー本名の名前フリガナに全角カタカナ以外が用いられた場合' do
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana is invalid'
    end
    it '生年月日がない場合' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
  describe '登録ができる場合' do
    it '全ての入力が正常に行われた場合' do
      expect(@user).to be_valid
    end
  end
end
