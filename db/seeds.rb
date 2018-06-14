# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
13.times do |i|
  Comic.create!(title: "テスト#{i}", price: 100, status: 0, user_id: 1, front_cover: open("#{Rails.root}/app/assets/images/20171216154719.jpg"))
end