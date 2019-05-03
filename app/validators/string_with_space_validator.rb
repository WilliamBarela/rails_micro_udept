class StringWithSpaceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[a-zA-Z0-9\- ]+\z/
      record.errors[attribute] << (options[:message] || "only alphanumeric characters, dashes and spaces allowed")
    end
  end
end
