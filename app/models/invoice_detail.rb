class InvoiceDetail < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  validates :amount, :price, presence: true

  def total
    amount * price
  end
end
