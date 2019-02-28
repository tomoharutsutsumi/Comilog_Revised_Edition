class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    user = User.find(params[:id])
    @liked_comics_top_three = user.like_comics.limit(3)
    @wanted_comics_top_three = user.want_comics.limit(3)
  end
end
