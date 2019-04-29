class Committee < ApplicationRecord
  has_many :committee_memberships
  has_many :people, through: :committee_memberships
end
