require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザーが新規登録できるとき' do
    it '正しい情報を入力すると、ユーザー新規登録ができてトップページに遷移する' do
      sign_up(@user)
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ユーザーが新規登録できないとき' do
    it '誤った情報が入力されたとき新規登録ページに戻ってくる' do
       visit root_path
       expect(page).to have_content('新規登録')
       click_on '新規登録'
      fill_in 'nickname', with: ""
      fill_in 'email', with: ""
      fill_in 'password', with: ""
      fill_in 'password-confirmation', with: ""
      fill_in 'last-name', with: ""
      fill_in 'first-name', with: ""
      fill_in 'last-name-kana', with: ""
      fill_in 'first-name-kana', with: ""
      fill_in 'first-name-kana', with: ""
      expect{
        click_on '会員登録'
      }.to change {User.count}.by(0)
      expect(current_path).to eq '/users'
    end
  end
end

RSpec.describe "ログイン", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインできるとき' do
    it '正しい情報を入力するとログインできること' do
      log_in(@user)
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ログインできないとき' do
    it '誤った情報入力するとログインできない' do
      visit root_path
      expect(page).to have_content('ログイン')
      click_on 'ログイン'
      fill_in 'email', with: ""
      fill_in 'password', with: ""
      click_on 'ログイン'
      expect(current_path).to eq new_user_session_path
    end
  end
end


