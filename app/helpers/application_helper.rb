module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "WTD!"
    if page_title.empty?
       base_title
    else
      "WTD| #{page_title}"
    end
  end 
end