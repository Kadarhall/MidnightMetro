class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string :title, null: false
  		t.integer :user_id
  		t.integer :neighborhood_id
  		t.timestamps
  	end
  end
end
