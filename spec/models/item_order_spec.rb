require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order_user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    sleep 1
    @item_order = FactoryBot.build(:item_order, item_id: @item.id, user_id: @item_order_user.id)
  end

  describe '購入できる場合' do
    it '必要な情報が記入されてある場合' do
      expect(@item_order).to be_valid
    end
    it 'building_nameが空の場合' do
      @item_order.building_name = nil
      expect(@item_order).to be_valid
    end
  end

  describe '購入できない場合' do
    it '郵便番号が空の場合' do
      @item_order.postal_code = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "Postal code is invalid"
    end
    it '都道府県が空の場合' do
      @item_order.prefecture_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "Prefecture can't be blank"
    end
    it 'prefecture_idが0の場合' do
      @item_order.prefecture_id = 0
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include
    end
    it '市区町村が空の場合' do
      @item_order.city = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "City can't be blank"
    end
    it '番地が空の場合' do
      @item_order.address = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "Address can't be blank"
    end
    it '電話番号が空の場合' do
      @item_order.tel_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "Tel number can't be blank"
    end
    it '電話番号にハイフンがある場合' do
      @item_order.tel_number = 111-1111-1111
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "Tel number is invalid"
    end
    it '電話番号が11桁より多い場合' do
      @item_order.tel_number = 111111111111
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "Tel number is invalid"
    end
    it '郵便番号にハイフンがない場合' do
      @item_order.postal_code = 1111111
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "Postal code is invalid"
    end
    it 'tokenが空の場合' do
      @item_order.token = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "Token can't be blank"
    end
    it 'user_idが存在しない場合' do
      @item_order.user_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "User can't be blank"
    end
    it 'item_idが存在しない場合' do
      @item_order.item_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "Item can't be blank"
    end

  end
end
