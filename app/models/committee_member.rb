class CommitteeMember < ApplicationRecord
  belongs_to :person
  belongs_to :committee
end
