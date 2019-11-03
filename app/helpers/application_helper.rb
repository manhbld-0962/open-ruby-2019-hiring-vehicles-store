module ApplicationHelper
  def full_title page_title = ""
    page_title.empty? ? t(".sub") : "#{page_title} | #{t(.sub)}"
  end
end
