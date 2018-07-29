require 'rails_helper'

RSpec.describe Comic, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  #タイトルがなければ無効
  it "is invalid without a title" do
    comic = Comic.new(title: nil)
    comic.valid?
    expect(comic.errors[:title]).to include("を入力してください")
  end

  it "confirms whether the user likes the comic" do
    Like.create(user_id: 1, comic_id: 1)
    comic = Comic.new(
      id: 1
      title: "www"
    )
    user = User.new(
      id: 1
      username: "ttt"
    )
    expect(comic.liked?(user)).to be true
  end
end
