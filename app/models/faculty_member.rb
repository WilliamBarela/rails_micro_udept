class FacultyMember < ApplicationRecord
  belongs_to :person

  has_many :graduate_advisorships
  has_many :graduate_students, through: :graduate_advisorships
end
