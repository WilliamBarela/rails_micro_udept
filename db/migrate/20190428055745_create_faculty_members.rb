class CreateFacultyMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :faculty_members, comment: "FacultyMembers table for all faculty member roles" do |t|
      t.string :current_title, comment: "Professor, Assistant Professor, Instructor, ..."
      t.text :auxiliary_roles, comment: "Chairship, Directorship, ..."
      t.text :objectives_statement, comment: "160 or less character long objectives/mission statement"
      t.text :research_interests_summary, comment: "paragraph(s) stating summary of research interests"
      t.date :role_start_date, comment: "date in which faculty role was started"
      t.date :role_termination_date, comment: "date in which faculty role finished"
      t.string :termination_reason, comment: "default: null; contract ended, fired, quit, ..."
      t.references :person, index: true, foreign_key: true, comment: "one person to possibly many faculty roles"

      t.timestamps
    end
  end
end
