require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "新增 task 功能" do
    it "原本的 task 數量為 0 " do
      expect( Task.count ).to eq(0)
    end

    it "增加 1 個 task後，task 數量為 1" do
      Task.create( 
        title: "完成 5xRuby 面試題目",
        content: " 詳細內容請見：https://github.com/5xRuby/5xtraining/blob/master/backend.md ",
        status: "未完成",
        priority: "10",
        finish_time: "2019-03-22"
      )
       expect( Task.count ).to eq(1)
    end

    it "title 不可空白" do
      Task.create( 
        content: " 詳細內容請見：https://github.com/5xRuby/5xtraining/blob/master/backend.md ",
        status: "未完成",
        priority: "10",
        finish_time: "2019-03-22"
      )
       expect( Task.count ).to eq(0)
    end

    it "content 不可空白" do
      Task.create( 
        title: "完成 5xRuby 面試題目",
        status: "未完成",
        priority: "10",
        finish_time: "2019-03-22"
      )
       expect( Task.count ).to eq(0)
    end
  end

  describe "編輯 task 功能" do
    before(:each) do
      Task.create( 
        title: "完成 5xRuby 面試題目",
        content: " 詳細內容請見：https://github.com/5xRuby/5xtraining/blob/master/backend.md ",
        status: "未完成",
        priority: "10",
        finish_time: "2019-03-22"
      )
    end
    it "原本 task 的 title 為 '完成 5xRuby 面試題目' " do
      expect( Task.first.title ).to eq('完成 5xRuby 面試題目')
    end
    it "編輯後的 task，內容會改變" do
      Task.first.update( title: "我要完成 5xRuby 面試題目" )
      expect( Task.first.title ).to eq('我要完成 5xRuby 面試題目')
    end
  end

  describe "刪除 task 功能" do
    before(:all) do
      Task.create( 
        title: "完成 5xRuby 面試題目",
        content: " 詳細內容請見：https://github.com/5xRuby/5xtraining/blob/master/backend.md ",
        status: "未完成",
        priority: "10",
        finish_time: "2019-03-22"
      )
    end
    it "原本的 task 數量為 1 " do
      expect( Task.count ).to eq(1)
    end
    it "原本有 1 個 task，減少一個變成 0 個" do
      Task.first.destroy
      expect( Task.count ).to eq(0)
    end
  end

  describe "Task 排序功能" do
    before(:all) do
      5.times { | i | Task.create( 
        title: "完成 5xRuby 面試題目 #{ i }",
        content: " 詳細內容請見：https://github.com/5xRuby/5xtraining/blob/master/backend.md ",
        status: "未完成",
        priority: "10",
        finish_time: "2019-03-22",
        created_at: i.days.ago
      )}
    end
    it "由task建立時間排序，從最早建立的開始排" do
      all_task_id = Task.all.pluck(:id)
      expect( Task.all.order(created_at: :asc).pluck(:id) ).to eq all_task_id
    end

    it "task 可以由完成時間排序" do
      all_task_id = Task.order_by_finish_time.pluck(:id)
      expect( Task.all.order(finish_time: :desc).pluck(:id) ).to eq all_task_id
    end
  end
end
