class My::WantsController < ApplicationController
  before_action :authenticate_user!

  def wanted
    @my_wanted_comics =  Comic.joins({:wants => :user}).where("wants.user_id" => current_user.id)

    @sum_of_my_wanted_comics_price = @my_wanted_comics.sum_price
  end
end
