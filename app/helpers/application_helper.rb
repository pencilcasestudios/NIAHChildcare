module ApplicationHelper
  def body_id
    controller.controller_name
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def sub_title(sub_title)
    content_for(:sub_title) do
      content_tag :small do
        sub_title
      end
    end
  end

  def default_meta_tags
    {
      #:description => 'Member login page.',
      #:keywords    => 'Site, Login, Members',
      :separator   => "&mdash;".html_safe,
      :site       => t("application.name"),
      :title       => t("application.tagline_html"),
    }
  end
end
