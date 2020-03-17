# frozen_string_literal: true

class DateValidator < ActiveModel::EachValidator

  def validate_each(model, attribute, value)
    unless /\A\d{4}-\d{2}-\d{2}\z/.match?(value)
      model.errors.add(attribute, :invalid_date)
    end
  end
end
