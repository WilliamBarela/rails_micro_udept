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

  validate :valid_honorific?
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

  # regex text incantations
  abbreviation_singleton  = /\A[a-zA-Z]+\.?\z/
  text_w_spaces           = /\A[a-zA-Z\- ]+\z/
  text_wo_spaces          = /\A[a-zA-Z\-]+\z/

  # error_messages
  invalid_abbreviation_error  = "only letters and periods are allowed"
  invalid_text_w_space_error  = "only letters, hyphens, and spaces allowed"
  invalid_text_wo_space_error = "only letters and hyphens allowed"
  invalid_text_length_error   = " is improper length"

  def valid_honorific?
    unless self.honorific.nil?
      errors.add(:honorific, invalid_abbreviation_error) unless self.honorific.match?(abbreviation_singleton)
      errors.add(:honorific, "honorific #{invalid_text_length_error}") unless self.honorific.length.between?(2,50)
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

    unless self.ttus_email.match?(ttus_email_pattern)
      errors.add(:ttus_email, "Please enter your valid TTU or TTUHSC email.")
    end
  end
end
