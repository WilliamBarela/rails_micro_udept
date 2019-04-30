class Person < ApplicationRecord
  has_many :faculty_members
  has_many :staff_members
  has_many :graduate_students

  has_many :committee_memberships
  has_many :committees, through: :committee_memberships

  # string validations
  validates :honorific, :last_name, :middle_name, :first_name, :suffix, :gender, :ttus_termination_reason,
    format: { with: /\A[a-zA-Z\-]+\z/, message: "only letters and hyphens allowed" }
  validates :honorific,
    length: { minimum: 2 }
  validates :last_name, :middle_name, :first_name,
    length: { in: 2..50 }
  validates :suffix,
    length: { in: 1..4 }

  validate :valid_ttus_email?

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
