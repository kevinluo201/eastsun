class Item < ApplicationRecord
  has_many :purchases

  validates :name, :price, :amount, presence: true
end
