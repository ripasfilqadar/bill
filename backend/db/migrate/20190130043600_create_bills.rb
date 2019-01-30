class CreateBills < ActiveRecord::Migration[5.1]
  def up
    create_table :bills do |t|
      t.string :name
      t.integer :price
      t.integer :tax_code

      t.timestamps
    end
  end
  def down
    drop_table :bills
  end
end
