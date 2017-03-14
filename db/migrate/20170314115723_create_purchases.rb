class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.references :item, foreign_key: true
      t.float :price
      t.integer :amount
      t.date :date

      t.timestamps
    end
  end
end
