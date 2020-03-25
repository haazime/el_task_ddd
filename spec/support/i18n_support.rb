module I18nSupport
  def i18n_error(key)
    I18n.t("errors.messages.#{key}")
  end

  def i18n_view(key)
    I18n.t(key)
  end
end

RSpec.configure do |c|
  c.include I18nSupport
end
