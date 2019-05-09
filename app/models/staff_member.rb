class StaffMember < ApplicationRecord
  belongs_to :person

  validates :current_title, :auxiliary_roles, :termination_reason,
    presence: true,
    string_with_space: true,
    length: { maximum: 255 },
    allow_nil: false

  validates :objectives_statement, 
    presence: true,
    string_with_space: true,
    length: { maximum: 160 },
    allow_nil: false

  validates :departmental_impact_statement, 
    presence: true,
    length: { maximum: 4000 },
    allow_nil: false

  validates :departmental?,
    inclusion: { in: [ true, false] }
end
