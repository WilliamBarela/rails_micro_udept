class FacultyMember < ApplicationRecord
  belongs_to :person

  has_many :graduate_advisorships
  has_many :graduate_students, through: :graduate_advisorships

  validates :current_title, :auxiliary_roles, :termination_reason,
    presence: true,
    string_with_space: true,
    length: { maximum: 255 },
    allow_nil: false

  validates :objectives_statement
    presence: true,
    string_with_space: true,
    length: { maximum: 160 },
    allow_nil: false

  validates :research_interests_summary,
    presence: true,
    length: { maximum: 4000 },
    allow_nil: false

  validate :start_proceeds_termination

  def start_proceeds_termination
    unless self.role_termination_date.nil? or self.role_termination_date > self.role_start_date
      errors.add(:role_termination_date, "termination date cannot be prior to join date")
    end
  end
end
