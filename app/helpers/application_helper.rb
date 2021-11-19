module ApplicationHelper
  include Pagy::Frontend

  def page_title(page_title = '')
    base_title = '呪物確認'

    page_title.empty? ? base_title : "#{page_title}　|　#{base_title}"
  end
end
