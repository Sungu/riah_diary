module ApplicationHelper
  def render_title
    return @title if defined?(@title)
    "Disign Diary"
  end
  
  def render_page
    return @page_title if defined?(@page_title)
    "Home"
  end
  
  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true, fenced_code_blocks: true)
    @markdown.render(content)
  end  
end
