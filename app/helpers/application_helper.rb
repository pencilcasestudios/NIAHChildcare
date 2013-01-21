module ApplicationHelper
  def body_id
    controller.controller_name
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

  # Ref: https://github.com/kpumuk/meta-tags
  def default_meta_tags
    {
      description: t("application.meta_tags.description"),
      keywords: t("application.meta_tags.keywords"),
      prefix: " ",
      reverse: true,
      site: t("application.name"),
      title: t("application.tagline_html"),
      open_graph: {
        description: t("application.meta_tags.description"),
        image: root_url + asset_path("logo-400x400.png"),
        title: t("application.tagline_html"),
        type: :website,
        url: root_url,
      }
    }
  end
end
