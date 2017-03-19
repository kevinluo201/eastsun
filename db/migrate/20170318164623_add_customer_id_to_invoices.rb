class AddCustomerIdToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :customer_id, :integer
  end
end
