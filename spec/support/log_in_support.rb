module LogInSupport
  def log_in(user)
    visit root_path
    expect(page).to have_content('ログイン')
    click_on 'ログイン'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'ログイン'
    expect(current_path).to eq root_path
  end
end