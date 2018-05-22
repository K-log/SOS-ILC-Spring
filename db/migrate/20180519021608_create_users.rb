class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
			t.column "first_name", :string, :limit => 50, :null => false
			t.string "last_name", :limit => 50, :null => false
			t.string "username", :limit => 25, :null => false
			t.string "email", :default => '', :null => false
			t.string "password", :limit => 40, :null => false
			t.timestamps
    end
		add_index :users, [:username, :email]
  end
  
  def down
		drop_table :users
  end
  
end
