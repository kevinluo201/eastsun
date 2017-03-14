require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "total" do
    invoice = Invoice.create!
    detail1 = InvoiceDetail.make!(amount: 1000, price: 12, invoice: invoice)
    detail2 = InvoiceDetail.make!(amount: 1000, price: 0.2, invoice: invoice)

    invoice.calculate_total!

    assert_equal 12200, invoice.total
  end
end
