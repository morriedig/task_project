require 'rails_helper'

feature "task order" do

  scenario "desc by created_at time" do
    user = create(:user)
    task_3 = create(:task, user_id: user.id, title: "task3", created_at: 3.days.ago)
    task_2 = create(:task, user_id: user.id, title: "task2", created_at: 2.days.ago)
    task_1 = create(:task, user_id: user.id, title: "task1", created_at: 1.days.ago)
    visit login_path
    fill_in 'user[name]', :with => user.name
    fill_in 'user[password]', :with => "12345678"
    click_button '登入'
    

    expect(find(".single_task_block:first-child")).to have_content task_1.title
    expect(find(".single_task_block:nth-child(2)")).to have_content task_2.title
    expect(find(".single_task_block:nth-child(3)")).to have_content task_3.title
  end
end