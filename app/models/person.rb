class Person < ApplicationRecord
  has_many :faculty_members
  has_many :staff_members
  has_many :graduate_students

  has_many :committee_memberships
  has_many :committees, through: :committee_memberships

  validates :honorific, length: { minimum: 2 }
  validates :last_name, :middle_name, :first_name, length: { 2..50 }
  validates :suffix, length: { 1..4 }
end
