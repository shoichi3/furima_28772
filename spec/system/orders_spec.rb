require 'rails_helper'

RSpec.describe "商品購入機能", type: :system do
  before do
    @user1 = FactoryBot.build(:user)
    @user2 = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @order =FactoryBot.build(:order_purchase)
  end
  context '商品を購入できない' do
    it '必須項目を入力しない場合は購入できない' do
      sign_up(@user1)
      listing(@item)
      click_on 'ログアウト'
      expect(current_path).to eq root_path
      expect(page).to have_content('新規登録')
      click_on '新規登録'
      sign_up(@user2)
      click_on "#{@item.name}"
      expect(page).to have_content('購入画面に進む')
      click_on '購入画面に進む'
      expect(page).to have_content('購入内容の確認')
      fill_in 'card-number', with: "4242424242424242"
      fill_in 'card-exp-month', with: "2"
      fill_in 'card-exp-year', with: "24"
      fill_in 'card-cvc', with: "123"
      fill_in 'postal-code', with: @order.postal_code
      select '東京都', from: 'prefecture'
      fill_in 'city', with: @order.city
      fill_in 'addresses', with: @order.address
      fill_in 'building', with: @order.building
      fill_in 'phone-number', with: ""
      expect{
        click_on '購入'
      }.to change{ Order.count }.by(0)
      expect(page).to have_content('購入内容の確認')
    end
    it '商品投稿者は購入できない' do
      sign_up(@user1)
      listing(@item)
      click_on "#{@item.name}"
      expect(page).to have_no_content('購入画面に進む')
    end
  end
end
