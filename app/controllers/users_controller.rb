class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    user = User.find(params[:id])
    @liked_comics_top_three = user.like_comics.limit(3)
    @wanted_comics_top_three = user.want_comics.limit(3)
    @liked_comics_price_sum = user.my_like_comic_price
    @wanted_comics_price_sum = user.my_want_comic_price
  end

  def my_posted_comics
    user = User.find(params[:id])
    @my_posted_comics = user.comics
    @authorname = user.username
  end
end
