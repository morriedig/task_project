require 'rails_helper'

feature "User sign_up" do

  scenario "with success sign up" do
    visit new_user_path
    fill_in 'user[name]', :with => "morrie100"
    fill_in 'user[password]', :with => "12345678"
    fill_in 'user[password_confirmation]', :with => "12345678"
    click_button '新增User'
    expect(page).to have_content "morrie100"
  end
end