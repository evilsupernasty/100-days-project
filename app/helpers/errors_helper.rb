module ErrorsHelper
  def help_error_message(resource, attribute, default = "")
    has_error = resource.errors.details.include? attribute
    error_msgs = resource.errors.full_messages_for(attribute).join(". ")

    return "" unless has_error || default

    content_tag :p, has_error ? error_msgs : default, class: "help#{has_error ? " is-danger" : ""}"
  end

  def errors_count(resource)
    I18n.t("errors.messages.not_saved",
           count: resource.errors.count,
           resource: resource.class.model_name.human.downcase)
  end
end
