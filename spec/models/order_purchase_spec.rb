require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  describe '購入情報の保存' do
    before do
      @order_purchase = FactoryBot.build(:order_purchase)
    end

    it '全ての値が正しく入力されている場合保存できること' do
      expect(@order_purchase).to be_valid
    end

    it 'tokenが空の場合保存できないこと' do
      @order_purchase.token = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
    
    it 'postal_codeが空の場合保存できないこと' do
      @order_purchase.postal_code = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("郵便番号を入力してください")
    end

    it 'postal_codeでハイフンがない場合保存できないこと' do
      @order_purchase.postal_code = "1234567"
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("郵便番号を正しく入力してください")
    end

    it 'prefecture_idが1の場合保存できないこと' do
      @order_purchase.prefecture_id = "1"
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("都道府県を選んでください")
    end

    it 'cityが空の場合保存できないこと' do
      @order_purchase.city = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("市町村を入力してください")
    end

    it 'addressが空の場合保存できないこと' do
      @order_purchase.address = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("番地を入力してください")
    end

    it 'phone_numberが空の場合保存できないこと' do
      @order_purchase.phone_number = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("電話番号を入力してください")
    end
  end
end