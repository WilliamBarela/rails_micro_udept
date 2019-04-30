class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people, comment: "People table for all members of department, excludes role information." do |t|
      t.string :honorific, comment: "person honorific: Mr., Miss, Ms., Mrs., Dr., ..."
      t.string :last_name, comment: "person surname"
      t.string :middle_name, comment: "person middle name (optional)"
      t.string :first_name, comment: "person given name"
      t.string :suffix, comment: "person suffix: I, II, Jr., Sr., ..."
      t.string :gender, comment: "person gender: female, male, non-binary"
      t.string :ttus_email, comment: "person TTU email username@ttu.edu, username@ttuhsc.edu"
      t.integer :ttus_phone, comment: "work phone"
      t.date :ttus_termination_date, comment: "date of dissociation from TTU"
      t.string :ttus_termination_reason, comment: "reason for dissociation from TTU"

      t.timestamps
    end
  end
end
