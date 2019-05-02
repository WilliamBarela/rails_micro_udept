class Person < ApplicationRecord
  has_many :faculty_members
  has_many :staff_members
  has_many :graduate_students

  has_many :committee_memberships
  has_many :committees, through: :committee_memberships

  # string validations

  validates :honorific, :last_name, :first_name, :gender,
    format: { with: /\A[a-zA-Z\-]+\z/, message: "only letters and hyphens allowed" }
  validates :middle_name, :suffix, :ttus_termination_date, :ttus_termination_reason,
    format: { with: /\A[a-zA-Z\-]+\z/, message: "only letters and hyphens allowed" },
    allow_nil: true
  validates :honorific,
    length: { minimum: 2 }
  validates :last_name, :middle_name, :first_name,
    length: { in: 2..50 }
  validates :suffix,
    length: { in: 1..4 }

  validate :is_valid_honorific?
  validate :valid_ttus_phone?
  validate :valid_ttus_email?

  # fields to be validated
  
  # self.last_name
  # self.middle_name
  # self.first_name
  # self.suffix
  # self.gender
  # self.ttus_email
  # self.ttus_phone
  # self.ttus_termination_date
  # self.ttus_termination_reason

  # regex incantations
  abbreviation_singleton  = /\A[a-zA-Z]+\.?\z/
  text_with_spaces        = /\A[a-zA-Z\- ]+\z/
  text_without_spaces     = /\A[a-zA-Z\-]+\z/

  # error_messages
  invalid_text_error = "only letters and hyphens allowed"
  invalid_honorific_error = "only letters and periods are allowed"

  def is_allowed_text?(field, text_pattern)
    field.match?(text_pattern)
  end

  def is_valid_honorific?
    unless self.honorific.nil? or is_allowed_text?(self.honorific, abbreviation_singleton)
      errors.add(:honorific, invalid_honorific_error)
    end
  end

  def valid_ttus_phone?
    valid_ttus_phones = [
      /\A806834[\d]{4}\z/,
      /\A806742[\d]{4}\z/
    ]

    unless valid_ttus_phones.any? {|phone| phone.match(self.ttus_phone)}
      errors.add(:ttus_phone, "Please enter your valid TTU or TTUHSC phone number")
    end
  end

  def valid_ttus_email?
    valid_ttus_emails = [
      /\A[a-zA-Z0-9\-\.]+@ttu\.edu\z/i,
      /\A[a-zA-Z0-9\-\.]+@ttuhsc\.edu\z/i
    ]

    unless valid_ttus_emails.any? {|email| email.match(self.ttus_email)}
      errors.add(:ttus_email, "Please enter your valid TTU or TTUHSC email.")
    end
  end
end
