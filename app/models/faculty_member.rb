class FacultyMember < ApplicationRecord
  belongs_to :person

  has_many :graduate_advisorships
  has_many :graduate_students, through: :graduate_advisorships

  # items to validate
  # :current_title
  # :auxiliary_roles
  # :objectives_statement
  # :research_interests_summary
  # :role_termination_date
  # :termination_reason
  # :person
end
