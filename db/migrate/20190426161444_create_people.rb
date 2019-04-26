class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :honorific
      t.string :last_name
      t.string :middle_name
      t.string :first_name
      t.string :suffix
      t.string :gender
      t.string :ttu_email
      t.string :ttu_phone
      t.boolean :ttu_termination
      t.string :termination_reason

      t.timestamps
    end
  end
end
