class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
    	t.string 	:title
    	t.datetime :last_updated
    	t.string :content
    	t.string :description
    	t.integer :category_id
    	t.string    :data_file_name
      t.string    :data_content_type
      t.integer   :data_file_size
      t.datetime  :data_updated_at
      t.integer :state, default: 1
      
      t.timestamps
    end
  end
end
