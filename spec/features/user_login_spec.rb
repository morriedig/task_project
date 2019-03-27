require 'rails_helper'

feature "User login" do

  scenario "with success login" do
    user = create(:user)
    visit login_path
    fill_in 'user[name]', :with => user.name
    fill_in 'user[password]', :with => "12345678"
    click_button '登入'
    expect(page).to have_content user.name
  end
  
end