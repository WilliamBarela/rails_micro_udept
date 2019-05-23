class GraduateAdvisorhip < ApplicationRecord
  belongs_to :faculty_member
  belongs_to :graduate_student

  validates :primary_advisor?,
    presence: true,
    inclusion: { in: [ true, false ] }

  validate :start_proceeds_termination

  def start_proceeds_termination
    unless self.advising_termination.nil? or self.advising_termination > self.advising_initiation
      errors.add(:advising_termination, "termination date cannot be prior to join date")
    end
  end
end
