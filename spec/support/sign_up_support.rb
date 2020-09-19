module SignUpSupport
  def sign_up(user)
    visit root_path
    expect(page).to have_content('新規登録')
    click_on '新規登録'
    fill_in 'nickname', with: user.nickname
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    fill_in 'password-confirmation', with: user.password_confirmation
    fill_in 'last-name', with: user.last_name
    fill_in 'first-name', with: user.first_name
    fill_in 'last-name-kana', with: user.last_name_kana
    fill_in 'first-name-kana', with: user.first_name_kana
    fill_in 'first-name-kana', with: user.first_name_kana
    select '1997', from: 'user_birth_date_1i'
    select '3', from: 'user_birth_date_2i'
    select '18', from: 'user_birth_date_3i'
    expect{
      click_on '会員登録'
    }.to change {User.count}.by(1)
    expect(current_path).to eq root_path
  end
end