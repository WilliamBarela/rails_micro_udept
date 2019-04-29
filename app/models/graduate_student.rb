class GraduateStudent < ApplicationRecord
  belongs_to :person

  has_many :graduate_advisorships
  has_many :faculty_members, through: :graduate_advisorships
end
