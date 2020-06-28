# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
30.times do |n|
    reg_date = Time.now + n.days
    Entry.create!(
        user_name:"Nora#{n}",
        user_email:"Nora#{n}@hoge",
        reserved_date:reg_date,
        usage_time:n%5,
        room_id:(n%2)+1,
        people:10
    )
end
puts "データ初期登録完了"