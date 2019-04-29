class CreateCommitteeMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :committee_members, comment: "CommitteeMembers is a join table for all departmental people and committees" do |t|
      t.string :role, comment: "role tile for current committee"
      t.date :join_date, comment: "date of joining the committee"
      t.date :termination_date, comment: "date of leaving committee"
      t.belongs_to :person, index: true, foreign_key: true
      t.belongs_to :committee, index: true, foreign_key: true

      t.timestamps
    end
  end
end
