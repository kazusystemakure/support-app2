require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー機能単体テスト' do
    context 'データ保存成功' do
      it '全てが正しく保存できること' do
        expect(@user).to be_valid
      end
    end

    context 'データ保存失敗' do
      it 'imageが空では登録できないこと' do
        @user.image = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できないこと' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが全角（漢字・ひらがな・カタカナ）以外では登録できないこと' do
        @user.name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name Full-width characters.')
      end

      it 'namekanaが空では登録できないこと' do
        @user.namekana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Namekana can't be blank")
      end

      it 'namekanaが全角（カタカナ）以外では登録できないこと' do
        @user.namekana = '漢字a1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Namekana Full-width katakana characters.')
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが英字のみであれば登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers.')
      end

      it 'passwordが数字のみであれば登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers.')
      end

      it 'postal_codeが空では登録できないこと' do
        @user.postal_code = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeがハイフンなしでは登録できないこと' do
        @user.postal_code = 1_234_567
        @user.valid?
        expect(@user.errors.full_messages).to include('Postal code Input correctly')
      end

      it 'prefectureが空では登録できない' do
        @user.prefecture = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では登録できないこと' do
        @user.city = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では登録できないこと' do
        @user.address = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では登録できないこと' do
        @user.phone_number = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'birth_dateが空では登録できないこと' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
