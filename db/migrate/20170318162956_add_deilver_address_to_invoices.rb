class AddDeilverAddressToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :deliver_address, :string
    add_column :invoices, :contactor, :string
    add_column :invoices, :contact_phone, :string
  end
end
