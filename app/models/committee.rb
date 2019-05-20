class Committee < ApplicationRecord
  has_many :committee_memberships
  has_many :people, through: :committee_memberships

  validates :committee_title,
    presence: true,
    string_with_space: true,
    length: { maximum: 255}

  validates :committee_description,
    presence: true,
    string_with_space: true,
    length: { maximum: 500 }

  validates :committee_started,
    presence: true,
    date_not_in_future: true

  validates :committee_depricated,
    date_not_in_future: true,
    allow_nil: true
end
