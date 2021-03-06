class DateNotInFutureValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.nil? or value <= Date.today
      record.errors[attribute] << (options[:message] || "date cannot be in the future.")
    end
  end
end
