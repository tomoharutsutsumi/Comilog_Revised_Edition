# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.create(id: 0, email: 'testtes0@test.com', password: '123456')
  User.create(id: 1, email: 'testtest1@test.com', password: '123456')
  User.create(id: 2, email: 'testtest2@test.com', password: '123456')


5.times do |i|
  Comic.create!(title: "テストテストテスト#{i}", price: 200, status: 1, user_id: 0, day: 1, origin_title: "サンプル", front_cover: open("#{Rails.root}/app/assets/images/20171216154719.jpg"))
end

5.times do |i|
  Comic.create(title: "テストテストテスト#{i}", price: 200, status: 0, user_id: 1, day: 1, origin_title: "サンプル", front_cover: open("#{Rails.root}/app/assets/images/20180116214151.jpg"))
end


  comic_first = Comic.first
  comic_last = Comic.last
  Like.create(user_id: 0, comic_id: comic_last.id)
  Like.create(user_id: 1, comic_id: comic_last.id)
  Like.create(user_id: 2, comic_id: comic_first.id)

