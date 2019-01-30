module FormsHelper
  def minimum_password_length
    return "" unless @minimum_password_length

    t "shared.form.minimum_password_length", min_pwd_length: @minimum_password_length
  end
end
