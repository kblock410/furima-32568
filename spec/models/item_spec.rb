require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe 'アイテム出品' do
    it 'ユーザーが存在しない場合' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
    end
    it '画像がない場合' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名がない場合' do
      @item.title = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Title can't be blank"
    end
    it '説明がない場合' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Explanation can't be blank"
    end
    it 'カテゴリーがない場合' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category Select"
    end
    it '商品の状態についての情報がない場合' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "State Slelct"
    end
    it '配送料の負担に関する情報がない場合' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery fee Select"
    end
    it '発送元の地域についての情報がない場合' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture Select"
    end
    it '発送までの日数についての情報がない場合' do
      @item.days_to_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Days to delivery Select"
    end
    it '価格についての情報がない場合' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is invalid"
    end
    it '価格の範囲が¥300~¥9,999,999の間でない場合(¥300より低い)' do
      @item.price = Faker::Number.between(from: 0, to: 299)
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not included in the list"
    end
    it '価格の範囲が¥300~¥9,999,999の間でない場合()¥9,999,999より高い' do
      @item.price = Faker::Number.number(8)
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not included in the list"
    end
    it '必要な情報を適切に入力すると、商品の出品ができる場合' do
      expect(@item).to be_valid
    end
  end
end
