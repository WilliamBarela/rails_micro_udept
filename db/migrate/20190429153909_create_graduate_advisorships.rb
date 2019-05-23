class CreateGraduateAdvisorships < ActiveRecord::Migration[5.2]
  def change
    create_table :graduate_advisorhips, comment: "join table of faculty_members and graduate_students" do |t|
      t.boolean :primary_advisor?, comment: "true, false"
      t.date :advising_initiation, comment: "when advisory relationship commenced"
      t.date :advising_termination, comment: "when advisory relationship ended"
      t.belongs_to :faculty_member, index: true, foreign_key: true
      t.belongs_to :graduate_student, index: true, foreign_key: true

      t.timestamps
    end
  end
end
