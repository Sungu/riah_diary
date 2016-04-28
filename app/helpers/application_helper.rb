module ApplicationHelper
  def render_title
    return @title if defined?(@title)
    "Disign Diary"
  end
  
  def render_page
    return @page_title if defined?(@page_title)
    "Home"
  end
end
