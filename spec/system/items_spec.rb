require 'rails_helper'

RSpec.describe "新規登録後の出品機能", type: :system do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end
  context '出品できるとき' do
    it '新規登録後、正しく情報を入力すると商品を出品できる' do
      sign_up(@user)
      listing(@item)
    end
  end
  context '出品できないとき' do
    it '新規登録後、誤った情報を入力すると商品を出品できない' do
      sign_up(@user)
      expect(page).to have_content('出品する')
      visit new_item_path
      expect(current_path).to eq new_item_path
      image_path = Rails.root.join('app/assets/images/camera.png')
      attach_file('item[image]', image_path, make_visible: true)
      fill_in 'item-name', with: @item.name
      fill_in 'item-info', with: ""
      expect{
        click_on '出品する'
      }.to change { Item.count}.by(0)
      expect(current_path).to eq '/items'
    end
  end
end

RSpec.describe 'ログイン後の出品機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end
  context '出品できるとき' do
    it 'ログイン後、正しい情報を入力すると商品を出品できる' do
      log_in(@user)
      listing(@item)
    end
  end
  context '出品できないとき' do
    it 'ログイン後、誤った情報を入力すると商品を出品できない' do
      log_in(@user)
      expect(page).to have_content('出品する')
      visit new_item_path
      expect(current_path).to eq new_item_path
      image_path = Rails.root.join('app/assets/images/camera.png')
      attach_file('item[image]', image_path, make_visible: true)
      fill_in 'item-name', with: @item.name
      fill_in 'item-info', with: ""
      expect{
        click_on '出品する'
      }.to change { Item.count}.by(0)
      expect(current_path).to eq '/items'
    end
  end
end

RSpec.describe 'トップページ遷移機能' do
  context 'サインインまたはログインしていないとき出品することはできない' do
    it '出品ページへ遷移しようとするとトップページへ遷移される' do
      visit new_item_path
      expect(current_path).to eq root_path
    end
  end
end

RSpec.describe '商品情報編集機能' do
  before do
    @user1 = FactoryBot.build(:user)
    @user2 = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end
  context "商品の情報を編集できる" do
    it '本人が出品した商品情報は編集できる' do
      sign_up(@user1)
      listing(@item)
      click_on "#{@item.name}"
      expect(page).to have_content("編集")
      click_on "編集"
      fill_in 'item-name', with: "#{@item.name}"
      expect{
        click_on '変更する'
      }.to change{ Item.count }.by(0)
      expect(current_path).to eq root_path
      expect(page).to have_selector ".item-img"
      expect(page).to have_content("#{@item.name}")
      expect(page).to have_content("#{@item.price}")
    end
  end
  context '商品情報を編集できない' do
    it '必須項目が空欄の場合編集できない' do
      sign_up(@user1)
      listing(@item)
      click_on "#{@item.name}"
      expect(page).to have_content("編集")
      click_on "編集"
      fill_in 'item-name', with: ""
      expect{
        click_on '変更する'
      }.to change{ Item.count }.by(0)
      expect(page).to have_content('商品名を入力してください')
    end
    it '他ユーザーは商品情報を編集できない' do
      sign_up(@user1)
      listing(@item)
      click_on 'ログアウト'
      expect(current_path).to eq root_path
      expect(page).to have_content('新規登録')
      click_on '新規登録'
      sign_up(@user2)
      click_on "#{@item.name}"
      expect(page).to have_no_content("編集")
    end
  end
end

RSpec.describe '商品情報削除機能' do
  before do
    @user1 = FactoryBot.build(:user)
    @user2 = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end
  context "商品の情報を削除できる" do
    it '本人が出品した商品情報は削除できる' do
      sign_up(@user1)
      listing(@item)
      click_on "#{@item.name}"
      expect(page).to have_content("削除")
      expect{
        click_on '削除'
      }.to change{ Item.count }.by(-1)
      expect(current_path).to eq root_path
      expect(page).to have_no_content("#{@item.name}")
      expect(page).to have_no_content("#{@item.price}")
    end
  end
  context '商品情報を編集できない' do
    it '他ユーザーは商品情報を編集できない' do
      sign_up(@user1)
      listing(@item)
      click_on 'ログアウト'
      expect(current_path).to eq root_path
      expect(page).to have_content('新規登録')
      click_on '新規登録'
      sign_up(@user2)
      click_on "#{@item.name}"
      expect(page).to have_no_content("削除")
    end
  end
end

