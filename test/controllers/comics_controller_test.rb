require 'test_helper'

class ComicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comic = comics(:one)
  end

  test "should get index" do
    get comics_url
    assert_response :success
  end

  test "should get new" do
    get new_comic_url
    assert_response :success
  end

  test "should create comic" do
    assert_difference('Comic.count') do
      post comics_url, params: { comic: { agetarget: @comic.agetarget, content_fifth: @comic.content_fifth, content_first: @comic.content_first, content_fourth: @comic.content_fourth, content_second: @comic.content_second, content_third: @comic.content_third, day: @comic.day, front_cover: @comic.front_cover, introduction: @comic.introduction, origin_title: @comic.origin_title, price: @comic.price, sns_first: @comic.sns_first, sns_fourth: @comic.sns_fourth, sns_second: @comic.sns_second, sns_third: @comic.sns_third, title: @comic.title, type: @comic.type } }
    end

    assert_redirected_to comic_url(Comic.last)
  end

  test "should show comic" do
    get comic_url(@comic)
    assert_response :success
  end

  test "should get edit" do
    get edit_comic_url(@comic)
    assert_response :success
  end

  test "should update comic" do
    patch comic_url(@comic), params: { comic: { agetarget: @comic.agetarget, content_fifth: @comic.content_fifth, content_first: @comic.content_first, content_fourth: @comic.content_fourth, content_second: @comic.content_second, content_third: @comic.content_third, day: @comic.day, front_cover: @comic.front_cover, introduction: @comic.introduction, origin_title: @comic.origin_title, price: @comic.price, sns_first: @comic.sns_first, sns_fourth: @comic.sns_fourth, sns_second: @comic.sns_second, sns_third: @comic.sns_third, title: @comic.title, type: @comic.type } }
    assert_redirected_to comic_url(@comic)
  end

  test "should destroy comic" do
    assert_difference('Comic.count', -1) do
      delete comic_url(@comic)
    end

    assert_redirected_to comics_url
  end
end
