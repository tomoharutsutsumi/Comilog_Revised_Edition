module ComicsHelper
  def safe_image_tag(content)
     if content.blank?
        image_tag 'noimage_tag.png'
     else
        image_tag content
     end
  end
end
