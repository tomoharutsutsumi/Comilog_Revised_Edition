module ComicsHelper
  def has_content?(content)
     if content.blank?
        image_tag 'noimage_tag.png'
     else
        image_tag content
     end
  end
end
