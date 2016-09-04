module ApplicationHelper
  def render_title
    return @title if defined?(@title)
    "Riah Diary"
  end
  
  def render_page
    return @page_title if defined?(@page_title)
    "Home"
  end
  
  # def markdown(content)
  #   @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, fenced_code_blocks: true, hard_wrap: true,space_after_headers: true)
  #   @markdown.render(content)
  # end
  
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
