class GraduateStudent < ApplicationRecord
  belongs_to :person

  has_many :graduate_advisorships
  has_many :faculty_members, through: :graduate_advisorships

  # validations to make
  #:current_program
  #:degree_sought
  #:auxiliary_roles
  #:expected_graduation_year
  #:expected_graduation_semester
  #:objectives_statement
  #:research_interests_summary
  #:role_termination_date
  #:termination_reason
  #:person
end
