# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
30.times do |n|
    Entry.create!(
        user_name:"Nora#{n}",
        user_email:"hoge@hoge",
        reserved_date:"202007#{n}".to_date,
        usage_time:n%5,
        room_id:n,
        people:n
    )
end