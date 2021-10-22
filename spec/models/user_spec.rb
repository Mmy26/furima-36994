require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '苗字が空では登録できない'do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it '名前が空では登録できない'do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it '苗字(カナ)が空では登録できない'do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last kana can't be blank"
    end

    it '名前(カナ)が空では登録できない'do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First kana can't be blank"
    end

    it '生年月日が空では登録できない'do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth can't be blank"
    end
    it '苗字が全角でなければ登録できない'do
      @user.last_name = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください"
    end
    it '名前が全角でなければ登録できない'do
      @user.first_name = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
    end
    it '苗字（カナ）が全角でなければ登録できない'do
      @user.last_kana = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last kana 全角文字を使用してください"
    end
    it '名前（カナ）が全角でなければ登録できない'do
      @user.first_kana = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First kana 全角文字を使用してください"
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include'Password is too short (minimum is 6 characters)'
    end
    it 'パスワードは、半角英数字混合でなければ登録できない'do
      @user.password = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation =! @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end
end
