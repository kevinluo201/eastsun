class CreateInvoiceDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_details do |t|
      t.float :price
      t.integer :amount
      t.references :item, foreign_key: true
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end
