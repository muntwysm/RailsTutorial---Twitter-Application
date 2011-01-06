
module ApplicationHelper

  def logo
    @logo = image_tag("logo.png", :alt => "Sample App", :class => "round")
    return @logo
  end

  # Return a title on a per-page basis.
  def title
    base_title = "MyTwitt App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{h(@title)}"
    end
  end
end


