class GraduateStudent < ApplicationRecord
  belongs_to :person

  has_many :graduate_advisorships
  has_many :faculty_members, through: :graduate_advisorships

  validates :current_program, :degree_sought, :auxiliary_roles, :termination_reason,
    presence: true,
    string_with_space: true,
    length: { maximum: 255 },
    allow_nil: false

  validates :expected_graduation_year,
    presence: true,
    inclusion: { in: Date.today.year..(Date.today.year + 10) }

  validates :expected_graduation_semester,
    presence: true,
    inclusion: { in: [fall, spring, summer] }

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
