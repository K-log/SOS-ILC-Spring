class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
	  #The following first and last name are equivalent
	  t.column "first_name", :string, :limit => 25
    t.string "last_name", :limit => 50
	  t.string "email", :default => '', :null => false
	  t.string "password"
	  # The folling are managed by rails and automatically updated and timestamps does this for us
	  # t.datetime "created_at"
	  # t.datetime "updated_at"
      t.timestamps
    end
  end
  
  def down
	drop_table :users
  end
  
end
