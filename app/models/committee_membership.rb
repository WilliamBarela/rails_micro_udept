class CommitteeMembership < ApplicationRecord
  belongs_to :person
  belongs_to :committee

  # validations to complete
  # :role
  # :join_date
  # :termination_date
  # :person
  # :committee
end
