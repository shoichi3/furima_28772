module ListingSupport
  def listing(item)
    expect(page).to have_content('出品する')
    visit new_item_path
    expect(current_path).to eq new_item_path
    image_path = Rails.root.join('app/assets/images/camera.png')
    attach_file('item[image]', image_path, make_visible: true)
    fill_in 'item-name', with: item.name
    fill_in 'item-info', with: item.detail
    select 'メンズ', from: 'item-category'
    select '未使用に近い', from: 'item-sales-status'
    select '着払い(購入者負担)', from: 'item-shipping-fee-status'
    select '岩手県', from: 'item-prefecture'
    select '1~2日で発送', from: 'item-scheduled-delivery'
    fill_in 'item-price', with: item.price
    expect{
      click_on '出品する'
    }.to change { Item.count}.by(1)
    expect(current_path).to eq root_path
    expect(page).to have_selector ".item-img"
    expect(page).to have_content("#{item.name}")
    expect(page).to have_content("#{item.price}")
  end
end