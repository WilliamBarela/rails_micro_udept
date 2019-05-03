class Committee < ApplicationRecord
  has_many :committee_memberships
  has_many :people, through: :committee_memberships

  # fields to validate
  # :committee_title
  # :committee_description
  # :committee_started
  # :committee_depricated
end
