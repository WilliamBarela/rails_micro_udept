class StaffMember < ApplicationRecord
  belongs_to :person

  # validations to complete
  #:current_title
  #:auxiliary_roles
  #:departmental?
  #:objectives_statement
  #:departmental_impact_statement
  #:role_termination_date
  #:termination_reason
  #:person
end
