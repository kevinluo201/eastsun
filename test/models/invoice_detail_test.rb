require 'test_helper'

class InvoiceDetailTest < ActiveSupport::TestCase
  test "total" do
    det = InvoiceDetail.make!(amount: 5, price: 14)
    assert_equal 70, det.total
  end
end
