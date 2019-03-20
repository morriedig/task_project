# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do |i| 
  user = User.create( name: "morrie#{i}", password: "12345678", password_confirmation: "12345678" )
  5.times { |k| user.tasks.create(
    title: "完成 5xRuby 面試題目 #{ k }",
    content: " 詳細內容請見：https://github.com/5xRuby/5xtraining/blob/master/backend.md ",
    status: "pending",
    priority: i,
    finish_time: "2019-03-22",
    created_at: k.days.ago
  ) }
end