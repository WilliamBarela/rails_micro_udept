class Person < ApplicationRecord
  has_many :faculty_members
  has_many :staff_members
  has_many :graduate_students

  has_many :committee_memberships
  has_many :committees, through: :committee_memberships

  validates :last_name, :first_name, :gender, :ttus_email,
    presence: true,
    on: :update

  validate :valid_name?
  validate :valid_ttus_phone?
  validate :valid_ttus_email?

  def valid_name?
    # error_messages
    invalid_abbreviation_error  = "only letters and periods are allowed"
    invalid_text_wo_space_error = "only letters and hyphens allowed"
    invalid_text_length_error   = "is improper length"

    # regex text incantations
    abbreviation_singleton  = /\A[a-zA-Z]+\.?\z/
    text_wo_spaces          = /\A[a-zA-Z\-]+\z/

    # honorific and suffix
    [:honorific, :suffix].each do |field|
      field_text = eval(field.to_s)
      unless field_text.nil?
        errors.add(field, invalid_abbreviation_error) unless field_text.match?(abbreviation_singleton)
        errors.add(field, invalid_text_length_error) unless field_text.length.between?(2,4)
      end
    end

    # names:
    [:first_name, :middle_name, :last_name].each do |field|
      field_text = eval(field.to_s)
      unless field_text.nil?
        errors.add(field, invalid_text_wo_space_error) unless field_text.match?(text_wo_spaces)
        errors.add(field, invalid_text_length_error) unless field_text.length.between?(2,50)
      end
    end
  end

  def valid_gender?
    gender_options = ["female", "male", "other"]

    unless self.gender.nil? or gender_options.any? {|gender_option| self.gender.match?(gender_option)}
      error.add(:gender, "Please input gender: female, male or other")
    end
  end

  def valid_ttus_phone?
    ttus_phone_pattern = /\A\(?806\)?[\.|\-| ]?(834|742)[\.|\-| ]?[\d]{4}\z/

    unless self.ttus_phone.nil? or self.ttus_phone.match?(ttus_phone_pattern)
      errors.add(:ttus_phone, "Please enter your valid TTU or TTUHSC phone number")
    end
  end

  def valid_ttus_email?
    ttus_email_pattern = /\A[a-zA-Z0-9\-\.]+@ttu(hsc)?\.edu\z/i

    unless self.ttus_email.nil? or self.ttus_email.match?(ttus_email_pattern)
      errors.add(:ttus_email, "Please enter your valid TTU or TTUHSC email.")
    end
  end
end
