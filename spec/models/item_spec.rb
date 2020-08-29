require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/camera.png')
    end

    it '正しく記入されていれば登録できること' do
      expect(@item).to be_valid
    end

    it '画像が空の場合保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空の場合保存できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'detailが空の場合保存できない' do
      @item.detail = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end

    it 'category_idが空の場合保存できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end

    it 'status_idが空の場合保存できない' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Status Select')
    end

    it 'burden_idが空の場合保存できない' do
      @item.burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Burden Select')
    end

    it 'prefecture_idが空の場合保存できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end

    it 'delivery_date_idが空の場合保存できない' do
      @item.delivery_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery date Select')
    end

    it 'priceが空の場合保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが全角文字のとき保存できない' do
      @item.price = '４６５'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end

    it 'priceが299円以下の場合保存できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it 'priceが10,000,000円以上の場合保存できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
  end
end
