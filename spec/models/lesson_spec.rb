require 'rails_helper'

RSpec.describe Lesson, type: :model do
  before do
    @lesson = FactoryBot.build(:lesson)
  end

  describe 'ユーザー機能単体テスト' do
    context 'データ保存成功' do
      it '全てが正しく保存できること' do
        expect(@lesson).to be_valid
      end
    end

    context 'データ保存失敗' do
      it 'imageが空では登録できないこと' do
        @lesson.image = nil
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できないこと' do
        @lesson.name = nil
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include("Name can't be blank")
      end

      it 'textが空では登録できないこと' do
        @lesson.content = nil
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include("Content can't be blank")
      end

      it 'textが空では登録できないこと' do
        @lesson.text = nil
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include("Text can't be blank")
      end

      it 'priceが空では登録できないこと' do
        @lesson.price = nil
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが500円未満で登録できないこと' do
        @lesson.price = 499
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceが50000円以上は登録できないこと' do
        @lesson.price = 50_001
        @lesson.valid?
        expect(@lesson.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
