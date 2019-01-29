module ErrorsHelper
  def errors_notification resource
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="notification is-warning">
      <p>#{sentence}</p>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def help_error_message(resource, attribute, default = "")
    has_error = resource.errors.details.include? attribute
    error_msgs = resource.errors.full_messages_for(attribute).join(". ")

    return "" unless has_error || default

    "<p class=\"help#{has_error ? " is-danger" : ""}\">#{has_error ? error_msgs : default}</p>".html_safe
  end
end
