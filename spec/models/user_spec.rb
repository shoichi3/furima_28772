require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '正しく記入されていれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空の場合登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空の場合登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'emailに@がない場合登録できない' do
      @user.email = 'fagahqndfkw'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it '重複したemailの場合登録できない' do
      @user.save
      anothor_user = FactoryBot.build(:user, email: @user.email)
      anothor_user.valid?
      expect(anothor_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'passwordが空の場合登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordが存在してもpassword_confirmationが空の場合登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'passwordが6文字以上なら登録できる' do
      @user.password = 'aaa111'
      @user.password_confirmation = 'aaa111'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下なら登録できない' do
      @user.password = 'arfd1'
      @user.password_confirmation = 'arfd1'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it 'passwordがアルファベットのみの場合登録できない' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードにはアルファベットと数字の両方が必要です')
    end

    it 'passwordが数字のみ場合登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードにはアルファベットと数字の両方が必要です')
    end

    it 'birth_dateが空の場合登録できない' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end

    it 'first_nameが空の場合登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("姓を入力してください")
    end

    it 'first_nameがアルファベットや数字を含む場合登録できない' do
      @user.first_name = 'aga3ga'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓を全角文字で入力してください')
    end

    it 'last_nameが空の場合登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください")
    end

    it 'last_nameがアルファベットや数字を含む場合登録できない' do
      @user.last_name = 'gaha1f'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字を全角文字で入力してください')
    end

    it 'first_name_kanaが空の場合登録できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("姓(カタカナ)を入力してください")
    end

    it 'first_name_kanaがカタカナ以外の場合登録できない' do
      @user.first_name_kana = 'aew12-あ一'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓(カタカナ)を全角(カタカナ)で入力してください')
    end

    it 'last_name_kanaが空の場合登録できない' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名字(カタカナ)を入力してください")
    end

    it 'last_name_kanaがカタカナ以外の場合登録できない' do
      @user.last_name_kana = 'tw3[2二'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字(カタカナ)を全角(カタカナ)で入力してください')
    end
  end
end
