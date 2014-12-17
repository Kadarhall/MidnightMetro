class CreateNeighborhoods < ActiveRecord::Migration
  def change
  	create_table :neighborhoods do |t|
  		t.string :title, null: false
  		t.text :body, default: ""
  		t.timestamps
  	end
  end
end
