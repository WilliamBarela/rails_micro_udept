class CreateCommittees < ActiveRecord::Migration[5.2]
  def change
    create_table :committees, comment: "Committees table for all departmental committes" do |t|
      t.string :committee_title, comment: "title of departmental committee"
      t.text :committee_description, comment: "description of the purpose of committee"
      t.date :committee_started, comment: "date that the committee was initiated"
      t.date :committee_depricated, comment: "date that the comittee was depricated"

      t.timestamps
    end
  end
end
