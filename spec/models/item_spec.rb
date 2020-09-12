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
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end

    it 'nameが空の場合保存できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it 'detailが空の場合保存できない' do
      @item.detail = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it 'category_idが空の場合保存できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを選んでください')
    end

    it 'category_idが1の場合保存できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを選んでください')
    end

    it 'status_idが空の場合保存できない' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を選んでください')
    end

    it 'status_idが1の場合保存できない' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を選んでください')
    end

    it 'burden_idが空の場合保存できない' do
      @item.burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('発送料の負担を選んでください')
    end

    it 'burden_idが1の場合保存できない' do
      @item.burden_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('発送料の負担を選んでください')
    end

    it 'prefecture_idが空の場合保存できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域を選んでください')
    end

    it 'prefecture_idが1の場合保存できない' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域を選んでください')
    end

    it 'delivery_date_idが空の場合保存できない' do
      @item.delivery_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を選んでください')
    end

    it 'delivery_date_idが1の場合保存できない' do
      @item.delivery_date_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を選んでください')
    end

    it 'priceが空の場合保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください")
    end

    it 'priceが全角文字のとき保存できない' do
      @item.price = '４６５'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格を半角数字で入力してください')
    end

    it 'priceが299円以下の場合保存できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格(¥300〜9,999,999の間)を入力してください')
    end

    it 'priceが10,000,000円以上の場合保存できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格(¥300〜9,999,999の間)を入力してください')
    end
  end
end
