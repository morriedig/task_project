# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i| 
  user = User.create( name: "guest#{i}", password: "12345678", password_confirmation: "12345678" )
  10.times { |k| user.tasks.create(
    title: "完成 5xRuby 面試題目 #{ k }",
    content: " 詳細內容請見：https://github.com/5xRuby/5xtraining/blob/master/backend.md ",
    status: ["pending", "processing", "finished"].sample,
    priority: [1,2,3].sample,
    finish_time: "2019-03-22",
    created_at: k.days.ago
  ) }
end

5.times do |i| 
  user = User.create( name: "admin#{ i }", role: "admin", password: "12345678", password_confirmation: "12345678" )
  10.times { |k| user.tasks.create(
    title: "完成 5xRuby 面試題目 #{ k }",
    content: " 詳細內容請見：https://github.com/5xRuby/5xtraining/blob/master/backend.md ",
    status: ["pending", "processing", "finished"].sample,
    priority: [1,2,3].sample,
    finish_time: "2019-03-22",
    created_at: k.days.ago
  )}
end

task_tags = %w(娛樂 工作 遊戲 休閒 進修)
task_tags.each { |i| TaskTag.create(name: i) }

TaskTag.all.each do |task_tag|
  Task.all.sample(50).each { |task| TaskTagWithTask.create( task_id: task.id, task_tag_id: task_tag.id ) }
end