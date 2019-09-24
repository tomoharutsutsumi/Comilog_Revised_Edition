class My::LikesController < ApplicationController
  before_action :authenticate_user!

  def liked
    @my_liked_comics =  Comic.joins({:likes => :user}).where("likes.user_id" => current_user.id)

    @sum_of_my_liked_comics_price = @my_liked_comics.sum_price
  end
end

