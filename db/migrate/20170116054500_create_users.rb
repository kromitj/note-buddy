class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :f_name
    	t.string :l_name
    	t.string :username
    	t.string :password_digest

    	t.timestamps null: false
    end
  end
end
