class Person < ApplicationRecord
  has_many :faculty_members
  has_many :staff_members
  has_many :graduate_students

  has_many :committee_memberships
  has_many :committees, through: :committee_memberships

  # string validations
  validates :honorific, :last_name, :middle_name, :first_name, :suffix, :gender, :termination_reason,
    format: { with: /\A[a-zA-Z-]+\z/, message: "only letters and hyphens allowed" }
  validates :honorific,
    length: { minimum: 2 }
  validates :last_name, :middle_name, :first_name,
    length: { 2..50 }
  validates :suffix, length: { 1..4 }
end



