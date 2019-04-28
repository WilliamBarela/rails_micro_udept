class CreateStaffMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :staff_members, comment: "StaffMembers table for all staff member roles" do |t|
      t.string :current_title, comment: "Accountant, Business Coordinator, Undegraduate Advisor, ..."
      t.text :auxiliary_roles, comment: "Network Site Coordinator, ..."
      t.boolean :departmental?, comment: "staff from department or working for professor"
      t.text :objectives_statement, comment: "160 or less character long objectives/mission statement"
      t.text :departmental_impact_statement, comment: "paragraph(s) stating summary of staff member's planned departmental impact"
      t.date :role_termination_date, comment: "date in which faculty role finished"
      t.string :termination_reason, comment: "default: null; contract ended, fired, quit, ..."
      t.references :person, foreign_key: true, comment: "one person to possibly many staff roles"

      t.timestamps
    end
  end
end
