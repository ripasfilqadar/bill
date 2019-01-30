class CreateCategory < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
   		t.string :name
		t.integer :parent_id
		t.boolean :has_children, default: false
		t.timestamps null: true
		t.integer :state, default: 1
		t.string :description
    end
  end
end
