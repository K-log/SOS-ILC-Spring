class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string "name"
      t.integer "position"
      t.boolean "visible", :defaults => false
      t.timestamps
    end
		add_index :subjects, [:name, :position]
  end
end
