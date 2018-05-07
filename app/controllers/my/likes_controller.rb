class My::LikesController < ApplicationController

  def liked
    like_ids = Like.where(user_id: current_user.id).pluck(:comic_id)
    @my_liked_comics = Comic.where(id: like_ids)
  end


end

