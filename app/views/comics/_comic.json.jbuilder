json.extract! comic, :id, :title, :front_cover, :price, :sns_first, :sns_second, :sns_third, :sns_fourth, :introduction, :content_first, :content_second, :content_third, :content_fourth, :content_fifth, :type, :day, :origin_title, :agetarget, :created_at, :updated_at
json.url comic_url(comic, format: :json)
