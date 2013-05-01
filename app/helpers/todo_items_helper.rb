module TodoItemsHelper
  def svg_object(name)
    "<span><object data=\"#{image_path(name + '.svg')}\" type=\"image/svg+xml\">#{image_tag(name + '.png')}</object></span>".html_safe
  end
end
