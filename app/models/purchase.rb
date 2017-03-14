class Purchase < ApplicationRecord
  belongs_to :item

  after_destroy :decrease_item_amount
  after_create :increase_item_amount

  validates :item, :price, :amount, :date, presence: true

  def increase_item_amount
    item.amount += amount
    item.save
  end

  def decrease_item_amount
    item.amount -= amount
    item.save
  end
end
