class Item < ApplicationRecord
  has_many :purchases
  has_many :invoice_details

  validates :name, :price, :amount, presence: true
end
