class Person < ApplicationRecord
  has_many :faculty_members
  has_many :staff_members
  has_many :graduate_students
  has_many :committees, through: :committee_members # change to committee_memberships to improve semantics?
end
