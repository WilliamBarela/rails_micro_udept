class Committee < ApplicationRecord
  has_many :committee_memberships
  has_many :people, through: :committee_memberships

  validates :committee_title, :committee_description,
    presence: true, string_with_space: true

  validates :committee_started,
    presence: true, date_not_in_future: true

  validates :committee_depricated,
    date_not_in_future: true, allow_nil: true

  # fields to validate
  # :committee_title
  # :committee_description
  # :committee_started
  # :committee_depricated
end
