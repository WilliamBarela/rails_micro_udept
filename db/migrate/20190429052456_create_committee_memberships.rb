class CreateCommitteeMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :committee_memberships, comment: "join table of person and committee" do |t|
      t.string :role, comment: "name of role"
      t.date :join_date, comment: "date of person joining committee"
      t.date :termination_date, comment: "date of person leaving committee"
      t.belongs_to :person, index: true, foreign_key: true
      t.belongs_to :committee, index: true, foreign_key: true

      t.timestamps
    end
  end
end
