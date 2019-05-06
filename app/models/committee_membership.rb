class CommitteeMembership < ApplicationRecord
  belongs_to :person
  belongs_to :committee

  validates :role,
    presence: true, string_with_space: true

  validate :join_proceeds_termination

  def join_proceeds_termination
    unless self.termination_date.nil? or self.termination_date > self.join_date
      errors.add(:termination_date, "termination date cannot be prior to join date")
    end
  end
end
