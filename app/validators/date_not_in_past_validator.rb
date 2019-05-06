class DateNotInPastValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value < Date.today
      record.errors[attribute] << (options[:message] || "date cannot be in the past.")
    end
  end
end
