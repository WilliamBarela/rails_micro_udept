class CreateFacultyMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :faculty_members do |t|
      t.string :current_title
      t.string :auxiliary_roles
      t.string :objectives_statement
      t.string :research_interests_summary
      t.date :role_termination_date
      t.string :termination_reason
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
