class CreateGraduateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :graduate_students do |t|
      t.string :current_program
      t.string :degree_sought
      t.string :auxiliary_roles
      t.date :expected_graduation_date
      t.text :objectives_statement
      t.text :research_interests_summary
      t.string :termination_reason
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
