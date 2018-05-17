class My::LikesController < ApplicationController
  before_action :authenticate_user!

  def liked
    @my_liked_comics =  Comic.joins({:likes => :user}).where("likes.user_id" => current_user.id)
    @my_liked_comics.each do |comic|
      @sum_of_my_liked_comics_price = 0
      @sum_of_my_liked_comics_price += comic.price
    end
  end



end

