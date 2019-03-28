require 'rails_helper'

feature "task order" do

  scenario "desc by created_at time" do
    user = create(:user)
    task_3 = create_list(:task,10, user_id: user.id)
    task = create(:task, user_id: user.id, title: "i need to be found")
    visit login_path
    fill_in 'user[name]', :with => user.name
    fill_in 'user[password]', :with => "12345678"
    click_button '登入'

    fill_in 'search_word', :with => task.title
    click_button 'Search'

    expect(page).to have_content task.title
    expect(all(".single_task_block").count).to be 1
  end
end