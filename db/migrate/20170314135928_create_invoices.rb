class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.float :total
      t.boolean :delivered

      t.timestamps
    end
  end
end
