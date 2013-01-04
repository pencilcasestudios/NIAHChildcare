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

  def new_or_create_action?
    (controller.action_name == "new") || (controller.action_name == "create")
  end

  def alert_name(alert)
    level = ""
    if alert.to_s == "error"
      level = "alert"
    elsif alert.to_s == "success"
      level = "success"
    end
  end
end
