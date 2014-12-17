class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string :title, null: false
  		t.text :body
  		t.integer :neighborhood_id
  		t.integer :user_id
  		t.timestamps
  	end
  end
end
