require 'rails_helper'

RSpec.describe User, type: :model do
before user = FactoryBot.build(:user)
  describe "ユーザー新規登録/ユーザー情報" do
    it "ニックネームが空欄の場合" do
      @user.nuckname = ""
      @user.valid?
      expect(@user.error.full_messages).to include "ニックネームを入力してください"
    end
    it "メールアドレスが空欄の場合" do
      @user.email = ""
      @user.valid?
      expect(@user.error.full_messages).to include "メールアドレスを入力してください"
    end
    it "メールアドレスが一意性でない場合" do
      @another_user.email = @user.email
      expect(@another_user.error.full_messages).to include "このメールアドレスはすでに登録されています"
    end
    it "メールアドレスに@が含まれていない場合" do
      @user.email = "abcabc"
      @user.valid?
      expect(@user.error.full_messages).to include "メールアドレスに@が含まれていません"
    end
    it "パスワードが空白の場合" do
      @user.password = ""
      @user.valid?
      expect(@user.error.full_messages).to include "パスワードを設定してください"
    end
    it "パスワードが６文字以上でない場合" do
      @user.password = "a0a0a"
      @user.valid?
      expect(@user.error.full_messages).to include "パスワードを６文字以上で設定してください"
    end
    it "パスワードが半角数字のみで、半角英数字混合でない場合" do
      @user.password = "123456"
      @user.valid?
      expect(@user.error.full_messages).to include "パスワードを半角アルファベットと半角数字でで設定してください"
    end
    it "パスワードが半角アルファベットのみで、半角英数字混合でない場合" do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.error.full_messages).to include "パスワードを半角アルファベットと半角数字でで設定してください"
    end
    it "パスワードに全角英数字が用いられている場合" do
      @user.password = "１２３ＡＢＣ"
      @user.valid?
      expect(@user.error.full_messages).to include "パスワードを半角アルファベットと半角数字でで設定してください"
    end
    it "パスワードが２回入力されていない場合" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.error.full_messages).to include "パスワードが一致していません"
    end
    it "パスワードと確認用のパスワードが一致しない場合" do
      @user.password_confirmation = "abcd1234"
      @user.valid?
      expect(@user.error.full_messages).to include "パスワードが一致していません"
    end
  end
  describe "ユーザー新規登録/本人情報確認" do
    it "ユーザー本名に名字がない場合" do
      @user.last_name = ""
      @user.valid?
      expect(@user.error.full_messages).to include "名字を入力してください"
    end
    it "ユーザー本名に名前がない場合" do
      @user.first_name = ""
      @user.valid?
      expect(@user.error.full_messages).to include "名前を入力してください"
    end
    it "ユーザー本名の名字に全角（漢字・ひらがな・カタカナ）以外が使用されている場合" do
      @user.last_name = "yamada"
      @user.valid?
      expect(@user.error.full_messages).to include "全角（漢字・ひらがな・カタカナ）で入力してください"
    end
    it "ユーザー本名の名前に全角（漢字・ひらがな・カタカナ）以外が使用されている場合" do
      @user.first_name = "taro"
      @user.valid?
      expect(@user.error.full_messages).to include "全角（漢字・ひらがな・カタカナ）で入力してください"
    end
    it "ユーザー本名に名字フリガナがない場合" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.error.full_messages).to include "名字フリガナをカタカナで入力してください"
    end
    it "ユーザー本名に名前フリガナがない場合" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.error.full_messages).to include "名前フリガナをカタカナで入力してください"
    end
    it "ユーザー本名の名字フリガナに全角カタカナ以外が用いられた場合" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.error.full_messages).to include "名字フリガナをカタカナで入力してください"
    end
    it "ユーザー本名の名前フリガナに全角カタカナ以外が用いられた場合" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.error.full_messages).to include "名前フリガナをカタカナで入力してください"
    end
    it "生年月日がない場合" do
      @user.birthday = ""
      @user.valid?
      expect(@user.error.full_messages).to include "生年月日を入力してください"
    end
  end
end
