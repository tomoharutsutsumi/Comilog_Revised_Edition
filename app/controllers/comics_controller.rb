class ComicsController < ApplicationController
  before_action :set_comic, only: [:show, :edit, :update, :destroy, :release, :nonrelease]
  before_action :authenticate_user!, only: [:show, :new, :edit, :destroy, :like, :unlike]
  before_action :set_ranked_comics, only: [:index, :rank]
  #after_action :redirect_to_show, only: [:like, :unlike, :want, :not_want]

  # GET /comics
  # GET /comics.json
  def index
    @comics = Comic.released.order('id DESC').page(params[:page]).per(6)
  end

  # GET /comics/1
  # GET /comics/1.json
  def show
  end

  # GET /comics/new
  def new
    @comic = Comic.new
  end

  def confirm
    @comic = Comic.new(comic_params)
    #コンテンツFirstがnil
    @comic.user_id = current_user.id
    if @comic.valid?
      flash.now[:notice_of_confirm] = "こちらで登録しますがよろしいですか？"
    else
      flash.now[:notice_of_choice] = "あなたが選択中の画像はこちらです。"
      render :new
    end
  end

  # GET /comics/1/edit
  def edit
  end

  # POST /comics
  # POST /comics.json
  def create
    @comic = Comic.new(comic_params)
    @comic.user_id = current_user.id
    respond_to do |format|
      if params[:back]
        format.html { render :new }
      elsif @comic.save
        format.html { redirect_to @comic, notice: 'Comic was successfully created.' }
        format.json { render :show, status: :created, location: @comic }
      else
        format.html { render :new }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comics/1
  # PATCH/PUT /comics/1.json
  def update
    respond_to do |format|
      if @comic.update(comic_params)
        format.html { redirect_to @comic, notice: 'Comic was successfully updated.' }
        format.json { render :show, status: :ok, location: @comic }
      else
        format.html { render :edit }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comics/1
  # DELETE /comics/1.json
  def destroy
    @comic.destroy
    respond_to do |format|
      format.html { redirect_to comics_url, notice: 'Comic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def like
    like = Like.create(comic_id: params[:id], user_id: current_user.id)
    redirect_to :action => "show"
  end


  def unlike
    unlike = Like.find_by(comic_id: params[:id], user_id: current_user.id)
    unlike.destroy
    unlike.save
    redirect_to :action => "show"
  end


  def want
    want = Want.create(comic_id: params[:id], user_id: current_user.id)
    redirect_to :action => "show"
  end


  def not_want
    not_want = Want.find_by(comic_id: params[:id], user_id: current_user.id)
    not_want.destroy
    not_want.save
    redirect_to :action => "show"
  end


  def search
    @search_result = Comic.all
    @search_result = @search_result.where(title: params[:title]) unless params[:title].blank?
    @search_result = @search_result.where(category: params[:category]) unless params[:category].blank?
    @search_result = @search_result.where(day: params[:day]) unless params[:day].blank?
    @search_result = @search_result.where(origin_title: params[:origin_title]) unless params[:origin_title].blank?
    @search_result = @search_result.where(agetarget: params[:agetarget]) unless params[:agetarget].blank?
  end

  def header_search
    header_search_result = Comic.all
    header_search_result = header_search_result.where(title: params[:keyword]).or(Comic.where(origin_title: params[:keyword]))
    #binding.pry
    @search_result = header_search_result
    render :search
  end

  def release
    @comic.released!
    redirect_to edit_comic_path, notice: 'この作品を公開しました'
  end

  def nonrelease
    @comic.nonreleased!
    redirect_to edit_comic_path, notice: 'この作品を非公開にしました'
  end

  def all_rank
    @ranked_comics = Comic.all_rank_limit
    @first_day_ranked_comics = Comic.where(day: 1).all_rank_limit
    @second_day_ranked_comics = Comic.where(day: 2).all_rank_limit
    @third_day_ranked_comics = Comic.where(day: 3).all_rank_limit
  end

  def first_day_rank
     @first_day_ranked_comics = Comic.where(day: 1).rank_limit_by_day
  end

  def second_day_rank
     @second_day_ranked_comics = Comic.where(day: 2).rank_limit_by_day
  end

  def third_day_rank
     @third_day_ranked_comics = Comic.where(day: 3).rank_limit_by_day
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comic
      @comic = Comic.find(params[:id])
    end

    def set_ranked_comics
      @ranked_comics = Comic.order('likes_count DESC')
    end

    def redirect_to_show
      redirect_to :action => "show" and return
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comic_params
      params.require(:comic).permit(:title, :front_cover, :front_cover_cache, :price, :sns_first, :sns_second, :sns_third, :sns_fourth, :introduction, :content_first, :content_second, :content_third, :content_fourth, :content_fifth, :category, :day, :origin_title, :agetarget, :tag_list)
    end
end
