module FormsHelper
  def minimum_password_length?
    return "" unless @minimum_password_length

    "#{@minimum_password_length} characters minimum. "
  end
end
