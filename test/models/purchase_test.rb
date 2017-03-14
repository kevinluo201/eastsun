require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  test 'purchase must have a item' do
    purchase = Purchase.new(price: 10, amount: 10, date: Date.today)
    assert_raise ActiveRecord::RecordInvalid do
      purchase.save!
    end

    item = Item.make!
    purchase.item = item
    assert purchase.save
  end

  test "increase item amount when creating" do
    item = Item.make!
    Purchase.create(price: 10, amount: 10, date: Date.today, item: item)
    Purchase.create(price: 10, amount: 20, date: Date.today, item: item)
    Purchase.create(price: 10, amount: 35, date: Date.today, item: item)
    assert_equal 65, item.amount
  end

  test "increase item amount when destroying" do
    item = Item.make!
    Purchase.create(price: 10, amount: 10, date: Date.today, item: item)
    Purchase.create(price: 10, amount: 20, date: Date.today, item: item)
    p3 = Purchase.create(price: 10, amount: 35, date: Date.today, item: item)
    p3.destroy

    assert_equal 30, item.amount
  end
end
