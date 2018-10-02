class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @liked_comics_top_three = user.likes.comic
    @wanted_comics_top_three = 
  end
end
