class Bills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.string :name
      t.integer :tax_code
      t.integer :price
    end
  end
end
