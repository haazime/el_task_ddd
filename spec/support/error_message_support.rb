module ErrorMessageSupport
  def i18n_error_message(key)
    I18n.t("errors.messages.#{key}")
  end
end

RSpec.configure do |c|
  c.include ErrorMessageSupport
end
