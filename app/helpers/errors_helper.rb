module ErrorsHelper
  def errors_notification(resource)
    return "" if resource.errors.empty?

    content_tag :div, class: "notification is-warning" do
      content_tag(:p, sentence) +
        content_tag(:ul, error_messages(resource))
    end
  end

  def help_error_message(resource, attribute, default = "")
    has_error = resource.errors.details.include? attribute
    error_msgs = resource.errors.full_messages_for(attribute).join(". ")

    return "" unless has_error || default

    content_tag :p, has_error ? error_msgs : default, class: "help#{has_error ? " is-danger" : ""}"
  end

  private

  def error_messages(resource)
    resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
  end

  def errors_count(resource)
    I18n.t("errors.messages.not_saved",
           count: resource.errors.count,
           resource: resource.class.model_name.human.downcase)
  end
end
